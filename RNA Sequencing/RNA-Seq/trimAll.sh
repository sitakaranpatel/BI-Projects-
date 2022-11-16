#!/usr/bin/env bash
# trimAll.sh

# Initialize variable that has  directory of un-trimmed fastq files 
fastqPath="/scratch/AiptasiaMiSeq/fastq/"

# Initialize variable that consists of  suffix for the left reads
leftSuffix=".R1.fastq"
rightSuffix=".R2.fastq"
pairedOutPath="Paired/"
unpairedOutPath="Unpaired/"

# Create the output directories
mkdir -p $pairedOutPath
mkdir -p $unpairedOutPath
#Initialize a for loop
# Loop left-read fastq files in $fastqPath
function trimAll {
    for leftInFile in $fastqPath*$leftSuffix
    do
        # Remove the path from the filename and assign to pathRemoved
        pathRemoved="${leftInFile/$fastqPath/}"
        # Remove the left-read suffix from $pathRemoved and assign to suffixRemoved
        sampleName="${pathRemoved/$leftSuffix/}"
        # Printing of $sampleName
        echo  $sampleName
        nice -n19 java -jar /usr/local/programs/Trimmomatic-0.36/trimmomatic-0.36.jar PE \
        -threads 1 -phred33 \
        $fastqPath$sampleName$leftSuffix \
        $fastqPath$sampleName$rightSuffix \
        $pairedOutPath$sampleName$leftSuffix \
        $unpairedOutPath$sampleName$leftSuffix \
        $pairedOutPath$sampleName$rightSuffix \
        $unpairedOutPiath$sampleName$rightSuffix \
        HEADCROP:0 \
        ILLUMINACLIP:/usr/local/programs/Trimmomatic-0.36/adapters/TruSeq3-PE.fa:2:30:10 \
        LEADING:20 TRAILING:20 SLIDINGWINDOW:4:30 MINLEN:36
    done
}
trimAll 1>trimAll.log 2>trimAll.err
