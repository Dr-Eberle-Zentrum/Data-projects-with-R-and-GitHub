Setup

    library(readr)
    library(knitr)
    library(khroma)

    ## Warning: Paket 'khroma' wurde unter R Version 4.5.3 erstellt

    library(tidyverse)
    data <- read_csv("https://raw.githubusercontent.com/barrolee/BarroLeeDataSet/master/BLData/BL2013_MF_v2.2.csv")

## Validation Checks

#### Sum of education level percentages

    # Sum up to 100?
    edu_lvl <- subset(data, select = c("lu", "lp", "lpc", "ls", "lsc", "lh", "lhc"))
    min<-which.min(rowSums(edu_lvl))
    max<-which.max(rowSums(edu_lvl)) # Max Value almost at 200, something must be wrong here with the data
    # What to do? Should from a threshold on entries be removed?
    sum(edu_lvl[min,])

    ## [1] 99.84

    sum(edu_lvl[max,])

    ## [1] 199.74

The sum of education levels should be at ~100, the max. value however,
is at almost 200. This is because the completed education level (e.g.,
lpc) is a subset of that education level in general (e.g., lp).
Therefore, for the general education levels the completed subset needs
to be subtracted:

    data <- data %>%
      mutate(
        lp = lp - lpc,
        ls = ls - lsc,
        lh = lh - lhc
      )

#### Missing values?

    sum(is.na(data)) # No

    ## [1] 0

There are NO missing values

#### Implausible values?

    # Are there any implausible values (negative percentage)
    min(edu_lvl) # no values below 0

    ## [1] 0

    max(edu_lvl) # no values above 100

    ## [1] 100

The max value at any single education level is 100, the min value 0

#### Check if for every country there are all year entries

    # 1. Create a grid of all possible combinations
    all_combinations <- data %>%
      expand(country, year)
    # 2. Find which combinations are NOT in your original data
    missing_entries <- all_combinations %>%
      anti_join(data, by = c("country", "year"))
    print(missing_entries)

    ## # A tibble: 0 × 2
    ## # ℹ 2 variables: country <chr>, year <dbl>

There are NO missing combinations of country and year

BUT: for age groups from 15, 25 & 75 entries are always double (the
second time with ageto == 999). This needs to be removed!

    data <- data %>%
      filter(!(agefrom %in% c(15, 25, 75) & ageto == 999))

## Renaming columns for improved readability

    data <- data %>%
      rename(No_education = "lu",
             Primary_education  = "lp",
             Primary_education_completed = "lpc",
             Secondary_education = "ls",
             Secondary_education_completed = "lsc",
             Higher_education = "lh",
             Higher_education_completed = "lhc")

    kable(head(subset(data, select = c("No_education", "Primary_education", "Primary_education_completed", "Secondary_education", "Secondary_education_completed", "Higher_education", "Higher_education_completed")), 1))

<table>
<colgroup>
<col style="width: 8%" />
<col style="width: 11%" />
<col style="width: 18%" />
<col style="width: 13%" />
<col style="width: 19%" />
<col style="width: 11%" />
<col style="width: 17%" />
</colgroup>
<thead>
<tr>
<th style="text-align: right;">No_education</th>
<th style="text-align: right;">Primary_education</th>
<th style="text-align: right;">Primary_education_completed</th>
<th style="text-align: right;">Secondary_education</th>
<th style="text-align: right;">Secondary_education_completed</th>
<th style="text-align: right;">Higher_education</th>
<th style="text-align: right;">Higher_education_completed</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: right;">86.12</td>
<td style="text-align: right;">9.68</td>
<td style="text-align: right;">3.64</td>
<td style="text-align: right;">0.42</td>
<td style="text-align: right;">0.12</td>
<td style="text-align: right;">0.02</td>
<td style="text-align: right;">0</td>
</tr>
</tbody>
</table>

# Data Visualizations

## Visualization 1

    ## Compute population-weighted regional average years of schooling (`yr_sch`) for each region and year and plot their evolution over time (1950-2010) using a line plot with one line per region.

    # Group by Region and Year and calculate the population-weighted average years of schooling
    regional_avg <- data %>%
      group_by(region_code, year) %>%
      summarise(
        total_population = sum(pop, na.rm = TRUE),
        weighted_yr_sch = weighted.mean(yr_sch, w = pop, na.rm = TRUE),
        .groups = "drop"
      )

    # Plot the evolution of population-weighted average years of schooling over time for each region
    ggplot(regional_avg, aes(x = year, y = weighted_yr_sch, color = as.factor(region_code))) +
      geom_line(linewidth = 1) +
      geom_point(size = 2) +
      scale_x_continuous(breaks = seq(1950,2010, by = 10)) +
      scale_color_nightfall(discrete = TRUE) +
      labs(title = "Population-Weighted Average Years of Schooling Over Time",
           subtitle = "Analysis by Region (1950-2010)",
           x = "Year",
           y = "Population-Weighted Average Years of Schooling",
           color = "Region") +
      theme_minimal() +
      theme(
        legend.position = "right",
        panel.grid.minor = element_blank()
      )

![](Jakobs_solution_files/figure-markdown_strict/unnamed-chunk-9-1.png)

## Visualization 2

    # 1. Prepare data with Netherlands/Fiji and "Incomplete" math
    pyramid_data <- data %>%
      filter(country %in% c("Netherlands", "Fiji"), 
             year %in% c(1960, 2010)) %>%
      mutate(
        age_range = paste0(agefrom, "-", ageto),
        # Ensure the axis stays in numerical order (15-19 before 20-24)
        age_range = reorder(age_range, agefrom)
      ) %>%
      pivot_longer(
        cols = c("No_education", 
                 "Primary_education", "Primary_education_completed", 
                 "Secondary_education", "Secondary_education_completed", 
                 "Higher_education", "Higher_education_completed"),
        names_to = "education_level",
        values_to = "percentage"
      ) %>%
      mutate(
        # Netherlands on the left (negative)
        adj_percentage = ifelse(country == "Netherlands", -percentage, percentage),
        
        # OPPOSITE ORDER: Higher education will now be at the center line
        education_level = factor(education_level, levels = rev(c(
          "No_education", 
          "Primary_education", "Primary_education_completed", 
          "Secondary_education", "Secondary_education_completed", 
          "Higher_education", "Higher_education_completed"
        )))
      )

    # 2. Plotting
    ggplot(pyramid_data, aes(x = adj_percentage, 
                             y = age_range, 
                             fill = education_level)) +
      geom_col(width = 0.8) +
      geom_vline(xintercept = 0, color = "black", linewidth = 0.6) +
      facet_wrap(~year) +
      # Limits set to 115 to keep bars away from the edges
      scale_x_continuous(labels = abs) + 
      scale_fill_nightfall(
        discrete = TRUE,
        reverse = TRUE,
        labels = c("Higher (Comp)", "Higher (Inc)", "Secondary (Comp)", 
                   "Secondary (Inc)", "Primary (Comp)", "Primary (Inc)", "No Education")
      ) +
      labs(
        title = "Education Comparison: Netherlands (Left) vs. Fiji (Right)",
        subtitle = "Years 1960 and 2010 | Advanced degrees at the center",
        x = "Percentage of Population",
        y = "Age Groups",
        fill = "Education Level"
      ) +
      theme_minimal() +
      theme(
        legend.position = "bottom",
        legend.text = element_text(size = 7),
        panel.grid.major.y = element_blank()
      )

![](Jakobs_solution_files/figure-markdown_strict/unnamed-chunk-10-1.png)
