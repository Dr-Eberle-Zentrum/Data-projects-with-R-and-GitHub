Project_Tobi solution by Tim
================

## Data Wrangling

``` r
knitr::opts_chunk$set(echo = TRUE)

library(tidyverse)
library(ggplot2)
library(readxl)

windenergiebw <- read.csv("WindenergieBW.csv")

windenergie_clean <- windenergiebw %>%
  select(-Typbezeichnung.des.Herstellers, -Stand.der.Daten, -Herkunft.der.Daten) %>%
  filter(!grepl("Stillgelegt", Status)) %>%
  
  
  mutate(
   
    Inbetriebnahmedatum = as.Date(Inbetriebnahmedatum, format = "%d.%m.%Y"),
    
    Inbetriebnahme_Jahr = year(Inbetriebnahmedatum),
    
    Betriebsdauer = as.numeric(as.Date("2025-10-31") - Inbetriebnahmedatum) / 365,
    
     Kapazitätsfaktor = case_when(
      Nabenhöhe..m. < 100 ~ 0.20,
      Nabenhöhe..m. <= 150 ~ 0.25,
      Nabenhöhe..m. > 150 ~ 0.30,
      TRUE ~ NA_real_
    ),
    
     Gesamtenergie_MWh = Generatorleistung..MW. * Kapazitätsfaktor * Betriebsdauer,
    
     Steueraufkommen_Cent = Gesamtenergie_MWh * 0.01
  ) %>%

  # Jahreskennzahlen pro Inbetriebnahmedatum berechnen
  left_join(
    windenergiebw %>%
      filter(!grepl("Stillgelegt", Status)) %>%
      mutate(Inbetriebnahmedatum = as.Date(Inbetriebnahmedatum, format = "%d.%m.%Y")) %>%
      group_by(Inbetriebnahmedatum) %>%
      summarise(
        Anzahl_Anlagen_Jahr = n(),
        Leistung_Jahr_MW = sum(Generatorleistung..MW., na.rm = TRUE),
        .groups = "drop"
      ),
    by = "Inbetriebnahmedatum"
  )
```

## Aufgabe 1

Linechart mit jährlichem Zubau an Windrädern in BW

``` r
jahres_stats <- windenergie_clean %>%
  group_by(Inbetriebnahme_Jahr) %>%
  summarise(
    Anzahl_Anlagen_Jahr = n(),
    Leistung_Jahr_MW = sum(Generatorleistung..MW., na.rm = TRUE),
    .groups = "drop"
  ) %>%
  arrange(Inbetriebnahme_Jahr)  # nach Jahr sortieren


faktor <- max(jahres_stats$Leistung_Jahr_MW) / max(jahres_stats$Anzahl_Anlagen_Jahr)


ggplot(jahres_stats, aes(x = Inbetriebnahme_Jahr)) +
  geom_line(aes(y = Anzahl_Anlagen_Jahr, group = 1, color = "Anzahl Windräder"), size = 1.2) +
  geom_line(aes(y = Leistung_Jahr_MW / faktor, group = 1, color = "Installierte Leistung (MW)"),
            size = 1.2, linetype = "dashed") +
  scale_y_continuous(
    name = "Anzahl Windräder",
    sec.axis = sec_axis(~.*faktor, name = "Installierte Leistung (MW)")
  ) +
  scale_color_manual(values = c("Anzahl Windräder" = "green", "Installierte Leistung (MW)" = "blue")) +
  labs(
    title = "Jährlicher Zubau an Windrädern in BW",
    x = "Jahr",
    color = ""
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
    axis.title = element_text(size = 12),
    legend.position = "bottom"
  )
```

    ## Warning: Using `size` aesthetic for lines was deprecated in ggplot2 3.4.0.
    ## ℹ Please use `linewidth` instead.
    ## This warning is displayed once every 8 hours.
    ## Call `lifecycle::last_lifecycle_warnings()` to see where this warning was
    ## generated.

    ## Warning: Removed 1 row containing missing values or values outside the scale range
    ## (`geom_line()`).
    ## Removed 1 row containing missing values or values outside the scale range
    ## (`geom_line()`).

![](tobi_solution_bytim_files/figure-gfm/unnamed-chunk-1-1.png)<!-- -->

## Aufgabe 2

Korrelationsmatrix

``` r
cor_vars <- windenergie_clean %>%
  select(Steueraufkommen_Cent, Rotordurchmesser..m., Nabenhöhe..m., Gesamtenergie_MWh)


pairs <- expand_grid(
  var1 = names(cor_vars),
  var2 = names(cor_vars)
) %>%
  mutate(
   
    test = map2(var1, var2, ~cor.test(cor_vars[[.x]], cor_vars[[.y]], method = "spearman")),
    rho = map_dbl(test, ~.x$estimate),
    p = map_dbl(test, ~.x$p.value),
    p_adj = p.adjust(p, method = "BH"),
    sig = p_adj < 0.05,
    rho_sig = ifelse(sig, rho, NA),
    var1 = factor(var1, levels = names(cor_vars)),
    var2 = factor(var2, levels = names(cor_vars))
  )
```

    ## Warning: There were 16 warnings in `mutate()`.
    ## The first warning was:
    ## ℹ In argument: `test = map2(var1, var2, ~cor.test(cor_vars[[.x]],
    ##   cor_vars[[.y]], method = "spearman"))`.
    ## Caused by warning in `cor.test.default()`:
    ## ! Kann exakten p-Wert bei Bindungen nicht berechnen
    ## ℹ Run `dplyr::last_dplyr_warnings()` to see the 15 remaining warnings.

``` r
ggplot(pairs, aes(x = var1, y = var2, fill = rho_sig)) +
  geom_tile(color = "white") +
  geom_text(aes(label = round(rho, 2)), color = "black") +
  scale_fill_gradient2(
    low = "blue", mid = "white", high = "red",
    midpoint = 0, na.value = "grey90",
    name = "Spearman-Rho"
  ) +
  labs(
    title = "Korrelogramm",
    x = "",
    y = ""
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
    legend.position = "right"
  )
```

![](tobi_solution_bytim_files/figure-gfm/unnamed-chunk-2-1.png)<!-- -->
