#!/bin/bash

# Build the Trimming Docker image
docker build -t trimming-image:1.0 -f Dockerfile.trim .

# Build the Alignment Docker image
docker build -t alignment-image:1.0 -f Dockerfile.align .

# Build the Sorting Docker image
docker build -t sorting-image:1.0 -f Dockerfile.sort .

# Build the Indexing Docker image
docker build -t indexing-image:1.0 -f Dockerfile.index .
