#!/usr/bin/env bash
# index.sh
samtools index -b SRR6808334.bam \
    1>index.log 2>index.err &
