#!/usr/bin/env python3
# This program reads from two files (left and right reads) Aip02.R1.fastq and Aip02.R2.fastq. The output the results to an interleaved fasta file named Interleaved.fasta
from Bio import SeqIO, Seq, SeqRecord

interleaved = list()
# the path of two input fastq files
file_path = '/scratch/AiptasiaMiSeq/fastq/'
l_file = file_path + 'Aip02.R1.fastq'
r_file = file_path + 'Aip02.R2.fastq'

# Parsing of files
left_reads = SeqIO.parse(l_file, 'fastq')
right_reads = SeqIO.parse(r_file, 'fastq')

# To zip both the files
both_reads = list(zip(left_reads, right_reads))
# iteration of first file
for l, r in both_reads:
    interleaved.append(l)
    interleaved.append(r)
# To write  fasta file
SeqIO.write(interleaved, "Interleaved.fasta", "fasta")


