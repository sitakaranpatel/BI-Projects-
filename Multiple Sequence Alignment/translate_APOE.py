#!/usr/bin/env python3
# importing biopython modules
from Bio import SeqIO
from Bio.SeqRecord import SeqRecord

# open the input ortholog fasta file and saving the changes made to apoe_aa.fasta
with open("apoe_aa.fasta", 'w') as temp:
    for aa in SeqIO.parse("APOE_refseq_transcript.fasta", 'fasta'):
        # using .translate function to translate the nucletide sequence
        translated_apoe = SeqRecord(description=aa.description, id=aa.id, seq=aa.seq.translate()).format('fasta')   # noqa: E501
        temp.write(translated_apoe)
# end
