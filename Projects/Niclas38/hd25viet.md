# Load Packages

    library(tidyverse)

    ## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ## ✔ dplyr     1.1.4     ✔ readr     2.1.5
    ## ✔ forcats   1.0.0     ✔ stringr   1.5.1
    ## ✔ ggplot2   3.5.1     ✔ tibble    3.2.1
    ## ✔ lubridate 1.9.4     ✔ tidyr     1.3.1
    ## ✔ purrr     1.0.4     
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()
    ## ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

    library(readxl)
    library(purrr)
    library(ggrepel)

# Load Data and Data Wrangling

    data_raw <- read_csv("movies.csv")

    ## Rows: 9999 Columns: 9
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr (6): MOVIES, YEAR, GENRE, ONE-LINE, STARS, Gross
    ## dbl (2): RATING, RunTime
    ## num (1): VOTES
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

    # Data Wrangling
    data_cleaned <- data_raw %>% 
      mutate(
        # Remove \n and clean whitespace
        across(where(is.character), ~ str_squish(str_remove_all(., "^\\n"))),

        # Clean year column
        YEAR = str_squish(str_remove_all(YEAR, "[()]")),

        # Extract start and end years
        Start = as.numeric(str_extract(YEAR, "\\d{4}")),
        End = as.numeric(str_extract(YEAR, "(?<=[–-])\\d{4}")),
        End = case_when(
          str_detect(YEAR, "[-–]\\s*$") ~ 2022L,  # TV show still running
          is.na(End) ~ Start,                    # single-year entries
          TRUE ~ End
        ),

        # Expand years as list-column (Start:End)
        Year_List = map2(Start, End, ~ if (!is.na(.x)) .x:.y else NA_integer_),

        # Clean and split STARS and GENRE into list-columns
        STARS = str_split(str_extract(STARS, "(?<=Stars: ).*"), ",\\s*"),
        GENRE = str_split(as.factor(GENRE), ",\\s*"),

        # Parse votes and gross
        VOTES = as.numeric(VOTES),
        Gross = parse_number(Gross)
      ) %>%
      unnest(Year_List) %>%                   # one row per year
      select(-YEAR, -Start, -End) %>% 
      rename(YEAR = Year_List) %>% 
      select(MOVIES, GENRE, RATING, STARS, VOTES, Gross,YEAR) %>% 
      glimpse()

    ## Rows: 25,827
    ## Columns: 7
    ## $ MOVIES <chr> "Blood Red Sky", "Masters of the Universe: Revelation", "Master…
    ## $ GENRE  <list> <"Action", "Horror", "Thriller">, <"Animation", "Action", "Adv…
    ## $ RATING <dbl> 6.1, 5.0, 5.0, 8.2, 8.2, 8.2, 8.2, 8.2, 8.2, 8.2, 8.2, 8.2, 8.2…
    ## $ STARS  <list> <"Peri Baumeister", "Carl Anton Koch", "Alexander Scheer", "Ka…
    ## $ VOTES  <dbl> 21062, 17870, 17870, 885805, 885805, 885805, 885805, 885805, 88…
    ## $ Gross  <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
    ## $ YEAR   <int> 2021, 2021, 2022, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 201…

    # Consistency Check
    data_cleaned %>% 
      filter(MOVIES=="The Walking Dead")

    ## # A tibble: 13 × 7
    ##    MOVIES           GENRE     RATING STARS      VOTES Gross  YEAR
    ##    <chr>            <list>     <dbl> <list>     <dbl> <dbl> <int>
    ##  1 The Walking Dead <chr [3]>    8.2 <chr [4]> 885805    NA  2010
    ##  2 The Walking Dead <chr [3]>    8.2 <chr [4]> 885805    NA  2011
    ##  3 The Walking Dead <chr [3]>    8.2 <chr [4]> 885805    NA  2012
    ##  4 The Walking Dead <chr [3]>    8.2 <chr [4]> 885805    NA  2013
    ##  5 The Walking Dead <chr [3]>    8.2 <chr [4]> 885805    NA  2014
    ##  6 The Walking Dead <chr [3]>    8.2 <chr [4]> 885805    NA  2015
    ##  7 The Walking Dead <chr [3]>    8.2 <chr [4]> 885805    NA  2016
    ##  8 The Walking Dead <chr [3]>    8.2 <chr [4]> 885805    NA  2017
    ##  9 The Walking Dead <chr [3]>    8.2 <chr [4]> 885805    NA  2018
    ## 10 The Walking Dead <chr [3]>    8.2 <chr [4]> 885805    NA  2019
    ## 11 The Walking Dead <chr [3]>    8.2 <chr [4]> 885805    NA  2020
    ## 12 The Walking Dead <chr [3]>    8.2 <chr [4]> 885805    NA  2021
    ## 13 The Walking Dead <chr [3]>    8.2 <chr [4]> 885805    NA  2022

# Visualization

    # Combine RATING and VOTES
    genre_scores <- data_cleaned %>%
      filter(!is.na(RATING), !is.na(VOTES)) %>%
      unnest(GENRE) %>%
      group_by(GENRE, YEAR) %>%
      summarise(
        mean_rating = mean(RATING, na.rm = TRUE),
        mean_votes = sum(VOTES, na.rm = TRUE),
        .groups = "drop"
      ) %>%
      filter(!is.na(GENRE))

    # Normalize votes within each year to [0, 1] scale
    genre_scores <- genre_scores %>%
      group_by(GENRE) %>%
      mutate(norm_votes = 10*mean_votes/max(mean_votes)) %>%
      ungroup()

    # Make long format: one column for metric type (rating or votes)
    genre_long <- genre_scores %>%
      pivot_longer(cols = c(mean_rating, norm_votes),
                   names_to = "metric",
                   values_to = "value")

It is not quite clear how to interprete “votes” as laymen ratings since
“votes” reflect the amount of IMDb voting submissions by the users.
Thus, “votes” rather reflects the general popularity of a genre of a
specfic year. I normalized by the maximal amount of voting submission
per year and genre with 10 corresponding to the most popular year of the
genre.

    # Plot with facets and no legend
    ggplot(genre_long, aes(x = YEAR, y = value, color = metric)) +
      geom_line(alpha=0.5, linewidth = 0.8) +
      geom_point(size=0.3)+
      facet_wrap(~ GENRE, scales = "fixed", ncol = 4) + 
      labs(
        title = "IMDb Rating vs Normalized Audience Votes by Genre",
        subtitle = "Normalized votes (per year) and average IMDb rating over time",
        x = "Year",
        y = "Value",
        color = "Metric"
      ) +
      theme_minimal()+
      theme(
        legend.position = c(0.93, 0),            # bottom right (x from left, y from bottom)
        legend.justification = c("right", "bottom"),
        legend.title = element_text(size = 8),
        legend.text = element_text(size = 7),
        legend.key.size = unit(0.5, "cm")
      )

    ## Warning: A numeric `legend.position` argument in `theme()` was deprecated in ggplot2
    ## 3.5.0.
    ## ℹ Please use the `legend.position.inside` argument of `theme()` instead.
    ## This warning is displayed once every 8 hours.
    ## Call `lifecycle::last_lifecycle_warnings()` to see where this warning was
    ## generated.

![](hd25viet_files/figure-markdown_strict/Plot%20of%20votes%20and%20rating-1.png)
I emphasize that this plot using facetting gives much more insights
about trends then the suggested plot containing all genres.

    actor_stats <- data_cleaned %>%
      filter(!is.na(RATING)) %>%
      unnest(STARS) %>%
      filter(!is.na(STARS)) %>%
      group_by(STARS) %>%
      summarise(
        appearances = n(),
        avg_rating = mean(RATING, na.rm = TRUE),
        .groups = "drop"
      ) %>%
      arrange(desc(avg_rating))

    actor_stats %>% filter(appearances>10) %>% head(20)

    ## # A tibble: 20 × 3
    ##    STARS                    appearances avg_rating
    ##    <chr>                          <int>      <dbl>
    ##  1 Dietrich Hollinderbäumer          12       9.43
    ##  2 Ian James Corlett                 15       9.3 
    ##  3 Louis Hofmann                     44       9.24
    ##  4 Maja Schöne                       12       9.23
    ##  5 Andreas Pietschmann               16       9.2 
    ##  6 Lisa Vicari                       33       9.2 
    ##  7 Amybeth McNulty                   30       9.18
    ##  8 Geraldine James                   30       9.18
    ##  9 R.H. Thomson                      30       9.18
    ## 10 Cavan Clerkin                     16       9.15
    ## 11 Ahmet Mümtaz Taylan               11       9.1 
    ## 12 Finn Elliot                       32       9.05
    ## 13 Ali Atay                          12       9.04
    ## 14 Rena Anakwe                       25       9.04
    ## 15 Alexander Dreymon                 56       9.01
    ## 16 Emily Cox                         16       9   
    ## 17 Ewan Mitchell                     16       9   
    ## 18 Jakob Diehl                       12       9   
    ## 19 Mark Rowley                       24       9   
    ## 20 Arnas Fedaravicius                32       8.98

    top_actors <- actor_stats %>%
      slice_max(appearances, n = 100)



    top5 <- top_actors %>%
      mutate(score = avg_rating * log1p(appearances)) %>%
      slice_max(score, n = 5)

Funnily, the guy from the ZDF heute-Show representing “Ulrich von
Heesen” has the highest rating if restricted to &gt;10 appearences.

    ggplot(top_actors, aes(x = appearances, y = avg_rating)) +
      geom_point(color = "steelblue", alpha = 0.7) +
      geom_text_repel(
        data = top5,
        aes(label = STARS),
        size = 3,
        box.padding = 0.4,
        point.padding = 0.3,
        segment.color = "grey50",
        max.overlaps = Inf
      ) +
      labs(
        title = "Actor Performance: Appearances vs. IMDb Rating",
        subtitle = "Top 100 most active actors",
        x = "Number of Movies/Shows",
        y = "Average IMDb Rating"
      ) +
      theme_minimal()

![](hd25viet_files/figure-markdown_strict/Plot%20top%20actors-1.png) The
upper cluster are all “Dexter” actors.
