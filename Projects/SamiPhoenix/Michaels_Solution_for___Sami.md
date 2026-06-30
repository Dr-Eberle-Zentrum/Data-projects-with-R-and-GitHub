# Data Import and Preparation

    ## # A tibble: 6 × 16
    ##   Name     EX    EW `Subtotal (EX+EW)` `CR(PE)` `CR(PEW)` Subtotal (EX+EW+ CR(…¹
    ##   <chr> <dbl> <dbl>              <dbl>    <dbl>     <dbl>                  <dbl>
    ## 1 ACTI…    90    11                101      143         8                    252
    ## 2 AMPH…    37     2                 39      187         1                    227
    ## 3 ANTH…     0     0                  0        2         0                      2
    ## 4 ARAC…     9     0                  9       27         0                     36
    ## 5 ASTE…     0     0                  0        0         0                      0
    ## 6 AVES    164     5                169       18         2                    189
    ## # ℹ abbreviated name: ¹​`Subtotal (EX+EW+ CR(PE)+CR(PEW))`
    ## # ℹ 9 more variables: CR <dbl>, EN <dbl>, VU <dbl>,
    ## #   `Subtotal (threatened spp.)` <dbl>, `LR/cd` <dbl>, `NT or LR/nt` <dbl>,
    ## #   `LC or LR/lc` <dbl>, DD <dbl>, Total <dbl>

## Add Kingdom Information

## Data Cleaning

## Percentage Table

    ## # A tibble: 6 × 13
    ##   Name           `Extinct [%]` `Extinct_Wild [%]` `Extinct_Subtotal [%]`
    ##   <chr>                  <dbl>              <dbl>                  <dbl>
    ## 1 ACTINOPTERYGII         0.325             0.0397                  0.364
    ## 2 AMPHIBIA               0.460             0.0248                  0.484
    ## 3 ANTHOZOA               0                 0                       0    
    ## 4 ARACHNIDA              0.855             0                       0.855
    ## 5 ASTEROIDEA             0                 0                       0    
    ## 6 AVES                   1.47              0.0447                  1.51 
    ## # ℹ 9 more variables: `Critically_Endangered [%]` <dbl>,
    ## #   `Endangered [%]` <dbl>, `Vulnerable [%]` <dbl>,
    ## #   `Threatened_Subtotal [%]` <dbl>, `Least_Concern [%]` <dbl>,
    ## #   `Data_Deficient [%]` <dbl>, Total <dbl>, Kingdom <chr>,
    ## #   `Near Threatened [%]` <dbl>

## Kingdom Plot

![](Michaels_Solution_for___Sami_files/figure-markdown_strict/kingdom_plot-1.png)

## Class Plot

![](Michaels_Solution_for___Sami_files/figure-markdown_strict/class_plot-1.png)
