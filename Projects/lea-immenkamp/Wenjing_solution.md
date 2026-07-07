## Load the file

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

- Calculating the total value before intervention
- Calculating the total value before intervention

<!-- -->

    #Intervention_data$QIpre <- rowSums(Intervention_data[,c("i1t0","i2t0","i3t0","i4t0","i5t0")])
    #Intervention_data$QIpost <- rowSums(Intervention_data[,c("i1","i2","i3","i4","i5")])
    #revise: in a more "tidyverse" style

    Intervention_data <- Intervention_data %>% mutate(QIpre=rowSums(across(c(i1t0:i5t0))),QIpost=rowSums(across(c(i1:i5))))

- Calculating mean of sweet

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

    # plotdata_1

    # "0" presents "pre"; "1" prsents "0" 
    plot_data <-df_withmean  %>% select(child_id, Intervention, QIpre,QIpost) %>%group_by(child_id, Intervention) %>%
    mutate(trial_id = row_number()) %>%
    ungroup() %>%
    mutate(pair_id = paste(child_id, Intervention, trial_id, sep = "_")) %>% pivot_longer(cols = c(QIpre,QIpost),names_to = "time",values_to = "score") %>% mutate(
        time = factor(time, 
                      levels = c("QIpre","QIpost"),
                      labels = c(0, 1))
      )  

       
      
    plot_data

    ## # A tibble: 238 × 6
    ##    child_id Intervention trial_id pair_id time  score
    ##       <dbl>        <dbl>    <int> <chr>   <fct> <dbl>
    ##  1        1            1        1 1_1_1   0         0
    ##  2        1            1        1 1_1_1   1         4
    ##  3        1            2        1 1_2_1   0         1
    ##  4        1            2        1 1_2_1   1         3
    ##  5        1            1        2 1_1_2   0         2
    ##  6        1            1        2 1_1_2   1         5
    ##  7        1            1        3 1_1_3   0         2
    ##  8        1            1        3 1_1_3   1         1
    ##  9        1            2        2 1_2_2   0         2
    ## 10        1            2        2 1_2_2   1         4
    ## # ℹ 228 more rows

    summary_data <- plot_data %>% group_by(child_id,Intervention,time) %>% summarise(mean=mean(score,na.rm=TRUE), .groups = "drop") 
    summary_data

    ## # A tibble: 80 × 4
    ##    child_id Intervention time   mean
    ##       <dbl>        <dbl> <fct> <dbl>
    ##  1        1            1 0      1.33
    ##  2        1            1 1      3.33
    ##  3        1            2 0      1.67
    ##  4        1            2 1      3.33
    ##  5        2            1 0      1.33
    ##  6        2            1 1      3.67
    ##  7        2            2 0      2   
    ##  8        2            2 1      3   
    ##  9        3            1 0      1   
    ## 10        3            1 1      2.33
    ## # ℹ 70 more rows

    ggplot() +
      geom_line(data=plot_data,alpha = 0.2, linewidth = 1.8,aes(x=time,y=score,group = pair_id)) +
      geom_point(alpha = 0.4, size = 1.2) +geom_line(data=summary_data,aes(x=time,y=mean,group=child_id),colour="red",linewidth=1.5)+geom_point(data=summary_data,aes(x=time,y=mean),color="red",size=2)+facet_wrap(~ Intervention,
        ncol = 2,
        labeller = labeller(Intervention = c(`1` = "Reality Check",
                                             `2` = "Sugar Shock"))
      ) +
      scale_y_continuous(breaks = 0:5, limits = c(0, 5)) +scale_color_viridis_d()+
      labs(x = "Intervention type", y = "Behavioral Indicator") +
      theme_minimal(base_size = 13) +
      theme(
        strip.text = element_text(hjust = 0.5, face = "bold"),
        legend.position = "none"
      )

![](Wenjing_solution_files/figure-markdown_strict/Data_Visualization-1.png)

    #lm(QIpost ~ Intervention * Motivation + QIpre+（1｜child_id), data = df) because the random intercept variance was near 0 which indicates minimal between participants variablity after controlling baseline quality. so i changed it to `lm()`function

    model <- lm(QIpost ~ Intervention * Motivation + QIpre, data = df_withmean) 
    model %>% summary()

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
