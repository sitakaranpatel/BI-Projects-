#!/usr/bin/env python
# This program reads the sequence of the file aip_kmers.txt line by line and counts the 6-mers within the sequence and then gives a list down of the 6-mers along with the respective counts.

#importing re to support reguar expression  
import re
import os
# initailizing variables and assigning them values  
read_seq = open('/scratch/AiptasiaMiSeq/fastq/Aip02.R1.fastq','r')
aip_kmers = open("aip_kmers.txt",'w')
line = ' '
length_kmer = 6
dictionary_kmer = {}
  
while line:
      line = read_seq.readline()
      line = line.rstrip(os.linesep)
      if re.match('^[ATGCN]+$', line):
          sequence = line
          stop = len(sequence) - length_kmer +1
          for start in range(0, stop):
              kmer = sequence[start:start + length_kmer]
              if kmer in dictionary_kmer:
                 dictionary_kmer[kmer] += 1
              else:
                  dictionary_kmer[kmer] = 1
 
space = "\t"  
for kmer in dictionary_kmer:
     count_kmer = dictionary_kmer[kmer]
     output = (kmer, str(count_kmer))
     print(space.join(output))
     aip_kmers.write(space.join(output) + "\n")
 
read_seq.close()
aip_kmers.close()
