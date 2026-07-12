# Solution for Michael’s Project “Demographic Shift in Germany”

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
    ## 
    ## Attaching package: 'kableExtra'
    ## 
    ## 
    ## The following object is masked from 'package:dplyr':
    ## 
    ##     group_rows
    ## 
    ## 
    ## Loading required package: MASS
    ## 
    ## 
    ## Attaching package: 'MASS'
    ## 
    ## 
    ## The following object is masked from 'package:dplyr':
    ## 
    ##     select
    ## 
    ## 
    ## Multiple files in zip: reading 'FReDA_panel_4waves_long_labeled.csv'
    ## Rows: 107921 Columns: 203
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## dbl (203): id, welle, pid, sample, sat3, pa27, sd3, sd40, sd43, sd11, sd7e1,...
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

## Analysis of Reasons for the low Fertility Rate

Solution: There is a positive correlation between relationship
satisfaction and intention to have children in the next 3 years.

    ## [1] 0.1555075

    ## [1] 0.1458812

![](Jannis-DW_files/figure-markdown_strict/FertilityRateAnalysis-1.png)

\##1.3 I think that is due to happy couples not wanting to change any of
their current situation since they are allready fulfilled. Maybe the
unhappier families simply are unhappy because they want ti have children
but do not have any yet and will be happier as soon as they have
children.

\#1.4

Histogram to get an overview of data: Answer: We have the statistical
problem that most people see themselves as very happy or do not want to
answer the question. This leads to a very skewed distribution of the
data and makes it hard to find a correlation between the two variables.

![](Jannis-DW_files/figure-markdown_strict/histogram-1.png)

\#Corellation between sat3 and frt69 with controll of age

    ##    estimate      p.value statistic    n gp  Method
    ## 1 0.1104294 1.232921e-16  8.305721 5591  1 pearson

\#1.6

## Task 2

<table class="table table-striped table-hover table-condensed" style="width: auto !important; margin-left: auto; margin-right: auto;">
<thead>
<tr>
<th style="text-align:right;">
east
</th>
<th style="text-align:right;">
mean\_val1i3
</th>
<th style="text-align:right;">
mean\_val1i5
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:right;">
-7
</td>
<td style="text-align:right;">
1.781250
</td>
<td style="text-align:right;">
2.069444
</td>
</tr>
<tr>
<td style="text-align:right;">
0
</td>
<td style="text-align:right;">
2.334725
</td>
<td style="text-align:right;">
2.323553
</td>
</tr>
<tr>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
2.135884
</td>
<td style="text-align:right;">
1.853245
</td>
</tr>
</tbody>
</table>

## Task 2.2

    ## Warning: Removed 71196 rows containing non-finite outside the scale range
    ## (`stat_ydensity()`).

![](Jannis-DW_files/figure-markdown_strict/ViolinPlot-1.png)
