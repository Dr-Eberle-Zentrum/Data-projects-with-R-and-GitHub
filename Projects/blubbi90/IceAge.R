library(tidyverse)

IceAge <- read_csv("https://ourworldindata.org/uploads/2022/09/Mammal-comeback-in-Europe-data-OWID-download.csv", locale = locale(encoding = "ISO-8859-1"))%>%  # Use Latin1 for import ô 
  slice_head(n = 5)
view(IceAge)
