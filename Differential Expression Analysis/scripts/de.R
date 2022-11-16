#!/usr/bin/env Rscript
# de.R
library(tximport)
library(readr)
library(DESeq2)

# TODO: update constants for your machine
# Define constants
TESTING <- TRUE # Change to FALSE if using entire Samples set
RESULTS_DIR <- "/home/j.talbot/binf2/BINF6309-Spring2022-Talbot-ClassDemos/Module4Refactor/results"
AIPTASIA_DIR <- "/work/courses/BINF6309/AiptasiaMiSeq"

# for testing purposes - alternative samples table
testing_samples <- data.frame(Sample = c("Aip02", "Aip02", "Aip02", "Aip02"),
                              Menthol = c("Control", "Control", "Menthol", "Menthol"),
                              Vibrio = c("Control", "Vibrio", "Control", "Vibrio"))
head(testing_samples)

# True script begins
tx2gene <- read.csv(file.path(RESULTS_DIR, "tx2gene.csv"))
head(tx2gene)

if (TESTING) {
  print("***Running test with Aip02 only***")
  samples <- testing_samples
} else {
  samples <- read.csv(file.path(AIPTASIA_DIR, "Samples.csv"), header=TRUE)
}
head(samples)


files <- file.path(RESULTS_DIR, "quant", samples$Sample, "quant.sf")
txi <- tximport(files, type="salmon", tx2gene=tx2gene)

dds <- DESeqDataSetFromTximport(txi, colData = samples, 
                                design = ~ Menthol + Vibrio)

dds$Vibrio <- relevel(dds$Vibrio, ref = "Control")
dds$Menthol <- relevel(dds$Menthol, ref = "Control")
keep <- rowSums(counts(dds)) >= 10
dds <- dds[keep,]
dds <- DESeq(dds)

padj <- .05
minLog2FoldChange <- .5
dfAll <- data.frame()
# Get all DE results except Intercept, and "flatten" into a single file.
for (result in resultsNames(dds)){
  if(result != 'Intercept'){
    res <- results(dds, alpha=.05, name=result)
    dfRes <- as.data.frame(res)
    dfRes <- subset(subset(dfRes, select=c(log2FoldChange, padj)))
    dfRes$Factor <- result
    dfAll <- rbind(dfAll, dfRes)
  }
}
head(dfAll)

write.csv(dfAll, file=file.path(RESULTS_DIR, "dfAll.csv"))

# padj change
change<- subset(dfAll, padj <0.05)
change<- cbind(rownames(change), data.frame(change, row.names=NULL))
colnames(change)[1] <- "ko" # ko = as the column name

# add pathways table 
pathWays_add <- read.table("data_BINF6309/Module4/Annotation/kegg.txt", sep='\t', header=FALSE)
colnames(pathWays_add) <- c("ko", "pathway")

# add ko table
pathwayNames <- read.table( "data_BINF6309/Module4/Annotation/ko.txt", sep="\t", header=FALSE)
colnames(pathwayNames_add) <- c("pathway", "description")

# Merging of both the tables                
merge_table<- merge(pathWays_add, pathwayNames_add)

# adding the mrege table to change df 
result <- kable(merge(merge_table, change))

# creating a csv file of the final result
write.csv(result, file="deAnnotated.csv")
