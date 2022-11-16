#!/usr/bin/env python3
# get_path.py
import subprocess

# Open the BLAST output
ko = open('ko.txt')
ko_dict = {} # store KO IDs so we only query KEGG once

# Open files for stdout and stderr
out = open('path.txt','w')
err = open('path.err','w')

# Iterate over lines of the KEGG to KO mapping file.
for ko_line in ko:
    # Remove line terminator
    ko_line = ko_line.rstrip()
    
    # Split line on whitespace
    fields = ko_line.split()
    
    # Make sure fields[1] exists
    if len(fields) > 1:
        ko = fields[1]
        ko_dict[ko] = 1

print(f"found {len(ko_dict)} keys")

for ko in ko_dict:
    cmd = f"curl http://rest.kegg.jp/link/pathway/{ko}"
    # print(cmd) # good to test, before you actually run subprocess.call
    result = subprocess.call(cmd, stdout=out, stderr=err, shell=True)

out.close()
err.close()
