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
        avg_popularity = mean(popularity, na.rm = TRUE)
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
        avg_popularity = mean(popularity, na.rm = TRUE)
      ) 


    # Group films by year & countries (only if JSON formatting worked for countries)
    clean_data_grouped_year_countries <- clean_data %>%
      group_by(year, production_countries) %>%
      summarise(
      count = n(),
      avg_revenue = mean(revenue, na.rm = TRUE),
      avg_budget = mean(budget, na.rm = TRUE),
      avg_runtime = mean(runtime, na.rm = TRUE),
      avg_vote_average = mean(vote_average, na.rm = TRUE),
      avg_vote_count = mean(vote_count, na.rm = TRUE),
      avg_popularity = mean(popularity, na.rm = TRUE)
      ) 

    ## `summarise()` has grouped output by 'year'. You can override using the
    ## `.groups` argument.

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
        avg_popularity = mean(popularity, na.rm = TRUE)
      ) 

## Data Visualization

    ### Plots

    clean_data_grouped_year_countries %>%

      # top-10 countries wrt total_count
      mutate(total_films = sum(count, na.rm = TRUE),
             rank = dense_rank(desc(total_films))) %>%
      filter(rank <= 10) %>%

      #  factorize production countries for output
      group_by(production_countries) %>%
      arrange(year) %>%
      mutate(last_value = last(count, order_by = year)) %>%
      ungroup() %>%
      mutate(production_countries = fct_reorder(production_countries, last_value, .desc = TRUE)) |>

      # visualization
     ggplot(aes(x = year, y = count, color = production_countries)) +
      geom_line(linewidth = 0.7) +
      scale_x_continuous(limits = c(min(clean_data_grouped_year_countries$year), 2020)) +
      scale_y_sqrt() +  # Square root transformation
      scale_color_viridis_d(option = "C", end = 0.9, name = "Country") +  # More contrasting colors
      labs(title = "Number of Films by Year & Countries", x = "Year", y = "Number of Films (sqrt scale)") +
      theme_minimal()

![](solution_by_madeleine1806_files/figure-markdown_strict/unnamed-chunk-4-1.png)

    # number of genres through different year (use ridgeline plot)
    clean_data_filtered <- clean_data %>%
      filter(!is.na(year), !is.na(genres))  # Remove missing values

    ggplot(clean_data_filtered, aes(x = year, y = genres, fill = genres)) +
      geom_density_ridges(scale = 1, alpha = 0.7, bandwidth = 2.5, na.rm = TRUE) +  # Set bandwidth
      scale_x_continuous(
        limits = c(1960, max(clean_data_filtered$year)), 
        breaks = seq(1960, max(clean_data_filtered$year), by = 10)  # Set 10-year intervals
      ) +
      labs(
        title = "Number of Genres Over Years",
        x = "Year",
        y = "Genres"
      ) +
      theme_ridges() +
      theme(legend.position = "none")

![](solution_by_madeleine1806_files/figure-markdown_strict/unnamed-chunk-5-1.png)

    ## correlation between revenue and budget 
    # Add profit_or_loss and status columns
    clean_data <- clean_data %>%
      mutate(
        profit_or_loss = revenue - budget, 
        status = ifelse(profit_or_loss >= 0, "Profit", "Loss"),
        production_countries = fct_infreq(production_countries)  # Reorder countries by frequency
      )

    # Calculate correlation
    correlation <- cor(clean_data$budget, clean_data$revenue)
    print(correlation)

    ## [1] 0.7412502

    # Plot with production countries reordered and legend on the right
    ggplot(clean_data, aes(x = budget, y = revenue, color = production_countries)) +
      geom_point(size = 3, alpha = 0.8) +
      geom_abline(slope = 1, intercept = 0, linetype = "dashed", color = "gray") +
      labs(
        title = "Correlation Between Revenue and Budget",
        x = "Budget",
        y = "Revenue",
        color = "Production Country"
      ) +
      annotate("text", x = max(clean_data$budget) * 0.7, y = max(clean_data$revenue) * 0.9,
               label = paste("Correlation:", round(correlation, 2)), size = 5) +
      theme_minimal() +
      theme(legend.position = "right")  # Move the legend to the right side

![](solution_by_madeleine1806_files/figure-markdown_strict/unnamed-chunk-6-1.png)
