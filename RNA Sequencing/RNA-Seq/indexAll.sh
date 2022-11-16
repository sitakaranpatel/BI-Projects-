#!/usr/bin/env bash
# indexAll.sh

# Initialize variable that has  directory of un-trimmed fastq files 
fastqPath="/scratch/AiptasiaMiSeq/fastq/"
leftSuffix=".R1.fastq"
rightSuffix=".R2.fastq"
bamOutPath="bam/"
bamSuffix=".sorted.bam"


function indexAll {
    for trimFile in $bamOutPath*$bamSuffix
    do
          # Removes path from filename and then assign to removePath
          removePath="${trimFile/$bamOutPath/}"
          #removes the suffix and only gives the sample names
          sampleName="${removePath/$bamSuffix/}"
          echo $sampleName
          samtools index $bamPath${sampleName}.sorted.bam
    done
}
indexAll 1>indexAll.log 2>indexAll.err
