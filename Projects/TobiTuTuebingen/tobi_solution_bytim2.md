Project_Tobi solution by Tim
================

## Data Wrangling

``` r
knitr::opts_chunk$set(echo = TRUE)

library(dplyr)
library(stringr)
library(lubridate)
library(purrr)
library(ggplot2)
library(tidyr)


windenergiebw <- readr::read_csv("WindenergieBW.csv")



windenergie_clean <- windenergiebw %>%
  select(-'Typbezeichnung des Herstellers', -'Stand der Daten', -'Herkunft der Daten') %>%
  filter(!str_detect(Status, "Stillgelegt")) %>%
  
  
  mutate(
   
    Inbetriebnahmedatum = as.Date(Inbetriebnahmedatum, format = "%d.%m.%Y"),
    
    Inbetriebnahme_Jahr = year(Inbetriebnahmedatum),
    
    Betriebsdauer = as.numeric(as.Date("2025-10-31") - Inbetriebnahmedatum) / 365,
    
     Kapazitätsfaktor = case_when(
      "Nabenhöhe [m]" < 100 ~ 0.20,
      "Nabenhöhe [m]" <= 150 ~ 0.25,
      "Nabenhöhe [m]" > 150 ~ 0.30,
      TRUE ~ NA_real_
    ),
    
     Gesamtenergie_MWh = `Generatorleistung [MW]` * Kapazitätsfaktor * Betriebsdauer,
    
     Steueraufkommen_Cent = Gesamtenergie_MWh * 0.01
  ) %>%

  # Jahreskennzahlen pro Inbetriebnahmedatum berechnen
  left_join(
    windenergiebw %>%
      filter(!str_detect(Status, "Stillgelegt")) %>%
      mutate(Inbetriebnahmedatum = as.Date(Inbetriebnahmedatum, format = "%d.%m.%Y")) %>%
      group_by(Inbetriebnahmedatum) %>%
      summarise(
        Anzahl_Anlagen = n(),
        Leistung_Jahr_MW = sum(`Generatorleistung [MW]`, na.rm = TRUE),
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
    Leistung_Jahr_MW = sum(`Generatorleistung [MW]`, na.rm = TRUE),
    .groups = "drop"
  ) %>%
  arrange(Inbetriebnahme_Jahr)

faktor <- max(jahres_stats$Leistung_Jahr_MW) / max(jahres_stats$Anzahl_Anlagen_Jahr)

ggplot(jahres_stats, aes(x = Inbetriebnahme_Jahr)) +
  
  # Balken
  geom_col(aes(y = Anzahl_Anlagen_Jahr, fill = "Anzahl Windräder"), width = 0.7) +
  
  # Linie
  geom_line(
    aes(y = Leistung_Jahr_MW / faktor, color = "Installierte Leistung (MW)"),
    linewidth = 1.3,
    linetype = "dashed"
  ) +
  
  scale_fill_manual(values = c("Anzahl Windräder" = "grey60")) +
  scale_color_manual(values = c("Installierte Leistung (MW)" = "blue")) +
  
  scale_y_continuous(
    name = "Anzahl Windräder",
    sec.axis = sec_axis(~ . * faktor, name = "Installierte Leistung (MW)")
  ) +
  
  labs(
    title = "Jährlicher Zubau an Windrädern in BW",
    x = "Jahr",
    fill = "",
    color = ""
  ) +
  
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
    axis.title = element_text(size = 12),
    legend.position = "bottom",
    axis.title.y  = element_text(color = "grey60"),
    axis.text.y   = element_text(color = "grey60"),
    axis.title.y.right = element_text(color = "blue"),
    axis.text.y.right  = element_text(color = "blue")
  )
```

    ## Warning: Removed 1 row containing missing values or values outside the scale range
    ## (`geom_col()`).

    ## Warning: Removed 1 row containing missing values or values outside the scale range
    ## (`geom_line()`).

![](tobi_solution_bytim_files/figure-gfm/unnamed-chunk-1-1.png)<!-- -->

## Aufgabe 2

Korrelationsmatrix

``` r
cor_vars <- windenergie_clean %>%
  select(
    Steueraufkommen_Cent,
    `Rotordurchmesser [m]`,
    `Nabenhöhe [m]`,
    Gesamtenergie_MWh
  )
pairs_corr <- expand_grid(
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
    
   
    stars = case_when(
      p_adj < 0.001 ~ "***",
      p_adj < 0.01  ~ "**",
      p_adj < 0.05  ~ "*",
      TRUE ~ ""
    ),
    
    var1 = factor(var1, levels = names(cor_vars)),
    var2 = factor(var2, levels = names(cor_vars))
  )
```

    ## Warning: There were 16 warnings in `mutate()`.
    ## The first warning was:
    ## ℹ In argument: `test = map2(var1, var2, ~cor.test(cor_vars[[.x]],
    ##   cor_vars[[.y]], method = "spearman"))`.
    ## Caused by warning in `cor.test.default()`:
    ## ! Cannot compute exact p-value with ties
    ## ℹ Run `dplyr::last_dplyr_warnings()` to see the 15 remaining warnings.

``` r
ggplot(pairs_corr, aes(x = var1, y = var2, fill = rho_sig)) +
  geom_tile(color = "white") +
  
  # rho + Sterne
  geom_text(aes(label = paste0(round(rho, 2), stars)), color = "black") +
  
 
  geom_point(
    aes(x = Inf, y = Inf, shape = "Signifikanz"),
    color = "black"
  ) +
  
  scale_shape_manual(
    name = "Signifikanzniveau",
    values = c("Signifikanz" = NA),
    labels = c(
      "Signifikanz" =
        "*   p < 0.05\n**  p < 0.01\n*** p < 0.001"
    )
  ) +
  
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

    ## Warning: Removed 16 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

![](tobi_solution_bytim_files/figure-gfm/unnamed-chunk-2-1.png)<!-- -->

``` r
# Warnung weil * liegen außerhab der Skala 
# Signifikanz weniger wichtig, da Effektgröße bedeutsamer ist. Große Stichprobe, Korrekturen verändern Signifikanz (kann man nicht trauen). 
```
