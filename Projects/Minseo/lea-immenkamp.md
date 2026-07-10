# Social Media Advertising

Social media advertising is an important part of modern marketing and
public relations. This project explores how social media advertising
campaigns differ across platforms, customer segments, and campaign
goals.

The focus of this project lies on cleaning, restructuring, and
visualizing advertising campaign data. I am especially interested in how
different advertising strategies lead to audience interaction and
financial performance.

    library(tidyverse)

    ## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ## ✔ dplyr     1.2.1     ✔ readr     2.2.0
    ## ✔ forcats   1.0.1     ✔ stringr   1.6.0
    ## ✔ ggplot2   4.0.3     ✔ tibble    3.3.1
    ## ✔ lubridate 1.9.5     ✔ tidyr     1.3.2
    ## ✔ purrr     1.2.2     
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()
    ## ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

    library(dplyr)
    library(tidyr)
    library(stringr)
    library(lubridate)
    library(knitr)
    library(kableExtra)

    ## 
    ## Attaching package: 'kableExtra'
    ## 
    ## The following object is masked from 'package:dplyr':
    ## 
    ##     group_rows

    library(purrr)
    library(ggplot2)

    socialmedia <- read.csv("Social_Media_Advertising.csv")

    socialmedia_clean <- socialmedia %>% 
       mutate(
        Duration = as.numeric(str_extract(Duration, "\\d+"))
      ) %>% 
      mutate(
        Acquisition_Cost = as.numeric(
          str_replace_all(Acquisition_Cost, "[$,]", "")
        )
      ) %>%
      mutate(
        Date = mdy(Date)
      ) %>%
      mutate(
        Target_Audience = str_replace(Target_Audience, "All Ages", "All gender")
      ) %>% 
      separate(
        Target_Audience,
        into = c("Gender", "Age_Group"),
        sep = " (?=\\d)",
        remove = TRUE
      ) %>%
      mutate(
        Gender = str_trim(Gender),
        Age_Group = str_trim(Age_Group)
      ) %>% 
       rename_with(tolower) %>% 
      drop_na(age_group)

    ## Warning: There was 1 warning in `mutate()`.
    ## ℹ In argument: `Date = mdy(Date)`.
    ## Caused by warning:
    ## ! All formats failed to parse. No formats found.

    ## Warning: Expected 2 pieces. Missing pieces filled with `NA` in 33447 rows [7, 13, 27,
    ## 29, 55, 58, 64, 75, 89, 90, 132, 138, 140, 151, 153, 168, 178, 183, 188, 189,
    ## ...].

    # Check variable type
    glimpse(socialmedia_clean)

    ## Rows: 266,553
    ## Columns: 17
    ## $ campaign_id      <int> 529013, 275352, 692322, 675757, 535900, 323031, 28955…
    ## $ gender           <chr> "Men", "Women", "Men", "Men", "Men", "Women", "Men", …
    ## $ age_group        <chr> "35-44", "45-60", "45-60", "25-34", "45-60", "35-44",…
    ## $ campaign_goal    <chr> "Product Launch", "Market Expansion", "Product Launch…
    ## $ duration         <dbl> 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 1…
    ## $ channel_used     <chr> "Instagram", "Facebook", "Instagram", "Pinterest", "P…
    ## $ conversion_rate  <dbl> 0.15, 0.01, 0.08, 0.03, 0.13, 0.02, 0.10, 0.14, 0.04,…
    ## $ acquisition_cost <dbl> 500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500…
    ## $ roi              <dbl> 5.7900000, 7.2100000, 0.4300000, 0.9098236, 1.4228282…
    ## $ location         <chr> "Las Vegas", "Los Angeles", "Austin", "Miami", "Austi…
    ## $ language         <chr> "Spanish", "French", "Spanish", "Spanish", "French", …
    ## $ clicks           <int> 500, 500, 500, 293, 293, 500, 293, 501, 501, 501, 501…
    ## $ impressions      <int> 3000, 3000, 3000, 1937, 1937, 3001, 1938, 3003, 3003,…
    ## $ engagement_score <int> 7, 5, 9, 1, 1, 10, 1, 8, 9, 8, 8, 8, 6, 4, 10, 8, 9, …
    ## $ customer_segment <chr> "Health", "Home", "Technology", "Health", "Home", "Te…
    ## $ date             <date> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
    ## $ company          <chr> "Aura Align", "Hearth Harmony", "Cyber Circuit", "Wel…

In total 266553 particpants took part in the social media advertising
campaigns. The dataset contains 17 variables.

# Data manipulation

## 1. Which campaign goals bring the highest engagement scores?

    campaign <- socialmedia_clean %>% 
      group_by(campaign_goal) %>% 
      summarise(
        M = mean(engagement_score, na.rm = TRUE),
        SD = sd(engagement_score, na.rm = TRUE),
        n = n()
      ) %>%
      arrange(desc(M)) %>% 
      rename(
        `Campaign Goal` = campaign_goal
      )

    kable(campaign, 
          digits = 2, 
          caption = "Engagement Score Summary by Campaign Goal")

<table>
<caption>Engagement Score Summary by Campaign Goal</caption>
<thead>
<tr>
<th style="text-align: left;">Campaign Goal</th>
<th style="text-align: right;">M</th>
<th style="text-align: right;">SD</th>
<th style="text-align: right;">n</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">Increase Sales</td>
<td style="text-align: right;">4.37</td>
<td style="text-align: right;">3.16</td>
<td style="text-align: right;">66547</td>
</tr>
<tr>
<td style="text-align: left;">Product Launch</td>
<td style="text-align: right;">4.37</td>
<td style="text-align: right;">3.16</td>
<td style="text-align: right;">66598</td>
</tr>
<tr>
<td style="text-align: left;">Brand Awareness</td>
<td style="text-align: right;">4.36</td>
<td style="text-align: right;">3.15</td>
<td style="text-align: right;">66938</td>
</tr>
<tr>
<td style="text-align: left;">Market Expansion</td>
<td style="text-align: right;">4.36</td>
<td style="text-align: right;">3.16</td>
<td style="text-align: right;">66470</td>
</tr>
</tbody>
</table>

## 2. Which age group has the highest click-through rate?

    age_data <- socialmedia_clean %>%
      mutate(
        click_through_rate = clicks / impressions,
        gender = tolower(gender)
      ) %>%
      separate(
        age_group,
        into = c("age_min", "age_max"),
        sep = "-",
        convert = TRUE
      ) %>%
      separate_rows(gender, sep = ",") %>%
      mutate(age_span = age_max - age_min + 1) %>% 
      uncount(age_span) %>% 
      group_by(across(everything())) %>% 
      mutate(age = age_min + row_number() - 1) %>% 
      ungroup()

Visualization of click-through rate by gender

    age_data %>%
      group_by(age, gender) %>%
      summarise(
        ctr = mean(click_through_rate, na.rm = TRUE),
        .groups = "drop"
      ) %>%
      ggplot(aes(age, ctr)) +
      geom_point() +
      facet_wrap(~gender) +
      labs(
        title = "Average Click-Through Rate (CTR) by Age and Gender", 
        x = "Age",
        y = "CTR"
      )

![](lea-immenkamp_files/figure-markdown_strict/click-through-rate-visualization-1.png)

**Results CTR**

- The graph shows the average click-through rate (CTR) by age and
  gender. - Results indicate that the CTR for men is highest for the age
  group 18-24, followed by 45-60. The age groups 25-34 and 35-44
  demonstrate the lowest CTR.
- For women, the highest CTR is for the same age group (18–24), but
  lower than the same age group for men. It is followed by 35–44, 25–34,
  and then 45–60 (which represents the lowest CTR for women).

# 3. Average ROI changes with campaign duration

    socialmedia_clean %>%
      group_by(duration, channel_used) %>%
      summarise(
        avg_roi = mean(roi, na.rm = TRUE),
        .groups = "drop"
      ) %>% 
      ggplot(aes(x = duration, y = avg_roi, color = channel_used)) +
      geom_line() +
      geom_point() +
      scale_y_continuous(limits = c(0, NA)) +
      labs(
        title = "Average Return on investment (ROI) by Campaign Duration and Platform",
        x = "Campaign Duration (days)",
        y = "Average ROI",
        color = "Platform"
      ) +
      theme_minimal()

![](lea-immenkamp_files/figure-markdown_strict/line-graph-1.png)

*Results*

- This line graph shows the average Return on investment for each
  campaign duration, separated by the platform used. - The average ROI
  does not change with campaign duration.
- However, differences exist regarding the platform used. Whereas
  facebook, instagram and twitter do not differ much in their average
  ROI, pinterest seems to be the least effective.
