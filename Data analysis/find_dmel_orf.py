#!/usr/bin/env python3
# To transcribe and translate the first ORF of Dorsophila genome to a protein
# Importing regular expresssion 
import re
# Importing SeqIO
from Bio import SeqIO
# Importing Seq()
from Bio.Seq import Seq
# Defining file name 
FILE_NAME = "/scratch/Drosophila/dmel-all-chromosome-r6.17.fasta"
# Initialising for loop to parse the file with SeqIO function 
for record in SeqIO.parse(FILE_NAME, "fasta"):
    if re.match("^\d{1}\D*$", record.id):
       DNA = record.seq
# Transcribing DNA to RNA
       RNA = DNA.transcribe()
       FIRST_ORF = re.search('AUG([AUGC]{3})+?(UAA|UAG|UGA)', str(RNA)).group()
       REQUIRED_PROTEIN = Seq(FIRST_ORF)
# Translating protein from RNA
       FINAL_PROTEIN = REQUIRED_PROTEIN.translate()
       print(FINAL_PROTEIN)
