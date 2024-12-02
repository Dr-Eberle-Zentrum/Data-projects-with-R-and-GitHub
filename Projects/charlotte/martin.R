

library(tidyverse)

# set wd to script file location using rstudio api
rstudioapi::getSourceEditorContext()$path |>
  dirname() |>
  setwd()

"https://www.landesdatenbank.nrw.de/ldbnrwws/downloader/00/tables/21331-02i_00.csv" |>
  # read from web
  # skip header
  # ensure encoding
  # Handle missing data
  read_delim(delim = ";", skip = 5,
             na = c("-"),
             locale = locale(encoding="latin1")) |>
  # Name the columns
  rename(Semester=1, Uni=2) |>
  # Clean the end of the table
  filter(str_detect(Semester,"^WS")) |>
  # Extract hierarchy from leading spaces
  mutate(indent = str_length(str_extract(Uni, "^\\s*")) / 2) |>
  # Remove leading spaces
  mutate(Uni=str_trim(Uni)) |>
  # reduce to unis of interest
  filter(Uni %in% str_c("Universität ",c("Bielefeld","Bochum","Bonn"))) |>
  # add summed values per semester
  pivot_wider(names_from = Uni, values_from = c(Insgesamt, männlich, weiblich)) %>%
  mutate("Insgesamt_Unis ges." = rowSums(select(., contains("Insgesamt")), na.rm = TRUE)) %>%
  mutate("männlich_Unis ges." = rowSums(select(., contains("männlich")), na.rm = TRUE)) %>%
  mutate("weiblich_Unis ges." = rowSums(select(., contains("weiblich")), na.rm = TRUE)) |>
  pivot_longer(cols = contains("_"), names_to = c("Category","Uni"), names_sep = "_") |>
  filter(Category == "Insgesamt") |>
  mutate(sem = str_extract(Semester, "\\d+") |> as.integer()) |>
  ggplot(aes(x=sem, y=value, shape=Uni, col=Uni=="Unis ges.")) +
  geom_line() +
  geom_point(size=3) +
  labs( x = "Wintersemester",
        y = "Anzahl Studierende",
        title = "Studierende an Unis in NRW",
        caption = "Datenquelle: Landesdatenbank NRW") +
  # add "Uni" label at the last data point
  geom_text(data = . %>% filter(sem == max(sem)), aes(label = Uni), hjust = 0, nudge_x = 0.3) +
  xlim(2007,2026)+
  guides(col = FALSE, shape = FALSE) +
  theme_minimal()
