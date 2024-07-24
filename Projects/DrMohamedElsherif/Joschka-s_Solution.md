    library(dplyr)

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

    library(lubridate)

    ## Warning: package 'lubridate' was built under R version 4.3.3

    ## 
    ## Attaching package: 'lubridate'

    ## The following objects are masked from 'package:base':
    ## 
    ##     date, intersect, setdiff, union

    library(ggplot2)

    ## Warning: package 'ggplot2' was built under R version 4.3.3

    library(reshape2)

    ## Warning: package 'reshape2' was built under R version 4.3.3

    library(scales)
    unzip("BikeData.zip", exdir = "BikeData")
    Bike_Count <- read.csv("BikeData/bike_counts.csv")
    Counter_Sites <- read.csv("BikeData/counter_sites.csv")
    Holidays <- read.csv("BikeData/holidays.csv")
    Weather <- read.csv("BikeData/weather.csv")
    file.remove(list.files("BikeData", full.names = TRUE))

    ## [1] TRUE TRUE TRUE TRUE

    Holidays$date <- as.Date(Holidays$date)
    Bike_Count <- Bike_Count %>% mutate(time = ymd_hms(time))
    Weather <- Weather %>% mutate(time = ymd_hms(time))

    bike_counts_agg <- Bike_Count %>%
      group_by(time, counter_site_id) %>%
      summarise(Bike_Count = sum(bike_count), .groups = 'drop')
    merged <- bike_counts_agg %>%
      left_join(Counter_Sites, by = "counter_site_id") %>%
      mutate(date = as.Date(time)) %>%
      left_join(Holidays, by = "date") %>%
      tidyr::replace_na(list(bike_count = 0, bike_count_agg = 0)) %>%
      select(-date) %>%
      left_join(Weather, by = "time") %>%
      mutate(
        week = week(time),
        hour = hour(time),
        wday = wday(time)
      )

    Bike_Count_Week <- Bike_Count %>%
      mutate(week = floor_date(time, unit = "week")) %>%
      group_by(counter_site_id, week) %>%
      summarise(bike_count = sum(bike_count), .groups = 'drop')

## Data Visualization 1

    Bike_Count_Hourly <- merged %>%
      group_by(counter_site, hour) %>%
      summarise(bike_count = sum(Bike_Count), .groups = 'drop')
    Graph1 <- ggplot(Bike_Count_Hourly, aes(x = hour, y = bike_count, color = as.factor(counter_site))) +
      geom_line() +
      labs(x = "Time of Day", y = "Bike Count", title = "Bike Counts for Each Counter Site by Time of Day", color = "Counter Site") +
      scale_y_continuous(labels = scales::comma) +
      theme_minimal()
    # Clear peaks at certain hours, yet traffic remains relatively consistent from ~7:00-18:00
    print(Graph1)

![](Joschka-s_Solution_files/figure-markdown_strict/unnamed-chunk-2-1.png)
![](Projects/DrMohamedElsherif/Joschka-s_Solution_files/figure-markdown_strict/unnamed-chunk-2-1.png)

## Data Visualization 2

    Bike_Count_Week <- Bike_Count_Week %>%
      left_join(Counter_Sites, by = "counter_site_id")
    Graph2 <- ggplot(Bike_Count_Week, aes(x = week, y = bike_count)) +
      geom_line() +
      facet_wrap(~ counter_site, scales = "free_y", nrow = 3) +
      labs(x = "Time", y = "Number of Bikes", title = "Number of Bikes per Week for Each Counter Site") +
      theme_minimal()
    # Interestingly, there is not much of a shock during COVID
    # Seasons can be easily differentiated
    # Hirschau closed of for a period of time?
    print(Graph2)

![](Joschka-s_Solution_files/figure-markdown_strict/unnamed-chunk-3-1.png)
![](Projects/DrMohamedElsherif/Joschka-s_Solution_files/figure-markdown_strict/unnamed-chunk-3-1.png)

## Data Visualization 3

    library(dplyr)
    weekdays <- c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")
    Heatmap_Data <- Bike_Count %>%
      mutate(wday = wday(time, label = TRUE, abbr = FALSE, week_start = 7), hour = hour(time)) %>%
      group_by(wday, hour) %>%
      summarise(Avg_Bike_Count = mean(bike_count), .groups = 'drop') %>%
      dcast(hour ~ wday, value.var = "Avg_Bike_Count") %>%
      melt(id.vars = "hour", variable.name = "weekday", value.name = "Avg_Bike_Count")
    Heatmap <- ggplot(Heatmap_Data, aes(x = weekday, y = hour, fill = Avg_Bike_Count)) +
      geom_tile() +
      scale_fill_gradient(low = "white", high = "steelblue") +
      labs(x = "Weekday", y = "Time of Day", title = "Average Bike Count Timetable Heatmap across all years") +
      theme_minimal() +
      theme(axis.text.x = element_text(angle = 90, hjust = 1))
    # Unsurprisingly, Mon-Fri mornings and evenings tend to have the most bike traffic
    # The slight increase in the middle of the day, though, is interesting
    print(Heatmap)

![](Joschka-s_Solution_files/figure-markdown_strict/unnamed-chunk-4-1.png)
![](Projects/DrMohamedElsherif/Joschka-s_Solution_files/figure-markdown_strict/unnamed-chunk-4-1.png)
