## General project topic

Companies often discover unique patterns when organizing and visualizing
consumer data. This project aims to visualize shopping trends of
American consumers by age group and gender, focusing on their Purchase
Amount and Frequency of Purchases. You need to create four separate
graphs:

1.  Female consumers’ purchase amount by age group,
2.  Male consumers’ purchase amount by age group,
3.  Female consumers’ frequency of purchases by age group,
4.  Male consumers’ frequency of purchases by age group.

## The Data Set (processed)

    ## # A tibble: 6 × 7
    ## # Groups:   AgeGroup, Gender [4]
    ##   Customer.ID   Age Gender Purchase.Amount..USD. Frequency.of.Purchases
    ##         <int> <int> <fct>                  <int> <chr>                 
    ## 1           1    55 Male                      53 Fortnightly           
    ## 2           2    19 Male                      64 Fortnightly           
    ## 3           3    50 Male                      73 Weekly                
    ## 4           4    21 Male                      90 Weekly                
    ## 5           5    45 Male                      49 Annually              
    ## 6           6    46 Male                      20 Weekly                
    ## # ℹ 2 more variables: `Frequency [1/year]` <dbl>, AgeGroup <fct>

## Visualisation

![](ManuDoerrich_files/figure-markdown_strict/visualisation%20(All_in_one)-1.png)
