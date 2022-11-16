#!/usr/bin/env python3
# get_kegg_ids.py
import subprocess

# Open the BLAST output
blast_output = open('alignPredicted.txt') #  module08 output must be in your working dir, so scp it to your local machine
sp_ids = {} # store accessions so we only query KEGG once

# Open files for stdout and stderr
out = open('kegg.txt','w')  # this will be used for input into the next Python program
err = open('kegg.err','w')

# Iterate over each line of BLAST output, one by one
for blast_line in blast_output:
    # Remove new line character
    blast_line = blast_line.rstrip()
    
    # Split line on whitespace
    fields = blast_line.split()
    sp = fields[1]
    evalue = fields[7]
    
    # commented out, b/c I was just making sure I had the right variables
    #print(sp + "\t" + evalue)
    #quit()

    # Check for e-value less than 1e-180
    if float(evalue) < float("1e-180"):
        sp_ids[sp] = 1 # keep writing it over, b/c all we care about is the key itself
     
print(f"found {len(sp_ids)} keys")

for sp in sp_ids:
    cmd = f"curl http://rest.kegg.jp/conv/genes/uniprot:{sp}"  # f-string let's variable inside the string
    # print(cmd) # good to test, before you actually run subprocess.call
    result = subprocess.call(cmd, stdout=out, stderr=err, shell=True)

out.close()
err.close()
