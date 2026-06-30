-   [Introduction]
-   [1. Data Import and Wrangling](#data-import-and-wrangling)
    -   [1a) Import CSV into R](#a-import-csv-into-r)
    -   [1c) Add Kingdom Data](#c-add-kingdom-data)
-   [2. Data Manipulation](#data-manipulation)
    -   [2a) Remove Unwanted Columns](#a-remove-unwanted-columns)
    -   [2c) Simplify Columns](#c-simplify-columns)
    -   [2d) Make Column Names Readable](#d-make-column-names-readable)
-   [3. Data Visualisation](#data-visualisation)
    -   [3a) Create Relative Amount
        Table](#a-create-relative-amount-table)
    -   [3b) Visualise Difference Between
        Kingdoms](#b-visualise-difference-between-kingdoms)
    -   [3c) Visualise Most and Least Affected
        Classes](#c-visualise-most-and-least-affected-classes)


# Introduction

This analysis examines the **conservation status of species** across
different taxonomic classes and kingdoms, based on data from the **IUCN
Red List** (`SpeciesByKingdomAndClass.csv`). 

**What we will do:**

1.  **Import and enrich the data** – add Kingdom information based on
    taxonomic classification.
2.  **Clean and restructure** – remove non‑official categories, combine
    similar statuses, and rename columns for readability.
3.  **Create a percentage table** – express each category as a
    percentage of the total species count per class.
4.  **Visualise differences between Kingdoms** – compare the proportion
    of extinct, affected, and unaffected species across major kingdoms
    (Animalia, Plantae, Fungi, Chromista).
5.  **Identify most and least affected Classes** – highlight the classes
    with the highest and lowest percentages of Critically Endangered
    species.

------------------------------------------------------------------------

# 1. Data Import and Wrangling

## 1a) Import CSV into R

The dataset is imported from `~/Downloads/SpeciesByKingdomAndClass.csv`.
It contains information about the number of species in various IUCN Red
List categories for each taxonomic class.

    ## # A tibble: 6 × 16
    ##   Name     EX    EW `Subtotal (EX+EW)` `CR(PE)` `CR(PEW)` Subtotal (EX+EW+ CR(…¹
    ##   <chr> <dbl> <dbl>              <dbl>    <dbl>     <dbl>                  <dbl>
    ## 1 ACTI…    90    11                101      143         8                    252
    ## 2 AMPH…    37     2                 39      187         1                    227
    ## 3 ANTH…     0     0                  0        2         0                      2
    ## 4 ARAC…     9     0                  9       27         0                     36
    ## 5 ASTE…     0     0                  0        0         0                      0
    ## 6 AVES    164     5                169       18         2                    189
    ## # ℹ abbreviated name: ¹​`Subtotal (EX+EW+ CR(PE)+CR(PEW))`
    ## # ℹ 9 more variables: CR <dbl>, EN <dbl>, VU <dbl>,
    ## #   `Subtotal (threatened spp.)` <dbl>, `LR/cd` <dbl>, `NT or LR/nt` <dbl>,
    ## #   `LC or LR/lc` <dbl>, DD <dbl>, Total <dbl>



------------------------------------------------------------------------

## 1c) Add Kingdom Data

The original dataset does not contain a `Kingdom` column. We add it
using a lookup table that maps each class (`Name`) to its kingdom
(Animalia, Plantae, Fungi, or Chromista) based on the taxonomic
hierarchy from the IUCN website.


    ## # A tibble: 6 × 17
    ##   Name     EX    EW `Subtotal (EX+EW)` `CR(PE)` `CR(PEW)` Subtotal (EX+EW+ CR(…¹
    ##   <chr> <dbl> <dbl>              <dbl>    <dbl>     <dbl>                  <dbl>
    ## 1 ACTI…    90    11                101      143         8                    252
    ## 2 AMPH…    37     2                 39      187         1                    227
    ## 3 ANTH…     0     0                  0        2         0                      2
    ## 4 ARAC…     9     0                  9       27         0                     36
    ## 5 ASTE…     0     0                  0        0         0                      0
    ## 6 AVES    164     5                169       18         2                    189
    ## # ℹ abbreviated name: ¹​`Subtotal (EX+EW+ CR(PE)+CR(PEW))`
    ## # ℹ 10 more variables: CR <dbl>, EN <dbl>, VU <dbl>,
    ## #   `Subtotal (threatened spp.)` <dbl>, `LR/cd` <dbl>, `NT or LR/nt` <dbl>,
    ## #   `LC or LR/lc` <dbl>, DD <dbl>, Total <dbl>, Kingdom <chr>



------------------------------------------------------------------------

# 2. Data Manipulation

## 2a) Remove Unwanted Columns

The columns `CR(PE)` (Possibly Extinct) and `CR(PEW)` (Possibly Extinct
in the Wild) are *not* official IUCN categories and are removed. 

    ## # A tibble: 6 × 14
    ##   Name           EX    EW Extinct_Subtotal    CR    EN    VU Threatened_Subtotal
    ##   <chr>       <dbl> <dbl>            <dbl> <dbl> <dbl> <dbl>               <dbl>
    ## 1 ACTINOPTER…    90    11              101   777  1359  1502                3638
    ## 2 AMPHIBIA       37     2               39   825  1291   814                2930
    ## 3 ANTHOZOA        0     0                0    32   246    58                 336
    ## 4 ARACHNIDA       9     0                9   121   165   104                 390
    ## 5 ASTEROIDEA      0     0                0     2     0     0                   2
    ## 6 AVES          164     5              169   216   372   668                1256
    ## # ℹ 6 more variables: `LR/cd` <dbl>, `NT or LR/nt` <dbl>, `LC or LR/lc` <dbl>,
    ## #   DD <dbl>, Total <dbl>, Kingdom <chr>

**Explanation:** After this step, the table contains only the official
IUCN categories plus the subtotals for extinct and threatened species.

------------------------------------------------------------------------

## 2c) Simplify Columns

`LR/cd` (Lower Risk – conservation dependent) and `NT or LR/nt` (Near
Threatened) are combined into a single column called **Near
Threatened**. This aligns the data with the current IUCN classification
system.

    ## # A tibble: 6 × 13
    ##   Name           EX    EW Extinct_Subtotal    CR    EN    VU Threatened_Subtotal
    ##   <chr>       <dbl> <dbl>            <dbl> <dbl> <dbl> <dbl>               <dbl>
    ## 1 ACTINOPTER…    90    11              101   777  1359  1502                3638
    ## 2 AMPHIBIA       37     2               39   825  1291   814                2930
    ## 3 ANTHOZOA        0     0                0    32   246    58                 336
    ## 4 ARACHNIDA       9     0                9   121   165   104                 390
    ## 5 ASTEROIDEA      0     0                0     2     0     0                   2
    ## 6 AVES          164     5              169   216   372   668                1256
    ## # ℹ 5 more variables: `LC or LR/lc` <dbl>, DD <dbl>, Total <dbl>,
    ## #   Kingdom <chr>, `Near Threatened` <dbl>


------------------------------------------------------------------------

## 2d) Make Column Names Readable

All column names are replaced with their full and more readable names.

    ## # A tibble: 6 × 13
    ##   Name    Extinct Extinct_Wild Extinct_Subtotal Critically_Endangered Endangered
    ##   <chr>     <dbl>        <dbl>            <dbl>                 <dbl>      <dbl>
    ## 1 ACTINO…      90           11              101                   777       1359
    ## 2 AMPHIB…      37            2               39                   825       1291
    ## 3 ANTHOZ…       0            0                0                    32        246
    ## 4 ARACHN…       9            0                9                   121        165
    ## 5 ASTERO…       0            0                0                     2          0
    ## 6 AVES        164            5              169                   216        372
    ## # ℹ 7 more variables: Vulnerable <dbl>, Threatened_Subtotal <dbl>,
    ## #   Least_Concern <dbl>, Data_Deficient <dbl>, Total <dbl>, Kingdom <chr>,
    ## #   `Near Threatened` <dbl>


------------------------------------------------------------------------

# 3. Data Visualisation

## 3a) Create Relative Amount Table

Here is a new table `redlist_pct` where every numeric column (except
`Total`) is expressed as a percentage of the row’s `Total`. 

    ## # A tibble: 6 × 13
    ##   Name           `Extinct [%]` `Extinct_Wild [%]` `Extinct_Subtotal [%]`
    ##   <chr>                  <dbl>              <dbl>                  <dbl>
    ## 1 ACTINOPTERYGII         0.325             0.0397                  0.364
    ## 2 AMPHIBIA               0.460             0.0248                  0.484
    ## 3 ANTHOZOA               0                 0                       0    
    ## 4 ARACHNIDA              0.855             0                       0.855
    ## 5 ASTEROIDEA             0                 0                       0    
    ## 6 AVES                   1.47              0.0447                  1.51 
    ## # ℹ 9 more variables: `Critically_Endangered [%]` <dbl>,
    ## #   `Endangered [%]` <dbl>, `Vulnerable [%]` <dbl>,
    ## #   `Threatened_Subtotal [%]` <dbl>, `Least_Concern [%]` <dbl>,
    ## #   `Data_Deficient [%]` <dbl>, Total <dbl>, Kingdom <chr>,
    ## #   `Near Threatened [%]` <dbl>


------------------------------------------------------------------------

## 3b) Visualise Difference Between Kingdoms

To compare the conservation status across major Kingdoms, we create a
**stacked bar plot**. Only Kingdoms with at least 1,000 species are
included to avoid distorted results for small groups.

**Categories:** - **Extinct:** `Extinct + Extinct_Wild` (EX + EW) -
**Affected:** `Critically_Endangered + Endangered + Vulnerable` (CR +
EN + VU) - **Unaffected / No data:**
`Least_Concern + Near Threatened + Data_Deficient`

The plot shows the proportion of species in each
status category for each Kingdom.

<img src="Michaels_Solution_for___Sami_files/figure-markdown_github/kingdom_plot-1.png" style="display: block; margin: auto;" />




------------------------------------------------------------------------

## 3c) Visualise Most and Least Affected Classes

We define **“affected”** as the percentage of **Critically Endangered**
species within a class. This plot shows the **10 most affected** and the
**10 least affected** classes, colour‑coded by Kingdom.

<img src="Michaels_Solution_for___Sami_files/figure-markdown_github/class_plot-1.png" style="display: block; margin: auto;" />


------------------------------------------------------------------------


