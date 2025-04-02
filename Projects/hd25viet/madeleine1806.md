    ## Warning: Paket 'ggridges' wurde unter R Version 4.3.3 erstellt

    file <- "standard_rating_list.txt"
    data <- read_fwf(file = file, 
                             fwf_empty(file, 
                                       col_names = c("ID", "Name", "Fed", "Sex", "Tit", "WTit", 
                                                     "OTit", "FOA", "APR25", "Gms", "K", "Birthday", "Flag")),
                             skip = 1,
                             show_col_types = FALSE) %>%
      # Keep only Name, Fed, APR25, and Birthday columns
      select(Name, Fed, APR25, Birthday) %>%
      # Remove rows with missing Birthday or ratings (APR25)
      filter(!is.na(Birthday) & !is.na(APR25)) %>%
      # Calculate age based on the current year and the Birthday column
      mutate(Age = 2025 - Birthday) %>%
      # Create age categories
      mutate(AgeCategory = case_when(
        Age < 16 ~ "Under 16",
        Age >= 16 & Age < 24 ~ "16–24",
        Age >= 24 & Age < 34 ~ "24–34",
        Age >= 34 & Age < 45 ~ "35–45",
        Age >= 45 ~ "45+"
      )) %>%
      # Convert AgeCategory to a factor
      mutate(AgeCategory = factor(AgeCategory, levels = c("Under 16", "16–24", "24–34", "35–45", "45+")))

    # Compute mean ratings for each Federation (Fed) within each age category
    data_mean_ratings <- data %>%
      group_by(Fed, AgeCategory) %>%
      summarize(
        mean_APR25 = mean(APR25, na.rm = TRUE),
        .groups = "drop"  # To ungroup the data after summarizing
      )

    # Calculate the overall mean rating for each Federation
    data_overall <- data_mean_ratings %>%
      group_by(Fed) %>%
      summarize(
        overall_mean = mean(mean_APR25, na.rm = TRUE),
        .groups = "drop"
      )

    # Pivot the table: federations as rows and age categories as columns
    data_pivoted <- data_mean_ratings %>%
      pivot_wider(names_from = AgeCategory, values_from = mean_APR25) %>%
      left_join(data_overall, by = "Fed") %>%
      arrange(desc(overall_mean)) %>%  # Sort by overall mean rating in descending order
      slice_head(n = 10) %>%  # Keep only the top 10 federations
      drop_na() # Drop rows with missing values

    # Print the table
    knitr::kable(data_pivoted, format = "pipe", caption = "Federation Mean Ratings by Age Category with Overall Mean Rating")

<table>
<caption>Federation Mean Ratings by Age Category with Overall Mean
Rating</caption>
<thead>
<tr class="header">
<th style="text-align: left;">Fed</th>
<th style="text-align: right;">16–24</th>
<th style="text-align: right;">24–34</th>
<th style="text-align: right;">35–45</th>
<th style="text-align: right;">45+</th>
<th style="text-align: right;">Under 16</th>
<th style="text-align: right;">overall_mean</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">CHN</td>
<td style="text-align: right;">1735.627</td>
<td style="text-align: right;">1974.962</td>
<td style="text-align: right;">2082.961</td>
<td style="text-align: right;">2072.058</td>
<td style="text-align: right;">1637.901</td>
<td style="text-align: right;">1900.702</td>
</tr>
<tr class="even">
<td style="text-align: left;">CUB</td>
<td style="text-align: right;">1827.623</td>
<td style="text-align: right;">1996.200</td>
<td style="text-align: right;">2028.557</td>
<td style="text-align: right;">2013.782</td>
<td style="text-align: right;">1630.358</td>
<td style="text-align: right;">1899.304</td>
</tr>
<tr class="odd">
<td style="text-align: left;">NED</td>
<td style="text-align: right;">1816.230</td>
<td style="text-align: right;">1909.538</td>
<td style="text-align: right;">1969.701</td>
<td style="text-align: right;">1907.855</td>
<td style="text-align: right;">1747.681</td>
<td style="text-align: right;">1870.201</td>
</tr>
<tr class="even">
<td style="text-align: left;">UKR</td>
<td style="text-align: right;">1731.736</td>
<td style="text-align: right;">1915.529</td>
<td style="text-align: right;">2056.312</td>
<td style="text-align: right;">2001.265</td>
<td style="text-align: right;">1645.790</td>
<td style="text-align: right;">1870.126</td>
</tr>
<tr class="odd">
<td style="text-align: left;">USA</td>
<td style="text-align: right;">1825.921</td>
<td style="text-align: right;">1908.348</td>
<td style="text-align: right;">1930.334</td>
<td style="text-align: right;">1946.536</td>
<td style="text-align: right;">1723.772</td>
<td style="text-align: right;">1866.982</td>
</tr>
<tr class="even">
<td style="text-align: left;">BIH</td>
<td style="text-align: right;">1787.014</td>
<td style="text-align: right;">1890.297</td>
<td style="text-align: right;">1985.538</td>
<td style="text-align: right;">1985.268</td>
<td style="text-align: right;">1659.125</td>
<td style="text-align: right;">1861.449</td>
</tr>
<tr class="odd">
<td style="text-align: left;">FID</td>
<td style="text-align: right;">1868.609</td>
<td style="text-align: right;">1889.282</td>
<td style="text-align: right;">1920.046</td>
<td style="text-align: right;">1895.996</td>
<td style="text-align: right;">1713.644</td>
<td style="text-align: right;">1857.515</td>
</tr>
<tr class="even">
<td style="text-align: left;">FIN</td>
<td style="text-align: right;">1741.482</td>
<td style="text-align: right;">1905.473</td>
<td style="text-align: right;">1968.781</td>
<td style="text-align: right;">1958.913</td>
<td style="text-align: right;">1687.538</td>
<td style="text-align: right;">1852.437</td>
</tr>
</tbody>
</table>

Federation Mean Ratings by Age Category with Overall Mean Rating

    ## Picking joint bandwidth of 47.2

    ## Picking joint bandwidth of 57.2

    ## Picking joint bandwidth of 46.5

    ## Picking joint bandwidth of 47.1

    ## Picking joint bandwidth of 39.7

![](madeleine1806_files/figure-markdown_strict/ridgeline%20plot-1.png)

    ## `summarise()` has grouped output by 'Fed'. You can override using the `.groups`
    ## argument.

![](madeleine1806_files/figure-markdown_strict/heatmap%20plot-1.png)
