#!/usr/bin/env bash                                                            
# runQuast.sh

#Defining variables for the file path and the reference genome path 
inFile="/home/patel.sit/BINF6308/module-10-sitakaranpatel/GenomeAssembly/Rhodo/scaffolds.fasta"
reference_genome="/data/METHODS/Fall/Module10/GCF_000012905.2_ASM1290v2_genomic.fna"

nice -n19 /usr/local/programs/quast-4.6.3/quast.py \
--threads 4 \
-R $reference_genome \
-f $inFile \
--scaffolds \
-o /home/patel.sit/BINF6308/module-10-sitakaranpatel/GenomeAssembly/quast_output

runQuast 1>runQuast.log 2>runQuast.err
