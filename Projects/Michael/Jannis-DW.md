## \# Solution for Michael’s Project “Demographic Shift in Germany”

## \## Task 1: Analysis of Reasons for the low Fertility Rate

### Task 1.1

Task: Calculate Correlation between relationship satisfaction and
intention to have children in the next 3 years.

Solution: There is a positive correlation between relationship
satisfaction and intention to have children in the next 3 years.

    ## [1] 0.1555075

    ## [1] 0.1458812

------------------------------------------------------------------------

### Task 1.2

Task: Create a Heatmap to visualize the correlation between relationship
satisfaction (sat3) and intention to have children in the next 3 years
(frt69).

## ![](Jannis-DW_files/figure-markdown_strict/HeatMap-1.png)

### Task 1.3

Task: Interpretation: Why do you think that people who are satisfied
with their relationship the most are seemingly less likely to get
children in the near future?

Solution: I think the effect is due to happy couples not wanting to
change any of their current situation since they are allready fulfilled.
Maybe the unhappier families simply are unhappy because they want t0
have children but do not have any yet and will be happier as soon as
they have children.

------------------------------------------------------------------------

### Task 1.4

Task: What statistical problems do we run into?

Solution: Histogram to get an overview of data: We have the statistical
problem that most people see themselves as very happy or do not want to
answer the question. This leads to a very skewed distribution of the
data and makes it hard to find a correlation between the two variables.

## ![](Jannis-DW_files/figure-markdown_strict/histogram-1.png)

### Task 1.5

Task: Correllation between relationship satisfaction and fertility
intentions with control of age.

Answer: The correlation between sat3 and frt69 with control of age is
0.08, which is a weak positive correlation. This means that there is a
weak positive relationship between relationship satisfaction and
intention to have children in the next 3 years, even when controlling
for age.

    ##    estimate      p.value statistic    n gp  Method
    ## 1 0.1104294 1.232921e-16  8.305721 5591  1 pearson

------------------------------------------------------------------------

### Task 1.6

Task: Correllation between relationship satisfaction and fertility
intentions with control of age, number of children and relationship
duration

    ##    estimate      p.value statistic    n gp  Method
    ## 1 0.1057409 1.774588e-14  7.687956 5232  3 pearson

------------------------------------------------------------------------

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

------------------------------------------------------------------------

### Task 2.2

Task: Create a violin plot, summarizing the differences of East and West
Germany in one plot by using faceting.

![](Jannis-DW_files/figure-markdown_strict/ViolinPlot-1.png)
