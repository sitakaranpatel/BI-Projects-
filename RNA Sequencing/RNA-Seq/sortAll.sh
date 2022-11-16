#!/usr/bin/env bash
#!sortAll.sh
samPath="sam/"
samSuffix=".sam"
bamOutPath="bam/"
bamSuffix=".sorted.bam"

mkdir -p $bamOutPath

function sortAll {
    for trimmedFile in $samPath*$samSuffix
    do
          #removes path from filename with no replacement
          removePath="${trimmedFile/$samPath/}"
          #removes the suffix and only gives the sample names
          sampleName="${removePath/$samSuffix/}"
          nice -n19 samtools sort \
          $samPath$sampleName$samSuffix \
          -o $bamOutPath$sampleName$bamSuffix
    done
}
sortAll 1>sortAll.log 2>sortAll.err
