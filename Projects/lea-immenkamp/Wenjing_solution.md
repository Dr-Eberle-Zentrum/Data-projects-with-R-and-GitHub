# Topic: The impact of various deterrents on children’s consumption of sweets-from Lea

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
    ## Loading required package: Matrix
    ## 
    ## 
    ## Attaching package: 'Matrix'
    ## 
    ## 
    ## The following objects are masked from 'package:tidyr':
    ## 
    ##     expand, pack, unpack

## Load the file (btw. remove the missing values)

### quick overview of the data

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

    file.exists("data.xlsx")

    ## [1] TRUE

    Intervention_data <- read_excel("data.xlsx",  sheet = "Intervention data") %>% drop_na()
    #revise: "glimpse()" is better to preview the data.
    glimpse(Intervention_data)

    ## Rows: 119
    ## Columns: 14
    ## $ child_id     <dbl> 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 4, …
    ## $ Intervention <dbl> 1, 2, 1, 1, 2, 2, 1, 2, 1, 1, 2, 2, 2, 1, 1, 2, 1, 2, 2, …
    ## $ i1t0         <dbl> 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, …
    ## $ i2t0         <dbl> 0, 1, 0, 1, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 1, 0, 0, …
    ## $ i3t0         <dbl> 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, …
    ## $ i4t0         <dbl> 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, …
    ## $ i5t0         <dbl> 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, …
    ## $ i1           <dbl> 0, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, …
    ## $ i2           <dbl> 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 1, …
    ## $ i3           <dbl> 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 1, 0, 0, 1, 0, 1, 1, …
    ## $ i4           <dbl> 1, 0, 1, 0, 1, 1, 0, 1, 1, 0, 0, 0, 1, 0, 1, 1, 0, 1, 1, …
    ## $ i5           <dbl> 1, 0, 1, 0, 0, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, …
    ## $ Motivation   <dbl> 3, 2, 3, 3, 3, 3, 3, 4, 3, 3, 3, 3, 2, 3, 2, 2, 3, 4, 2, …
    ## $ Helpfulness  <dbl> 4, 4, 4, 4, 3, 3, 3, 4, 3, 2, 2, 3, 4, 4, 3, 3, 4, 2, 4, …

    Q_data <- read_excel("data.xlsx", sheet = "questionaire") %>% drop_na()
    glimpse(Q_data)

    ## Rows: 20
    ## Columns: 6
    ## $ `id child` <dbl> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, …
    ## $ `id age`   <dbl> 11, 8, 11, 9, 13, 12, 11, 10, 13, 11, 13, 11, 9, 10, 10, 9,…
    ## $ sweet1     <dbl> 4, 5, 5, 5, 5, 4, 5, 3, 2, 4, 4, 3, 5, 4, 3, 3, 2, 4, 3, 3
    ## $ sweet2     <dbl> 4, 3, 5, 5, 5, 4, 5, 3, 2, 4, 4, 4, 3, 5, 5, 1, 5, 2, 1, 5
    ## $ sweet3     <dbl> 3, 4, 4, 1, 5, 2, 5, 5, 4, 5, 3, 2, 4, 4, 4, 3, 5, 5, 1, 5
    ## $ sweet4     <dbl> 1, 1, 1, 5, 2, 4, 3, 5, 5, 1, 5, 2, 5, 4, 5, 3, 2, 4, 4, 3

## Data cleaning

- Calculating the total value before intervention `QIpre`
- Calculating the total value before intervention `QIpost`
- using `across()` and `c()` to select the columns in a more “tidyverse”
  style

<!-- -->

    #Intervention_data$QIpre <- rowSums(Intervention_data[,c("i1t0","i2t0","i3t0","i4t0","i5t0")])
    #Intervention_data$QIpost <- rowSums(Intervention_data[,c("i1","i2","i3","i4","i5")])
    #revise: in a more "tidyverse" style

    Intervention_data <- Intervention_data %>% mutate(QIpre=rowSums(across(c(i1t0:i5t0))),QIpost=rowSums(across(c(i1:i5))))
    glimpse(Intervention_data)

    ## Rows: 119
    ## Columns: 16
    ## $ child_id     <dbl> 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 4, …
    ## $ Intervention <dbl> 1, 2, 1, 1, 2, 2, 1, 2, 1, 1, 2, 2, 2, 1, 1, 2, 1, 2, 2, …
    ## $ i1t0         <dbl> 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, …
    ## $ i2t0         <dbl> 0, 1, 0, 1, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 1, 0, 0, …
    ## $ i3t0         <dbl> 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, …
    ## $ i4t0         <dbl> 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, …
    ## $ i5t0         <dbl> 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, …
    ## $ i1           <dbl> 0, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, …
    ## $ i2           <dbl> 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 1, …
    ## $ i3           <dbl> 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 1, 0, 0, 1, 0, 1, 1, …
    ## $ i4           <dbl> 1, 0, 1, 0, 1, 1, 0, 1, 1, 0, 0, 0, 1, 0, 1, 1, 0, 1, 1, …
    ## $ i5           <dbl> 1, 0, 1, 0, 0, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, …
    ## $ Motivation   <dbl> 3, 2, 3, 3, 3, 3, 3, 4, 3, 3, 3, 3, 2, 3, 2, 2, 3, 4, 2, …
    ## $ Helpfulness  <dbl> 4, 4, 4, 4, 3, 3, 3, 4, 3, 2, 2, 3, 4, 4, 3, 3, 4, 2, 4, …
    ## $ QIpre        <dbl> 0, 1, 2, 2, 2, 2, 2, 3, 2, 0, 1, 2, 2, 0, 2, 1, 1, 1, 2, …
    ## $ QIpost       <dbl> 4, 3, 5, 1, 4, 3, 3, 3, 5, 3, 2, 4, 5, 0, 4, 4, 3, 3, 5, …

- Calculating mean of sweet to get children’s attitude toward sweet
  consumption, and then merge it with Intervention\_data by “child\_id”
  column.

<!-- -->

    # Calculating mean of sweet
    df_withmean <- Q_data %>% 
      mutate(sweet_mean=pmap_dbl(select(.,sweet1,sweet2,sweet3,sweet4),~mean(c(...)))) %>%
      select("id child","id age",sweet_mean) %>%
      rename("child_id"="id child") %>%
      right_join(Intervention_data,by="child_id")
    df_withmean

    ## # A tibble: 119 × 18
    ##    child_id `id age` sweet_mean Intervention  i1t0  i2t0  i3t0  i4t0  i5t0    i1
    ##       <dbl>    <dbl>      <dbl>        <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
    ##  1        1       11       3               1     0     0     0     0     0     0
    ##  2        1       11       3               2     0     1     0     0     0     1
    ##  3        1       11       3               1     0     0     0     1     1     1
    ##  4        1       11       3               1     1     1     0     0     0     0
    ##  5        1       11       3               2     0     0     1     1     0     1
    ##  6        1       11       3               2     0     1     0     1     0     1
    ##  7        2        8       3.25            1     0     1     0     0     1     1
    ##  8        2        8       3.25            2     1     0     1     0     1     0
    ##  9        2        8       3.25            1     0     0     1     1     0     1
    ## 10        2        8       3.25            1     0     0     0     0     0     1
    ## # ℹ 109 more rows
    ## # ℹ 8 more variables: i2 <dbl>, i3 <dbl>, i4 <dbl>, i5 <dbl>, Motivation <dbl>,
    ## #   Helpfulness <dbl>, QIpre <dbl>, QIpost <dbl>

## Data visualization

1.  To compare the effect of two interventions, we make the plot where
    each line represents one participant, connecting their pre score to
    post score. We need two datasets:

- the individual QIpre & QIpost scores

<!-- -->

    plot_data <-df_withmean  %>% select(child_id, Intervention, QIpre,QIpost) %>%group_by(child_id, Intervention) %>%
    mutate(trial_id = row_number()) %>%
    ungroup() %>%
    mutate(pair_id = paste(child_id, Intervention, trial_id, sep = "_")) %>% pivot_longer(cols = c(QIpre,QIpost),names_to = "time",values_to = "score") %>% mutate(
        time = factor(time, 
                      levels = c("QIpre","QIpost"))
      )  
    glimpse(plot_data)

    ## Rows: 238
    ## Columns: 6
    ## $ child_id     <dbl> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, …
    ## $ Intervention <dbl> 1, 1, 2, 2, 1, 1, 1, 1, 2, 2, 2, 2, 1, 1, 2, 2, 1, 1, 1, …
    ## $ trial_id     <int> 1, 1, 1, 1, 2, 2, 3, 3, 2, 2, 3, 3, 1, 1, 1, 1, 2, 2, 3, …
    ## $ pair_id      <chr> "1_1_1", "1_1_1", "1_2_1", "1_2_1", "1_1_2", "1_1_2", "1_…
    ## $ time         <fct> QIpre, QIpost, QIpre, QIpost, QIpre, QIpost, QIpre, QIpos…
    ## $ score        <dbl> 0, 4, 1, 3, 2, 5, 2, 1, 2, 4, 2, 3, 2, 3, 3, 3, 2, 5, 0, …

    # here I keep plot_data, because i need to used it to create "summary_data". and they will be used separately in the next step.

- the mean score of all participants in each intervention group to
  present tendency

<!-- -->

    summary_data <- plot_data %>% group_by(child_id,Intervention,time) %>% summarise(mean=mean(score,na.rm=TRUE), .groups = "drop") 
    glimpse(summary_data)

    ## Rows: 80
    ## Columns: 4
    ## $ child_id     <dbl> 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, …
    ## $ Intervention <dbl> 1, 1, 2, 2, 1, 1, 2, 2, 1, 1, 2, 2, 1, 1, 2, 2, 1, 1, 2, …
    ## $ time         <fct> QIpre, QIpost, QIpre, QIpost, QIpre, QIpost, QIpre, QIpos…
    ## $ mean         <dbl> 1.333333, 3.333333, 1.666667, 3.333333, 1.333333, 3.66666…

From plot, we can conclude that there is no obvious difference between
two interventions, but the “Suger shock” intervention seems to have a
slightly better effect on reducing children’s consumption of sweets.

    ggplot() +
      geom_line(data=plot_data,alpha = 0.2, linewidth = 1.8,aes(x=time,y=score,group = pair_id)) +
      geom_point(alpha = 0.4, size = 1.2) +geom_line(data=summary_data,aes(x=time,y=mean,group=child_id,colour=factor(child_id)),linewidth=1.5)+geom_point(data=summary_data,aes(x=time,y=mean),color="red",size=2)+facet_wrap(~ Intervention,
        ncol = 2,
        labeller = labeller(Intervention = c(`1` = "Reality Check",
                                             `2` = "Sugar Shock"))
      ) +
      scale_y_continuous(breaks = 0:5, limits = c(0, 5)) +scale_color_viridis_d()+
      labs(x = "Intervention type", y = "Behavioral Indicator",legend="Child Id") +
      theme_minimal(base_size = 13) +
      theme(
        strip.text = element_text(hjust = 0.5, face = "bold"),
        legend.position = "bottom"
      )

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

    model_lmer <- lmer(QIpost ~ Intervention * Motivation + QIpre + (1 | child_id), data = df_withmean)
    summary(model_lmer)

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

    model <- lm(QIpost ~ Intervention * Motivation + QIpre, data = df_withmean) 
    summary(model)

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

    #use a linear plot with the motivation on the x-Axis, QIpost quality on the y-axis and one line (colour) for each Intervention #type. It should look like an interaction plot in the end


    model %>% plotmod(x=Motivation,w=Intervention)+labs(y="QIpost quality",title="Motivation effect")

![](Wenjing_solution_files/figure-markdown_strict/plot_data_sencond_plot-1.png)
Conclusion: The interaction between intervention type and motivation was
not significant ( p = 0.341), suggesting that motivation did not
significantly moderate the relationship between intervention and QIpost.
