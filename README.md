# Convert BibTeX to authoryear citation key

This program, `bibtex_authoryear.pl`, converts a BibTeX file to use authoryear citation keys. 

## Description

Usually, authoryear is preferred as the citation key for a BibTeX file. However, some programs do not export BibTeX with authoryear as the citation key. For example, EndNote exports BibTeX files with citation keys in the format of "RN1234". There is no easy way for EndNote to export a large number of references with authoryear keys in an automatic way. This program solves this problem by converting BibTeX files to use authoryear citation keys.

## Installation

The program requires Perl 5, but no other special packages.

To install the program, simply download the `bibtex_authoryear.pl` file and place it in a directory on your computer.

## Usage

To use the program, run the following command:

`bibtex_authoryear.pl input.bib > output.bib`

This will convert the BibTeX file `input.bib` to use authoryear citation keys, and save the result to `output.bib`.

The program "bibtex_authoryear.pl" converts a BibTex file to use authoryear as the citation key. The program parses the bibtex entries and use first author's last name + year as the citation key.  If there are multiple author+year combinations, surffix "b", "c", etc. will be added to make the key unique.


## Troubleshooting

If you encounter any issues while using the program, please refer to the `FAQ` file in this repo. If your issue is not addressed in the FAQ, please open an issue on GitHub.





