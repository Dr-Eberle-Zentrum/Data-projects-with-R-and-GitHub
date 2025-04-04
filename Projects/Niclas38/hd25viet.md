# Load Packages

# Load Data and Data Wrangling

    setwd( this.path::this.dir() )

    data_raw <- read_csv("movies.csv")

    # Data Wrangling
    data_cleaned <- data_raw %>% 
      mutate(
        # Remove \n and clean whitespace
        across(where(is.character), ~ str_squish(str_remove_all(., "^\\n"))),

        # Clean year column
        MOVIES = as.factor(MOVIES),
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

        # Parse votes and gross
        VOTES = as.numeric(VOTES),
        Gross = parse_number(Gross)
      ) %>%
      unnest(Year_List) %>%                   # one row per year
      select(-YEAR, -Start, -End) %>% 
      rename(YEAR = Year_List) %>% 
      select(MOVIES, GENRE, RATING, STARS, VOTES, Gross,YEAR) %>% 
      group_by(MOVIES, YEAR) %>%
      # Merge duplicated movie entries
      summarize(
        RATING = mean(RATING, na.rm = TRUE),
        VOTES = sum(VOTES, na.rm = TRUE),
        GENRE = first(GENRE),           # assuming Genre is same for all
        STARS = first(STARS),           # same logic
        Gross = sum(Gross, na.rm = TRUE), # often NA, but sum in case
        .groups = "drop"
      ) %>%
      mutate(
            # Clean and split STARS and GENRE into list-columns
        STARS = str_split(str_extract(STARS, "(?<=Stars: ).*"), ",\\s*"),
        GENRE = str_split(as.factor(GENRE), ",\\s*"),
      )

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
    ##  1 Ahmet Mümtaz Taylan               11       9.1 
    ##  2 Ali Atay                          12       9.04
    ##  3 Serkan Keskin                     12       8.96
    ##  4 Courteney Cox                     11       8.9 
    ##  5 Beatrice Robertson-Jones          12       8.8 
    ##  6 Curt Morgan                       11       8.8 
    ##  7 Daniel Lapaine                    12       8.8 
    ##  8 Ford Kiernan                      18       8.8 
    ##  9 Gavin Mitchell                    18       8.8 
    ## 10 Greg Hemphill                     18       8.8 
    ## 11 Mark Landvik                      11       8.8 
    ## 12 Paul Riley                        18       8.8 
    ## 13 Scotty Lago                       11       8.8 
    ## 14 Travis Rice                       11       8.8 
    ## 15 Martin Freeman                    19       8.79
    ## 16 Lisa Kudrow                       12       8.72
    ## 17 Adrian Dunbar                     11       8.7 
    ## 18 Isaac Hayes                       26       8.7 
    ## 19 Luca De Castro                    13       8.7 
    ## 20 Maira Kesten                      13       8.7

    top_actors <- actor_stats %>%
      slice_max(appearances, n = 100)



    top5 <- top_actors %>%
      mutate(score = avg_rating * log1p(appearances)) %>%
      slice_max(score, n = 5)

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

![](hd25viet_files/figure-markdown_strict/Plot%20top%20actors-1.png)

Note: In the previous version, several duplicated entries were present
coming from redundant entries at IMDB. They are now merged. As a
consistency check the threshold of 95 appearances seems to be reasonable
for one actor. In particular, note that [Johnny Yong
Bosch](https://en.wikipedia.org/wiki/Johnny_Yong_Bosch) works also as a
voice actor.
