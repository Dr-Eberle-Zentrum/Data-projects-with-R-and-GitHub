## Datentransformation

    jena_25 <- data_jena_2025_1_


    jena_25 <- jena_25 %>%
      mutate(`dry soil + glass [g]` = replace(
        `dry soil + glass [g]`,
        44,
        mean(as.numeric(strsplit(`dry soil + glass [g]`[44], "/")[[1]]))
      )
        `dry soil + glass [g]` = as.numeric(`dry soil + glass [g]`),
        `glass weight [g]` = as.numeric(`glass weight [g]`),
        dry_soil_swc_g = `dry soil + glass [g]` - `glass weight [g]`,
        swc = (`wet soil [g]` - dry_soil_swc_g) / dry_soil_swc_g
      ) %>%
      drop_na() %>% 
      mutate(dry_soil_nmin_g = `Nmin wet soil [g]` / (1 + swc)) 
      


    Nmin_jena_25 <- X2025_Nmin_Jena %>% 
      mutate(across(4, ~ ifelse(. < 0, 0, .))) %>%
      rename(ID_temp = 2) %>%
      # Join mit dry_soil_nmin_g aus jena_25
      left_join(
        jena_25 %>% 
        select(`plot ID`, dry_soil_nmin_g = 3),
        by = c("ID_temp" = "plot ID")
      ) %>%
      mutate(
        `NO3ˉ-N [mg/l]` = pmax(`NO3ˉ-N [mg/l]`, 0),
        `NH4+-N [mg/l]` = pmax(`NH4+-N [mg/l]`, 0)
      ) %>%
      
      mutate(
        NO3_mg_kg = (`NO3ˉ-N [mg/l]` * 50) / dry_soil_nmin_g,
        NH4_mg_kg = (`NH4+-N [mg/l]` * 50) / dry_soil_nmin_g,
        Nmin_mg_kg = NO3_mg_kg + NH4_mg_kg
      ) 


    jena_25_join <- Nmin_jena_25 %>%
      left_join(
        Plot_information, 
        by = c("ID_temp" = "plotcode")
      )

    Results_24 <- Results_24 %>% mutate(Year = 2024)
    jena_25_join <- jena_25_join %>% mutate(Year = 2025)


    Nmin_long <- bind_rows(Results_24, jena_25_join)

    write_xlsx(
      list(
        "2024" = Results_24 %>% select(-Year),
        "2025" = jena_25_join %>% select(-Year)
      ),
      path = "Jena_Nmin_Combined.xlsx"
    )

## Aufgaben 1&2

    library(dplyr)

    ## 
    ## Attache Paket: 'dplyr'

    ## Die folgenden Objekte sind maskiert von 'package:stats':
    ## 
    ##     filter, lag

    ## Die folgenden Objekte sind maskiert von 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

    library(ggplot2)
    library(readxl)

    Jena_Nmin_24 <- read_excel("Jena_Nmin_Combined.xlsx", sheet=1)
    Jena_Nmin_25 <- read_excel("Jena_Nmin_Combined.xlsx", sheet =2)

    Jena_Nmin_25 %>%
      mutate(
        log2_sowndiv = log2(sowndiv),
        log_Nmin = log(Nmin_mg_kg),
        legume = factor(leg, levels = c(0, 1), labels = c("Nein", "Ja"))
      ) %>%
      ggplot(aes(x = log2_sowndiv, y = log_Nmin, color = legume)) +
      geom_point(size = 3, alpha = 0.8) +
      labs(
        x = "log2(sowndiv)",
        y = "log(Nmin)",
        color = "Leguminosen"
      ) +
      scale_x_continuous(expand = expansion(mult = c(0.1, 0.1))) +  # 10% Platz links und rechts
      scale_y_continuous(expand = expansion(mult = c(0.1, 0.1))) +  # 10% Platz oben und unten
      theme_minimal(base_size = 14)

    ## Warning: Removed 8 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

![](Dario_solution_files/unnamed-chunk-2-1.png)

    # Aufgabe 2: 

    ggplot() +
      # Daten 2024
      geom_boxplot(
        data = Jena_Nmin_24, 
        aes(x = "2024", y = Nmin, fill = "2024", group = factor(p_legume)),
        outlier.shape = NA, alpha = 0.6
      ) +
      geom_jitter(
        data = Jena_Nmin_24, 
        aes(
          x = "2024", 
          y = Nmin, 
          color = factor(p_legume, levels = c(0,1), labels = c("Non-Legume","Legume"))
        ),
        width = 0.2, alpha = 0.6
      ) +
      # Daten 2025
      geom_boxplot(
        data = Jena_Nmin_25, 
        aes(x = "2025", y = Nmin_mg_kg, fill = "2025", group = factor(leg)), 
        outlier.shape = NA, alpha = 0.6
      ) +
      geom_jitter(
        data = Jena_Nmin_25, 
        aes(
          x = "2025", 
          y = Nmin_mg_kg, 
          color = factor(leg, levels = c(0,1), labels = c("Non-Legume","Legume"))
        ),
        width = 0.2, alpha = 0.6
      ) +
      labs(
        title = "Jahresvergleich der Nmin-Werte (2024 vs. 2025)",
        x = "Jahr",
        y = "Nmin (mg/kg)",
        color = "Legume"
      ) +
      theme_minimal() +
      scale_fill_manual(values = c("2024" = "lightblue", "2025" = "lightpink")) +
      scale_color_manual(values = c("Non-Legume" = "gray50", "Legume" = "forestgreen"))

    ## Warning: Removed 8 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 8 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

![](Dario_solution_files/unnamed-chunk-3-1.png)

