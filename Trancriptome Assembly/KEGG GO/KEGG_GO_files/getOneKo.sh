#!/usr/bin/env bash
# getOneKo.sh

# Retrieve from KEGG API and append result to kegg.txt
curl http://rest.kegg.jp/link/ko/hsa:348 1>ko.txt 2>ko.err
