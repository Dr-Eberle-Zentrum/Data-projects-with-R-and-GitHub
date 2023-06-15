

read_csv2("ZA7848_v1-0-0.csv") |>
  # drop obsolete columns
  select( isocntry, country, starts_with("qd3_")) |>
  # drop strange entries
  mutate(across(everything(), \(x)ifelse(str_detect(x,"Inap."),NA, x))) |>
  mutate(across(everything(), \(x)ifelse(str_detect(x,"SPONTANEOUS"),NA, x))) |>
  # make numbers
  mutate(across(starts_with("qd3_"), strtoi)) |>
  # make tidy long format
  pivot_longer(starts_with("qd3"), names_to = "question") |>
  # drop missing data
  drop_na() %>%
  # get statistics
  group_by(isocntry,question) %>%
  summarize(meanValue = mean(value), .groups = "drop")
