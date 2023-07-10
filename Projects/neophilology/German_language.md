    ## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ## ✔ dplyr     1.1.2     ✔ readr     2.1.4
    ## ✔ forcats   1.0.0     ✔ stringr   1.5.0
    ## ✔ ggplot2   3.4.2     ✔ tibble    3.2.1
    ## ✔ lubridate 1.9.2     ✔ tidyr     1.3.0
    ## ✔ purrr     1.0.1     
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()
    ## ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

First, the data is imported. Here, I can use a subset of data, which
only includes the speeches of one german president, Roman Herzog.

A frequency diagram and a word cloud would be sufficient to paint a
bird’s eye view of the topics discussed in the aggregated speeches

After tidying the data, to only include somewhat relevant words, a
wordcloud is created. here, the words are arranged to fit smuggly
together, while the size should reflect their frequency

    ## Lade nötiges Paket: RColorBrewer

    ## png 
    ##   2

The frequency diagram started off as a simple barplot, but while
adjusting the labels of the words, this seemed to boring, and the words
were hard to read. They still are, kind of, but now it looks *way more*
interesting.

![](German_language_files/figure-markdown_strict/unnamed-chunk-4-1.png)
