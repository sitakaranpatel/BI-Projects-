## Module06-Module 6 Practice: Multiple Sequence Alignment 
Sita Karan Patel module06-sitakaranpatel-Module 6 Practice: Multiple Sequence Alignment 

# Methods
The module Module 6 Practice: Multiple Sequence Alignment  consists of scripts:
module6-sitakaranpatel/translate_APOE.py
module6-sitakaranpatel/clustalAlign.sh

We downloaded the APOE gene orthologs from various species and then converted the nucleotide sequences to amino acid using a Python 3 or BioPython script. The multiple seqment of the numerous sequences was done using Clustal Omega.

## translate_APOE.py : 
The python script takes in the NCB sourced ortholog file named as ‘APOE_refseq_transcript.fasta’ and translates the sequence to give an output file ‘apoe_aa.fasta’.  This was done using Biopython seqIO module.

## clustalAlign.sh: 
The following bash file performed multiple seq alignment of the translated amino acid sequences present in the 
‘apoe_aa.fasta’ file and generated an output file ‘apoe_alignment.fasta’. custalo function was used and the input and output file names were specified. 


# Installing
* The files are under -rwxr-xr-x file permissions wherein the user has full access. Others will be able to exceute the files only.

# Authors
* Sita Karan Patel, NUID-002938187
* patel.sit@norhtheastern.neu.edu
* patel.sit@login.discovery.neu.edu

# Acknowledgements
* BINF6309-module06-Professor Quan Wan.

