## Dataset Manipulation

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

    file <- "standard_rating_list.txt"
    df <- read_fwf(file=file, 
                   fwf_empty(file, 
                            col_names=c("ID", "Name", "Fed", "Sex", "Tit", "WTit", "OTit", "FOA", "APR25", "Gms", "K", "Birthday", "Flag")),
                            skip=1) %>%
          mutate(Fed = na_if(Fed, "NON")) %>%
          drop_na(Birthday, APR25, Fed) %>% # remove rows without birthday or rating
          # filter out rows with invalid birthday year
          filter(Birthday > 1900) %>%
          select(Name, Fed, APR25, Birthday) %>%
          # remove irrelevant columns
          mutate(# using cut already create factor-typed column
                 bin = cut(2024-Birthday, breaks=c(1,16,25,35,46,Inf), labels=c("below 16", "16-24", "25-34", "35-45", "above 45"))
                 ) %>%
          drop_na(bin) %>% 
          print(n=20)

    ## Rows: 498022 Columns: 13
    ## ── Column specification ────────────────────────────────────────────────────────
    ## 
    ## chr (8): Name, Fed, Sex, Tit, WTit, OTit, FOA, Flag
    ## dbl (5): ID, APR25, Gms, K, Birthday
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

    ## # A tibble: 489,590 × 5
    ##    Name                           Fed   APR25 Birthday bin     
    ##    <chr>                          <chr> <dbl>    <dbl> <fct>   
    ##  1 A B M Jobair, Hossain          BAN    1750     1998 25-34   
    ##  2 A C J John                     IND    1438     1987 35-45   
    ##  3 A Chakravarthy                 IND    1491     1986 35-45   
    ##  4 A Darshil                      IND    1427     2013 below 16
    ##  5 A E M, Doshtagir               BAN    1904     1974 above 45
    ##  6 A F M Ehteshamul, Hoque (tuhin BAN    1796     1977 above 45
    ##  7 A hamed Ashraf, Abdallah       EGY    1837     2001 16-24   
    ##  8 A Hamid, Harman                MAS    1552     1970 above 45
    ##  9 A I Sabbir                     BAN    1607     1995 25-34   
    ## 10 A K, Kalshyan                  IND    1803     1964 above 45
    ## 11 A La, Teng Hua                 CHN    1949     1993 25-34   
    ## 12 A Q M Salahuddin, Khan         BAN    1695     1977 above 45
    ## 13 A S M Khalid, Hasan            BAN    1751     1988 35-45   
    ## 14 A S M Mashrur, Zaman           BAN    1614     2008 below 16
    ## 15 A S M Soyaeb, Reza             BAN    1592     2006 16-24   
    ## 16 A, L M Wayes Faruki            BAN    1714     2015 below 16
    ## 17 A, N M Ziaul Islam Mithu       BAN    1653     1974 above 45
    ## 18 A, Sohita                      IND    1668     1995 25-34   
    ## 19 A. HUDSON                      IND    1644     2013 below 16
    ## 20 A. K. Azad, Akhond             BAN    1779     1971 above 45
    ## # ℹ 489,570 more rows

    by_country_by_age <- group_by(df, Fed, bin) %>%
      summarise(mean_rating=mean(APR25, na.rm=TRUE), .groups="drop") %>%
      pivot_wider(names_from=bin, values_from=mean_rating) %>%
      select("Fed", "below 16", "16-24", "25-34", "35-45", "above 45")

    by_country <- group_by(df, Fed) %>%
      summarise(mean_rating=mean(APR25, na.rm=TRUE)) %>%
      arrange(desc(mean_rating)) 

    final_df <- left_join(by_country, by_country_by_age, by="Fed") %>%
      arrange(desc(mean_rating)) %>%
      slice_head(n=10)

    knitr::kable(final_df, format = "pipe", caption="table sorted by average rating of each federation (Top 10)")

<table>
<caption>table sorted by average rating of each federation (Top
10)</caption>
<thead>
<tr>
<th style="text-align: left;">Fed</th>
<th style="text-align: right;">mean_rating</th>
<th style="text-align: right;">below 16</th>
<th style="text-align: right;">16-24</th>
<th style="text-align: right;">25-34</th>
<th style="text-align: right;">35-45</th>
<th style="text-align: right;">above 45</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">CUB</td>
<td style="text-align: right;">1941.712</td>
<td style="text-align: right;">1665.968</td>
<td style="text-align: right;">1885.176</td>
<td style="text-align: right;">2009.319</td>
<td style="text-align: right;">2039.182</td>
<td style="text-align: right;">2009.836</td>
</tr>
<tr>
<td style="text-align: left;">BIH</td>
<td style="text-align: right;">1934.607</td>
<td style="text-align: right;">1699.621</td>
<td style="text-align: right;">1812.250</td>
<td style="text-align: right;">1923.701</td>
<td style="text-align: right;">1999.206</td>
<td style="text-align: right;">1981.751</td>
</tr>
<tr>
<td style="text-align: left;">MYA</td>
<td style="text-align: right;">1917.426</td>
<td style="text-align: right;">1652.611</td>
<td style="text-align: right;">1772.000</td>
<td style="text-align: right;">1893.522</td>
<td style="text-align: right;">1954.941</td>
<td style="text-align: right;">1964.498</td>
</tr>
<tr>
<td style="text-align: left;">FIN</td>
<td style="text-align: right;">1916.444</td>
<td style="text-align: right;">1707.103</td>
<td style="text-align: right;">1786.681</td>
<td style="text-align: right;">1910.691</td>
<td style="text-align: right;">1992.398</td>
<td style="text-align: right;">1955.388</td>
</tr>
<tr>
<td style="text-align: left;">SRB</td>
<td style="text-align: right;">1912.044</td>
<td style="text-align: right;">1657.771</td>
<td style="text-align: right;">1775.522</td>
<td style="text-align: right;">1898.519</td>
<td style="text-align: right;">1975.574</td>
<td style="text-align: right;">1970.373</td>
</tr>
<tr>
<td style="text-align: left;">KOS</td>
<td style="text-align: right;">1906.109</td>
<td style="text-align: right;">1607.316</td>
<td style="text-align: right;">1853.719</td>
<td style="text-align: right;">1868.889</td>
<td style="text-align: right;">1955.057</td>
<td style="text-align: right;">1939.668</td>
</tr>
<tr>
<td style="text-align: left;">NED</td>
<td style="text-align: right;">1903.981</td>
<td style="text-align: right;">1761.653</td>
<td style="text-align: right;">1840.350</td>
<td style="text-align: right;">1938.054</td>
<td style="text-align: right;">1976.723</td>
<td style="text-align: right;">1902.765</td>
</tr>
<tr>
<td style="text-align: left;">UKR</td>
<td style="text-align: right;">1896.574</td>
<td style="text-align: right;">1664.897</td>
<td style="text-align: right;">1772.076</td>
<td style="text-align: right;">1976.746</td>
<td style="text-align: right;">2063.388</td>
<td style="text-align: right;">1993.814</td>
</tr>
<tr>
<td style="text-align: left;">GER</td>
<td style="text-align: right;">1889.695</td>
<td style="text-align: right;">1684.138</td>
<td style="text-align: right;">1791.569</td>
<td style="text-align: right;">1891.149</td>
<td style="text-align: right;">1943.909</td>
<td style="text-align: right;">1929.801</td>
</tr>
<tr>
<td style="text-align: left;">MNE</td>
<td style="text-align: right;">1881.261</td>
<td style="text-align: right;">1578.988</td>
<td style="text-align: right;">1738.929</td>
<td style="text-align: right;">1962.662</td>
<td style="text-align: right;">1975.857</td>
<td style="text-align: right;">1977.656</td>
</tr>
</tbody>
</table>

## Data Visualisation

-   Ridgeline Plots

<!-- -->

    library(ggridges)
    ridgePlot <- df %>%
      filter(Fed %in% c("CUB", "BIH", "MYA","FIN","SRB")) %>%
      ggplot(aes(x = APR25, y = as.factor(bin), fill = ..x..)) +  # Gradient fill based on APR25 rating
      geom_density_ridges_gradient(scale = 1, rel_min_height = 0.01) +  
      facet_wrap(~ Fed, scales = "free_y") +  # One plot per federation
      scale_fill_viridis_c(name = "Rating", option = "C") +  # Apply viridis color scale
      labs(title = "Rating distributions of each Top 5 Federation (by Age category)",
           x = "APR25 Rating",
           y = "Age Group",
           fill = "Rating Intensity") +
      theme(legend.position = "right",
            panel.spacing = unit(2, "lines"))

    ridgePlot

    ## Warning: The dot-dot notation (`..x..`) was deprecated in ggplot2 3.4.0.
    ## ℹ Please use `after_stat(x)` instead.
    ## This warning is displayed once every 8 hours.
    ## Call `lifecycle::last_lifecycle_warnings()` to see where this warning was
    ## generated.

    ## Picking joint bandwidth of 51.5

    ## Picking joint bandwidth of 38.8

    ## Picking joint bandwidth of 52.4

    ## Picking joint bandwidth of 38.7

    ## Picking joint bandwidth of 37.5

![](solution_by_hiuyan_files/figure-markdown_strict/unnamed-chunk-2-1.png)

-   Heatmap

<!-- -->

    library(reshape2)

    ## 
    ## Attaching package: 'reshape2'

    ## The following object is masked from 'package:tidyr':
    ## 
    ##     smiths

    age_groups <- c("below 16", "16-24", "25-34", "35-45", "above 45") # for strict ordering

    df_heatmap_pivot <- by_country_by_age %>%
      filter(Fed %in% c("NON", "CUB", "BIH", "MYA","FIN","SRB", "KOS", "NED", "UKR", "GER")) %>%
      select(Fed, all_of(age_groups)) %>%
      pivot_longer(cols = all_of(age_groups), 
                   names_to = "Age", 
                   values_to = "APR25")

    df_heatmap_pivot$Age <- factor(df_heatmap_pivot$Age, levels = age_groups) # to fix the age order

    ggplot(df_heatmap_pivot, aes(x = Age, y = Fed, fill = APR25)) +
      geom_tile() +  # heatmap needs tiles
      scale_fill_gradientn(colors = colorRampPalette(c("deepskyblue","deepskyblue2", "deepskyblue4"))(4), 
                           name = "Mean Rating") + # more fine-grained palette
      labs(title = "Mean rating by Federation and Age categories", 
           x = "Age category", 
           y = "Federation") + 
      theme(axis.text.x = element_text(angle = 45, hjust = 1))  # rotate x-axis and align with plot)

![](solution_by_hiuyan_files/figure-markdown_strict/unnamed-chunk-3-1.png)
