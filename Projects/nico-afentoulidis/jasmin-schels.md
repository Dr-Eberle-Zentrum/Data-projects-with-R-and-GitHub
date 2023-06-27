## Initial solution

This is my first try at a solution of your project. I have all the
relevant data in one table. Now the only thing left to do is to
visualize it in a map.

    library(tidyverse)

    ## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ## ✔ dplyr     1.1.2     ✔ readr     2.1.4
    ## ✔ forcats   1.0.0     ✔ stringr   1.5.0
    ## ✔ ggplot2   3.4.2     ✔ tibble    3.2.1
    ## ✔ lubridate 1.9.2     ✔ tidyr     1.3.0
    ## ✔ purrr     1.0.1     
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()
    ## ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

    library(maps)

    ## 
    ## Attaching package: 'maps'
    ## 
    ## The following object is masked from 'package:purrr':
    ## 
    ##     map

    library(viridis)

    ## Loading required package: viridisLite
    ## 
    ## Attaching package: 'viridis'
    ## 
    ## The following object is masked from 'package:maps':
    ## 
    ##     unemp

    media_use <- read_csv2("ZA7848_v1-0-0.csv")

    ## ℹ Using "','" as decimal and "'.'" as grouping mark. Use `read_delim()` for more control.
    ## Rows: 37487 Columns: 16── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ";"
    ## chr (15): country, isocntry, eu27b, d11, d70, d70a, qa1_5, qd3_1, qd3_2, qd3...
    ## dbl  (1): uniqid
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

    mean_media <-
      media_use %>% 
      mutate(across(starts_with("qd3_"), as.double),
             isocntry = str_sub(isocntry, start= 1, end = 2)) %>% 

        group_by(isocntry) %>% 
       summarize(mean_TV = mean(qd3_1, na.rm = TRUE),
                 mean_TVviaInternet = mean(qd3_2, na.rm = TRUE),
                 mean_radio = mean(qd3_3, na.rm = TRUE),
                 mean_podcast = mean(qd3_4, na.rm = TRUE),
                 mean_writtenPress = mean(qd3_5, na.rm = TRUE),
                 mean_Internet = mean(qd3_6, na.rm = TRUE),
                 mean_SocialMedia = mean(qd3_8, na.rm = TRUE)
                 )  %>% 
         drop_na() %>% 
      print()

    ## Warning: There were 7 warnings in `mutate()`.
    ## The first warning was:
    ## ℹ In argument: `across(starts_with("qd3_"), as.double)`.
    ## Caused by warning:
    ## ! NAs introduced by coercion
    ## ℹ Run `dplyr::last_dplyr_warnings()` to see the 6 remaining warnings.

    ## # A tibble: 27 × 8
    ##    isocntry mean_TV mean_TVviaInternet mean_radio mean_podcast mean_writtenPress
    ##    <chr>      <dbl>              <dbl>      <dbl>        <dbl>             <dbl>
    ##  1 AT          6.13              2.65        4.71        1.13               3.92
    ##  2 BE          5.88              2.27        4.72        1.12               3.18
    ##  3 BG          6.57              0.841       3.59        0.567              1.17
    ##  4 CY          6.23              2.72        4.34        0.510              1.06
    ##  5 CZ          5.12              2.22        4.59        1.94               2.14
    ##  6 DE          5.92              2.28        5.36        0.945              4.04
    ##  7 DK          5.78              3.25        5.21        1.70               4.15
    ##  8 EE          5.48              2.24        5.11        1.18               3.86
    ##  9 ES          6.01              1.66        3.12        0.653              1.83
    ## 10 FI          6.03              3.18        5.14        0.797              5.39
    ## # ℹ 17 more rows
    ## # ℹ 2 more variables: mean_Internet <dbl>, mean_SocialMedia <dbl>

The boxplots are ready:

    media_use %>%
      mutate(isocntry = str_sub(isocntry, start= 1, end = 2),
             across(starts_with("qd3_"), as.double) ) %>% 
      select(qa1_5, qd3_8, isocntry) %>%
      filter(isocntry == "GR" | isocntry == "ES" | isocntry =="DE", 
      qa1_5 != "Don't know (SPONTANEOUS)") %>%
      drop_na() %>%
      ggplot(aes(x=qa1_5, y=qd3_8, fill=qa1_5)) +
      geom_boxplot() +
      ggtitle(" Financial Situation in relation to Social Media Usage") +
      labs(fill="Financial Situation", y = "Social Media usage", x = "Financial situation") +
      theme(axis.text.x = element_text(angle = 90)) +
      scale_fill_viridis(discrete = TRUE, alpha = 0.5, option="A") +
      facet_wrap(~isocntry)

    ## Warning: There were 7 warnings in `mutate()`.
    ## The first warning was:
    ## ℹ In argument: `across(starts_with("qd3_"), as.double)`.
    ## Caused by warning:
    ## ! NAs introduced by coercion
    ## ℹ Run `dplyr::last_dplyr_warnings()` to see the 6 remaining warnings.

![](jasmin-schels_files/figure-markdown_strict/unnamed-chunk-2-1.png)
