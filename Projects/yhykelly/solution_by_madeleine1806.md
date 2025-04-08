## Load Libraries

    suppressPackageStartupMessages({
      library(tidyverse)
      library(jsonlite)
      library(ggridges)
      library(lubridate)
      library(stringi)
    })

    setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

## Load Data

    data <- suppressWarnings(read_csv("movies_metadata.csv", show_col_types = FALSE))

## Data Cleaning & Preprocessing

    clean_data <- data %>% 
      select(id, title, release_date, genres, original_language,   
             production_countries, budget, revenue, runtime, 
             vote_average, vote_count, popularity) %>%  # Select relevant columns
      filter(runtime > 0 & budget > 0) %>%  # Filter out invalid values

      # Convert 'genres' from JSON to a list and extract names
      mutate(
        genres = map(genres, ~fromJSON(gsub("'", "\"", .), simplifyDataFrame = TRUE)),
        genres = map(genres, ~pluck(., "name"))
      ) %>% 
      unnest(genres) %>%  # Unnest genres to separate rows
      
      # Convert 'production_countries' from JSON to a list and extract names
      mutate(
        production_countries = map(production_countries, ~ {
          cleaned_json <- gsub("'", "\"", .)
          tryCatch(
            fromJSON(cleaned_json, simplifyDataFrame = TRUE), 
            error = function(e) NULL 
          )
        }),
        production_countries = map(production_countries, ~ if (!is.null(.)) pluck(., "name") else NULL)
      ) %>%
      unnest(production_countries) %>%  # Unnest production countries to separate rows
      
      # Extract year from 'release_date' and add it as a new column
      mutate(year = year(release_date)) %>%
      
      # Remove duplicate rows
      distinct()

## Data Wrangling

    # Group films by genres
    clean_data_grouped_genre <- clean_data %>%
      group_by(genres) %>%
      summarise(
        count = n(),
        avg_revenue = mean(revenue, na.rm = TRUE),
        avg_budget = mean(budget, na.rm = TRUE),
        avg_runtime = mean(runtime, na.rm = TRUE),
        avg_vote_average = mean(vote_average, na.rm = TRUE),
        avg_vote_count = mean(vote_count, na.rm = TRUE),
        avg_popularity = mean(popularity, na.rm = TRUE),
        .groups = "drop"  
      )

    # Group films by year
    clean_data_grouped_year <- clean_data %>%
      group_by(year) %>%
      summarise(
        count = n(),
        avg_revenue = mean(revenue, na.rm = TRUE),
        avg_budget = mean(budget, na.rm = TRUE),
        avg_runtime = mean(runtime, na.rm = TRUE),
        avg_vote_average = mean(vote_average, na.rm = TRUE),
        avg_vote_count = mean(vote_count, na.rm = TRUE),
        avg_popularity = mean(popularity, na.rm = TRUE),
        .groups = "drop"  
      ) 

    # Group films by year & countries
    clean_data_grouped_year_countries <- clean_data %>%
      group_by(year, production_countries) %>%
      summarise(
        count = n(),
        avg_revenue = mean(revenue, na.rm = TRUE),
        avg_budget = mean(budget, na.rm = TRUE),
        avg_runtime = mean(runtime, na.rm = TRUE),
        avg_vote_average = mean(vote_average, na.rm = TRUE),
        avg_vote_count = mean(vote_count, na.rm = TRUE),
        avg_popularity = mean(popularity, na.rm = TRUE),
        .groups = "drop"  
      ) 

    # Group films by languages
    clean_data_grouped_language <- clean_data %>%
      group_by(original_language) %>%
      summarise(
        count = n(),
        avg_revenue = mean(revenue, na.rm = TRUE),
        avg_budget = mean(budget, na.rm = TRUE),
        avg_runtime = mean(runtime, na.rm = TRUE),
        avg_vote_average = mean(vote_average, na.rm = TRUE),
        avg_vote_count = mean(vote_count, na.rm = TRUE),
        avg_popularity = mean(popularity, na.rm = TRUE),
        .groups = "drop"  
      ) 

## Data Visualization

    ### Plots

    # Select top 10 countries
     top_countries <- clean_data_grouped_year_countries %>%
       group_by(production_countries) %>%
       summarise(total_films = sum(count)) %>%
       arrange(desc(total_films)) %>%
       slice_head(n = 10) %>%
       pull(production_countries)
     
     # Number of Films by Year & Countries (Top 10 Countries) (only if JSON formatting worked for countries)
     ggplot(clean_data_grouped_year_countries %>% filter(production_countries %in% top_countries),
           aes(x = year, y = count, color = production_countries)) +
       geom_line(linewidth = 0.7) +
       scale_x_continuous(limits = c(min(clean_data_grouped_year_countries$year), 2020)) +
      scale_y_continuous(limits = c(0, 500), breaks = seq(0, 500, 50)) +  
      scale_color_viridis_d(option = "C", end = 0.9, name = "Country")+  
      labs(title = "Number of Films by Year & Countries", x = "Year", y = "Number of Films") +
       theme_minimal() +
       theme(
        plot.title = element_text(hjust = 0.5, vjust = 1.5)  # Adjusts plot title position
      )

![](solution_by_madeleine1806_files/figure-markdown_strict/unnamed-chunk-4-1.png)

    # number of genres through different year (use ridgeline plot)
    clean_data %>%
      filter(!is.na(year), !is.na(genres)) %>%  # Remove missing values
      ggplot(aes(x = year, y = genres, fill = genres)) +
      geom_density_ridges(scale = 1, alpha = 0.7, bandwidth = 2.5, na.rm = TRUE) +  # Set bandwidth
      scale_x_continuous(
        limits = c(1960, max(clean_data$year)), 
        breaks = seq(1960, max(clean_data$year), by = 10)  # Set 10-year intervals
      ) +
      labs(
        title = "Number of Genres Over Years",
        x = "Year",
        y = "Genres"
      ) +
      theme_ridges() +
      theme(
        legend.position = "none",
        axis.title.y = element_text(angle = 90, vjust = 1.5, hjust = 0.5),
        axis.title.x = element_text(vjust = -0.5, hjust = 0.5),
        plot.title = element_text(hjust = 0.5, vjust = 1.5)
      )

![](solution_by_madeleine1806_files/figure-markdown_strict/unnamed-chunk-5-1.png)

    ## correlation between revenue and budget 
    clean_data <- clean_data %>%
      mutate(
        profit_or_loss = revenue - budget, 
        status = ifelse(profit_or_loss >= 0, "Profit", "Loss")
      ) %>%
      add_count(production_countries, name = "country_count") %>%  # Count occurrences of each country
      filter(dense_rank(desc(country_count)) <= 10) %>%  # Keep only the top 10 countries
      mutate(production_countries = fct_reorder(production_countries, country_count))  # Reorder by frequency

    # Calculate correlation based on filtered data
    correlation <- cor(clean_data$budget, clean_data$revenue)
    print(correlation)

    ## [1] 0.7364136

    # Plot
    ggplot(clean_data, aes(x = budget, y = revenue, color = production_countries)) +
      geom_point(size = 3, alpha = 0.8) +
      geom_abline(slope = 1, intercept = 0, linetype = "dashed", color = "gray") +
      labs(
        title = "Correlation Between Revenue and Budget (Top 10 Countries)",
        x = "Budget",
        y = "Revenue",
        color = "Production Country"
      ) +
      annotate("text", x = max(clean_data$budget) * 0.7, y = max(clean_data$revenue) * 0.9,
               label = paste("Correlation:", round(correlation, 2)), size = 5) +
      theme_minimal() +
      theme(legend.position = "bottom")  # Move legend to bottom

![](solution_by_madeleine1806_files/figure-markdown_strict/unnamed-chunk-6-1.png)
