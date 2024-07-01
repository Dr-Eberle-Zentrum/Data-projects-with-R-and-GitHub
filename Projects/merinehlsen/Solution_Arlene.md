    library("readxl")
    library("dplyr")

    ## 
    ## Attache Paket: 'dplyr'

    ## Die folgenden Objekte sind maskiert von 'package:stats':
    ## 
    ##     filter, lag

    ## Die folgenden Objekte sind maskiert von 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

    library(tidyr)

So far, I was only able to combine the different data into one
dataframe. I will try to create the plots in the next week!

## Sheet 1 & 2: Survival & Developmental\_Time

At first I looked at the structure of the different excel sheets. As
sheet 1 (survival) and sheet 2 (developmental time) had the same
structure, I only needed two functions for both of them: First I made a
function to rename the columns to mean and sd plus numbers.

    # Function to rename columns to mean and sd
    rename_columns <- function(df, start, prefix) {
      df %>%
        rename_with(~ paste0(prefix, seq_along(seq(start, ncol(df), by = 2))), 
                    .cols = seq(start, ncol(df), by = 2))
    }

I then implemented a function to reorganize the sheets so there are no
empty cells:

    reorganize_sheets <- function(data, sheetname, rowname1, rowname2, rowname3){
      # load data and rename columns
      data <- data %>% 
        rename_columns(2, paste0(sheetname, "_mean_")) %>%
        rename_columns(3, paste0(sheetname, "_sd_"))
      # change first column name to index
      colnames(data)[1] <- "index"
      # change "index" for rows 4-6
      new_index_names <- c(paste0(sheetname, "_" ,rowname1,"_mean"), paste0(sheetname, "_" ,rowname2,"_mean"), paste0(sheetname, "_" ,rowname3,"_mean"))
      data[c(4:6),1] <- new_index_names
      
      # one matrix for mean
      mean_cols <- data %>% 
        select(contains("mean")) %>% 
        as.matrix()

      # one matrix for sd
      sd_cols <- data %>% 
        select(contains("sd")) %>% 
        # remove first 3 rows of sd_cols as they are empty
        slice(-c(1:3)) %>% 
        as.matrix()
      
      # combine data
      combined_data <- rbind(mean_cols, sd_cols) %>% 
        as.data.frame()
      
      # change the index names
      new_index_names_sd <- c(paste0(sheetname, "_" ,rowname1,"_sd"), paste0(sheetname, "_" ,rowname2,"_sd"), paste0(sheetname, "_" ,rowname3,"_sd"))
      combined_data$index <- c(data$index, new_index_names_sd)
      
      # change structure: pivot
      reshaped_data <- combined_data %>%
        pivot_longer(cols = contains("mean"), names_to = "mean", values_to = "value") %>%
        pivot_wider(names_from = index, values_from = value) %>%
        select(-"mean")
      
      return(reshaped_data)
    }

Now let’s change the structure of the survival and development data. But
first, here is an example how the sheet for survival looked before
reshaping it:

    head(read_excel("flydata.xlsx", sheet = "Survival", col_names = F))

    ## # A tibble: 6 × 31
    ##   ...1  ...2    ...3 ...4   ...5 ...6   ...7 ...8   ...9 ...10 ...11 ...12 ...13
    ##   <chr> <chr>  <dbl> <chr> <dbl> <chr> <dbl> <chr> <dbl> <chr> <dbl> <chr> <dbl>
    ## 1 Diet  HPS   NA     HPS   NA    HPS   NA    HPS   NA    HPS   NA    EPS   NA   
    ## 2 Line  1     NA     2     NA    3     NA    4     NA    5     NA    1     NA   
    ## 3 n     10    NA     5     NA    10    NA    10    NA    7     NA    10    NA   
    ## 4 Fema… 17.8   1.14  13.4   1.03 16.1…  1.02 15.5   1.63 18.3   1.71 19     1.26
    ## 5 Males 17.8   0.573 16.8   1.2  16.1…  1.29 13.7   1.16 15.6   1.76 18     0.77
    ## 6 Total 35.6   0.78  30.2   1.07 32.2…  0.83 29.2   1.2  33.9   1.3  37     1.17
    ## # ℹ 18 more variables: ...14 <chr>, ...15 <dbl>, ...16 <chr>, ...17 <dbl>,
    ## #   ...18 <chr>, ...19 <dbl>, ...20 <chr>, ...21 <dbl>, ...22 <chr>,
    ## #   ...23 <dbl>, ...24 <chr>, ...25 <dbl>, ...26 <chr>, ...27 <dbl>,
    ## #   ...28 <chr>, ...29 <dbl>, ...30 <chr>, ...31 <dbl>

    data_survival <- read_excel("flydata.xlsx", sheet = "Survival", col_names = F) %>% 
      reorganize_sheets("Survival", "Females", "Males", "Total")

    data_developm <- read_excel("flydata.xlsx", sheet = "Survival", col_names = F) %>% 
      reorganize_sheets("Developmental_Time", "L-P", "P-E", "L-E")

It now looks like this, which is already way cleaner!

    head(data_survival)

    ## # A tibble: 6 × 9
    ##   Diet  Line  n     Survival_Females_mean Survival_Males_mean
    ##   <chr> <chr> <chr> <chr>                 <chr>              
    ## 1 HPS   1     10    17.8                  17.8               
    ## 2 HPS   2     5     13.4                  16.8               
    ## 3 HPS   3     10    16.100000000000001    16.100000000000001 
    ## 4 HPS   4     10    15.5                  13.7               
    ## 5 HPS   5     7     18.3                  15.6               
    ## 6 EPS   1     10    19                    18                 
    ## # ℹ 4 more variables: Survival_Total_mean <chr>, Survival_Females_sd <chr>,
    ## #   Survival_Males_sd <chr>, Survival_Total_sd <chr>

But now I also want to have a new column with the sex in the survival
dataframe. I wrote a function for that.

    transform_data <- function(data, exclude_columns, new_sex, mean_column, sd_column) {
      data %>%
        # only select one sex
        select(-all_of(exclude_columns)) %>%
        # add new column with sex
        mutate(sex = new_sex) %>%
        # rename columns so sex not in column name anymore
        rename(survival_mean = !!sym(mean_column),
               survival_sd = !!sym(sd_column))
    }

Now let’s use this function on the data. In the following, I already
combined the new dataframes with the development dataframe.

    data_survival_developm <-
      bind_rows(
        transform_data(
          data_survival,
          exclude_columns = c("Survival_Males_mean", "Survival_Males_sd", "Survival_Total_mean", "Survival_Total_sd"),
          new_sex = "F",
          mean_column = "Survival_Females_mean",
          sd_column = "Survival_Females_sd"),
        transform_data(
          data_survival,
          exclude_columns = c("Survival_Females_mean", "Survival_Females_sd", "Survival_Total_mean", "Survival_Total_sd"),
          new_sex = "M",
          mean_column = "Survival_Males_mean",
          sd_column = "Survival_Males_sd"),
        transform_data(
          data_survival,
          exclude_columns = c("Survival_Females_mean", "Survival_Females_sd", "Survival_Males_mean", "Survival_Males_sd"),
          new_sex = "Total",
          mean_column = "Survival_Total_mean",
          sd_column = "Survival_Total_sd")) %>% 
      merge(data_developm, by = c("n", "Line", "Diet"), all = F)

So the data for survival and development now look like this:

    head(data_survival_developm)

    ##    n Line Diet survival_mean survival_sd   sex Developmental_Time_L-P_mean
    ## 1 10    1  EPS            37        1.17 Total                          19
    ## 2 10    1  EPS            18        0.77     M                          19
    ## 3 10    1  EPS            19        1.26     F                          19
    ## 4 10    1  HPS          17.8        1.14     F                        17.8
    ## 5 10    1  HPS          17.8       0.573     M                        17.8
    ## 6 10    1  HPS          35.6        0.78 Total                        17.8
    ##   Developmental_Time_P-E_mean Developmental_Time_L-E_mean
    ## 1                          18                          37
    ## 2                          18                          37
    ## 3                          18                          37
    ## 4                        17.8                        35.6
    ## 5                        17.8                        35.6
    ## 6                        17.8                        35.6
    ##   Developmental_Time_L-P_sd Developmental_Time_P-E_sd Developmental_Time_L-E_sd
    ## 1                      1.26                      0.77                      1.17
    ## 2                      1.26                      0.77                      1.17
    ## 3                      1.26                      0.77                      1.17
    ## 4                      1.14                     0.573                      0.78
    ## 5                      1.14                     0.573                      0.78
    ## 6                      1.14                     0.573                      0.78

Now that the development and survival data are combined, I will look at
metabolic pools.

## Sheet 3: Metabolic Pools

First I wrote a function to read and process the metabolic pool data.
The dataframe looked like this at first:

    # how can I supress the console output?
    read_excel("flydata.xlsx", sheet = "Metabolic_Pools", col_names = F)

    process_metabolic_pool <- function(sheetname, rows) {
      # read data
      read_excel("flydata.xlsx", sheet = "Metabolic_Pools", col_names = F) %>% 
        # delete irrelevant notes at the bottom of excel sheet
        slice(-c(18:58)) %>% 
        # only get relevant data (drymass, proteins or driglycerides)
        slice(rows) %>%
        # reorganize sheets with function above
        reorganize_sheets(sheetname, "HPS", "EPS", "LPS") %>%
        # now convert it more meaningful format
        pivot_longer(cols = starts_with(sheetname), names_to = "temp", values_to = sheetname) %>%
        separate(temp, into = c("metric", "diet", "type"), sep = "_") %>%
        select(-metric) %>% 
        pivot_wider(names_from = type, values_from = sheetname)
    }

Now I use this function for all three different types of metabolic pools
(drymass, protein and triglycerides) and also renamed the columns.

    data_drymass <- process_metabolic_pool("Drymass", c(1:3, 5:7)) %>% 
      rename(mean_drymass = mean, sd_drymass = sd)

    ## Warning: Using an external vector in selections was deprecated in tidyselect 1.1.0.
    ## ℹ Please use `all_of()` or `any_of()` instead.
    ##   # Was:
    ##   data %>% select(sheetname)
    ## 
    ##   # Now:
    ##   data %>% select(all_of(sheetname))
    ## 
    ## See <https://tidyselect.r-lib.org/reference/faq-external-vector.html>.
    ## This warning is displayed once every 8 hours.
    ## Call `lifecycle::last_lifecycle_warnings()` to see where this warning was
    ## generated.

    data_protein <- process_metabolic_pool("Protein", c(1:3, 10:12)) %>% 
      rename(mean_protein = mean, sd_protein = sd)

    data_triglycerides <- process_metabolic_pool("Triglycerides", -c(4:14)) %>% 
      rename(mean_triglycerides = mean, sd_triglycerides = sd)

This is how drymass looks like now as an example:

    head(data_drymass)

    ## # A tibble: 6 × 6
    ##   line  n     sex   diet  mean_drymass sd_drymass
    ##   <chr> <chr> <chr> <chr> <chr>        <chr>     
    ## 1 1     10    F     HPS   1.67         0.032     
    ## 2 1     10    F     EPS   1.67         0.019     
    ## 3 1     10    F     LPS   1.62         0.024     
    ## 4 1     10    M     HPS   1.23         0.018     
    ## 5 1     10    M     EPS   1.23         0.01      
    ## 6 1     10    M     LPS   1.18         0.029

## Combine into one dataframe

Now I finally combined the processed data into one final dataframe:

    final_data <- merge(data_drymass, data_protein, by=c("line", "n", "sex", "diet")) %>% 
      merge(data_triglycerides, by=c("line", "n", "sex","diet")) %>% 
      # rename so dataframes have same column names
      rename(Line = line,
             Diet = diet) %>% 
      left_join(data_survival_developm, data_metabolic, by = c("Line", "n", "Diet", "sex"))

This is how it looks like now:

    head(final_data)

    ##   Line  n sex Diet mean_drymass sd_drymass mean_protein sd_protein
    ## 1    1 10   F  EPS         1.67      0.019          365       15.2
    ## 2    1 10   F  HPS         1.67      0.032          324       13.7
    ## 3    1 10   F  LPS         1.62      0.024          320         12
    ## 4    1 10   M  EPS         1.23       0.01          259       6.71
    ## 5    1 10   M  HPS         1.23      0.018          247         17
    ## 6    1 10   M  LPS         1.18      0.029          245       10.9
    ##   mean_triglycerides sd_triglycerides      survival_mean survival_sd
    ## 1                157             7.32                 19        1.26
    ## 2                111             6.95               17.8        1.14
    ## 3                157             8.83 16.899999999999999        1.37
    ## 4                109              3.6                 18        0.77
    ## 5               92.9             4.96               17.8       0.573
    ## 6                107             6.14               16.2        0.92
    ##   Developmental_Time_L-P_mean Developmental_Time_P-E_mean
    ## 1                          19                          18
    ## 2                        17.8                        17.8
    ## 3          16.899999999999999                        16.2
    ## 4                          19                          18
    ## 5                        17.8                        17.8
    ## 6          16.899999999999999                        16.2
    ##   Developmental_Time_L-E_mean Developmental_Time_L-P_sd
    ## 1                          37                      1.26
    ## 2                        35.6                      1.14
    ## 3                        33.1                      1.37
    ## 4                          37                      1.26
    ## 5                        35.6                      1.14
    ## 6                        33.1                      1.37
    ##   Developmental_Time_P-E_sd Developmental_Time_L-E_sd
    ## 1                      0.77                      1.17
    ## 2                     0.573                      0.78
    ## 3                      0.92                      1.39
    ## 4                      0.77                      1.17
    ## 5                     0.573                      0.78
    ## 6                      0.92                      1.39

## Plot

I will plot the data in the next week.
