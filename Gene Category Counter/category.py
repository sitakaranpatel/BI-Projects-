"""
File:  categories.py

This program takes in two files and determines the number
of times a a particular gene occurs in a certain category
and writes the occcurence, description and category into an output file.

Sample command for executing the program:
python3 categories.py -i1 chr21_genes.txt -i2 chr21_genes_categories.txt
"""
import argparse
from assignment4 import my_io


def main():
    """ Business Logic
    The main function where all other functions are invoked
    """
    args = get_cli_args()
    infile1 = args.infile1
    infile2 = args.infile2
    fh_in = my_io.get_fh(infile1, "r")
    fh_in_2 = my_io.get_fh(infile2, "r")
    occurrence = count_genes_in_category(fh_in)
    description = description_of_category(fh_in_2)
    outfile = my_io.get_fh("OUTPUT/categories.txt", "w")
    write_output(occurrence, description, outfile)


def count_genes_in_category(fh_in):
    """
    Takes in the input file chr21_genes.txt and counts the number of gene
    symbols in each category.
    @param fh_in: The input chr21_genes.txt file
    @return:
    """
    occurrence = {}
    lines = fh_in.readlines()
    for line in lines:
        categories = line.replace("\n", "")
        categories = categories.split("\t")[2]
        occurrence[categories] = occurrence.get(categories, 0)
        occurrence[categories] += 1
        ascending_order_dictionary = dict(sorted(occurrence.items()))
    return ascending_order_dictionary


def description_of_category(fh_in_2):
    """
    Takes the input file containing categories and description and
    gets the dictionary of description of each category.
    @param fh_in_2: chr21_genes_categories.txt
    @return:
    """
    description_dictionary = {}
    lines = fh_in_2.readlines()
    for line in lines:
        description = line.replace("\n", "")
        description = description.split("\t")[1]
        categories = line.replace("\n", "")
        categories = categories.split("\t")[0]
        description_dictionary[categories] = description
    return description_dictionary


def write_output(occurrence, description, outfile):
    """
    @param occurrence: The count of gene repetitions
    @param description: The description of each category
    @param outfile: Output written to OUTPUT/categories.txt
    """
    outfile.write("Category\tOccurrence\tDescription\n")
    for k_1, v_1 in occurrence.items():
        for k_2, v_2 in description.items():
            if k_1 == k_2:
                outfile.write(f"{k_1}\t{v_1}\t{v_2}\n")


def get_cli_args():
    """
    Just get the command line options using argparse
    @return: Instance of argparse arguments
    """
    parser = argparse.ArgumentParser(description='Combine on gene name \
                                    and count the category occurrence')
    parser.add_argument('-i1', '--infile1', dest='infile1',
                        type=str, help='Path to the gene description file \
                        to open',
                        required=False, default='./chr21_genes.txt')
    parser.add_argument('-i2', '--infile2', dest='infile2',
                        type=str, help='Path to the gene category to open',
                        required=False, default='./chr21_genes_categories.txt')
    return parser.parse_args()


if __name__ == '__main__':
    main()