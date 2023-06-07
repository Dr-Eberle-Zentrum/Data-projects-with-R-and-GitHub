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

    deaths2 <- read_csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv")

    ## Rows: 289 Columns: 1147
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr    (2): Province/State, Country/Region
    ## dbl (1145): Lat, Long, 1/22/20, 1/23/20, 1/24/20, 1/25/20, 1/26/20, 1/27/20,...
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

    cases <- read_csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv")

    ## Rows: 289 Columns: 1147
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr    (2): Province/State, Country/Region
    ## dbl (1145): Lat, Long, 1/22/20, 1/23/20, 1/24/20, 1/25/20, 1/26/20, 1/27/20,...
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

    #daten["Case"] <-
    bind_rows(list("Death" = deaths2, "Cases" = cases), .id="table") %>% 
    #cases %>% 
      dplyr::filter(`Country/Region` %in% c("US", "Germany", "Italy", "China", "Korea, South", "New Zealand", "Senegal")) %>% 

    transmute(
     table,  `Country/Region`, `Province/State`, Lat, Long, 
      early2020 = `4/30/20`-`2/1/20`,
      late2020 = `9/30/20`-`6/1/20`, 
    ) %>% 
    #  dplyr::filter( `Country/Region` == "Germany") %>% 
      pivot_longer(ends_with("2020"), names_to = "Time") %>% 
      pivot_wider(names_from = "table", values_from = "value") %>% 
      mutate(Mortality= Death / Cases)

    ## # A tibble: 84 × 8
    ##    `Country/Region` `Province/State`   Lat  Long Time      Death Cases Mortality
    ##    <chr>            <chr>            <dbl> <dbl> <chr>     <dbl> <dbl>     <dbl>
    ##  1 China            Anhui             31.8  117. early2020     6   694   0.00865
    ##  2 China            Anhui             31.8  117. late2020      0     0 NaN      
    ##  3 China            Beijing           40.2  116. early2020     8   425   0.0188 
    ##  4 China            Beijing           40.2  116. late2020      0   343   0      
    ##  5 China            Chongqing         30.1  108. early2020     5   332   0.0151 
    ##  6 China            Chongqing         30.1  108. late2020      0     5   0      
    ##  7 China            Fujian            26.1  118. early2020     1   212   0.00472
    ##  8 China            Fujian            26.1  118. late2020      0    51   0      
    ##  9 China            Gansu             35.8  104. early2020     2    99   0.0202 
    ## 10 China            Gansu             35.8  104. late2020      0    31   0      
    ## # ℹ 74 more rows
