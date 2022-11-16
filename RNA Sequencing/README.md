# BINF module 6 Short Read Alignment

## Your Name here
Sita Karan Patel

# Runnning the file 
./programname.sh 

# Methods
In the assignment short read alignment consisted of alignment of the genomic sequences to the reference genome. It consisted of the following steps:

1.The reads of the fastq file were trimmed.

2.Trimmomatic methods which are transcriptome assemblers was used to trim the reads from the fastq file.

3.The trimmed reads were then aligned to the reference genome and generation of aligned files.

4.The aligned files were sorted with the help of sam tools.

5.Indexing of the bam files which were generated.

In the beginning the raw data i.e fastq files were trimmed with Trimmomatic. This will check the quality scores. Paired and unpaired reads were then obtained. Fastq file provides the raw data of Aiptasia pallidia.
Then the left and right suffix is defined by R1 and R2 reads which shows forward and reverse reads. Parameters are defined in the FOR loop.The FOR loop consists of pathremoved whose function is to remove path from the fastq file.
The alignment of the reads of the paired ends was done by using gsnap which runs alignment
GMAP was used for faster alignment.
sam read files are used for sorting in BAM format which converts Aip02sam to sorted BAM format which are then converted to BAM directories.
Then the sorted reads are indexed with samtools where it’s converted to BAM format with bai file.


# References:

Wang, Fang, B., Chen, J., Zhang, X., Luo, Z., Huang, L., Chen, X., & Li, Y. (2010). De novo assembly and characterization of root transcriptome using Illumina paired-end sequencing and development of cSSR markers in sweetpotato (Ipomoea batatas). BMC Genomics, 11(1), 726–726. https://doi.org/10.1186/1471-2164-11-726

Bolger, Lohse, M., & Usadel, B. (2014). Trimmomatic: a flexible trimmer for Illumina sequence data. Bioinformatics (Oxford, England), 30(15), 2114–2120. https://doi.org/10.1093/bioinformatics/btu170

Burgess, David, R., & Searle, I. R. (2015). Conservation of tRNA and rRNA 5-methylcytosine in the kingdom Plantae. BMC Plant Biology, 15(1), 199–199. https://doi.org/10.1186/s12870-015-0580-8


