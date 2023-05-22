# Project Introduction

The aim of this project is process and wrangle data set from NGS
pipeline into a long format, and visualise prevalence key drug
resistance associated mutations in spatial format on maps. The script
should process datasets with varying number of columns and observations.
The data in this project is a summary from bioinformatics pipeline for
next generation sequencing of targeted polymorphic genomic regions. The
table populates individual patient genotype information at specific loci
for each gene.

## Description of the data

-   The *first column* is the sample identification. It contains three
    key information types:
    -   site (represented by the first 2 or 3 letter codes),
    -   period ( two digits separated from site code by a dash),
    -   the sample number (three digits after the year code). The letter
        codes and digits that follow are from sequencing run and not
        important.
-   *Column-2 and the rest* have have loci as column name and animo acid
    calls as observations. Both the column name and observations carry
    additional information of interest that need to be extracted
    -   *column name*: this contains three informations
        -   the NCBI geneid (*PF3D7\_ * followed by digits); gene
            name-abbreviation (letter codes after the period following
            the NCBI geneID and ends with the period that is followed by
            digits (*loci*)
    -   the observations carry two pieces of information:
        -   the amino acid call(s) (the three letter amino acid codes).
            If both reference and alternative amino acids are detected,
            they are separated by comma.
        -   the read depth (digits enclosed in brackets). When more than
            one value is present, each is separated by coma.

## Data Manipulation goals

### Goal 1. To process the data set and format it into the long format. The data set should contain the following column headers and their correspond source of values

    - sampleID: the values are to be extracted from the first column and it should contain sitecode-period- samplenumber.
    - siteName: values from transforming the sitecode into full names as in defined the     bracket(AG=agago,   LM=lamwo, KO=kole, AM=amolatar, KBG=kaabong, KTK=katakwi, AR=arua, KBK=koboko, HO=hoima, KS=kasese, KN=kanungu, KB=kabale, MU=mubende, JI=jinja, TO=tororo, KAP=kapchorwa)
    - year: values from transforming the period (digits) into year as defined in the brackets (“00”=2016, “02”=2017, “03”=2018, “04”=2019, “05”=2020, “06”=2021, “07”=2022, “08”=2023, “09”=2024, “10”=2025)
    - geneid: values obtained from column names by extracting the NCBI geneid
    - genename: values obtained from column names by extracting genename 
    - loci: values obtained from column names and observations by extracting loci and amino acid call ( Ala16Val, Ile51Asn, Cys59Arg,   Asn108Ser, Ile164Leu, Thr185)
    - genotype: values obtained from observations. 
        - aminoacid, then loci = 0 (widtype)
        - aminoacid, loci aminoacid = 1 (mixed)
        - loci, amino acid = 2 (mutant)
    - depth: values obtained from observations, stored in brackets. Where there are two more values, average is taken.

### Goal 2. Visualisation goals

    - represent the prevalence of resistance genotypes on map. Geolocate prevalences on site location,
    - maps to be faceted by year of sample collection.
