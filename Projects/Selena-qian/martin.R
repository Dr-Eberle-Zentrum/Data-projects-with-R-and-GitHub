

library(tidyverse)

# set wd to script file location using rstudio api
rstudioapi::getSourceEditorContext()$path |>
  dirname() |>
  setwd()

# library(countrycode)
# identify respective flag for a given column of country names
country2flag <- function(country) {
  country[[1]] |>
    countrycode::countrycode("country.name", "iso2c") |>
    str_to_lower() |>
    map(~str_c("<img src='https://raw.githubusercontent.com/hampusborgos/country-flags/refs/heads/main/png250px/",.,".png' width='20' />")) |>
    paste(country[[1]], " - <img src='https://raw.githubusercontent.com/hampusborgos/country-flags/refs/heads/main/png250px/eu.png' width='20' />") |>
    as_tibble_col(column_name = "title")
}

data <- read_csv("lang_known.csv.gz")

data |>
  dplyr::filter( age == "From 18 to 69 years",
          TIME_PERIOD == 2022,
          isced11 == "All ISCED 2011 levels",
          geo %in% c("Germany","Austria","France","Netherlands","European Union - 27 countries (from 2020)")) |>
  # shorten country names
  mutate( geo = ifelse(geo=="European Union - 27 countries (from 2020)","EU27",geo)) |>
  # cleanup number of languages
  mutate( n_lang = str_sub(n_lang,1,1) |> as.integer()) |>
  replace_na(list(n_lang = 0)) |>
  mutate( n_lang = ifelse(n_lang==3,"3+",n_lang)) |>
  group_by(n_lang) |>
  # add column obsEU with EU27 value per n_lang group
  mutate( obsEU = ifelse(geo=="EU27",OBS_VALUE,NA)) |>
  arrange(obsEU) |>
  fill(obsEU) |>
  # compute deviation
  mutate( deviation = OBS_VALUE - obsEU) |>
  ungroup() |>
  # drop EU27
  dplyr::filter(geo != "EU27") |>
  # plot barplot with facet per geo
  ggplot(aes(x = n_lang, y = deviation, fill = deviation)) +
  geom_bar(stat = "identity") +
  labs(x = "Number of known languages",
       y = "Difference to EU27 average [%]") +
  # disable fill legend
  guides(fill = FALSE) +
  # use gradient fill scale from blue to red
  scale_fill_gradient2(high = "blue", low = "red") +
  # dotted line at y=0
  geom_hline(yintercept = 0, linetype = "dotted") +
  ylim(-30,35)+
  # add value labels above or below bars
  geom_text(aes(label = round(deviation,1),
                vjust = ifelse(deviation > 0, -0.5, 1.5))) +
  theme_minimal() +
# country flags
# https://umairdurrani.com/posts/images_in_facets/images_in_facets
  facet_wrap(~geo, labeller = country2flag) + # set flag image as facet label
  theme(
    strip.text.x = ggtext::element_markdown() # ensure rendering of flags
  )


