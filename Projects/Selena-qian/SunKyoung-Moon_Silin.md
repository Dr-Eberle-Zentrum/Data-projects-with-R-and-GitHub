---
title: "Silin project_from Sunkyoung Moon"
output: 
  md_document:
    variant: markdown_strict
    preserve_yaml: true
    pandoc_args: ["--standalone"]
date: "2024-12-03"
---

# Introduction

The report analyzes foreign language proficiency across selected
European countries (Germany, France, Sweden, and Austria) and compares
their performance to the EU average. The primary goal is to evaluate
differences in proficiency levels by the number of foreign languages
known among adults aged 18 to 69.

# Analysis

The dataset is filtered to include data from 2022 for the relevant
countries and age group. Key steps include below

1.  Renaming and reorganizing columns for clarity.

2.  Calculating the difference between each country’s proficiency
    percentage and the EU average for the same category (number of
    foreign languages known).

3.  Grouping data by country and number of languages for summary
    statistics, particularly focusing on the mean differences from the
    EU average.

The results are visualized using a bar chart, where red and blue
indicate whether a country’s proficiency level is above or below the EU
average.

# My Challenge

One of the main challenges was incorporating country flags and the EU
flag into the facet labels for enhanced visual clarity.

This was achieved using the ggtext library, which supports HTML
rendering in ggplot facet labels. Flags were added as <img> tags in the
facet labels, with specific sizes and alignments. The
element\_markdown() function in theme() allowed rendering these HTML
elements correctly.

# Result

The final plot effectively illustrates the proficiency levels of each
country compared to the EU average, with flags for each country and the
EU flag enhancing the visualization.

![](Result_imaga_from_Sun.png)

    # Set CRAN mirror
    options(repos = c(CRAN = "https://cran.r-project.org"))


    # libraries
    library(tidyverse)

    ## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ## ✔ dplyr     1.1.4     ✔ readr     2.1.5
    ## ✔ forcats   1.0.0     ✔ stringr   1.5.1
    ## ✔ ggplot2   3.5.1     ✔ tibble    3.2.1
    ## ✔ lubridate 1.9.3     ✔ tidyr     1.3.1
    ## ✔ purrr     1.0.2     
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()
    ## ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

    install.packages("ggtext")

    ## 'C:/Users/poop0/AppData/Local/R/win-library/4.3'의 위치에 패키지(들)을 설치합니다.
    ## (왜냐하면 'lib'가 지정되지 않았기 때문입니다)

    ## 패키지 'ggtext'를 성공적으로 압축해제하였고 MD5 sums 이 확인되었습니다
    ## 
    ## 다운로드된 바이너리 패키지들은 다음의 위치에 있습니다
    ##  C:\Users\poop0\AppData\Local\Temp\Rtmpwh9u1r\downloaded_packages

    library(ggtext)


    # Set chunk
    knitr::opts_chunk$set(
      echo = TRUE,        
      warning = FALSE,    
      message = FALSE,    
      fig.align = "center",
      out.width = "100%"
    )

    # Load data
    setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
    data <- read_csv("lang_known.csv.gz")

    ## Rows: 5474 Columns: 11
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr (9): DATAFLOW, LAST UPDATE, freq, age, n_lang, unit, isced11, geo, OBS_FLAG
    ## dbl (2): TIME_PERIOD, OBS_VALUE
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

    # checking data structure
    head(data)

    ## # A tibble: 6 × 11
    ##   DATAFLOW      `LAST UPDATE` freq  age   n_lang unit  isced11 geo   TIME_PERIOD
    ##   <chr>         <chr>         <chr> <chr> <chr>  <chr> <chr>   <chr>       <dbl>
    ## 1 ESTAT:EDAT_A… 20/08/24 23:… Annu… From… No la… Perc… Less t… Aust…        2022
    ## 2 ESTAT:EDAT_A… 20/08/24 23:… Annu… From… No la… Perc… Less t… Belg…        2022
    ## 3 ESTAT:EDAT_A… 20/08/24 23:… Annu… From… No la… Perc… Less t… Bulg…        2022
    ## 4 ESTAT:EDAT_A… 20/08/24 23:… Annu… From… No la… Perc… Less t… Cypr…        2022
    ## 5 ESTAT:EDAT_A… 20/08/24 23:… Annu… From… No la… Perc… Less t… Czec…        2022
    ## 6 ESTAT:EDAT_A… 20/08/24 23:… Annu… From… No la… Perc… Less t… Germ…        2022
    ## # ℹ 2 more variables: OBS_VALUE <dbl>, OBS_FLAG <chr>

    # Checking unique data of each column
    unique(data$age)          

    ## [1] "From 18 to 24 years" "From 18 to 64 years" "From 18 to 69 years"
    ## [4] "From 25 to 64 years" "From 25 to 69 years"

    unique(data$geo)          

    ##  [1] "Austria"                                  
    ##  [2] "Belgium"                                  
    ##  [3] "Bulgaria"                                 
    ##  [4] "Cyprus"                                   
    ##  [5] "Czechia"                                  
    ##  [6] "Germany"                                  
    ##  [7] "Denmark"                                  
    ##  [8] "Euro area – 20 countries (from 2023)"     
    ##  [9] "Estonia"                                  
    ## [10] "Greece"                                   
    ## [11] "Spain"                                    
    ## [12] "European Union - 27 countries (from 2020)"
    ## [13] "Finland"                                  
    ## [14] "France"                                   
    ## [15] "Croatia"                                  
    ## [16] "Hungary"                                  
    ## [17] "Ireland"                                  
    ## [18] "Iceland"                                  
    ## [19] "Italy"                                    
    ## [20] "Lithuania"                                
    ## [21] "Luxembourg"                               
    ## [22] "Latvia"                                   
    ## [23] "Malta"                                    
    ## [24] "Netherlands"                              
    ## [25] "Norway"                                   
    ## [26] "Poland"                                   
    ## [27] "Portugal"                                 
    ## [28] "Romania"                                  
    ## [29] "Serbia"                                   
    ## [30] "Sweden"                                   
    ## [31] "Slovenia"                                 
    ## [32] "Slovakia"                                 
    ## [33] "Türkiye"                                  
    ## [34] "Albania"                                  
    ## [35] "Bosnia and Herzegovina"                   
    ## [36] "Switzerland"                              
    ## [37] "North Macedonia"                          
    ## [38] "United Kingdom"

    unique(data$TIME_PERIOD)  

    ## [1] 2022 2016 2007 2011

    unique(data$n_lang)

    ## [1] "No languages"        "1 language"          "2 languages"        
    ## [4] "3 languages or more"

    # Data Manipulation
    filtered_data <- data %>%
      filter(
        TIME_PERIOD == 2022,  # year filtering
        age == "From 18 to 69 years",  # age filtering
        geo %in% c("Germany", "France", "Sweden", "Austria", "European Union - 27 countries (from 2020)"), # Include EU average for comparison
        !is.na(OBS_VALUE)  # remove NA
      ) %>%
      rename(
        Country = geo,  # Change column name
        Number_of_Languages = n_lang,  
        Percentage = OBS_VALUE  
      ) %>%
      mutate(
        # Organize number of languages
        Number_of_Languages = case_when(
          Number_of_Languages == "No languages" ~ "0",
          Number_of_Languages == "1 language" ~ "1",
          Number_of_Languages == "2 languages" ~ "2",
          Number_of_Languages == "3 languages or more" ~ "3+",
          TRUE ~ Number_of_Languages
        )
      )

    # Extract EU average for comparison
    eu_data <- filtered_data %>%
      filter(Country == "European Union - 27 countries (from 2020)") %>%
      select(Number_of_Languages, Percentage) %>%
      rename(EU_Percentage = Percentage)

    # Calculate difference from EU average
    country_data_summary <- filtered_data %>%
      filter(Country != "European Union - 27 countries (from 2020)") %>%
      left_join(eu_data, by = "Number_of_Languages") %>%
      mutate(Difference = Percentage - EU_Percentage) %>%
      group_by(Country, Number_of_Languages) %>%
      summarize(
        Mean_Difference = mean(Difference, na.rm = TRUE),
        .groups = "drop"
      )

    ## Warning in left_join(., eu_data, by = "Number_of_Languages"): Detected an unexpected many-to-many relationship between `x` and `y`.
    ## ℹ Row 1 of `x` matches multiple rows in `y`.
    ## ℹ Row 1 of `y` matches multiple rows in `x`.
    ## ℹ If a many-to-many relationship is expected, set `relationship =
    ##   "many-to-many"` to silence this warning.

    # Add max value for each country for flag positioning
    country_data_summary <- country_data_summary %>%
      group_by(Country) %>%
      mutate(Max_Mean_Difference = max(Mean_Difference, na.rm = TRUE)) %>%
      ungroup()

    # Create a named vector for facet labels with flags
    facet_labels <- c(
      "Germany" = "<img src='Germany_flag.png' width='20' height='15' /> Germany - <img src='EU_flag.png' width='20' height='15' />",
      "France" = "<img src='France_flag.png' width='20' height='15' /> France - <img src='EU_flag.png' width='20' height='15' />",
      "Sweden" = "<img src='Sweden_flag.png' width='20' height='15' /> Sweden - <img src='EU_flag.png' width='20' height='15' />",
      "Austria" = "<img src='Austria_flag.png' width='20' height='15' /> Austria - <img src='EU_flag.png' width='20' height='15' />"
    )

    # Visualization
    ggplot(country_data_summary, aes(x = Number_of_Languages, y = Mean_Difference, fill = Mean_Difference > 0)) +
      geom_bar(stat = "identity", aes(alpha = abs(Mean_Difference)), show.legend = FALSE) +
      geom_text(aes(label = round(Mean_Difference, 1)), 
                vjust = ifelse(country_data_summary$Mean_Difference > 0, -0.5, 1.5),
                size = 1.5) + 
      scale_fill_manual(values = c("TRUE" = "red", "FALSE" = "blue")) +
      scale_alpha(range = c(0.4, 1)) +
      geom_hline(yintercept = 0, linetype = "dashed") +
      facet_wrap(~ Country, ncol = 2, scales = "free_y", labeller = as_labeller(facet_labels)) +
      labs(
        title = "Foreign Language Proficiency by Country: Comparison with EU Average",
        x = "Number of Foreign Languages",
        y = "Difference in Percentage",
        caption = "Source: [Eurostat](https://ec.europa.eu/eurostat/databrowser/view/edat_aes_l23/default/table?lang=en&category=educ.educ_lang.educ_lang_00.edat_aes_l2)"
      ) +
      theme_minimal() +
      theme(
        plot.title = element_text(face = "bold", hjust = 0.5),
        strip.text = element_markdown(face = "bold", hjust = 0.5), # HTML rendering in facet labels
        plot.caption = element_text(hjust = 0, face = "italic")
      )

![](SunKyoung-Moon_Silin_files/figure-markdown_strict/setup-1.png)
