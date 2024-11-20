

library(tidyverse)

# set wd to script file location using rstudio api
rstudioapi::getSourceEditorContext()$path |>
  dirname() |>
  setwd()

"https://github.com/JeffSackmann/tennis_atp/raw/refs/heads/master/atp_matches_qual_chall_2024.csv" |>
  read_csv() |>
  distinct(winner_id, winner_rank) |>
  arrange(winner_id)
  View()
