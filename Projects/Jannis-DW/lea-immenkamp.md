    library(tidyverse)

    ## Warning: package 'ggplot2' was built under R version 4.5.2

    ## Warning: package 'purrr' was built under R version 4.5.2

    ## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ## ✔ dplyr     1.1.4     ✔ readr     2.1.5
    ## ✔ forcats   1.0.0     ✔ stringr   1.6.0
    ## ✔ ggplot2   4.0.3     ✔ tibble    3.2.1
    ## ✔ lubridate 1.9.4     ✔ tidyr     1.3.1
    ## ✔ purrr     1.2.2     
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()
    ## ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

    library(scales)

    ## 
    ## Attaching package: 'scales'
    ## 
    ## The following object is masked from 'package:purrr':
    ## 
    ##     discard
    ## 
    ## The following object is masked from 'package:readr':
    ## 
    ##     col_factor

    movies <- read_csv2("sciFiMovies_dataset.csv")

    ## ℹ Using "','" as decimal and "'.'" as grouping mark. Use `read_delim()` for more control.

    ## New names:
    ## Rows: 2934 Columns: 13
    ## ── Column specification
    ## ──────────────────────────────────────────────────────── Delimiter: ";" chr
    ## (8): Title, Genre, Votes, Gross_collection, Sinopsis, Director, Star, Gr... dbl
    ## (4): ...1, Release_Year, Watchtime, Metascore num (1): Movie_Rating
    ## ℹ Use `spec()` to retrieve the full column specification for this data. ℹ
    ## Specify the column types or set `show_col_types = FALSE` to quiet this message.
    ## • `` -> `...1`

    glimpse(movies)

    ## Rows: 2,934
    ## Columns: 13
    ## $ ...1             <dbl> 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,…
    ## $ Title            <chr> "Star Wars: El despertar de la Fuerza", "Vengadores: …
    ## $ Release_Year     <dbl> 2015, 2019, 2009, 2018, 2018, 2015, 2012, 2017, 2018,…
    ## $ Watchtime        <dbl> 138, 181, 162, 134, 149, 124, 143, 152, 118, 133, 141…
    ## $ Genre            <chr> "Action, Adventure, Sci-Fi", "Action, Adventure, Dram…
    ## $ Movie_Rating     <dbl> 78, 84, 78, 73, 84, 70, 80, 69, 76, 78, 65, 65, 73, 7…
    ## $ Metascore        <dbl> 80, 78, 83, 88, 68, 59, 69, 84, 80, 65, 53, 51, 66, 9…
    ## $ Votes            <chr> "888,938", "956,091", "1,162,234", "683,754", "937,13…
    ## $ Gross_collection <chr> "936660000.0", "858370000.0", "760510000.0", "7000600…
    ## $ Sinopsis         <chr> "As a new threat to the galaxy rises, Rey, a desert s…
    ## $ Director         <chr> "Director:J.J. Abrams", "Directors:Anthony Russo, Joe…
    ## $ Star             <chr> "Stars:Daisy Ridley, John Boyega, Oscar Isaac, Domhna…
    ## $ Gross_equivalent <chr> "1073412359.9999999", "914164050.0", "940750869.99999…

    # Add unique ID
    movies_clean <- movies %>% 
      select(-1) %>% 
      mutate(movie_id = row_number()) %>% 
      select(movie_id, everything()) %>% 
    # rename variables
      rename_with(tolower) %>% 
    # numeric variables
     mutate(
        votes = parse_number(votes),
        gross_collection = parse_number(gross_collection),
        gross_equivalent = parse_number(gross_equivalent),
        movie_rating = parse_number(as.character(movie_rating))
      ) %>%
    # round numeric values
      mutate(across(where(is.numeric), round)) %>% 
    # list genre
    separate_rows(genre, sep = ",\\s*") %>% 
      group_by(across(-genre)) %>%  
      nest() %>%                    
      ungroup() %>% 
      rename(genre_list=data)

    movies_analyzed <- movies_clean %>% 
      # Combine movie_rating and metascore
      mutate(total_score = movie_rating + metascore) %>% 
      # Calculate the inflation rate per row
      mutate(inflation_rate = (gross_equivalent - gross_collection) / gross_collection)

    # Extract the highest-scoring movie
    best_movie <- movies_analyzed %>% 
      arrange(desc(total_score)) %>% 
      slice(1) %>% 
      select(title, release_year, movie_rating, metascore, total_score)

    # Display the best movie
    print(best_movie)

    ## # A tibble: 1 × 5
    ##   title      release_year movie_rating metascore total_score
    ##   <chr>             <dbl>        <dbl>     <dbl>       <dbl>
    ## 1 Metrópolis         1927           83        98         181

    # Create a scatterplot to check for correlation
    movies_analyzed %>% 
      drop_na(movie_rating, metascore) %>%
    ggplot(aes(x = movie_rating, y = metascore)) +
      geom_jitter(alpha = 0.5, color = "steelblue", width = 0.2, height = 0.2) + 
      geom_smooth(method = "lm", formula = y ~ x, color = "darkorange", se = TRUE) +
      labs(
        title = "Correlation between Movie Rating and Metascore",
        x = "Movie Rating",
        y = "Metascore",
        caption = "Note: A small jitter was added to reduce overplotting."
      ) +
      theme_minimal()

![](lea-immenkamp_files/figure-markdown_strict/correlation%20visualization-1.png)
**Interpretation** The scatterplot shows a positive linear trend. Thus
it can be concluded that there is a positive correlation between Moviw
rating and Metascore.

    movies_clean %>% 
      drop_na(movie_rating, metascore) %>% 
      unnest(genre_list) %>% 
      ggplot(aes(x = movie_rating, y = metascore)) +
      geom_jitter(alpha = 0.4, color = "orange", width = 0.2, height = 0.2) + 
      geom_smooth(method = "lm", formula = y ~ x, color = "blue", se = FALSE) +
      facet_wrap(~genre) +
      labs(
        title = "Rating vs. Metascore Correlation Across Genres",
        x = "Movie Rating",
        y = "Metascore"
      ) +
      theme_minimal() +
      theme(strip.text = element_text(face = "bold", size = 10))

![](lea-immenkamp_files/figure-markdown_strict/role%20of%20genre%20visualization-1.png)

    # Prepare the data per director
    director_summary <- movies_clean %>% 
      mutate(total_score = movie_rating + metascore) %>% 
      drop_na(total_score, director) %>% 
      mutate(director = str_remove(director, "^Directors?:\\s*")) %>%
      group_by(director) %>% 
      summarise(
        avg_score = mean(total_score),
        sd_score = sd(total_score),
        movie_count = n(),
        .groups = "drop"
      ) %>% 
      # Filter out directors with too few movies for cleaner visualization
      filter(movie_count >= 3) %>% 
      mutate(director = fct_reorder(director, avg_score))

    # bar plot
    ggplot(director_summary, aes(x = avg_score, y = director)) +
      geom_col(fill = "steelblue", alpha = 0.8, width = 0.7) +
      # Add whiskers 
      geom_errorbar(
        aes(xmin = avg_score - sd_score, xmax = avg_score + sd_score),
        width = 0.3, color = "darkred", linewidth = 0.7
      ) +
      # Add text annotation for number of movies next to the bars
      geom_text(
        aes(label = paste0("n = ", movie_count), x = avg_score),
        hjust = -0.3, size = 3.5, fontface = "italic", color = "black"
      ) +
      # Expand the x-axis limits slightly so the text labels don't get cut off
      expand_limits(x = max(director_summary$avg_score) + 20) +
      labs(
        title = "Average Combined Score by Director",
        subtitle = "Showing average total score, standard deviation (whiskers), and movie count (n)",
        x = "Average Combined Score (Rating + Metascore)",
        y = "Director"
      ) +
      theme_minimal()

![](lea-immenkamp_files/figure-markdown_strict/directors%20score%20visualization-1.png)

    # I do not have a favorite actor, but I am interested in the second optional task

    movies_clean %>% 
      mutate(total_score = movie_rating + metascore) %>% 
      drop_na(gross_equivalent, total_score) %>% 
      
      #  scatterplot
      ggplot(aes(x = gross_equivalent, y = total_score)) +
      geom_point(alpha = 0.5, color = "orange") + 
      geom_smooth(method = "lm", formula = y ~ x, color = "blue", se = TRUE) +
      scale_x_continuous(labels = scales::label_dollar(scale = 1e-6, suffix = "M")) +
      labs(
        title = "Does Financial Success Align with Movie Quality?",
        subtitle = "Inflation-Adjusted Gross Earnings vs. Combined Score",
        x = "Gross Equivalent Earnings (in Millions USD)",
        y = "Combined Score (User Rating + Metascore)"
      ) +
      theme_minimal()

![](lea-immenkamp_files/figure-markdown_strict/optional%20task-1.png)
