# Dragonflies - to find out under which weather conditions autumn mosaic dragonfly prefers to fly

## Data manipulation

    library(dplyr)
    library(tidyr)
    library(tidyverse)
    library(kableExtra)
    library(knitr)
    library(fs)
    library(lubridate)
    library(ggplot2)


    if (!is.null(current_input())) {
      rmd_dir <- path_dir(current_input())
    } else {
      rmd_dir <- getwd()
    }
    weather_data <- read.csv(file.path(rmd_dir, "Weather_Data_Poland.csv"))

Form mean values from the extracted and revised weather data for the
morning (10 a.m. to 2 p.m.) and midday (2 p.m. to 4 p.m.) periods.
Creation of a new column based on the wind direction in degrees (True
Dir.) with the wind direction in compass direction (e.g. NW, SSO)

    transformed_weather_data <- weather_data %>%
      slice(-1) %>%
      select(Time, Temp, Wind.Speed, True.Dir.) %>%
      rename("Time in yyyy-MM-dd hh:mm:ss" = Time, 
             "Temperature in Celsius" = Temp, 
             "Wind speed in m/s" = Wind.Speed, 
             "Wind direction in degrees" = True.Dir.) %>%
      separate("Time in yyyy-MM-dd hh:mm:ss", into = c("Date", "Time"), sep = " ") %>%
      mutate( 
        period = case_when(
        Time %in% c("10:00:00", "11:00:00", "12:00:00", "13:00:00") ~ "Morning",
        Time %in% c("14:00:00", "15:00:00") ~ "Afternoon",
        TRUE ~ NA_character_)
        ) %>%
      group_by(Date, period) %>%
      filter(period %in% c("Morning", "Afternoon")) %>% # here I changed Midday to Afternoon that both dfs can be merged
      mutate(
        `Mean Temperature in Celsius` = mean(as.numeric(`Temperature in Celsius`), na.rm = TRUE),
        `Mean Wind Speed in m/s` = mean(as.numeric(`Wind speed in m/s`), na.rm = TRUE),
        `Mean Wind Direction in degrees` = mean(as.numeric(`Wind direction in degrees`), na.rm = TRUE)
      ) %>%
      ungroup() %>%
      mutate(
        `Wind direction in compass direction` = case_when(
          `Wind direction in degrees` >= 337.5 | `Wind direction in degrees` < 22.5 ~ "N",
          `Wind direction in degrees` >= 22.5 & `Wind direction in degrees` < 67.5 ~ "NE",
          `Wind direction in degrees` >= 67.5 & `Wind direction in degrees` < 112.5 ~ "E",
          `Wind direction in degrees` >= 112.5 & `Wind direction in degrees` < 157.5 ~ "SE",
          `Wind direction in degrees` >= 157.5 & `Wind direction in degrees` < 202.5 ~ "S",
          `Wind direction in degrees` >= 202.5 & `Wind direction in degrees` < 247.5 ~ "SW",
          `Wind direction in degrees` >= 247.5 & `Wind direction in degrees` < 292.5 ~ "W",
          `Wind direction in degrees` >= 292.5 & `Wind direction in degrees` < 337.5 ~ "NW",
          TRUE ~ NA_character_
        ))

Merging the data from the revised weather file with the dragonfly catch
data

    if (!is.null(current_input())) {
      rmd_dir <- path_dir(current_input())
    } else {
      rmd_dir <- getwd()
    }
    catch_data <- read.csv(file.path(rmd_dir, "Fangdaten_Poland.csv"), sep = ";")

    revised_catch_data <- catch_data %>%
      mutate(across(everything(), ~na_if(.x, ""))) %>%
      mutate(across(everything(), ~na_if(.x, "NA"))) %>%
      filter(if_any(everything(), ~ !is.na(.))) %>%
      mutate(Datum = format(dmy(Datum), "%Y-%m-%d"))

    merged_data <- left_join(transformed_weather_data, revised_catch_data, by = c("Date" = "Datum", "period" = "Uhrzeit"))

## Data visualization
