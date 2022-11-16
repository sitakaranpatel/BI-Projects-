#!/usr/bin/env Rscript
# mergeAll.R

# Load BLAST results as a table using tab (\t) as separator.
# There is no header with column names, so set header=FALSE
# This is the output from Module08 that you'll to have access to.
# you can either cp to your working directory, or create a symbolic link
blast <- read.table ("alignPredicted.txt", sep="\t", header=FALSE)

# Set column names to match fields selected in BLAST
colnames (blast) <- c("qseqid", "sacc", "qlen", "slen",
    "length", "nident", "pident", "evalue", "stitle")

# Calculate the coverage as nident/slen, creating a new column called cov
blast$cov <- blast$nident/blast$slen

# Select only blast rows where coverage is greater than .9
blast <- subset (blast, cov > .9, select=-c(stitle))

# Read kegg.txt, produced by get_kegg_ids.py, as a table
kegg <- read.table ("kegg.txt", sep="\t", header=FALSE)

# Set the column names for kegg
colnames (kegg) <- c("sacc", "kegg")

# Remove the up: prefix from the accession number so it will match the BLAST
# subject accession (sacc)
kegg$sacc <- gsub ("up:", "", kegg$sacc) # e.g. up:P17126

# Merge the tables. Since one column name in common (sacc), just give
# the two tables as parameters to merge.
blast_kegg <- merge(blast, kegg)

# printing in R, using paste0
print (paste0 ("Printing Merged blast & kegg: blast_kegg"))
# Display the first few lines of output
head (blast_kegg)

# read in the large file, if you want to do this locally, you'll need to scp this file
go <- read.csv ("/data/METHODS/Fall/sp_go.txt", sep="\t", header=FALSE) 
colnames (go) <- c("sacc", "go") # add some column names
print(paste0("Printing head of sp_go.txt"))
head(go)

# merge the data structures
blast_kegg_go <- merge(blast_kegg, go)
print(paste0("Printing Merged blast_kegg & go: blast_kegg_go"))
head(blast_kegg_go)

# read in the ko.txt file
ko <- read.table("ko.txt", sep="\t", header=FALSE)
colnames(ko) <- c("kegg", "ko")
print(paste0("Printing head of ko.txt"))
head(ko)

path <- read.table("path.txt", sep="\t", header=FALSE)
colnames(path) <- c("ko", "path")
print(paste0("Printing head of path.txt"))
head(path)

desc <- read.table("ko", sep="\t", header=FALSE)
colnames(desc) <- c("path", "desc")
print(paste0("Printing head of ko"))
head(desc)

blast_ko <- merge(blast_kegg_go, ko)
print(paste0("Printing Merged blast_kegg_go & ko: blast_ko"))
head(blast_ko)

blast_path <- merge(blast_ko, path)
print(paste0("Printing Merged blast_ko & path: blast_path"))
head(blast_path)

blast_desc <- merge(blast_path, desc)
print(paste0("Printing Merged blast_path & desc: blast_desc"))
head(blast_desc)

# write out to a csv that can be used for downstream analysis
write.csv(blast_desc, file="blast_desc.csv")
NOTE: if you get the following error when reading your alignPredicted.txt,

Warning message:
In scan(file = file, what = what, sep = sep, quote = quote, dec = dec,  :
  EOF within quoted string
