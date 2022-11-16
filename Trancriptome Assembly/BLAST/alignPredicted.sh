#!/usr/bin/env bash
# alignPredicted.sh
# We will run the sequences and then will be compared to swlssprot db
# usage of evalue 1e-10
# running with 6 qseqid sacc qlen slen length nident pident evalue stitle

blastp -query Trinity.fasta.transdecoder.pep \
    -db swissprot \
    -outfmt "6 qseqid sacc qlen slen length nident pident evalue stitle" \
    -evalue 1e-10 -num_threads 4 \
    1>alignPredicted.txt 2>alignPredicted.err 

