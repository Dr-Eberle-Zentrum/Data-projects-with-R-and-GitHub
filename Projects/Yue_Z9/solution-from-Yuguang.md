# This is my solution for Yue’s project.

## Chart one data

    library(tidyverse)

    ## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ## ✔ dplyr     1.1.4     ✔ readr     2.1.5
    ## ✔ forcats   1.0.0     ✔ stringr   1.5.1
    ## ✔ ggplot2   3.5.1     ✔ tibble    3.2.1
    ## ✔ lubridate 1.9.3     ✔ tidyr     1.3.1
    ## ✔ purrr     1.0.2     
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()
    ## ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

    data <- read.csv("https://data.cityofnewyork.us/api/views/c3uy-2p5r/rows.csv?accessType=DOWNLOAD")
    # Data manipulation for first graph.
    data_task1 <- data |>
      select(Name, Data.Value) |>
      group_by(Name) |>
      summarise(Mean_value = mean(Data.Value, na.rm = TRUE))

## Chart one

[chart
one](https://github.com/Dr-Eberle-Zentrum/Data-projects-with-R-and-GitHub/blob/YueZ/Projects/Yue_Z9/solution-from-Yuguang_files/figure-markdown_strict/chart_one-1.png)
![](solution-from-Yuguang_files/figure-markdown_strict/chart_one-1.png)

## Chart two data

    #data manipulation for second task

    #In this part, data_pollutant is to store a data set, which only include the name, so that i can see the name, i know it is a bit silly...
    data_pollutant <- data |>
      mutate(Year = year(dmy(Start_Date))) |>
      group_by(Name) |>
      summarise(Max_value = max(Data.Value, na.rm = TRUE), .groups = "drop") |>
      arrange(desc(Max_value)) |>
      slice_head(n = 1) |>
      pull(Name)

    ## Warning: There was 1 warning in `mutate()`.
    ## ℹ In argument: `Year = year(dmy(Start_Date))`.
    ## Caused by warning:
    ## !  282 failed to parse.

    #This data_region is also to store a data set, which contains only three Geo.Place.Name
    data_region <- data |>
      filter(Name == data_pollutant) |>
      mutate(
        Start_Date = ifelse(!grepl("^\\d{2}/\\d{2}/\\d{4}$", Start_Date), NA, Start_Date),
        Year = year(dmy(Start_Date))) |>
      arrange(desc(Data.Value)) |>
      slice_head(n = 3) |>
      pull(Geo.Place.Name)
    #This part is to select the observations we need.
    data_task2 <- data |>
      filter(Name == data_pollutant) |>
      filter(Geo.Place.Name %in% data_region) |>
      mutate(Year = year(dmy(Start_Date))) |>
      group_by(Geo.Place.Name,Year) |>
      slice_max(Data.Value, n = 1)|>
      ungroup()

## chart two

![](solution-from-Yuguang_files/figure-markdown_strict/chart_two-1.png)
