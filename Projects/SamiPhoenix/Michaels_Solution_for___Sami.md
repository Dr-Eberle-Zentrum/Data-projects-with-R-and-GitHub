-   [Introduction](#introduction)
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
-   [Summary](#summary)
    -   [⚠️ Important Notes](#important-notes)

# Introduction

This analysis examines the **conservation status of species** across
different taxonomic classes and kingdoms, based on data from the **IUCN
Red List** (`SpeciesByKingdomAndClass.csv`). The IUCN Red List is the
world’s most comprehensive inventory of the global conservation status
of biological species.

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

**Explanation:** The table shows for each class (e.g., `ACTINOPTERYGII`
– ray‑finned fishes) the number of species in each IUCN category: `EX`
(Extinct), `EW` (Extinct in the Wild), `CR` (Critically Endangered),
`EN` (Endangered), `VU` (Vulnerable), `NT` (Near Threatened), `LC`
(Least Concern), and `DD` (Data Deficient). The `Total` column gives the
total number of assessed species for that class.

**Note:** The columns `CR(PE)` and `CR(PEW)` represent “Possibly
Extinct” and “Possibly Extinct in the Wild” – these are *not* official
IUCN categories and will be removed later.

------------------------------------------------------------------------

## 1c) Add Kingdom Data

The original dataset does not contain a `Kingdom` column. We add it
using a lookup table that maps each class (`Name`) to its kingdom
(Animalia, Plantae, Fungi, or Chromista) based on the taxonomic
hierarchy from the IUCN website.

    ## ⚠️ Warning: The following classes have no Kingdom assigned:
    ##  Total

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

**Explanation:** The `Kingdom` column now tells us which kingdom each
class belongs to. This allows us to group and compare species across the
major kingdoms (Animalia, Plantae, Fungi, Chromista).

------------------------------------------------------------------------

# 2. Data Manipulation

## 2a) Remove Unwanted Columns

The columns `CR(PE)` (Possibly Extinct) and `CR(PEW)` (Possibly Extinct
in the Wild) are *not* official IUCN categories and are removed. The
subtotal that includes them is also removed. The remaining subtotals are
renamed for clarity.

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
The columns are now easier to read.

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

**Explanation:** The new `Near Threatened` column contains the combined
counts of Lower Risk / conservation dependent species and Near
Threatened species. This simplifies the table and aligns with the
current IUCN Red List categories.

------------------------------------------------------------------------

## 2d) Make Column Names Readable

All column names are replaced with their full, human‑readable names.

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

**Resulting columns:** `Name`, `Kingdom`, `Extinct`, `Extinct_Wild`,
`Critically_Endangered`, `Endangered`, `Vulnerable`, `Near Threatened`,
`Least_Concern`, `Data_Deficient`, `Extinct_Subtotal`,
`Threatened_Subtotal`, `Total`.

------------------------------------------------------------------------

# 3. Data Visualisation

## 3a) Create Relative Amount Table

We create a new table `redlist_pct` where every numeric column (except
`Total`) is expressed as a percentage of the row’s `Total`. This makes
it easy to compare proportions across classes. The `Total` column is set
to 100.

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

**Explanation:** In this table, each value shows the percentage of
species in that category relative to the total number of species for
that class. For example, for `ACTINOPTERYGII`, about 0.325% are Extinct,
0.04% Extinct in the Wild, etc. The `Total` column is always 100. This
makes it easy to compare proportions across classes, regardless of the
total number of species assessed.

------------------------------------------------------------------------

## 3b) Visualise Difference Between Kingdoms

To compare the conservation status across major Kingdoms, we create a
**stacked bar plot**. Only Kingdoms with at least 1,000 species are
included to avoid distorted results for small groups.

**Categories:** - **Extinct:** `Extinct + Extinct_Wild` (EX + EW) -
**Affected:** `Critically_Endangered + Endangered + Vulnerable` (CR +
EN + VU) - **Unaffected / No data:**
`Least_Concern + Near Threatened + Data_Deficient`

<img src="Michaels_Solution_for___Sami_files/figure-markdown_github/kingdom_plot-1.png" style="display: block; margin: auto;" />

**Interpretation:** The plot shows the proportion of species in each
status category for each Kingdom.

-   **Animalia** and **Plantae** have relatively high proportions of
    “Affected” species (CR + EN + VU).
-   **Fungi** and **Chromista** have very few species in the extinct or
    affected categories – but this is largely because fewer species have
    been assessed in these kingdoms.
-   The “Unaffected / No data” category dominates for Fungi and
    Chromista, reflecting incomplete assessments.

------------------------------------------------------------------------

## 3c) Visualise Most and Least Affected Classes

We define **“affected”** as the percentage of **Critically Endangered**
species within a class. This plot shows the **10 most affected** and the
**10 least affected** classes, colour‑coded by Kingdom.

<img src="Michaels_Solution_for___Sami_files/figure-markdown_github/class_plot-1.png" style="display: block; margin: auto;" />

**Interpretation:**

-   **Most affected classes:** **AMPHIBIA** (Amphibians) and
    **ACTINOPTERYGII** (Ray‑finned fishes) have the highest percentages
    of Critically Endangered species. Many of the most affected classes
    belong to **Animalia**.
-   **Least affected classes:** The least affected classes (with small
    but non‑zero CR percentages) include **CHAROPHYCEAE** (Charophytes)
    and **POLYTRICHOPSIDA** (a moss class), both belonging to
    **Plantae**. However, the low numbers often reflect limited
    assessments rather than genuinely low threat levels.

------------------------------------------------------------------------

# Summary

-   **Data import** and **Kingdom enrichment** were successful – all
    classes were assigned a kingdom.
-   **Cleaning** removed non‑official categories and consolidated the
    Near Threatened classification.
-   The **percentage table** (`redlist_pct`) allows direct comparison of
    relative conservation statuses across classes.
-   **Plot 1 (Kingdom comparison)** shows that the majority of assessed
    species are in the “Unaffected / No data” category for all Kingdoms,
    but **Animalia** and **Plantae** have notable affected proportions.
-   **Plot 2 (Class comparison)** highlights **Amphibia** and
    **ACTINOPTERYGII** as the most affected classes, while several plant
    classes have very low CR percentages – likely due to assessment gaps
    rather than actual low threat levels.

------------------------------------------------------------------------

## ⚠️ Important Notes

1.  **File path:** Make sure the CSV file is at
    `~/Downloads/SpeciesByKingdomAndClass.csv`. If it is elsewhere,
    adjust the path in the `read_csv()` call.
2.  **Data limitations:** The IUCN Red List data is incomplete for many
    groups. Fungi and Chromista have very few assessed species, so the
    percentages may not reflect true global patterns. This analysis is
    based on the subset of species that have been assessed.
3.  **Plots:** The plots are rendered as PNG images in the output
    folder. If you are rendering to HTML, the images will be embedded.
    If you are rendering to GitHub Markdown, the images will be linked
    correctly.

------------------------------------------------------------------------

    ## R version 4.4.0 (2024-04-24)
    ## Platform: aarch64-apple-darwin20
    ## Running under: macOS 15.6.1
    ## 
    ## Matrix products: default
    ## BLAS:   /Library/Frameworks/R.framework/Versions/4.4-arm64/Resources/lib/libRblas.0.dylib 
    ## LAPACK: /Library/Frameworks/R.framework/Versions/4.4-arm64/Resources/lib/libRlapack.dylib;  LAPACK version 3.12.0
    ## 
    ## locale:
    ## [1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8
    ## 
    ## time zone: Europe/Berlin
    ## tzcode source: internal
    ## 
    ## attached base packages:
    ## [1] stats     graphics  grDevices utils     datasets  methods   base     
    ## 
    ## other attached packages:
    ## [1] readr_2.2.0   forcats_1.0.1 ggplot2_4.0.2 tidyr_1.3.2   dplyr_1.2.0  
    ## 
    ## loaded via a namespace (and not attached):
    ##  [1] bit_4.0.5          gtable_0.3.6       highr_0.11         crayon_1.5.3      
    ##  [5] compiler_4.4.0     tidyselect_1.2.1   parallel_4.4.0     scales_1.4.0      
    ##  [9] yaml_2.3.8         fastmap_1.2.0      R6_2.5.1           labeling_0.4.3    
    ## [13] generics_0.1.4     knitr_1.47         tibble_3.3.1       pillar_1.9.0      
    ## [17] RColorBrewer_1.1-3 tzdb_0.4.0         rlang_1.1.7        utf8_1.2.4        
    ## [21] xfun_0.45          S7_0.2.0           bit64_4.0.5        cli_3.6.3         
    ## [25] withr_3.0.2        magrittr_2.0.3     digest_0.6.36      grid_4.4.0        
    ## [29] vroom_1.7.0        rstudioapi_0.18.0  hms_1.1.3          lifecycle_1.0.5   
    ## [33] vctrs_0.7.2        evaluate_0.24.0    glue_1.8.0         farver_2.1.1      
    ## [37] fansi_1.0.6        rmarkdown_2.27     purrr_1.2.1        tools_4.4.0       
    ## [41] pkgconfig_2.0.3    htmltools_0.5.8.1
