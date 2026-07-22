# Movies and Inflation

Movies are a big and important part of our culture. They are a source of
entertainment, a way to tell stories, and a reflection of society. But they are
also a big business, with billions of dollars in revenue generated each year. In
this project, we explore the relationship between movies and inflation using a
dataset that contains information about movies released between 1970 and 2020,
including their ratings, box office performance, and inflation-adjusted gross
collections.

------------------------------------------------------------------------

## Setup

    library(tidyverse)

------------------------------------------------------------------------

## Data Loading

The dataset is loaded directly from Zenodo without downloading it
locally.

    movies_raw <- read.csv(
      "https://zenodo.org/records/5653247/files/sciFiMovies_dataset.csv",
      sep       = ";",
      header    = TRUE,
      stringsAsFactors = FALSE,
      check.names = FALSE
    )

    # Quick overview
    glimpse(movies_raw)

    ## Rows: 2,934
    ## Columns: 13
    ## $ ``               <int> 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, …
    ## $ Title            <chr> "Star Wars: El despertar de la Fuerza", …
    ## $ Release_Year     <int> 2015, 2019, 2009, 2018, 2019, …
    ## $ Watchtime        <int> 138, 181, 162, 134, 149, …
    ## $ Genre            <chr> "Action, Adventure, Sci-Fi", …
    ## $ Movie_Rating     <chr> "7.8", "8.4", "7.8", "7.3", …
    ## $ Metascore        <int> 80, 78, 83, 88, 78, …
    ## $ Votes            <chr> "888,938", "956,091", "1,162,234", …
    ## $ Gross_collection <dbl> 936660000, 858370000, 760510000, …
    ## $ Sinopsis         <chr> "As a new threat to the galaxy rises …", …
    ## $ Director         <chr> "Director:J.J. Abrams", …
    ## $ Star             <chr> "     Stars:Daisy Ridley, …", …
    ## $ Gross_equivalent <dbl> 1073412360, 914164050, 940750870, …

------------------------------------------------------------------------

## Data Cleanup

### Step 1 – First column: check uniqueness and remove or assign ID

    col1_name <- names(movies_raw)[1]   # empty string or "X"
    movies_no_first <- movies_raw[, -1]

    if (nrow(distinct(movies_no_first)) == nrow(movies_raw)) {
      message("Rows are unique without the first column → removing it.")
      movies <- movies_no_first
    } else {
      message("Rows are NOT unique without the first column → keeping it as row ID.")
      movies <- movies_raw %>%
        rename(ID = all_of(col1_name))
    }

    ## Rows are unique without the first column → removing it.

### Step 2 – Remove special characters from variable names

    names(movies) <- gsub("[^A-Za-z0-9_]", "_", names(movies))
    names(movies) <- gsub("__+", "_", names(movies))
    names(movies) <- gsub("_$", "", names(movies))
    glimpse(movies)

    ## Rows: 2,934
    ## Columns: 12
    ## $ Title            <chr> "Star Wars: El despertar de la Fuerza", …
    ## $ Release_Year     <int> 2015, 2019, 2009, 2018, …
    ## $ Watchtime        <int> 138, 181, 162, 134, …
    ## $ Genre            <chr> "Action, Adventure, Sci-Fi", …
    ## $ Movie_Rating     <chr> "7.8", "8.4", "7.8", "7.3", …
    ## $ Metascore        <int> 80, 78, 83, 88, …
    ## $ Votes            <chr> "888,938", "956,091", "1,162,234", …
    ## $ Gross_collection <dbl> 936660000, 858370000, 760510000, …
    ## $ Sinopsis         <chr> "As a new threat to the galaxy rises …", …
    ## $ Director         <chr> "Director:J.J. Abrams", …
    ## $ Star             <chr> "     Stars:Daisy Ridley, …", …
    ## $ Gross_equivalent <dbl> 1073412360, 914164050, 940750870, …

### Step 3 – Round numeric values (eliminate decimals)

    movies <- movies %>%
      mutate(
        Votes            = as.numeric(gsub(",", "", Votes)),
        Gross_collection = round(as.numeric(Gross_collection)),
        Gross_equivalent = round(as.numeric(Gross_equivalent))
      )

### Step 4 – Ensure Movie\_Rating is numeric (not a date)

    cat("Current class of Movie_Rating:", class(movies$Movie_Rating), "\n")

    ## Current class of Movie_Rating: character

    if (!is.numeric(movies$Movie_Rating)) {
      movies <- movies %>%
        mutate(Movie_Rating = as.numeric(Movie_Rating))
      cat("Movie_Rating converted to numeric.\n")
    } else {
      cat("Movie_Rating is already numeric – no change needed.\n")
    }

    ## Movie_Rating converted to numeric.

### Step 5 – Disassemble Genre into a list of individual genres

    movies_nested <- movies %>%
      mutate(Genre = strsplit(Genre, ",\\s*")) %>%
      group_by(across(-Genre)) %>%
      nest(genres = Genre) %>%
      ungroup()

    head(movies_nested$genres, 3)

    ## [[1]]
    ## # A tibble: 3 × 1
    ##   Genre
    ##   <chr>
    ## 1 Action
    ## 2 Adventure
    ## 3 Sci-Fi
    ##
    ## [[2]]
    ## # A tibble: 3 × 1
    ##   Genre
    ##   <chr>
    ## 1 Action
    ## 2 Adventure
    ## 3 Drama
    ##
    ## [[3]]
    ## # A tibble: 3 × 1
    ##   Genre
    ##   <chr>
    ## 1 Action
    ## 2 Adventure
    ## 3 Fantasy

------------------------------------------------------------------------

## Data Manipulation

### Best movie: highest combined rating score

    movies <- movies %>%
      mutate(
        Metascore    = as.numeric(Metascore),
        Movie_Rating = as.numeric(Movie_Rating),
        Combined_Score = Movie_Rating + Metascore
      )

    best_movie <- movies %>%
      slice_max(Combined_Score, n = 1) %>%
      select(Title, Release_Year, Movie_Rating, Metascore, Combined_Score)

    print(best_movie)

    ## # A tibble: 1 × 5
    ##   Title              Release_Year Movie_Rating Metascore Combined_Score
    ##   <chr>                     <int>        <dbl>     <dbl>          <dbl>
    ## 1 The Shawshank Redemption   1994          9.3       80             89.3

### Inflation rate per year

    inflation_by_year <- movies %>%
      group_by(Release_Year) %>%
      summarise(
        sum_gross      = sum(Gross_collection, na.rm = TRUE),
        sum_equivalent = sum(Gross_equivalent, na.rm = TRUE),
        .groups = "drop"
      ) %>%
      mutate(
        Inflation_Rate = (sum_equivalent - sum_gross) / sum_gross * 100
      ) %>%
      arrange(Release_Year)

    print(inflation_by_year)

    ## # A tibble: 51 × 4
    ##    Release_Year  sum_gross sum_equivalent Inflation_Rate
    ##           <int>      <dbl>          <dbl>          <dbl>
    ##  1         1970  372430000     2413030000          548.
    ##  2         1971  261160000     1586560000          507.
    ##  3         1972  391840000     2332590000          495.
    ##  4         1973  419790000     2296300000          447.
    ##  5         1974  413190000     2094420000          407.
    ##  6         1975  631300000     3014700000          377.
    ##  7         1976  383160000     1705740000          345.
    ##  8         1977 1043110000     4442130000          326.
    ##  9         1978  622270000     2397590000          285.
    ## 10         1979  755640000     2697470000          257.
    ## # … with 41 more rows

The inflation rates are highest for the oldest years (1970s) because the
dollar has lost significant purchasing power over the decades. As we
approach the present, the inflation rate between nominal and adjusted
gross collections decreases.

------------------------------------------------------------------------

## Data Visualization

### 1. Scatter plot: Movie\_Rating vs. Metascore

    ggplot(movies, aes(x = Movie_Rating, y = Metascore)) +
      geom_point(alpha = 0.4, color = "steelblue") +
      geom_smooth(method = "lm", se = TRUE, color = "firebrick", linewidth = 0.8) +
      labs(
        title   = "Correlation between IMDB Rating and Metascore",
        x       = "IMDB Movie Rating",
        y       = "Metascore",
        caption = "Each point represents one movie; red line shows the linear trend."
      ) +
      theme_minimal()

![Scatter plot of IMDB Movie Rating vs Metascore with a positive linear
trend line.](copilot_files/figure-markdown_strict/viz-scatter-1.png)

**Interpretation:** The scatter plot shows a moderate positive correlation
between the IMDB Movie Rating and the Metascore. Movies with higher IMDB
ratings tend to also receive higher Metascores, indicating that both
rating systems largely agree on movie quality, although there is
considerable spread around the trend line.

### 2. Scatter plot faceted by genre

    movies_unnested <- movies %>%
      mutate(Genre = strsplit(Genre, ",\\s*")) %>%
      unnest(Genre) %>%
      mutate(Genre = str_trim(Genre))

    ggplot(movies_unnested, aes(x = Movie_Rating, y = Metascore)) +
      geom_point(alpha = 0.3, color = "steelblue", size = 0.8) +
      geom_smooth(method = "lm", se = FALSE, color = "firebrick", linewidth = 0.6) +
      facet_wrap(~Genre) +
      labs(
        title = "IMDB Rating vs. Metascore by Genre",
        x     = "IMDB Movie Rating",
        y     = "Metascore"
      ) +
      theme_minimal() +
      theme(strip.text = element_text(size = 7))

![Faceted scatter plots of IMDB Rating vs Metascore, one panel per
genre.](copilot_files/figure-markdown_strict/viz-scatter-facets-1.png)

### 3. Horizontal bar plot: average combined score by director

    director_stats <- movies %>%
      mutate(
        Director = str_remove(Director, "^Directors?:\\s*"),
        Director = str_trim(str_extract(Director, "^[^,]+"))
      ) %>%
      group_by(Director) %>%
      summarise(
        mean_score = mean(Combined_Score, na.rm = TRUE),
        sd_score   = sd(Combined_Score,   na.rm = TRUE),
        n_movies   = n(),
        .groups    = "drop"
      ) %>%
      arrange(mean_score) %>%
      mutate(Director = factor(Director, levels = Director))

    ggplot(director_stats,
           aes(x = mean_score, y = Director)) +
      geom_col(fill = "steelblue", width = 0.7) +
      geom_errorbar(
        aes(xmin = mean_score - sd_score,
            xmax = mean_score + sd_score),
        width = 0.3, color = "gray30"
      ) +
      geom_text(
        aes(label = paste0("n=", n_movies)),
        hjust = -0.2, size = 2.8, color = "gray20"
      ) +
      scale_x_continuous(expand = expansion(mult = c(0, 0.15))) +
      labs(
        title = "Average Combined Score by Director",
        x     = "Average Combined Score (IMDB + Metascore)",
        y     = NULL
      ) +
      theme_minimal() +
      theme(axis.text.y = element_text(size = 7))

![Horizontal bar chart showing average combined score per director with
standard deviation whiskers and movie
counts.](copilot_files/figure-markdown_strict/viz-director-bars-1.png)

------------------------------------------------------------------------

## Optional Tasks

### Highlight a favourite actor's movies in the scatter plot

    favourite_actor <- "Leonardo DiCaprio"

    movies_actor <- movies %>%
      mutate(
        Featured = str_detect(Star, fixed(favourite_actor))
      )

    ggplot(movies_actor, aes(x = Movie_Rating, y = Metascore, color = Featured)) +
      geom_point(alpha = 0.5) +
      scale_color_manual(
        values = c("FALSE" = "gray70", "TRUE" = "tomato"),
        labels = c("Other movies", paste0(favourite_actor, "'s movies"))
      ) +
      geom_smooth(data = filter(movies_actor, !Featured),
                  method = "lm", se = FALSE, color = "gray40", linewidth = 0.6) +
      labs(
        title  = paste("Movies featuring", favourite_actor, "highlighted"),
        x      = "IMDB Movie Rating",
        y      = "Metascore",
        color  = NULL
      ) +
      theme_minimal()

![Scatter plot with Leonardo DiCaprio's movies highlighted in
red.](copilot_files/figure-markdown_strict/viz-actor-highlight-1.png)

### Does a good rating correlate with higher earnings?

    ggplot(movies, aes(x = Gross_equivalent, y = Combined_Score)) +
      geom_point(alpha = 0.3, color = "steelblue") +
      geom_smooth(method = "lm", se = TRUE, color = "firebrick", linewidth = 0.8) +
      scale_x_continuous(labels = scales::label_number(scale = 1e-6, suffix = "M")) +
      labs(
        title   = "Do highly-rated films make more money?",
        x       = "Inflation-adjusted Gross (millions USD)",
        y       = "Combined Score (IMDB + Metascore)",
        caption = "Positive slope would suggest higher-rated films earn more."
      ) +
      theme_minimal()

![Scatter plot of inflation-adjusted gross vs combined score with linear
trend.](copilot_files/figure-markdown_strict/viz-score-vs-gross-1.png)

**Interpretation:** This scatter plot reveals whether critically and
publicly acclaimed movies also tend to be bigger box-office successes. A
weak or moderate positive correlation is expected, but many blockbusters
achieve enormous revenues despite moderate ratings.
