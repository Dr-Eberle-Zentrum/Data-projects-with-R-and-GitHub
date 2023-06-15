

library(tidyverse)

data <- read_csv(file = "herzog.csv") |>
  select(2) |>
  rename(word = 1)

data |>
  mutate(word = str_to_lower(word, locale="de")) |>
  group_by(word) |>
  count() |>
  filter( !str_detect(word, "^(&|\\s|[:punct:]|\\d|\\$)")) |>
  filter( !(word %in% stopwords("de")) ) |>
  arrange(desc(n))
