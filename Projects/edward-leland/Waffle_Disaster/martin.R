

library(tidyverse)

# set working directory to source file location
library(this.path)
setwd(this.path::here())

# coordinate system and plotting
library(usmap)
library(sf)

# read waffle house data from web
library(rvest)
store_data <-
  read_html("https://locations.wafflehouse.com" ) |>
  html_element("script#__NEXT_DATA__") |>
  html_text() |>
  jsonlite::fromJSON() |>
  purrr::pluck("props", "pageProps", "locations") |>
  unnest(addressLines) |>
  unnest(custom) |>
  as_tibble() |>
  ######################
  # preprocessing
  ######################
  # correct naming
  rename(status=`_status`) |>
  # copy coordinate data
  mutate(x=longitude,y=latitude) |>
  # transform coordinate data for usmap package usage
  sf_transform_xy(target_crs = 2163, source_crs=4326)

# plot it
plot_usmap() +
  geom_point(data= store_data,
             mapping=aes(x,y,col=status),
             size=2)
