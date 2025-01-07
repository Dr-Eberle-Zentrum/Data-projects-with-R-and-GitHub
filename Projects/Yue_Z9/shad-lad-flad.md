    library(tidyverse)

    ## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ## ✔ dplyr     1.1.4     ✔ readr     2.1.5
    ## ✔ forcats   1.0.0     ✔ stringr   1.5.1
    ## ✔ ggplot2   3.4.4     ✔ tibble    3.2.1
    ## ✔ lubridate 1.9.3     ✔ tidyr     1.3.0
    ## ✔ purrr     1.0.2     
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()
    ## ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

\#importing the data

    airquality <- read.csv("air_quality.csv")

    #Task 1

    #Grouping the different pollutants in "Name" and calculating the mean value for each one

    airquality %>%
      select(Name,Measure,Measure.Info,Data.Value)%>% 
      group_by(Name) %>%
    #using "summarise" instead of "mutate" here, so the values in the chart are displayed correctly.
      summarise(mean_value = as.numeric(round(mean(Data.Value, na.rm = TRUE), digits = 1))) %>% 
      
    #tried to add a Letter to each Name for the legend here but it would not work so I commented it out. 
      #mutate(Pollutant_Letter = LETTERS[1:n()]) %>%        
      
    #Visualization of the Plot using "geom_histogram()"
      ggplot(aes(x = Name, y = mean_value  )) +
      geom_histogram(stat = "identity") +         # adding "identity" so the graph displays at all
      labs(x = "Name", y= "Mean_Value",) +
      geom_text(aes(label = mean_value ), hjust = -0.5)+ 
      geom_segment(aes(x = 0.5, y = 0.5, xend = 0.5, yend = 100), arrow = arrow(length = unit(0.1, "inches")) ) +
      expand_limits(y = c(0, 100)) +              #adding a limit to the y axis so the text fits in
      coord_flip()                                # flipping the chart to fit in the names with the values

    ## Warning in geom_histogram(stat = "identity"): Ignoring unknown parameters:
    ## `binwidth`, `bins`, and `pad`

![](shad-lad-flad_files/figure-markdown_strict/unnamed-chunk-3-1.png)

    # Since the Legend wouldn't build up like I intended to, I've decided to flip the chart in Order to make it more readable.
    # I've attempted to add the units for each observation, but since I only got a good graph by using "summarise", I couldn't 
    # use something like unite() to add the units to the names from the "Measure.Info" column

    #Task 2

    #finding out which regions have the highest pollution on average for mcg/m^3 measurements
    airquality %>%
      arrange(Name, Geo.Place.Name, Start_Date, Time.Period) %>%
      filter(Measure.Info == "mcg/m3") %>% 
      group_by(Geo.Place.Name) %>%
      summarise(mean_value = mean(Data.Value, na.rm = TRUE)) %>%
      arrange(desc(mean_value)) %>% 
      head(3) %>%
      ungroup() %>% 
      view()
      
    #results show that "Midtown (CD5)","Gramercy Park - Murray Hill" and "Chelsea - Clinton" have the highest pollution on average.

    #creating the time series for the top 3 areas mentioned above
    airquality %>% 
      filter(Measure.Info == "mcg/m3") %>% 
      filter(Geo.Place.Name == c("Midtown (CD5)","Gramercy Park - Murray Hill","Chelsea - Clinton")) %>%
      mutate(year = as.numeric(format(as.Date(Start_Date, format="%d/%m/%Y"), "%Y"))) %>%
      arrange(year, Geo.Place.Name) %>% 
      group_by(Geo.Place.Name) %>%
      
      # time series visualization using "geom_line()"

    ggplot(aes(x = year, y = Data.Value, color = Geo.Place.Name)) +
      geom_line() +
      labs(title = "Top 3 polluted Areas on average", x = "Year", y = "Yearly Average Value (mcg/m3)") +
      theme_minimal() +
      scale_color_manual(values = c("Midtown (CD5)" = "red", "Gramercy Park - Murray Hill" = "blue", "Chelsea - Clinton" = "green")) +
      theme(legend.position = "right") +
      labs(color = "Regions") +
      scale_x_continuous(breaks = seq(2010, 2022, by = 2)) +
      scale_y_continuous(breaks = seq(0, 25, by = 2)) 

    ## Warning: Removed 1 row containing missing values (`geom_line()`).

![](shad-lad-flad_files/figure-markdown_strict/unnamed-chunk-5-1.png)
