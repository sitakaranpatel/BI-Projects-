#!/usr/bin/env bash
# alignAll.sh
# Adding the path of  un-trimmed fastq files 
input="/work/courses/BINF6309/AiptasiaMiSeq/fastq/"

# Adding suffix of the  reads 
left=".R1.fastq"
right=".R2.fastq"

# Adding the path for the output file quant
outDir="quant/"

# initializing a funciton for assignment
function align {

# adding a loop so that all the aip samples are aligned by salmon 
    for i in $input"Aip"*$left
    do
        # the path was removed from the file and then assigned to the sample
        path_change="${i/$input/}"
        # give the final name
        samples="${path_change/$left}"

        salmon quant -l IU \
                -1 /work/courses/BINF6309/AiptasiaMiSeq/fastq/$samples$left \
                -2 /work/courses/BINF6309/AiptasiaMiSeq/fastq/$samples$right \
                -i AipIndex \
                --validateMappings \
                -o $outDir$samples
done
}
align

alignAll 1>alignall.log 2>alignall.err

