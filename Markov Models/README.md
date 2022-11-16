# Module03-Pattern Discovery, Markov Models, and R
Sita Karan Patel
module03-sitakaranpatel-Pattern Discovery, Markov Models, and R


## Methods
The module Pattern Discovery, Markov Models consists of scripts that run in R

The module03-sitakaranpatel directory consists of the followign files:

~/BINF6309/module03-sitakaranpatel/AnalyzeOutSpattFrom2Genomes.R

~/BINF6309/module03-sitakaranpatel/out.txt

~/BINF6309/module03-sitakaranpatel/markov_chains.R

~/BINF6309/module03-sitakaranpatel/README.md 

## AnalyzeOutSpattFrom2Genomes.R
Analyzed 8 length  kmers of using a 1st order Markov model for Pyrococcus_abyssi.fasta genome.
Analyzed 8 length  kmers of using a 1st order Markov model fo Pyrococcus_horikoshii.fasta genome.
Combined the outputs from 1 and 2 steps of the  Pyrococcus abyssi.fasta.8.m1.allwords.txt and Pyrococcus horikoshii.fasta.8.m1.allwords.txt,  into a single file.  Used the command pasteLinks to an external site. utilised the Linux command paste which is a utility used to join files horizontally taking out the lines of sequentially corresponding lines of each file specified (tab separated), to a  standard output. Quite similar to the cat utility command which works on vertical plane of  files.
The data is now present for analysis. 

## markov_chains.R 
This program show you how to generate a DNA sequence using a  multinomial model of DNA sequence evolution, and then moves onto a Markov model of DNA sequence evolution, plotting data as we go along. 
The R script performs DNA seequencing. By utilizing a multinomial model of DNA sequence evolution, a dna sequence is generated. It then goes to Markov model of DNA sequence evolution and the data is then plotted ussing ggplot. 


# Installing
- The files are under -rwxr-xr-x file permissions wherein the user has full acess. Others will be able to exceute the files only.

# Authors
- Sita Karan Patel, NUID-002938187
- patel.sit@norhtheastern.neu.edu
- patel.sit@login.discovery.neu.edu

# Acknowledgements
- BINF6309-module03-Professor Quan Wan.
