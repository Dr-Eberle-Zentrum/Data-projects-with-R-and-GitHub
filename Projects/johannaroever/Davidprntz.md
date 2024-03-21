    library(tidyverse)

    ## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ## ✔ dplyr     1.1.4     ✔ readr     2.1.5
    ## ✔ forcats   1.0.0     ✔ stringr   1.5.1
    ## ✔ ggplot2   3.5.0     ✔ tibble    3.2.1
    ## ✔ lubridate 1.9.3     ✔ tidyr     1.3.1
    ## ✔ purrr     1.0.2     
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()
    ## ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

    setwd("/Users/dave/Downloads")
    df <- read.csv("StelaeCyprus.csv", 
                     sep = ";", 
                     header = TRUE,
                     na = c("unknown", "undefined"))

    df <- df %>%
      mutate(across(c(location, type, epoch, material), ~na_if(.x, "unknown")),
             epoch = ifelse(epoch == "antoninisch", "antonine", epoch),
             type = gsub("\\?", "", type),
             typeCertain = ifelse(typeCertain == 1, TRUE, FALSE),
             material = case_when(grepl("limestone", material) ~ "limestone",
                                  grepl("marble", material) ~ "marble",
                                  TRUE ~ NA_character_),
             type = if_else(catNo == 98 | catNo == 99, "6", type))

    location_map <- setNames(
      c(rep("Cyprus", 2), "Amathus", "Amathus", "Amathus", "Golgoi", "Golgoi", "Golgoi", "Kition", "Marion", "Marion", "Salamis", "Salamis", "Soloi", "Tamassos"),
      c("unknown", "(?)", "region of Limassol", "Limassol", "Mathikoloni", "Athienou", "Melousha", "Pergamon", "Alambra (Larnaca)", "Pano Arodes", "Polis", "Kotschines (neighbourhood of Lysi)", "north of Lysi, district Famagusta", "Ambelia, near Morphou", "Pera (Asproji)")
    )

    df <- df %>%
      mutate(location = recode(location, !!!location_map))
