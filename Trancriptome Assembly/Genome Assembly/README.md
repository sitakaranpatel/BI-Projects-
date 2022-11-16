## Assignment 10  Genome Assembly

## Author

Sita Karan Patel

## Date Created

Apr-17-2022

## To run the file
./file_name

## Methods

This assignment instructs about Genome Assembly which consist of assembling the genomic data in the right order. The module comsisted of the following programs:

getNGS.sh
trim.sh
runSpades.sh
runQuast.sh

1. getNGS.sh :
SRA (Sequence Read Archive) consists of a repository of raw as well as high throughput sequencing data. SRA also read positions on a reference sequence and are then used to store alignment information.
The getNGS.sh program will retrieve from Rhodobacter spheroids the NGS genomic data and then translates into fastq format with the help of  Fastq dump. Fastq dump has command line utility to take in the  genomic sequences.
The 1> will create getNGS.log file which consists of  STDOUT and >2 will create getNGS.err file which consists of the STDERR each files.
The fastq files should have equal amount of lines.

2. trim.sh
The genomic reads from the fastq files are then quality trimmed using trimmomatic. Trim.sh shell script will hence create trimmed reads, from which the paired reads will go to the Paired directory and the Unpaired reads will go to the Unpaired directory. Both the directories should have equal number of reads.


3. runSpades.sh
De Bruijn graph assembler is also known as SPAdes. SPAdes assembler performs NGS and is an open source tool by Illumina. It is based on the
Spades takes in paired, unpaired and mate pair reads in fastq format and then converts assembles the input into scaffolds or configs. SPAdes employs two methods for  scaffolds from contigs. The first uses read pairs to try to estimate the size of the gap between contigs. The assembly graph is used in the second one. The contigs do not contain the N symbol. The scaffolds are given names like NODE 1, NODE 2, and so on in the file, and they are arranged in decreasing order of length, with NODE 1 being the longest scaffold in the assembly. A FASTA header for each scaffold in the file specifies its name, length in basepairs, and coverage.
The coverage information or value is given by ‘k-mer coverage’ which is given by the formula

              Ck = C∗(L−k+1)/L
              Ck – k-mer coverage
              C – base coverage
              L – length of reads
              K – largest kmer size
              

   Here in our module, a Rhodo directory will be created which has the scaffolds.fasta file.

4. runQuast.sh
QUAST is a genome assembly evaluation tool which takes in a number of assemblies and then compares them. The advantage of quast is that we can use it without a reference genome also. A number of metrics will evaluate the genomic assemblies.
The metrics

Quast evaluates the following metrics:
1. Contig sizes: No. of contigs, largest contig, total length, Nx, NGx, Genome Nx.
2.  Misassemblies and structural variations: No. of misassemblies, no. of misassembled contigs, misassembled contigs length, no. of unaligned contigs and no. of ambiguously mapped contigs.
3. Genome representation and its functional elements: Genome fraction (%), Duplication ratio, GC (%), No. of indels per 100 kb, No. of genes, No. of operons and No. of predicted genes.
Here in our module, the genomic reads from scaffolds.fasta will be assembled by splitting the scaffolds and then comparing them with the contigs. Quast_ouput directory consists of the output from the quast.py program. The report.txt file will contain the metrics information. Multiple plots are created such as Nx_plot.pdf, GC_content_plot.pdf, cumulative_plot.pdf and coverage_histogram.pdf for visualization.

## Conclusion from Analysis

If we analyse the data from report.txt generated, we will notice that:


1. The scaffolds have greater N50 value which is 27657 compared to the scaffold broken which has a lower N50 value which is 25496.
We can distinguish scaffolds and scaffolds_broke based on the continuity of the fragments. Scaffolds_broken is characterized by continuous fasta fragments which gets split from the fasta  input which is continuous. Because of the high number of split contigs, the N50 value is less.
2. scaffold broken has lesser value of N75, NG50, NG75 then scaffold.
3. L75, LG75, L50, LG50 values of scaffolds_broken is greater. 
4. LA50, NA50, NGA50, NA75 of scaffolds is greater than scaffolds_broken.
5.  % GC content and reference GC % of both scaffolds and scaffolds_broken are the same.

Plots generated:

The report.txt file contains the following shift:
>>Nx_plot.pdf : The plot depicts the x value which is based on the contig length, with greater contig length the x percentage value also increases. Since scaffold_broken has shorter contig length when compared with scaffold file, the N50 value is low.

>>GC_content_plot.pdf: In this plot the x axis consist of the GC% and the y axis is the number of windows which do not overlap with the  content equals x%.  A singular peak will indicate the genome. At 70% GC, a peak is seen which decreases and becomes 0 at 85 %  for scaffold and scaffold_broken.

>>cumulative_plot.pdf: Contig length growth is indicated by the plot wherein the contig length and index are directly proportional to each other.  At 300 contig index, the contig length increased at 4500kb on y axis.

>>Coverage histogram: The coverage depth increased in our graph with increase in contig length.  The coverage depth peaked at 1000 and gradually decreased with the lowest point seen at 13.7 coverage depth.  

## Future Directions
Gene ontology, which is the annotation of the functional proteins, is carried out to associate functions. The gff file can be converted to a fasta fle by using Samools and Bedtools. Biopython can aid to parse the gff file. 1.To do this, first the annotations are decided by examination of the files. 2.We then define the important items. 3.The separate parsing of the fasta file takes place. To bypass the memory issue, one can reduce the parsing features. The other way is to iterate the file portions.
FA- nf can also be used to automate the protein annotation process. Here docker images are generated and GO and protein sequences in fasta format are utilized. The output consists of the annotated files and a HTML report with a summary of the results. 


## References:

Retrieved from Canvas.Savol.A(2022).

Douglass, A. P., O'Brien, C. E., Offei, B., Coughlan, A. Y., Ortiz-Merino, R. A., Butler, G., Byrne, K. P., & Wolfe, K. H. (2019). Coverage-Versus-Length Plots, a Simple Quality Control Step for de Novo Yeast Genome Sequence Assemblies. G3 (Bethesda, Md.), 9(3), 879–887. https://doi.org/10.1534/g3.118.200745

A., G. (n.d.). Center for Algorithmic Biotechnology. Retrieved April 26, 2022, from https://cab.spbu.ru/software/quast/ 

Gurevich, A., Saveliev, V., Vyahhi, N., & Tesler, G. (2013). QUAST: quality assessment tool for genome assemblies. Bioinformatics (Oxford, England), 29(8), 1072–1075. https://doi.org/10.1093/bioinformatics/btt086


