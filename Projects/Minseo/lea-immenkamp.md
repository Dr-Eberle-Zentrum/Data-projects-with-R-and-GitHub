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

    ## Warning: package 'ggplot2' was built under R version 4.5.2

    ## Warning: package 'purrr' was built under R version 4.5.2

    ## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ## ✔ dplyr     1.1.4     ✔ readr     2.1.5
    ## ✔ forcats   1.0.0     ✔ stringr   1.6.0
    ## ✔ ggplot2   4.0.3     ✔ tibble    3.2.1
    ## ✔ lubridate 1.9.4     ✔ tidyr     1.3.1
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
    library(gt)

    ## Warning: package 'gt' was built under R version 4.5.2

    library(purrr)
    library(ggplot2)

    socialmedia <- read.csv("Social Media Advertising.csv")

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
      filter(!is.na(age_group))

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
    ## $ date             <date> 2022-02-25, 2022-05-12, 2022-06-19, 2022-09-08, 2022…
    ## $ company          <chr> "Aura Align", "Hearth Harmony", "Cyber Circuit", "Wel…

# Data mainpulation

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
        `Campaign goal` = campaign_goal
      )


    campaign %>%
      gt() %>%
      tab_header(
        title = "Engagement Score Summary by Campaign Goal"
      ) %>%
      tab_footnote(
        footnote = "Note. M = Mean, SD = Standard Derivation, n = number of campaigns."
      )

<div id="zauhobiegu" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#zauhobiegu table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

#zauhobiegu thead, #zauhobiegu tbody, #zauhobiegu tfoot, #zauhobiegu tr, #zauhobiegu td, #zauhobiegu th {
  border-style: none;
}

#zauhobiegu p {
  margin: 0;
  padding: 0;
}

#zauhobiegu .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#zauhobiegu .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}

#zauhobiegu .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#zauhobiegu .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#zauhobiegu .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#zauhobiegu .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#zauhobiegu .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#zauhobiegu .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#zauhobiegu .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#zauhobiegu .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#zauhobiegu .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#zauhobiegu .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#zauhobiegu .gt_spanner_row {
  border-bottom-style: hidden;
}

#zauhobiegu .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}

#zauhobiegu .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#zauhobiegu .gt_from_md > :first-child {
  margin-top: 0;
}

#zauhobiegu .gt_from_md > :last-child {
  margin-bottom: 0;
}

#zauhobiegu .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#zauhobiegu .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}

#zauhobiegu .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}

#zauhobiegu .gt_row_group_first td {
  border-top-width: 2px;
}

#zauhobiegu .gt_row_group_first th {
  border-top-width: 2px;
}

#zauhobiegu .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#zauhobiegu .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#zauhobiegu .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#zauhobiegu .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#zauhobiegu .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#zauhobiegu .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#zauhobiegu .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}

#zauhobiegu .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#zauhobiegu .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#zauhobiegu .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#zauhobiegu .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#zauhobiegu .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#zauhobiegu .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#zauhobiegu .gt_left {
  text-align: left;
}

#zauhobiegu .gt_center {
  text-align: center;
}

#zauhobiegu .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#zauhobiegu .gt_font_normal {
  font-weight: normal;
}

#zauhobiegu .gt_font_bold {
  font-weight: bold;
}

#zauhobiegu .gt_font_italic {
  font-style: italic;
}

#zauhobiegu .gt_super {
  font-size: 65%;
}

#zauhobiegu .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}

#zauhobiegu .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#zauhobiegu .gt_indent_1 {
  text-indent: 5px;
}

#zauhobiegu .gt_indent_2 {
  text-indent: 10px;
}

#zauhobiegu .gt_indent_3 {
  text-indent: 15px;
}

#zauhobiegu .gt_indent_4 {
  text-indent: 20px;
}

#zauhobiegu .gt_indent_5 {
  text-indent: 25px;
}

#zauhobiegu .katex-display {
  display: inline-flex !important;
  margin-bottom: 0.75em !important;
}

#zauhobiegu div.Reactable > div.rt-table > div.rt-thead > div.rt-tr.rt-tr-group-header > div.rt-th-group:after {
  height: 0px !important;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    <tr class="gt_heading">
      <td colspan="4" class="gt_heading gt_title gt_font_normal gt_bottom_border" style>Engagement Score Summary by Campaign Goal</td>
    </tr>
    
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Campaign-goal">Campaign goal</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="M">M</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="SD">SD</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="n">n</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="Campaign goal" class="gt_row gt_left">Increase Sales</td>
<td headers="M" class="gt_row gt_right">4.373195</td>
<td headers="SD" class="gt_row gt_right">3.158475</td>
<td headers="n" class="gt_row gt_right">66547</td></tr>
    <tr><td headers="Campaign goal" class="gt_row gt_left">Product Launch</td>
<td headers="M" class="gt_row gt_right">4.370281</td>
<td headers="SD" class="gt_row gt_right">3.155021</td>
<td headers="n" class="gt_row gt_right">66598</td></tr>
    <tr><td headers="Campaign goal" class="gt_row gt_left">Brand Awareness</td>
<td headers="M" class="gt_row gt_right">4.363321</td>
<td headers="SD" class="gt_row gt_right">3.152915</td>
<td headers="n" class="gt_row gt_right">66938</td></tr>
    <tr><td headers="Campaign goal" class="gt_row gt_left">Market Expansion</td>
<td headers="M" class="gt_row gt_right">4.362524</td>
<td headers="SD" class="gt_row gt_right">3.160453</td>
<td headers="n" class="gt_row gt_right">66470</td></tr>
  </tbody>
  <tfoot>
    <tr class="gt_footnotes">
      <td class="gt_footnote" colspan="4"> Note. M = Mean, SD = Standard Derivation, n = number of campaigns.</td>
    </tr>
  </tfoot>
</table>
</div>

## 2. Which age group has the highest click-through rate?

    age_summary <- socialmedia_clean %>%
      mutate(click_through_rate = clicks / impressions) %>%
      separate(age_group, into = c("age_min", "age_max"), sep = "-", convert = TRUE) %>%
      mutate(
        age = map2(age_min, age_max, ~ if (is.finite(.x) & is.finite(.y)) seq(.x, .y) else NA_real_)
      ) %>%
      unnest(age) %>%
      group_by(age) %>%
      summarise(
        mean_ctr = mean(click_through_rate, na.rm = TRUE),
        number_of_campaigns = n(),
        .groups = "drop"
      ) %>%
      arrange(age)

Visualization of click-through rate

    socialmedia_clean %>%
      mutate(
        click_through_rate = clicks / impressions,
        gender = tolower(gender),
        gender = ifelse(gender == "male","female", gender)
      ) %>%
      separate(age_group, c("age_min","age_max"), sep = "\\s*-\\s*", convert = TRUE, fill = "right") %>%
      separate_rows(gender, sep = ",") %>%
      mutate(
        age = map2(age_min, age_max, ~ {
          if (is.finite(.x) & is.finite(.y) & .x <= .y) seq(.x, .y) else NA_real_
        })
      ) %>%
      unnest(age) %>%
      group_by(age, gender) %>%
      summarise(ctr = mean(click_through_rate, na.rm = TRUE), .groups = "drop") %>%
      ggplot(aes(age, ctr)) +
      stat_summary(fun = mean, geom = "line") +
      facet_wrap(~gender)

![](lea-immenkamp_files/figure-markdown_strict/click-through%20rate%20visualization-1.png)

# Data visualization

    roi_data <- socialmedia_clean %>%
      group_by(duration, channel_used) %>%
      summarise(
        avg_roi = mean(roi, na.rm = TRUE),
        .groups = "drop"
      )

    ggplot(roi_data, aes(x = duration, y = avg_roi, color = channel_used)) +
      geom_line() +
      geom_point() +
      labs(
        title = "Average ROI by Campaign Duration and Platform",
        x = "Campaign Duration",
        y = "Average ROI",
        color = "Platform"
      ) +
      theme_minimal()

![](lea-immenkamp_files/figure-markdown_strict/line%20graph-1.png)
