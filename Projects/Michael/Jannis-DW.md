# Solution for Michael’s Project “Demographic Shift in Germany”

## Task 1: Analysis of Reasons for the low Fertility Rate

### 1.1

Task: Calculate Correlation between relationship satisfaction and
intention to have children in the next 3 years.

Solution: There is a positive correlation between relationship
satisfaction and intention to have children in the next 3 years.

    ## [1] 0.1555075

    ## [1] 0.1458812

### 1.2

Task: Create a Heatmap to visualize the correlation between relationship
satisfaction and intention to have children in the next 3 years.

![](Jannis-DW_files/figure-markdown_strict/HeatMap-1.png)

### 1.3

Task: Interpretation: Why do you think that people who are satisfied
with their relationship the most are seemingly less likely to get
children in the near future?

Solution: I think the effect is due to happy couples not wanting to
change any of their current situation since they are allready fulfilled.
Maybe the unhappier families simply are unhappy because they want t0
have children but do not have any yet and will be happier as soon as
they have children.

### 1.4

Task: What statistical problems do we run into?

Solution: Histogram to get an overview of data: We have the statistical
problem that most people see themselves as very happy or do not want to
answer the question. This leads to a very skewed distribution of the
data and makes it hard to find a correlation between the two variables.

![](Jannis-DW_files/figure-markdown_strict/histogram-1.png)

### 1.5

Task: Correllation between relationship satisfaction and fertility
intentions with control of age.

Answer: The correlation between sat3 and frt69 with control of age is
0.08, which is a weak positive correlation. This means that there is a
weak positive relationship between relationship satisfaction and
intention to have children in the next 3 years, even when controlling
for age.

    ##    estimate      p.value statistic    n gp  Method
    ## 1 0.1104294 1.232921e-16  8.305721 5591  1 pearson

### 1.6

Task: Correllation between relationship satisfaction and fertility
intentions with control of age, number of children and relationship
duration

    ##    estimate      p.value statistic    n gp  Method
    ## 1 0.1057409 1.774588e-14  7.687956 5232  3 pearson

### Task 2

Task: Check for differences in the perception of what a good
relationship looks like.

Answer: People in former West Germany have more conservative viewpoints
on thei relationships.
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

Task: Create a violin plot, summarizing the differences of East and West
Germany in one plot by using faceting.

    ## # A tibble: 36,725 × 203
    ## # Groups:   east [3]
    ##          id welle     pid sample  sat3  pa27   sd3  sd40  sd43  sd11 sd7e1 pstat
    ##       <dbl> <dbl>   <dbl>  <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
    ##  1   1.00e9     1  1.00e9     10    10    NA     1    NA    NA    NA    NA     1
    ##  2   1.00e9     1 NA          10    NA    NA     2    -3    NA    NA    -3     0
    ##  3   1.00e9     1  1.00e9     10    10    NA     1     1    NA    NA     2     1
    ##  4   1.00e9     1 NA          10    NA    NA     2    -3    NA    NA    -3     0
    ##  5   1.00e9     1 NA          10    NA    NA     2    NA    NA    NA    NA     0
    ##  6   1.00e9     1  1.00e9     10     7    NA     1    NA    NA    NA    NA     1
    ##  7   1.00e9     1  1.00e9     10     3    NA     1     1    NA    NA     2     1
    ##  8   1.00e9     1  1.00e9     10     8    NA     1    NA    NA    NA    NA     1
    ##  9   1.00e9     1  1.00e9     10     8    NA     1    NA    NA    NA    NA     1
    ## 10   1.00e9     1  1.00e9     10    10    NA     1     1    NA    NA     1     1
    ## # ℹ 36,715 more rows
    ## # ℹ 191 more variables: separation <dbl>, relstat <dbl>, reldur <dbl>,
    ## #   sd5ezby <dbl>, pa64 <dbl>, pa65 <dbl>, pa66 <dbl>, pa68i1 <dbl>,
    ## #   pa17i1 <dbl>, pa17i2 <dbl>, pa17i4 <dbl>, pa17i5 <dbl>, pa17i6 <dbl>,
    ## #   pa17i8 <dbl>, pa21i7 <dbl>, pa21i8 <dbl>, pa21i9 <dbl>, pa21i10 <dbl>,
    ## #   pa21i11 <dbl>, pa21i12 <dbl>, pa21i13 <dbl>, pa22ri1 <dbl>, pa22ri9 <dbl>,
    ## #   pa22ri10 <dbl>, pa22ri11 <dbl>, pa22ri12 <dbl>, pa22ri8 <dbl>, …

    ## Warning: Removed 71196 rows containing non-finite outside the scale range
    ## (`stat_ydensity()`).

![](Jannis-DW_files/figure-markdown_strict/ViolinPlot-1.png)
