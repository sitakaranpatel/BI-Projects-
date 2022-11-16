#!/usr/bin/env bash
# runSpades.sh 

#Initialize a variables which are the paths to the left and right reads.
left_file="/home/patel.sit/BINF6308/module-10-sitakaranpatel/GenomeAssembly/Paired/*_1.fastq"
right_file="/home/patel.sit/BINF6308/module-10-sitakaranpatel/GenomeAssembly/Paired/*_2.fastq"
outpath="Rhodo"
# Defining a function and looping through the fastq files that have the  left reads present in the files.
function runSpades {
	for left_in_file in left_file
		do
			/usr/local/programs/SPAdes-3.14.1-Linux/bin/spades.py \
			-t 4 \
			-1 $left_file \
			-2 $right_file \
			-o $outpath
		done
}
runSpades 1>runSpades.log 2>runSpades.err
