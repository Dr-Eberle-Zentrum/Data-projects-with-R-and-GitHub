    ## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ## ✔ dplyr     1.1.4     ✔ readr     2.1.5
    ## ✔ forcats   1.0.1     ✔ stringr   1.5.2
    ## ✔ ggplot2   4.0.0     ✔ tibble    3.2.1
    ## ✔ lubridate 1.9.4     ✔ tidyr     1.3.1
    ## ✔ purrr     1.0.4     
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()
    ## ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

# Reading the data

    setwd(this.path::this.dir())
    daten <- read_csv2("klimadaten_tuebingen.csv")

    ## ℹ Using "','" as decimal and "'.'" as grouping mark. Use `read_delim()` for more control.

    ## Rows: 1088 Columns: 14
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ";"
    ## chr  (3): name, typ, saison
    ## dbl (11): id, jahr, temperatur_heisse_tage, temperatur_frosttage, temperatur...
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

# Wie veränderte sich die Temperatur im zeitlichen Verlauf?

![](46Cent_files/figure-markdown_strict/unnamed-chunk-2-1.png)

# Wie verändert sich die Temperatur im Jahreszeitlichen Verlauf, über den gesamten Messzeitraum?

![](46Cent_files/figure-markdown_strict/unnamed-chunk-3-1.png)

# Wie verhalten sich die Niederschlagsmengen in Kombination mit den Heißen Tagen?

![](46Cent_files/figure-markdown_strict/unnamed-chunk-4-1.png)

# Wie entwickeln sich die Heißtage und Frosttage im laufe der Zeit und Saisonal?

![](46Cent_files/figure-markdown_strict/unnamed-chunk-5-1.png)

![](46Cent_files/figure-markdown_strict/unnamed-chunk-6-1.png)

![](46Cent_files/figure-markdown_strict/unnamed-chunk-7-1.png)

# Saisonale Trenddiagramme, alle Saisons in einem Diagramm (2023)

![](46Cent_files/figure-markdown_strict/unnamed-chunk-8-1.png)

# Wie häufig treten Trockenperioden auf und wie lange dauern diese an?

![](46Cent_files/figure-markdown_strict/unnamed-chunk-9-1.png)

![](46Cent_files/figure-markdown_strict/unnamed-chunk-10-1.png)

# Gibt es einen Zusammenhang zwischen Tropennächten und Trockentagen?

Es gibt keine Tropennächte ?

# Wie häufig gab es jährlich mehr als 5 Frosttage/Heißtage im Jahr?

![](46Cent_files/figure-markdown_strict/unnamed-chunk-11-1.png)

# Hat die Anzahl an Starknierderschlägen über die Jahre zugenommen?

![](46Cent_files/figure-markdown_strict/unnamed-chunk-12-1.png)
