
library(tidyverse)

# read the tables directly from the archive.zip
fileData <- list()
for ( file in c("drivers","constructors","results","races")) {
  fileData[[file]] <- read_csv( unz("archive.zip",str_c(file,".csv")) )
}


# reduce to winners
winners <-
  fileData$results |>
  # get winner per race
  group_by(raceId) |>
  slice_min(position) |>
    ungroup() |>
  # reduce to central information
  select(raceId, driverId, constructorId) |>
  # add needed race information
  left_join( by="raceId",
             fileData$races |> select(raceId, year)
    ) |>
  # reduce to time range of interest
  filter(between(year, 2000,2020)) |>
  # add needed constructor information
  left_join( by="constructorId",
             fileData$constructors |> select(constructorId, name)
  ) |>
  # rename to avoid variable name clashes
  rename( constructor = name) |>
  # add needed driver information
    left_join( by="driverId",
              fileData$drivers |>  select(driverId,forename, surname, nationality, url)
    ) |>
  # drop id variables, since not needed anymore
    select(-raceId, -constructorId, -driverId) |>
  # aggregate winning information per driver and constructor
    group_by( url, forename, surname, nationality, constructor) |>
    summarize( constructorWins = n(),
               constructorYears = str_c(unique(year) |> sort(),collapse=","),
               .groups = "drop") |>
  # aggregate overall winning information per driver
    group_by(url) |>
    mutate(wins = sum(constructorWins),
           name = paste(forename, surname)
           ) |>
    ungroup() |>
    arrange(desc(wins)) |>
  # compress data to extract top ten based on overall winning information
  nest(.by=c(url,wins)) |>
  slice_max(wins, n=10) |>
  # uncompress data
  unnest(cols = data) |>
  # compute number of wins per constructor in final subset
  group_by(constructor) |>
  mutate(winsOfConstructor = sum(constructorWins)) |>
  ungroup()

# get formula one font working
library(showtext)
font_add("formulaone",regular = "Formula1-Bold_web_0.ttf")
showtext_auto()

# plotting
winners |>
  ggplot(aes(x=fct_reorder(name,wins),
             y=constructorWins,
             # order color legend by cummulative wins per constructor
             fill=fct_reorder(constructor,-winsOfConstructor))) +
  geom_bar(stat = "identity") +
  coord_flip() +
  theme_minimal()+
  theme(
    # enable new font
    text = element_text(family = "formulaone", colour = "white"),
    axis.text = element_text(family = "formulaone", colour = "white"),
    # drop y axis label
    axis.title.y = element_blank(),
      plot.background = element_rect(fill = "darkgray"),
    legend.background = element_rect(fill = "darkgray")
  ) +
  labs(
    fill = "constructor",
    y = "races won"
  )
