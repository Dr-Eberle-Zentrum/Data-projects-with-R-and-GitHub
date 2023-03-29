## OCEAN

## Creating a new Dataset for the Graph

    df1 <- 
    df %>%
        filter(country %in% c("US", "GB", "IN", "AU", "BR")) %>%
        select(-race,-age,-engnat,-gender,-hand,-source) %>%
        group_by(country) %>%
        summarise(      
          O = mean(mean(c_across(O1:O10))), 
          C = mean(mean(c_across(C1:C10))), 
          E = mean(mean(c_across(E1:E10))), 
          A = mean(mean(c_across(A1:A10))), 
          N = mean(mean(c_across(N1:N10)))
          ) %>%
        pivot_longer(cols = 2:6, names_to = "OCEAN")

    print(df1)

    ## # A tibble: 25 × 3
    ##    country OCEAN value
    ##    <chr>   <chr> <dbl>
    ##  1 AU      O      3.34
    ##  2 AU      C      3.10
    ##  3 AU      E      3.05
    ##  4 AU      A      3.20
    ##  5 AU      N      3.09
    ##  6 BR      O      3.41
    ##  7 BR      C      3.23
    ##  8 BR      E      3.00
    ##  9 BR      A      3.11
    ## 10 BR      N      3.35
    ## # … with 15 more rows

## Final Graph

    plot_grid(p_dodged_bars,p_letter, labels = c('A', 'B'))

![](elizavetashch_files/figure-markdown_strict/unnamed-chunk-4-1.png)
