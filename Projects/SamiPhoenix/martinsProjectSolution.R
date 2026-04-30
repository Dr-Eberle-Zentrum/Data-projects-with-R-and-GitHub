library(tidyverse)


folder_path <- "~/Data-projects-with-R-and-GitHub/Projects/martin-raden/PV/"

zip_files <- list.files(folder_path, pattern = "\\.zip$", full.names = TRUE)

big_data <- read_csv2(zip_files,
                      skip = 1,
                      col_names = FALSE,
                      col_types = cols(X1 = col_date(format = "%d.%m.%Y")),
                      col_select = c(1:5)
)


colnames(big_data) = c("Datum", "Netzeinspeisung [kWh]", "Netzbezug [kWh]", "Speicherung [kWh]", "PV Ertrag [kWh]")

big_data <- big_data |> 
  group_by(Datum) |> 
  arrange(`PV Ertrag [kWh]`) |> 
  slice(1) |> 
  arrange(Datum) |> 
  mutate("Eigenverbrauch [kWh]" = `PV Ertrag [kWh]` - `Netzeinspeisung [kWh]` - `Speicherung [kWh]`) |> 
  mutate("Gesamtverbrauch [kWh]" = `Eigenverbrauch [kWh]` + `Netzbezug [kWh]`) |> 
  mutate("Eigenverbrauchsanteil [%]" = (`Eigenverbrauch [kWh]` / `Gesamtverbrauch [kWh]`) * 100)

