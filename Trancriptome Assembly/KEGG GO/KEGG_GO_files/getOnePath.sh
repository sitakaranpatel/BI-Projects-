#!/usr/bin/env bash
# getOnePath.sh

# Retrieve pathways from the KEGG API and append result to path.txt
curl http://rest.kegg.jp/link/pathway/ko:K04524 1>path.txt 2>path.err
