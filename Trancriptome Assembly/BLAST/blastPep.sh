#!/usr/bin/env bash
# blastPep.sh

# here you are using many sequences, each will be run and compared to swissprot db
# let's make sure to run with -outfmt 6.  NOTICE we are now using blastp
blastp -query Trinity.fasta.transdecoder_dir/longest_orfs.pep  \
    -db swissprot  -max_target_seqs 1 \
    -outfmt 6 -evalue 1e-5 -num_threads 4 1> blastp.outfmt6 \
    2>blastp.err
