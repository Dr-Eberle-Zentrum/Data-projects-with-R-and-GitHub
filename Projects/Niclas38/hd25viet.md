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
      mutate(
            # Clean and split STARS and GENRE into list-columns
        STARS = str_split(str_extract(STARS, "(?<=Stars: ).*"), ",\\s*"),
        GENRE = str_split(as.factor(GENRE), ",\\s*")) %>% 
      # Merge duplicated movie entries
      summarize(
        STARS = list(unique(unlist(STARS))),  # take all stars from duplicates
        RATING = mean(RATING, na.rm = TRUE),
        VOTES = sum(VOTES, na.rm = TRUE),
        GENRE = list(unique(unlist(GENRE))),  # take all genres from duplicates
        Gross = sum(Gross, na.rm = TRUE), # often NA, but sum in case
        .groups = "drop"
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
      drop_na(GENRE) %>% 
    # Normalize votes within each year to [0, 1] scale
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

![](hd25viet_files/figure-markdown_strict/Plot%20of%20votes%20and%20rating-1.png)
I emphasize that this plot using facetting gives much more insights
about trends then the suggested plot containing all genres.

    actor_stats <- data_cleaned %>%
      drop_na(RATING) %>%
      unnest(STARS) %>%
      drop_na(STARS) %>%
      group_by(STARS) %>%
      summarise(
        appearances = n(),
        avg_rating = mean(RATING, na.rm = TRUE),
        .groups = "drop"
      ) %>%
      arrange(desc(avg_rating))

    actor_stats %>% 
      slice_max(avg_rating, n=10) %>% 
      knitr::kable()

<table>
<thead>
<tr class="header">
<th style="text-align: left;">STARS</th>
<th style="text-align: right;">appearances</th>
<th style="text-align: right;">avg_rating</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">Anna Gunn</td>
<td style="text-align: right;">6</td>
<td style="text-align: right;">9.40000</td>
</tr>
<tr class="even">
<td style="text-align: left;">Betsy Brandt</td>
<td style="text-align: right;">6</td>
<td style="text-align: right;">9.40000</td>
</tr>
<tr class="odd">
<td style="text-align: left;">André Sogliuzzo</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">9.30000</td>
</tr>
<tr class="even">
<td style="text-align: left;">Neil deGrasse Tyson</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">9.30000</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Piotr Michael</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">9.30000</td>
</tr>
<tr class="even">
<td style="text-align: left;">Stoney Emshwiller</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">9.30000</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Andreas Pietschmann</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">9.25625</td>
</tr>
<tr class="even">
<td style="text-align: left;">Anne Ratte-Polle</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">9.25625</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Antje Traue</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">9.25625</td>
</tr>
<tr class="even">
<td style="text-align: left;">Arnd Klawitter</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">9.25625</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Axel Werner</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">9.25625</td>
</tr>
<tr class="even">
<td style="text-align: left;">Barbara Nüsse</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">9.25625</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Carlotta von Falkenhayn</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">9.25625</td>
</tr>
<tr class="even">
<td style="text-align: left;">Claude Heinrich</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">9.25625</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Daan Lennard Liebrenz</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">9.25625</td>
</tr>
<tr class="even">
<td style="text-align: left;">Dietrich Hollinderbäumer</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">9.25625</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Hans Diehl</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">9.25625</td>
</tr>
<tr class="even">
<td style="text-align: left;">Helena Pieske</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">9.25625</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Jakob Diehl</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">9.25625</td>
</tr>
<tr class="even">
<td style="text-align: left;">Joshio Marlon</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">9.25625</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Julika Jenkins</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">9.25625</td>
</tr>
<tr class="even">
<td style="text-align: left;">Jördis Triebel</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">9.25625</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Karoline Eichhorn</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">9.25625</td>
</tr>
<tr class="even">
<td style="text-align: left;">Lisa Kreuzer</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">9.25625</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Louis Hofmann</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">9.25625</td>
</tr>
<tr class="even">
<td style="text-align: left;">Luise Heyer</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">9.25625</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Maja Schöne</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">9.25625</td>
</tr>
<tr class="even">
<td style="text-align: left;">Mark Waschke</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">9.25625</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Moritz Jahn</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">9.25625</td>
</tr>
<tr class="even">
<td style="text-align: left;">Nina Kronjäger</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">9.25625</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Paul Lux</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">9.25625</td>
</tr>
<tr class="even">
<td style="text-align: left;">Sandra Borgmann</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">9.25625</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Sebastian Rudolph</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">9.25625</td>
</tr>
<tr class="even">
<td style="text-align: left;">Stephan Kampwirth</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">9.25625</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Tom Philipp</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">9.25625</td>
</tr>
</tbody>
</table>

    top_actors <- actor_stats %>%
      slice_max(appearances, n = 100)


    top5 <- top_actors %>%
      mutate(score = avg_rating * log(appearances)) %>%
      slice_max(score, n = 5)

[Anna Gunn](https://en.wikipedia.org/wiki/Anna_Gunn) as top actoress
with more then 5 appearances is known for the role of Skyler White in
Breaking Bad.

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
