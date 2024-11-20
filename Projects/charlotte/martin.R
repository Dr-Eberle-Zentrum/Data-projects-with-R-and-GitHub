

library(tidyverse)

# set wd to script file location using rstudio api
rstudioapi::getSourceEditorContext()$path |>
  dirname() |>
  setwd()

"https://www.landesdatenbank.nrw.de/ldbnrwws/downloader/00/tables/21331-02i_00.csv" |>
  read_delim(delim = ";", skip = 5, locale = locale(encoding="latin1")) |>
  rename(Semester=1, Uni=2) |>
  filter(str_detect(Semester,"^WS")) |>
  mutate(Uni=str_trim(Uni)) |>
  distinct(Uni)
