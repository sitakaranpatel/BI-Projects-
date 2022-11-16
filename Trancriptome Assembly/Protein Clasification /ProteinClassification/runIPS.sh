#!/usr/bin/env bash
# runIPS.sh

PATH="/usr/local/programs/jdk-11.0.9/bin/:$PATH"
export PATH

function scan {
        /usr/local/programs/interproscan-5.47-82.0/interproscan.sh \
        -pa \
        -cpu 4 \
        -i proteins.fasta \
        -o /home/patel.sit/BINF6308/module-11-sitakaranpatel/ProteinClassification1/proteins.tsv \
        -f TSV \
        -goterms \
        -dp
}
scan 1>scan.log 2>scan.err
~                          
