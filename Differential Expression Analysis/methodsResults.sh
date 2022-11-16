# Title: Differential Expression Analysis.

# Methods
The module Differential Expression Analysis consits of the following files:

-AnalyzeOutSpattFrom2Genomes.R

-de.R

-deAnnotated.csv

-alignAll.sh

Differential Expression Analysis tells us the relative abundance, that is, the the number of NGS reads that that will match to the gene of the reference genome. Here "Salmon" is used to determine the relative abundance estimates which are then imported by "tximport" and the differentially expressed genes are then recognized by "DeSeq2" which will do statistical testing.
Workflow through files:
1. buildIndex.sh - The purpose of the script is to create a salmon index from de-novo transcriptome.
2. alignAll.sh - The purpose of the script is to perform the relative abundance of all the Aip samples present in the work/courses/BINF6309/AiptasiaMiSeq/fastq/  and then align them to AipIndex with the help of Salmon.
3. de.R - The purpose of the script is to perform differential expression analysis using DEseq2 after the Salmon alignments are imported.As a component of the Bioconductor project, DESeq2 is accessible through R.The DESeq2 package includes a thorough vignette that walks users through various examples of differential expression studies performed on actual datasets and demonstrates how to utilize rlog transformation for evaluating and visualizing data quality. The default analysis is conducted using just one function, DESeq, however more experienced users can additionally use lower-level functions.
Salmon has bias models that performs fast mapping and works  on parallel inference algorithm. The advantages of Salmon is improved accuracy of the abundance estimates and sensitivity of the analysis  as it corrects the GC content bias. 
Adjustment of the pp value was done using the function kable(). The output from the file was then presented in the form of deAnnotated.csv file. 
to map the transcripts from tximport to the genes in a tabular format for ease in visualization.



# Author
Sita Karan Patel, NUID-002938187
patel.sit@norhtheastern.neu.edu
patel.sit@login.discovery.neu.edu

# Acknowledgements
Professor Quan Wan.

# References
Patro R;Duggal G;Love MI;Irizarry RA;Kingsford C; (n.d.). Salmon provides fast and bias-aware quantification of transcript expression. Nature methods. Retrieved October 14, 2022, from https://pubmed.ncbi.nlm.nih.gov/28263959/ 

Anders, S., &amp; Huber, W. (2010, March 15). Differential expression analysis for sequence count data. Nature News. Retrieved October 14, 2022, from https://www.nature.com/articles/npre.2010.4282.1 

Love, M. I., Huber, W., &amp; Anders, S. (2014, December 5). Moderated estimation of fold change and dispersion for RNA-seq data with DESEQ2 - Genome Biology. BioMed Central. Retrieved October 14, 2022, from https://genomebiology.biomedcentral.com/articles/10.1186/s13059-014-0550-8 



