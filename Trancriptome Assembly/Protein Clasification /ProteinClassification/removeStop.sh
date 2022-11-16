#!/usr/bin/env bash
# removeStop.sh

sed 's/*//' /home/patel.sit/BINF6308/module-11-sitakaranpatel/ProteinClassification/BLAST/Trinity.fasta.transdecoder.pep | head -n 5000 > proteins.fasta
