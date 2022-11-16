#!/usr/bin/env bash
# sort.sh
samtools sort -@ 8 -m 4G SRR6808334.sam -o SRR6808334.bam \
    1>sort.log 2>sort.err &
