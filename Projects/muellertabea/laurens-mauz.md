I first tried to make a simple scatterplot for the total mean radius of
the three measurements of each Taxa.

    data %>%
      dplyr::filter(Radius_number == 1) %>%
      dplyr::filter(Taxa == "Populus" | Taxa == "Indet" | Taxa == "Salix") %>%
      ggplot(aes(x=Taxa, y=Radius_tot_mean, color=Radius_tot_mean)) +
        geom_point() +
        geom_jitter() +
        scale_color_gradient(low="blue", high="red") +
        labs(title="Mean Radius of all Measurements",
              x="Taxa",
              y="Total mean Radius",
             color="Mean total Radius") +
        theme_bw() + 
        theme(panel.border = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"))

![](laurens-mauz_files/figure-markdown_strict/ex1-1.png) I remembered
that Martin advised Nico to make Violin plots, so I did as well. I think
with violin plots the distribution of the data is a little bit easier to
see.

    data %>%
      dplyr::filter(Radius_number == 1) %>%
      dplyr::filter(Taxa == "Populus" | Taxa == "Indet") %>%
      ggplot(aes(x=Taxa, y=Radius_tot_mean, color=Radius_tot_mean)) +
        geom_violin() +
        geom_point() +
        geom_jitter() +
        scale_color_gradient(low="blue", high="red") +
        labs(title="Mean Radius of all Measurements",
              x="Taxa",
              y="Total mean Radius") +
        theme_bw() + 
        theme(panel.border = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"))

    ## Warning: The following aesthetics were dropped during statistical transformation: colour
    ## ℹ This can happen when ggplot fails to infer the correct grouping structure in
    ##   the data.
    ## ℹ Did you forget to specify a `group` aesthetic or to convert a numerical
    ##   variable into a factor?

![](laurens-mauz_files/figure-markdown_strict/ex1%20violin-1.png)

Here I make a Barplot for the number of tree rings. I was not sure why
there were rows in the data with the same ID but different values for
Standard deviation etc.

    data %>%
      select(Radius_number, Taxa) %>%
      dplyr::filter(Taxa == "Populus" | Taxa == "Indet" | Taxa == "Salix") %>%
      drop_na() %>%
      group_by(Radius_number) %>%
      count() %>%
      mutate(Radius_number = as.factor(Radius_number)) %>%
      ggplot(aes(x=Radius_number, y=n)) +
        geom_bar(stat="identity") +
        labs(title="Number of Tree-rings",
             x="Number of Rings",
             y="Amount of Trees") +
        theme_bw() + 
        theme(panel.border = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"))

![](laurens-mauz_files/figure-markdown_strict/ex2-1.png) I made the
scatterfplot of mean radius against the standard deviation of the mean
radius and added a linear approximation of the data for INdet and
Populus.

    data %>%
      select(Radius_tot_mean, Radius_tot_sd, Radius_number, Taxa) %>%
      dplyr::filter(Radius_number == 1) %>%
      dplyr::filter(Taxa == "Populus" | Taxa == "Indet") %>%
      mutate(Radius_tot_sd = as.numeric(Radius_tot_sd)) %>% 
      drop_na() %>%
      ggplot(aes(x=Radius_tot_mean, y=Radius_tot_sd, color=Taxa)) +
        geom_point() +
        stat_smooth(method="lm") +
        labs(title="Correlation between Mean Radius and Standard Deviation of Mean Radius",
             x="Mean Radius of all Measurements",
             y="Standard Deviation of Radius") +
             theme_bw() + 
             theme(panel.border = element_blank(), panel.grid.major = element_blank(),
              panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"))

    ## Warning: There was 1 warning in `mutate()`.
    ## ℹ In argument: `Radius_tot_sd = as.numeric(Radius_tot_sd)`.
    ## Caused by warning:
    ## ! NAs introduced by coercion

    ## `geom_smooth()` using formula = 'y ~ x'

![](laurens-mauz_files/figure-markdown_strict/ex3-1.png) I wanted to see
how good the linear regression fits the data. You can see that R squared
for Populus is ca. 0,7 and for Indet it is ca. 0,35. The linear model
seems to fit the Populs Taxa a lot better

    lm_data_pop <- data %>%
      select(Radius_tot_mean, Radius_tot_sd, Radius_number, Taxa) %>%
      dplyr::filter(Radius_number == 1) %>%
      dplyr::filter(Taxa == "Populus") %>%
      mutate(Radius_tot_sd = as.numeric(Radius_tot_sd)) %>% 
      drop_na() 

    lm_data_indet <- data %>%
      select(Radius_tot_mean, Radius_tot_sd, Radius_number, Taxa) %>%
      dplyr::filter(Radius_number == 1) %>%
      dplyr::filter(Taxa == "Indet") %>%
      mutate(Radius_tot_sd = as.numeric(Radius_tot_sd)) %>% 
      drop_na() 

    ## Warning: There was 1 warning in `mutate()`.
    ## ℹ In argument: `Radius_tot_sd = as.numeric(Radius_tot_sd)`.
    ## Caused by warning:
    ## ! NAs introduced by coercion

    lm_std_radius_indet <- lm(Radius_tot_mean~Radius_tot_sd, data = lm_data_indet) #Create the linear regression
    summary(lm_std_radius_indet)

    ## 
    ## Call:
    ## lm(formula = Radius_tot_mean ~ Radius_tot_sd, data = lm_data_indet)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -87.580 -10.925  -4.340   6.625  95.145 
    ## 
    ## Coefficients:
    ##               Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)     23.095      3.163   7.301 1.10e-09 ***
    ## Radius_tot_sd    8.561      1.578   5.425 1.28e-06 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 21.97 on 56 degrees of freedom
    ## Multiple R-squared:  0.3445, Adjusted R-squared:  0.3328 
    ## F-statistic: 29.44 on 1 and 56 DF,  p-value: 1.281e-06

    lm_std_radius_pop <- lm(Radius_tot_mean~Radius_tot_sd, data = lm_data_pop)

    summary(lm_std_radius_pop)

    ## 
    ## Call:
    ## lm(formula = Radius_tot_mean ~ Radius_tot_sd, data = lm_data_pop)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -39.425  -7.557  -2.322   4.604  69.421 
    ## 
    ## Coefficients:
    ##               Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)     15.406      1.510   10.20   <2e-16 ***
    ## Radius_tot_sd   31.279      1.968   15.89   <2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 13.69 on 109 degrees of freedom
    ## Multiple R-squared:  0.6985, Adjusted R-squared:  0.6958 
    ## F-statistic: 252.6 on 1 and 109 DF,  p-value: < 2.2e-16
