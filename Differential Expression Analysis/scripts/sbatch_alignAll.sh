#!/usr/bin/env bash
# sbatch_alignAll.sh


###
# Slurm commands to request resources
###
#SBATCH --partition=express  # choose from debug, express, or short
#SBATCH --job-name=alignAll  # change this name to be informative for what you are running (eg. name of key script)
#SBATCH --time=00:01:00  # max time to run in hh:mm:ss, must be at or below max for partition
#SBATCH -N 1  # nodes requested
#SBATCH -n 1  # task per node requested
#SBATCH --output="batch-%x-%j.output"  # where to direct standard output

# output file will be batch-<job-name>-<job-ID>.output and include stdout and stderr
# to capture stderr to a separate file add the --error= command to a new sbatch line


###
# Usage
###
# Copy sbatch_buildIndex.sh and buildIndex.sh to your /scratch/username/ directory (or subdirectory)
# From that same directory run this command: 
# sbatch sbatch_alignAll.sh /home/username/where-to-put-output-files


###
# Core script
###
echo "Starting script $(date)"

echo "Loading required modules"
echo "   salmon/1.6.0/"
module load salmon/1.6.0/

echo "Copying AipIndex from ${1} to $(pwd)"
cp -R ${1}AipIndex/ .

echo "Align samples to AipIndex with salmon $(date)"
bash alignAll.sh

echo "Copy output files to ${1}"
cp -R quant/ $1 

echo "Clean up my scratch directory"
rm -R AipIndex/
rm -R quant/

echo "Ending script $(date)"
echo "Don't forget to remove your log files in /scratch/username/ manually"
cp batch*.output $1