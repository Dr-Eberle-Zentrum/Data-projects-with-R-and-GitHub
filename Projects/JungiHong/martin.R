

library(tidyverse)

# set wd to script file location using rstudio api
rstudioapi::getSourceEditorContext()$path |>
  dirname() |>
  setwd()

library(readxl)

"Volleyball Passing- USA and TU.xlsx" |>
  read_excel() |>
  View()
