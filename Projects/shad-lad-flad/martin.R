

library(tidyverse)

# set wd to script file location using rstudio api
rstudioapi::getSourceEditorContext()$path |>
  dirname() |>
  setwd()

library(readxl)

"wows_playerbase_data.xlxs" |>
  read_excel() |>
  View()
