#!/usr/bin/env bash
# sbatch_clustalAlign.sh


###
# Slurm commands to request resources
###
#SBATCH --partition=express # choose from debug, express, or short
#SBATCH --job-name=clustalAlign # change this name to be informative for what you are running (eg. name of key script)
#SBATCH --time=00:30:00 # max time to run in hh:mm:ss, must be at or below max for partition
#SBATCH -N 1 # nodes requested
#SBATCH -n 1 # task per node requested
#SBATCH --output="batch-%x-%j.output" # where to direct standard output
# output file will be batch-<job-name>-<job-ID>.output and include stdout and stderr


###
# Usage
###
# Copy sbatch_clustalAlign.sh and clustalAlign.sh to your /scratch/username/ directory (or subdirectory)
# From that same directory run this command: 
# sbatch sbatch_clustalAlign.sh /home/username/where-to-put-output-files
#
# ASSUMES that input apoe_aa.fasta is also in the /home/username/where-to-put-output-files directory


###
# Core script
###
echo "Starting script $(date)"

echo "Loading required modules"
echo "   Anaconda3"
module load anaconda3/2021.11
echo "   Loading BINF6309 Environment (includes clustalo)"
source activate BINF-12-2021

echo "Copying input apoe_aa.fasta file from ${1} to $(pwd)"
cp ${1}apoe_aa.fasta .

echo "Align sequences within apoe_aa.fasta with clustalo $(date)"
bash clustalAlign.sh

echo "Copy apoe_alignment.txt output file to ${1}"
cp apoe_alignment.txt $1

echo "Cleaning up input and output files"
rm apoe_alignment.txt
rm apoe_aa.fasta

echo "Ending script $(date)"
echo "Don't forget to remove your log files in $(pwd) manually"
cp batch*.output $1
