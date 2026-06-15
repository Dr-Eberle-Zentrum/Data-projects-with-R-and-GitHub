    library(tidyverse)

    ## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ## ✔ dplyr     1.1.4     ✔ readr     2.1.5
    ## ✔ forcats   1.0.1     ✔ stringr   1.5.2
    ## ✔ ggplot2   4.0.0     ✔ tibble    3.3.0
    ## ✔ lubridate 1.9.4     ✔ tidyr     1.3.1
    ## ✔ purrr     1.1.0     
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()
    ## ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

    library(dplyr)
    library(knitr)
    library(ggplot2)
    library(stringr)
    library(tidyr)

    freda<-read_csv("FReDA_panel_4waves_long_labeled.csv")

    ## Rows: 107921 Columns: 203
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## dbl (203): id, welle, pid, sample, sat3, pa27, sd3, sd40, sd43, sd11, sd7e1,...
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

    freda_2 <- freda%>%mutate(across(c(sat3,frt68,frt69,age,nkids,reldur),~replace(.x, .x<0, NA)))

### 1.1. What is the correlation between satisfaction with relationship with the general intention to get children and the correlation between satisfaction with relationship with the more specific intention to get children (in the next 3 years).

Answer: The correlations are both positive but also quite small. People
with higher satisfaction with relationship has slightly stronger general
intention to get children, and also people with higher satisfaction with
relationship has slightly stronger specific intention to get children
within the next 3 years. However, the correlations are weak.

    cor(freda_2$sat3, freda_2$frt68,use="complete.obs")

    ## [1] 0.1555075

    #0.1555075
    cor(freda_2$sat3, freda_2$frt69,use="complete.obs")

    ## [1] 0.1458812

    #0.1458812

### 1.2. Plot a heat map! On the x-axis: sat3. On the y-axis frt69. I want to see how much percent of people are in each box which displays the relative frequency of people with a specific combination of relationship satisfaction and intention to get children in the next 3 years.

    heatmap_data<- freda_2%>%drop_na(sat3,frt69)%>%group_by(sat3,frt69)%>%summarise(count=n())%>%mutate(percentage=count/sum(count))

    ## `summarise()` has grouped output by 'sat3'. You can override using the
    ## `.groups` argument.

    ggplot(heatmap_data, aes(x=sat3,y=frt69,fill=percentage))+geom_tile()+scale_fill_gradient(low="white",high="red")+labs(x="Satisfaction with Relationship(sat3)", y="Intention to Get Children in the Next 3 Years (frt69)", fill="Percentage")+theme_minimal()

![](Solution-for-Michael-s-project_files/figure-markdown_strict/heatmap-1.png)

    ggsave("heatmap.png")

    ## Saving 7 x 5 in image

### 1.3. Why do you think that people who are satisfied with their relationship the most are seemingly less likely to get children in the near future?

Answer: They are already happy with their relationship and do not feel
the need to have children to make it more fulfilling. Instead, they
would rather focus on their relationship with each other.

### 1.4. What statistical problems do we run into? (Hint: Look at the distribution in the variable sat3. How many percent are unsatisfied or very unsatisfied?)

Answer: Only 3.97% of the respondents are unsatisfied or very
unsatisfied with their relationship, while about 50.67% answered that
they are very satisfied with their relationship. Therefore, the
distribution of sat3 is strongly focused toward high satisfaction of the
relationship. This can cause a statistical problem because the
correlations for low satisfaction group may be unstable and less
reliable.

    #Unsatisfied or very unsatisfied: sat3<=4
    mean(freda_2$sat3<=4, na.rm=TRUE)*100

    ## [1] 3.966446

    #Very satisfied: sat3>=9
    mean(freda_2$sat3>=9, na.rm=TRUE)*100

    ## [1] 50.6674

### 1.5. See if age is affecting the correlation between relationship satisfaction and fertility intentions (use it as a control variable)

Answer: After controlling for age, the correlation between relationship
satisfaction and general fertility intention went down to 0.101 from
0.156. Also for the correlation between relationship satisfaction and
fertility intention in the next 3 years went down to 0.110 from 0.146.
This means that age variable does effect the correlation between
relationship satisfaction and fertility intentions. However, correlation
still remain positive after controlling for age as well.

    library(ppcor)

    ## Warning: package 'ppcor' was built under R version 4.5.3

    ## Loading required package: MASS

    ## 
    ## Attaching package: 'MASS'

    ## The following object is masked from 'package:dplyr':
    ## 
    ##     select

    data_frt68<-freda_2%>%drop_na(sat3, frt68, age)
    pcor.test(data_frt68$sat3, data_frt68$frt68, data_frt68$age)

    ##    estimate      p.value statistic    n gp  Method
    ## 1 0.1013064 2.224251e-06  4.744678 2174  1 pearson

    data_frt69<-freda_2%>%drop_na(sat3, frt69, age)
    pcor.test(data_frt69$sat3, data_frt69$frt69, data_frt69$age)

    ##    estimate      p.value statistic    n gp  Method
    ## 1 0.1104294 1.232921e-16  8.305721 5591  1 pearson

### 1.6. Now we can add number of children (nkids) and relationship duration (reldur) as control variables. What happens to the correlation between relationship satisfaction and fertility intentions when we introduce these variables into our model?

Answer: After controlling for the number of kids and the relationship
duration, the correlation between relationship satisfaction and general
fertility intention went down to 0.105 from 0.156. Also for the
correlation between relationship satisfaction and fertility intention in
the next 3 years went down to 0.112 from 0.146. This means that number
of kids and the relationship duration do effect the correlation between
relationship satisfaction and fertility intentions. However, correlation
still remain positive after the controlling as well.

    data_68<-freda_2%>%drop_na(sat3, frt68, nkids, reldur)
    pcor.test(data_68$sat3, data_68$frt68, data_68[,c("nkids","reldur")])

    ##    estimate      p.value statistic    n gp  Method
    ## 1 0.1050705 1.822039e-06   4.78608 2056  2 pearson

    data_69<-freda_2%>%drop_na(sat3, frt69, nkids, reldur)
    pcor.test(data_69$sat3, data_69$frt69, data_69[,c("nkids","reldur")])

    ##    estimate      p.value statistic    n gp  Method
    ## 1 0.1123691 3.607635e-16  8.177408 5233  2 pearson

### 1.7. significance: Are the correlations between relationship satisfaction and fertility intentions significant? (Hint: Look at the p-value of the correlation coefficient). What is the 95% confidence interval of the correlation coefficient? What does it mean?

Answer:

\[frt68\] p-value:0.000000000000304 p&lt;.001 95 percent confidence
interval: 0.1142237, 0.1962550

p-value is &lt;.001, meaning the correlations are statistically
significant. However, there is a 95% probability that the true
correlation lies between 0.114 and 0.196. This means the correlation is
valid, but the assosiation is relatively weak.

\[frt69\] p-value:0.00000000000000022 p&lt;.001 95 percent confidence
interval: 0.1201297, 0.1714366

p-value is &lt;.001, meaning the correlations are statistically
significant. However, there is a 95% probability that the true
correlation lies between 0.120 and 0.171. This means the correlation is
valid, but the assosiation is relatively weak.

    cor.test(freda_2$sat3, freda_2$frt68,use = "complete.obs")

    ## 
    ##  Pearson's product-moment correlation
    ## 
    ## data:  freda_2$sat3 and freda_2$frt68
    ## t = 7.3383, df = 2173, p-value = 3.04e-13
    ## alternative hypothesis: true correlation is not equal to 0
    ## 95 percent confidence interval:
    ##  0.1142237 0.1962550
    ## sample estimates:
    ##       cor 
    ## 0.1555075

    cor.test(freda_2$sat3, freda_2$frt69,use="complete.obs")

    ## 
    ##  Pearson's product-moment correlation
    ## 
    ## data:  freda_2$sat3 and freda_2$frt69
    ## t = 11.025, df = 5590, p-value < 2.2e-16
    ## alternative hypothesis: true correlation is not equal to 0
    ## 95 percent confidence interval:
    ##  0.1201297 0.1714366
    ## sample estimates:
    ##       cor 
    ## 0.1458812

### 2.1. Which region has more conservative viewpoints regarding the role a mother should play in the family? Which region has more egalitarian viewpoints?

Answer:The average score for the statement that “Womesn should take care
of the family more than their career.” was approximately 2.33 in West
Germany and 2.14 in East Germany. For the statement that “A child under
the age of 6 is suffering, if the mother works.”, the average score was
approximately 2.32 in West Germany and 1.85 in East Germany. As higher
values means stronger agreement with conservative viewpoints, West
Germany has more conservative viewpoints while East Germany appears to
be more egalitatrian.

    freda_3<-freda%>%mutate(across(c(val1i3, val1i5, east),~replace(.x, .x<0, NA)))

    freda_3<-freda_3%>%mutate(east=case_when(east==1~"East Germany", east==0 ~ "West Germany"))

    freda_3%>%group_by(east)%>%summarise(mean_val1i3=mean(val1i3, na.rm=TRUE),mean_val1i5=mean(val1i5, na.rm=TRUE))

    ## # A tibble: 3 × 3
    ##   east         mean_val1i3 mean_val1i5
    ##   <chr>              <dbl>       <dbl>
    ## 1 East Germany        2.14        1.85
    ## 2 West Germany        2.33        2.32
    ## 3 <NA>                1.78        2.07

### 2.2. Do a violine plot for visualization! It should visualize the regional differences between East and West Germany according to these different values on the role of woman in families. Think for yourself what kind of graph would suit best to visualize this. Also both plots should be visualized in one graph via faceting. So you can easily compare the regional differences between the two different viewpoints on the role of a mother in a family.

    plot_data<-freda_3%>%drop_na(val1i3, val1i5, east)%>%pivot_longer(cols=c(val1i3, val1i5), names_to="statement", values_to="response")

    ggplot(plot_data, aes(x=east, y=response, fill=east))+geom_violin(trim=FALSE) +facet_wrap(~statement)+labs(x="Region", y="Response", fill="Region")+theme_minimal()

![](Solution-for-Michael-s-project_files/figure-markdown_strict/violin%20plot-1.png)

    ggsave("violinplot.png")

    ## Saving 7 x 5 in image
