## Solution of “Wrangling and Analyzing Laptop Market Data”

First loading the necessary libraries:

    library(tidyverse)
    library(stringr)
    library(scales)
    library(ggridges)

    ## Warning: package 'ggridges' was built under R version 4.5.3

Doing all the data transformations:

    uncleanData <- "~/Data-projects-with-R-and-GitHub/Projects/Jingyi-L/data/laptopData.csv" %>% 
      read_csv(na = c("", "NA", "?"))

      #1
    data <- uncleanData %>% 
      drop_na() %>% 
      select(-1) %>% 
      #2
      mutate(Ram = as.integer(str_replace_all(Ram, "GB", ""))) %>% 
      mutate(Weight = as.double(str_replace_all(Weight, "kg", ""))) %>% 
      mutate(Cpu = as.double(str_extract(Cpu, "\\d+\\.?\\d*(?=GHz)"))) %>% 
      #3
      mutate(HasIPS = str_detect(ScreenResolution, "IPS")) %>% 
      mutate(HasRetina = str_detect(ScreenResolution, "Retina")) %>%
      mutate(Width = as.integer(str_extract(ScreenResolution, "\\d+(?=x)"))) %>% 
      mutate(Height = as.integer(str_extract(ScreenResolution, "(?<=x)\\d+"))) %>% 
        mutate(OpSys = case_when(
        str_detect(OpSys, regex("windows", ignore_case = TRUE)) ~ "Windows",
        str_detect(OpSys, regex("mac", ignore_case = TRUE)) ~ "macOS",
        TRUE ~ OpSys
        ))

Doing the Visualizations, Nr.3 was not possible as far as I could tell,
so instead I drew them after each other.

    #1
    data %>% 
      ggplot(aes(x = Cpu, y = Price)) +
      geom_point(alpha = 0.25) +
      geom_density2d(alpha = 0.75) +
      scale_y_continuous(labels = label_comma())

![](SamiPhoenix_files/figure-markdown_strict/Visualisation-1.png)

    #2
    data %>% 
      ggplot(aes(x = TypeName, y = Price)) +
      geom_boxplot() +
      scale_y_continuous(labels = label_comma())

![](SamiPhoenix_files/figure-markdown_strict/Visualisation-2.png)

    #3
    # Histogram
    data %>% 
      ggplot(aes(x = Price)) +
      geom_histogram(color = "black", fill = "purple") +
      scale_x_continuous(labels = label_comma())

![](SamiPhoenix_files/figure-markdown_strict/Visualisation-3.png)

    # Ridgeline
    data %>% 
      ggplot(aes(x = Price)) +
      geom_density_ridges(data = data %>%
                            filter( TypeName %in% c("Notebook", "Ultrabook", "Gaming")), 
                          aes(y = TypeName, scale = 1.5), alpha = 0.5)

![](SamiPhoenix_files/figure-markdown_strict/Visualisation-4.png)
