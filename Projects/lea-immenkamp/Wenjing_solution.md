# Topic: The impact of various deterrents on children’s consumption of sweets–From Lea

## Load the file (btw. remove the missing values)

### Get Quick Overview of the data

1.The file consists of two sheets: “Intervention data” and
“questionaire”.

2.Each child was assigned to one of **two interventions**: “Reality
Check” or “Sugar Shock”.(in dataset we use “1” for “Reality Check” and
“2” for “Sugar Shock”).

3.Each type experiment was conducted in **three rounds**, with a pre-
and post-intervention measurement of the child’s consumption of sweets.
The pre-intervention measurement is represented by the columns “i1t0” to
“i5t0”, while the post-intervention measurement is represented by the
columns “i1” to “i5”.

    ## [1] TRUE

    ## # A tibble: 6 × 14
    ##   child_id Intervention  i1t0  i2t0  i3t0  i4t0  i5t0    i1    i2    i3    i4
    ##      <dbl>        <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
    ## 1        1            1     0     0     0     0     0     0     1     1     1
    ## 2        1            2     0     1     0     0     0     1     1     1     0
    ## 3        1            1     0     0     0     1     1     1     1     1     1
    ## 4        1            1     1     1     0     0     0     0     1     0     0
    ## 5        1            2     0     0     1     1     0     1     1     1     1
    ## 6        1            2     0     1     0     1     0     1     1     0     1
    ## # ℹ 3 more variables: i5 <dbl>, Motivation <dbl>, Helpfulness <dbl>

    ## # A tibble: 6 × 6
    ##   `id child` `id age` sweet1 sweet2 sweet3 sweet4
    ##        <dbl>    <dbl>  <dbl>  <dbl>  <dbl>  <dbl>
    ## 1          1       11      4      4      3      1
    ## 2          2        8      5      3      4      1
    ## 3          3       11      5      5      4      1
    ## 4          4        9      5      5      1      5
    ## 5          5       13      5      5      5      2
    ## 6          6       12      4      4      2      4

## Data cleaning

- Calculating the total value before intervention `QIpre`
- Calculating the total value before intervention `QIpost`
- using `across()` and `c()` to select the columns in a more “tidyverse”
  style

<!-- -->

    ## # A tibble: 6 × 16
    ##   child_id Intervention  i1t0  i2t0  i3t0  i4t0  i5t0    i1    i2    i3    i4
    ##      <dbl>        <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
    ## 1        1            1     0     0     0     0     0     0     1     1     1
    ## 2        1            2     0     1     0     0     0     1     1     1     0
    ## 3        1            1     0     0     0     1     1     1     1     1     1
    ## 4        1            1     1     1     0     0     0     0     1     0     0
    ## 5        1            2     0     0     1     1     0     1     1     1     1
    ## 6        1            2     0     1     0     1     0     1     1     0     1
    ## # ℹ 5 more variables: i5 <dbl>, Motivation <dbl>, Helpfulness <dbl>,
    ## #   QIpre <dbl>, QIpost <dbl>

- Calculating mean of sweet to get children’s attitude toward sweet
  consumption, and then merge it with Intervention\_data by “child\_id”
  column.

<!-- -->

    ## # A tibble: 6 × 18
    ##   child_id `id age` sweet_mean Intervention  i1t0  i2t0  i3t0  i4t0  i5t0    i1
    ##      <dbl>    <dbl>      <dbl>        <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
    ## 1        1       11          3            1     0     0     0     0     0     0
    ## 2        1       11          3            2     0     1     0     0     0     1
    ## 3        1       11          3            1     0     0     0     1     1     1
    ## 4        1       11          3            1     1     1     0     0     0     0
    ## 5        1       11          3            2     0     0     1     1     0     1
    ## 6        1       11          3            2     0     1     0     1     0     1
    ## # ℹ 8 more variables: i2 <dbl>, i3 <dbl>, i4 <dbl>, i5 <dbl>, Motivation <dbl>,
    ## #   Helpfulness <dbl>, QIpre <dbl>, QIpost <dbl>

## Data visualization

1.  To compare the effect of two interventions, we make the plot where
    each line represents one participant, connecting their pre score to
    post score. We need two datasets:

- the individual QIpre & QIpost scores

<!-- -->

    ## # A tibble: 6 × 6
    ##   child_id Intervention trial_id pair_id time   score
    ##      <dbl>        <dbl>    <int> <chr>   <fct>  <dbl>
    ## 1        1            1        1 1_1_1   QIpre      0
    ## 2        1            1        1 1_1_1   QIpost     4
    ## 3        1            2        1 1_2_1   QIpre      1
    ## 4        1            2        1 1_2_1   QIpost     3
    ## 5        1            1        2 1_1_2   QIpre      2
    ## 6        1            1        2 1_1_2   QIpost     5

- the mean score of all participants in each intervention group to
  present tendency

<!-- -->

    ## # A tibble: 6 × 4
    ##   child_id Intervention time    mean
    ##      <dbl>        <dbl> <fct>  <dbl>
    ## 1        1            1 QIpre   1.33
    ## 2        1            1 QIpost  3.33
    ## 3        1            2 QIpre   1.67
    ## 4        1            2 QIpost  3.33
    ## 5        2            1 QIpre   1.33
    ## 6        2            1 QIpost  3.67

From plot, we can conclude that there is no obvious difference between
two interventions, but the “Suger shock” intervention seems to have a
slightly better effect on reducing children’s consumption of sweets.
![](Wenjing_solution_files/figure-markdown_strict/Data_Visualization-1.png)
2. We need to make a plot to explore whether **motivation** moderates
the relationship between the **intervention** and the QIpost in quality
(for each type) and control for the initial QIpre.

We should use
`model2 <- lmer(QIpost ~ intervention_type * motivaton + QIpre, data = data)`.
Because

`lmer() function` is used to fit linear mixed-effects models, which are
useful when you have data that is grouped or clustered, such as
**repeated measurements on the same subjects**. In this case, we have
repeated measurements of QIpost for each child, and we want to account
for the variability between children.

The random intercept variance was near 0 which indicates minimal between
participants variablity after controlling baseline quality.

    ## Linear mixed model fit by REML ['lmerMod']
    ## Formula: QIpost ~ Intervention * Motivation + QIpre + (1 | child_id)
    ##    Data: df_withmean
    ## 
    ## REML criterion at convergence: 391.9
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -3.1694 -0.5469 -0.0095  0.7108  1.8329 
    ## 
    ## Random effects:
    ##  Groups   Name        Variance Std.Dev.
    ##  child_id (Intercept) 0.000    0.000   
    ##  Residual             1.528    1.236   
    ## Number of obs: 119, groups:  child_id, 20
    ## 
    ## Fixed effects:
    ##                         Estimate Std. Error t value
    ## (Intercept)              3.94291    1.69237   2.330
    ## Intervention            -0.67304    1.05102  -0.640
    ## Motivation              -0.47114    0.56284  -0.837
    ## QIpre                    0.22875    0.08319   2.750
    ## Intervention:Motivation  0.33717    0.35259   0.956
    ## 
    ## Correlation of Fixed Effects:
    ##             (Intr) Intrvn Motvtn QIpre 
    ## Interventin -0.947                     
    ## Motivation  -0.974  0.926              
    ## QIpre       -0.208  0.124  0.124       
    ## Intrvntn:Mt  0.927 -0.976 -0.950 -0.119
    ## optimizer (nloptwrap) convergence code: 0 (OK)
    ## boundary (singular) fit: see help('isSingular')

    ## 
    ## Call:
    ## lm(formula = QIpost ~ Intervention * Motivation + QIpre, data = df_withmean)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -3.9182 -0.6761 -0.0117  0.8788  2.2660 
    ## 
    ## Coefficients:
    ##                         Estimate Std. Error t value Pr(>|t|)   
    ## (Intercept)              3.94291    1.69237   2.330  0.02158 * 
    ## Intervention            -0.67304    1.05102  -0.640  0.52322   
    ## Motivation              -0.47114    0.56284  -0.837  0.40431   
    ## QIpre                    0.22875    0.08319   2.750  0.00694 **
    ## Intervention:Motivation  0.33717    0.35259   0.956  0.34096   
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 1.236 on 114 degrees of freedom
    ## Multiple R-squared:  0.08693,    Adjusted R-squared:  0.0549 
    ## F-statistic: 2.713 on 4 and 114 DF,  p-value: 0.03339

![](Wenjing_solution_files/figure-markdown_strict/plot_data_sencond_plot-1.png)
Conclusion: The interaction between intervention type and motivation was
not significant ( p = 0.341), suggesting that motivation did not
significantly moderate the relationship between intervention and QIpost.
