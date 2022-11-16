#!/usr/bin/env bash
# alignAll.sh

FastqPath="/scratch/AiptasiaMiSeq/fastq/"
paired_path="/home/patel.sit/BINF6308/module-06-sitakaranpatel/RNA-Seq/Paired"
l_Suffix=".R1.fastq"
r_Suffix=".R2.fastq"
samPath="sam/"
# Defining the output path exists
mkdir -p $samPath
#Initializing a for loop inside the function 
function alignAll {
    for trimFile in $FastqPath*$l_Suffix
    do
          # removes path from filename with no replacement
          removePath="${trimFile/$FastqPath/}"
          # removes the suffix and only gives the sample names
          sampleName="${removePath/$l_Suffix/}"
          nice -n19 gsnap \
          -A sam \
          -D . \
          -d AiptasiaGmapDb \
          -s AiptasiaGmapIIT.iit \
          Paired/${sampleName}$l_Suffix \
          Paired/${sampleName}$r_Suffix \
          1>$samPath${sampleName}.sam
     done
}
# To put the output in the .log and .err files.
alignAll 1>alignAll.log 2>alignAll.err
