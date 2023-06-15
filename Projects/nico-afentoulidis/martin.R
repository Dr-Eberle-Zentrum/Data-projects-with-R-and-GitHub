
data <-
  read_csv2("ZA7848_v1-0-0.csv") |>
  # drop obsolete columns
  select( isocntry, country, matches("qd3_[1234568]")) |>
  # joining germany
  mutate(isocntry = str_sub(isocntry,1,2)) |>
  # drop strange entries
  mutate(across(everything(), \(x)ifelse(str_detect(x,"Inap."),NA, x))) |>
  mutate(across(everything(), \(x)ifelse(str_detect(x,"SPONTANEOUS"),NA, x))) |>
  # make numbers
  mutate(across(starts_with("qd3_"), strtoi)) |>
  # make tidy long format
  pivot_longer(starts_with("qd3"), names_to = "question") |>
  mutate(question = factor(question) |>
           fct_recode(
             "TV" = "qd3_1",
             "TV via Internet" = "qd3_2",
             "Radio" = "qd3_3",
             "Podcast" = "qd3_4",
             "Written press" = "qd3_5",
             "Internet" = "qd3_6",
             "Social media" = "qd3_8"
           )) |>
  # drop missing data
  drop_na() %>%
  # get statistics
  group_by(isocntry,question) %>%
  summarize(meanValue = mean(value), .groups = "drop")


# setting up geographic data
library(eurostat)
library(sf)

SHP_0 <- get_eurostat_geospatial(resolution = 10,
                                 nuts_level = 0,
                                 year = 2016)

EU27 <- eu_countries %>%
  dplyr::filter(code != "UK") %>%
  select(isocntry = code, name)

SHP_27 <- SHP_0 %>%
  select(isocntry = NUTS_ID, geometry) %>%
  inner_join(EU27, by = "isocntry") %>%
  arrange(isocntry) %>%
  st_as_sf()

# merging both data sets

data %>%
  inner_join(SHP_27, by = "isocntry") %>%
  st_as_sf() |>
  # filter(question=="qd3_1") |>
  ggplot(aes(fill=meanValue)) +
  geom_sf() +
  scale_x_continuous(limits = c(-10, 35)) +
  scale_y_continuous(limits = c(35, 75)) +
  theme_void() +
  facet_wrap(~question)
