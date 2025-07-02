# Erasmus Mobility Study

We want to investigate the student mobility within the Erasmus+
programme, focusing on long-term study mobility of pupils. The dataset
contains information about the sending and receiving countries along
with the number of participants:

    ## # A tibble: 15 × 3
    ##    origin destination totalParticipants
    ##    <chr>  <chr>                   <dbl>
    ##  1 AT     BE                          3
    ##  2 AT     DE                          1
    ##  3 AT     EL                          2
    ##  4 AT     ES                         21
    ##  5 AT     FI                         15
    ##  6 AT     FR                         15
    ##  7 AT     IE                          5
    ##  8 AT     IT                         25
    ##  9 AT     PT                          4
    ## 10 AT     SE                          2
    ## 11 AT     UK                          7
    ## 12 BE     AT                          6
    ## 13 BE     DE                         91
    ## 14 BE     ES                         15
    ## 15 BE     FR                          5

# Visualization

## Heatmap

![](natali-mmx_files/figure-markdown_strict/heatmap-1.png)

The heatmap visualizes the intensity of student mobility between the top
5 sending and receiving countries in the Erasmus+ programme. The color
intensity indicates the number of participants, with darker shades of
representing higher mobility. The 5 countries with the highest intensity
of student exchange are:

    ## # A tibble: 5 × 2
    ##   pair    combinedParticipants
    ##   <chr>                  <dbl>
    ## 1 ES - IT                  373
    ## 2 ES - FR                  235
    ## 3 FR - IT                  102
    ## 4 BE - DE                   92
    ## 5 ES - FI                   86

## Sankey Flow Diagram

![](natali-mmx_files/figure-markdown_strict/sankeyDiagram-1.png)

## Barplot

![](natali-mmx_files/figure-markdown_strict/barplot-1.png)
