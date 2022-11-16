#!/usr/bin/env Rscript
# AnalyzeOutSpattFrom2Genomes.R
options("scipen" = 30)#don't print final output with exponents up to e-30
#just a usage statement to print out to users that done run with input file
usage <- "\nUsage: AnalyzeOutSpattFrom2Genomes.R <input file.txt>\n\n"
#tell R to get arguments
args <- commandArgs(trailingOnly = TRUE)
#test the arguments
if(length(args) == 0) {
  cat(prompt=usage)
  q(save="no")
}
#create a data frame
spattMetrics <- read.table(args[1], sep="\t", header=FALSE)
#put names on each column in the data frame
names(spattMetrics) <- c("kmer1","occurrence1","expected1", "pvalue1",
                         "kmer2","occurrence2","expected2", "pvalue2") # variable names

#Add new column to data frame, and give all 0
spattMetrics["probablity_occurrence"] <- 0
#fill the column
spattMetrics$probablity_occurrence <- (spattMetrics$expected1 / (spattMetrics$expected1 + spattMetrics$expected2))

spattMetrics["trials"] <- 0
spattMetrics$trials <-  spattMetrics$occurrence1 + spattMetrics$occurrence2

spattMetrics["binomial_upper_tail"] <- 0
#An excellent description of this can be found here:
#http://people.reed.edu/~jones/141/Prob1.html
spattMetrics$binomial_upper_tail <- pbinom(spattMetrics$occurrence1-1,
                                           spattMetrics$trials,
                                           spattMetrics$probablity_occurrence,
                                           lower.tail=FALSE)

#write output to a file I can open in Excel
write.table(spattMetrics, file="out.txt", sep="\t", row.names = FALSE)
