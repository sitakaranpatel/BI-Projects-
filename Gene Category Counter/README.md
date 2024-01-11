# Overview
This program counts how many genes are in each category based on data from the chr21_genes.txt file. The program prints the results so that categories are arranged in ascending order to an output file to the output file OUTPUT/categories.txt

## Description
The chr21_genes.txt file lists genes from human chromosome 21, in their order along the chromosome and the HUGO_genes.txt file lists all human genes having official symbol approved by the HUGO gene nomenclature committee. The function get_description_dictionary(fh_in) Takes in the input file, reads it and returns a dictionary of descriptions corresponding to each category.

## Functionality

1. **Count Genes in Category**
   - Reads `chr21_genes.txt`.
   - Counts the occurrences of each gene in a category.
   - Returns a dictionary with categories sorted in ascending order.

2. **Description of Category**
   - Reads `chr21_genes_categories.txt`.
   - Extracts the description corresponding to each category.
   - Returns a dictionary of category descriptions.

3. **Write Output**
   - Writes results, including category, occurrence, and description, to `OUTPUT/categories.txt`.

## Command Line Options

- `-i1` or `--infile1`: Path to the gene description file (`chr21_genes.txt`). Default is `./chr21_genes.txt`.
- `-i2` or `--infile2`: Path to the gene category file (`chr21_genes_categories.txt`). Default is `./chr21_genes_categories.txt`.

## Dependencies

- Python 3.x
- Linux or any other CLI environment

## Output

Results are written to `OUTPUT/categories.txt` in a tabular format with columns for Category, Occurrence, and Description.

## Author

Sita Patel



