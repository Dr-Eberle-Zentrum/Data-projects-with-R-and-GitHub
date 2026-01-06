    library(tidyverse)

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

    library(this.path)

# Reading the data

    setwd(this.path::this.dir())
    daten <- read_delim("klimadaten_tuebingen.csv", delim = ";")

    ## Rows: 1088 Columns: 14
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ";"
    ## chr (4): name, typ, saison, temperatur_mittelwert
    ## dbl (9): id, jahr, temperatur_heisse_tage, temperatur_frosttage, temperatur_...
    ## num (1): niederschlag_summe
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

    # Fixing the average temp. column
    daten <- daten %>% 
      mutate(
        temperatur_mittelwert = gsub(",", ".", temperatur_mittelwert),
        temperatur_mittelwert = as.numeric(temperatur_mittelwert)
      )

# Wie veränderte sich die Temperatur im zeitlichen Verlauf?

    daten %>%
      filter(saison == "kalenderjahr") %>% 
      ggplot(
        aes(x = jahr, y = temperatur_mittelwert)
      )+
      geom_line(linewidth = 1)+
      labs(
        y = "Mittelwert (C°)",
        x = "Jahr",
        title = "Temperatur über die Jahre"
      )

![](46Cent_files/figure-markdown_strict/unnamed-chunk-2-1.png)

# Wie verändert sich die Temperatur im Jahreszeitlichen Verlauf, über den gesamten Messzeitraum?

    daten %>%
      filter(c("winter_djf", "fruehjahr_mam", "sommer_jja", "herbst_son") == saison) %>% 
      ggplot(
        aes(x = jahr, y = temperatur_mittelwert, color = saison)
      )+
        geom_line(linewidth = 1)+
      labs(
          y = "Mittelwert (C°)",
          x = "Jahr",
          title = "Temperatur in den Jahreszeiten",
          color = "Jahreszeit",
      )

![](46Cent_files/figure-markdown_strict/unnamed-chunk-3-1.png)

# Wie verhalten sich die Niederschlagsmengen in Kombination mit den Heißen Tagen?

    daten %>%
      filter(saison == "kalenderjahr") %>% 
      ggplot(
        aes(x = niederschlag_summe, y = temperatur_heisse_tage)
      )+
      geom_point()+
      labs(
        title = "Heiße Tage u. Niederschlagsmengen",
        x = "Niederschlagsumme (ml)",
        y = "Anzahl der heißen Tage (Jahr)"
      )

![](46Cent_files/figure-markdown_strict/unnamed-chunk-4-1.png)

# Wie entwickeln sich die Heißtage und Frosttage im laufe der Zeit und Saisonal?

    daten %>%
      filter(saison == c("winter_djf", "fruehjahr_mam", "sommer_jja", "herbst_son")) %>%
      ggplot(
        aes(x = jahr, y = temperatur_heisse_tage, color = saison)
      )+
      geom_line(linewidth = 1)+
      labs(
        title = "Heisse Tage in den verschiedenen Jahreszeiten",
        y = "Anzahl heisser Tage",
        x = "Jahr",
        color = "Jahreszeit"
      )

![](46Cent_files/figure-markdown_strict/unnamed-chunk-5-1.png)

    daten %>%
      filter(saison == c("winter_djf", "fruehjahr_mam", "sommer_jja", "herbst_son")) %>%
      ggplot(
        aes(x = jahr, y = temperatur_frosttage, color = saison)
      )+
      geom_line(linewidth = 1)+
      labs(
        title = "Frosttage in den verschiedenen Jahreszeiten",
        y = "Anzahl Frosttage",
        x = "Jahr",
        color = "Jahreszeit"
      )

![](46Cent_files/figure-markdown_strict/unnamed-chunk-6-1.png)

    daten %>% 
      filter(saison == "kalenderjahr") %>%
      pivot_longer(cols = c(temperatur_heisse_tage, temperatur_frosttage),
                   names_to = "Type",
                   values_to = "Anzahl") %>% 
      ggplot(
        aes(x = jahr, y = Anzahl, color = Type)
      )+
      geom_line(linewidth = 1)+
      labs(
        title = "Frosttage / heisse Tage im Laufe der Jahre",
        color = "Art"
      )+
      scale_color_manual(
        values = c("temperatur_heisse_tage" = "red", 
                   "temperatur_frosttage" = "blue"),
        labels = c("Frosttage", "Heisse Tage")
      )

![](46Cent_files/figure-markdown_strict/unnamed-chunk-7-1.png)

# Saisonale Trenddiagramme, alle Saisons in einem Diagramm (2023)

    daten %>%
      filter(saison %in% c("winter_djf", "fruehjahr_mam", "sommer_jja", "herbst_son") & jahr == 2023) %>%
      ggplot(aes(x = saison, y = temperatur_mittelwert, fill = saison)) +
      geom_col()+
      labs(
        title = "Saisondurschnitte 2023",
        y = "Temperaturdurschnitt (C°)",
        x = "Jahreszeit",
        fill = "Jahreszeiten"
        
      )

![](46Cent_files/figure-markdown_strict/unnamed-chunk-8-1.png)

# Wie häufig treten Trockenperioden auf und wie lange dauern diese an?

    daten %>% 
      filter(saison == "kalenderjahr") %>%
      mutate(periode_kategorie = cut(trockenperiode_tage_maximum,
                                     breaks = c(0, 10, 20, 30, 40, 100),
                                     labels = c("0-10", "11-20", "21-30", 
                                                "31-40", ">40"),
                                     right = TRUE)) %>%
      ggplot(
        aes(x = jahr, y = periode_kategorie, fill = trockenperiode_tage_maximum)
      )+
      geom_tile()+
      labs(
        title = "Konzentration der Trockenperioden über die Jahre",
        x = "Jahr",
        y = "Anzahl Trockentage / Jahr",
        fill = "Trockentage"
      )

![](46Cent_files/figure-markdown_strict/unnamed-chunk-9-1.png)

    daten %>% 
      filter(saison == "kalenderjahr") %>% 
      ggplot(
        aes(x = jahr, y = trockenperiode_tage_maximum)
      )+
      geom_col()+
      labs(
        title = "Maximale Trockenperioden über die Jahre",
        x = "Jahr",
        y = "Längste Trockenperiode im Jahr"
      )

![](46Cent_files/figure-markdown_strict/unnamed-chunk-10-1.png)

# Gibt es einen Zusammenhang zwischen Tropennächten und Trockentagen?

Es gibt keine Tropennächte ?

# Wie häufig gab es jährlich mehr als 5 Frosttage/Heißtage im Jahr?

    daten %>%
      filter(saison == "kalenderjahr") %>%
      select(temperatur_heisse_tage, temperatur_frosttage) %>%
      cor(use = "complete.obs") %>%
      as.data.frame() %>%
      rownames_to_column("var1") %>%
      pivot_longer(cols = -var1, names_to = "var2", values_to = "correlation") %>%
      ggplot(aes(x = var1, y = var2, fill = correlation)) +
      geom_tile(color = "white") +
      labs(title = "Korrelation zwischen heissen / Frosttagen") +
      theme_minimal() +
      theme(
        plot.title = element_text(size = 14, face = "bold"),
        axis.text.x = element_text(angle = 45, hjust = 1),
        axis.title = element_blank()
      )

![](46Cent_files/figure-markdown_strict/unnamed-chunk-11-1.png)

# Hat die Anzahl an Starknierderschlägen über die Jahre zugenommen?

    daten %>% 
      filter(saison == "kalenderjahr") %>% 
      ggplot(
        aes(x = jahr, y = starkniederschlag_20mm_tage)
      )+
      geom_line(linewidth = 1)+
      geom_hline(
        aes(yintercept = 4.33), linetype = "dotted", linewidth = 1, color = "red"
        )+
      labs(
        title = "Starkniederschläge über die Jahre",
        y = "Tage mit Starkniederschlägen im Jahr",
        x = "Jahr" 
      )

![](46Cent_files/figure-markdown_strict/unnamed-chunk-12-1.png)
