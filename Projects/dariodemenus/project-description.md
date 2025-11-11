## 1. Introduction & Context

This project uses data collected during the GEO-87 field trip to the
Jena Experiment (September 2025), a long-term biodiversity experiment.
The primary goal of the field trip was to investigate the relationship
between plant biodiversity (species richness and functional group
composition) and key soil functions.

We collected soil samples from various plots to determine: \* **Soil
Water Content (SWC)**  \* **Mineral Nitrogen (Nmin)** concentrations,
specifically Nitrate (*N**O*<sub>3</sub><sup>−</sup>) and Ammonium
(*N**H*<sub>4</sub><sup>+</sup>) 

This project’s main focus is **data wrangling**: taking the raw, “dirty”
2025 lab data, cleaning it, processing it into meaningful units (e.g.,
mg/kg of Nmin), and merging it with the experimental design data.

Finally, we will perform statistical analysis (ANOVA via mixed-effects
models) on our 2025 dataset and compare our findings to the results from
the previous year (2024)

## 2. Guiding Questions & Hypotheses

Our analysis will be guided by the provided hypotheses and the goal of
comparing our data to the previous year.

1.  **Hypothesis 1 (Diversity):** Does soil Nmin (total Nmin,
*N**O*<sub>3</sub><sup>−</sup>, *N**H*<sub>4</sub><sup>+</sup>) vary
significantly with the sown species diversity (`sowndiv`) of the plots?
2.  **Hypothesis 2 (Functional Groups):** Does the presence of specific
functional groups, particularly legumes (`p_legume`), significantly
impact soil Nmin concentrations? 3.  **Comparative Question:** Are the
2025 Nmin concentrations and their relationship with biodiversity
statistically different from those observed in the 2024 dataset?

## 3. The Data Sets

This project will use four main sets of files, which perfectly fit the
“dirty data” requirement.

-   **1. 2025 Raw Lab Data (`data_jena_2025 (1).xlsx - Tabelle1.csv`):**
    This is our primary **dirty dataset**. It contains raw weights from
    the SWC and Nmin preparations (glass weight, wet soil weight, etc.).
        \* **Wrangling Issues:** Contains missing values (e.g., B3A15,
    B3A18), problematic entries (B2A22 has “two glasses”), and requires
    calculation to be useful.

-   **2. 2025 Nmin Concentrations
    (`2025_Nmin_Jena.xlsx - Ergebnisse.csv`):** This file contains the
    raw photometer output for Nmin concentrations in **mg/l**.   t \*
    **Wrangling Issues:** These values must be converted to **mg/kg** of
    dry soil. Many *N**H*<sub>4</sub><sup>+</sup> readings are negative,
    indicating they are below the detection limit and must be handled
    (e.g., set to 0).

-   **3. Plot Metadata (`Plot information.xlsx - Hoja1.csv`):** This is
    a “tidy” metadata file. It links each `plotcode` to its experimental
    design variables, including `sowndiv` (sown diversity) and the
    presence/absence of functional groups (e.g., `leg`). This will be
    joined to our cleaned 2025 data.

-   **4. 2024 Comparison Data (`Results 2024.xlsx - ... .csv`):** These
    files provide the fully processed 2024 data. The `Nmin_Div.csv` file
    serves as the **“target” tidy format** for our 2025 data. The
    `Concentrations.csv` file is crucial as it implicitly contains the
    formula needed to convert our 2025 `mg/l` data to `mg/kg`.

## 4. Data Manipulation Goals (The “Wrangling” Roadmap)

The main goal is to process the 2025 “dirty” data (files 1 & 2) into a
“tidy” data frame that mirrors the 2024 `Nmin_Div.csv` structure using
the metadata from file 3.

### Step 1: Calculate 2025 Soil Water Content (SWC)

1.  Load `data_jena_2025 (1).xlsx - Tabelle1.csv`. 2.  Handle missing
data (e.g., B3A15) and problematic data (e.g., B2A22, which has two
values). 3.  Calculate `dry_soil_swc_g` (the dry weight of the SWC
sample) using:    
`dry_soil_swc_g = (dry soil + glass [g]) - (glass weight [g])` 4. 
Calculate `swc` (Soil Water Content as a fraction) using:    
`swc = (wet soil [g] - dry_soil_swc_g) / dry_soil_swc_g`

### Step 2: Calculate 2025 Nmin in mg/kg

1.s Using the `swc` from Step 1, calculate the dry weight of the *Nmin
extraction sample*:    
`dry_soil_nmin_g = (Nmin wet soil [g]) / (1 + swc)` 2.  Load the
`2025_Nmin_Jena.xlsx - Ergebnisse.csv` data. 3.  Handle the negative
*N**H*<sub>4</sub><sup>+</sup> values (e.g., set them to 0 or `NA`). 4. 
Convert `mg/l` to `mg/kg` of dry soil. By reverse-engineering the 2024
data, the conversion factor is 50 (likely representing 50ml of
extractant). t \* `NO3_mg_kg = (NO3-N [mg/l] * 50) / dry_soil_nmin_g`  
  \* `NH4_mg_kg = (NH4-N [mg/l] * 50) / dry_soil_nmin_g`     \*
`Nmin_mg_kg = NO3_mg_kg + NH4_mg_kg`

### Step 3: Create Tidy, Combined Data Frame

1.  Create a final 2025 data frame by joining the calculated `swc` and
`Nmin_mg_kg` values with the plot metadata from
`Plot information.xlsx - Hoja1.csv` using `plot ID` as the key. 2.Load
the 2024 tidy data (`Results 2024.xlsx - Nmin_Div.csv`). 3.  Combine the
2024 and 2025 tidy data frames into a single data frame. 4.  Add a new
column `Year` to this combined frame to distinguish the data (2024,
2025).

## 5. Visualization & Analysis Goals

### Visualization

-   **Goal 1 (Reproduction):** Recreate the exploratory plot from the
    `R-Script for Geo87 (1).doc`. This will be a `ggplot` scatter plot
    of `log(Nmin)` vs. `log2(sowndiv+1)`, colored by the
    presence/absence of legumes, using our newly cleaned **2025 data**.
-   **Goal 2 (Comparison):** Create a new, “non-standard” visualization
    using the **combined 2024-2025 data frame**. This will use `ggplot`
    with `facet_wrap(~ Year)` to directly compare the Nmin-diversity
    relationship between the two years side-by-side.

### Analysis (ANOVA)

-   **Goal 3 (Statistical Analysis):** Run the statistical models
    (linear mixed-effects models) provided in the R script on our **2025
    data** to answer Hypotheses 1 and 2.     \*
    `model_Nmin <- lmer(logNmin ~ sowndiv * legume + (1 | Block), data = Data_2025)`
        \* `anova(model_Nmin)`
-   **Goal 4 (Statistical Comparison):** Run a final model on the
    **combined 2024-2025 dataset** to answer our comparative question.
    We will add `Year` as a fixed effect to see if it has a significant
    main effect or interaction.     \*
    `model_combined <- lmer(logNmin ~ sowndiv * legume * Year + (1 | Block), data = Combined_Data)`
        \* `anova(model_combined)`
