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
  mutate("Eigenverbrauchsanteil [%]" = (`Eigenverbrauch [kWh]` / `Gesamtverbrauch [kWh]`) * 100) |> 
  mutate("Monat" = Datum)

big_data$Monat <- format(as.Date(big_data$Monat, format="%d/%m/%Y"), "%m")
# month() and months()

table <- big_data |> 
  group_by(Monat) |> 
  mutate("PV Ertrag [kWh]" = sum(`PV Ertrag [kWh]`)) |> 
  mutate("Gesamtverbrauch [kWh]" = sum(`Gesamtverbrauch [kWh]`)) |> 
  mutate("Eigenverbrauch [kWh]" = sum(`Eigenverbrauch [kWh]`)) |> 
  mutate("Netzeinspeisung [kWh]" = sum(`Netzeinspeisung [kWh]`)) |> 
  mutate("Netzbezug [kWh]" = sum(`Netzbezug [kWh]`)) |>
  select(-c("Eigenverbrauchsanteil [%]", "Speicherung [kWh]")) |> 
  slice(1) |> 
  mutate("Stromkosten [€]" = `Netzbezug [kWh]` * 0.30) |> 
  mutate("Einspeisevergütung [€]" = `Netzeinspeisung [kWh]` * 0.08) |> 
  mutate("Einsparungen durch Eigenverbrauch [€]" = `Eigenverbrauch [kWh]` * 0.30) |> 
  mutate("Gesamtwirtschaftlichkeit [€]" =
           `Einsparungen durch Eigenverbrauch [€]` + `Einspeisevergütung [€]` - `Stromkosten [€]`) |> 
  ungroup()

table[8:11] <- round(table[8:11], 2)

table$Monat <- as.numeric(table$Monat)

table$Monat <- factor(table$Monat,
                      levels = 1:12,
                      labels = c("Januar", "Februar", "März", "April",
                                 "Mai", "Juni", "Juli", "August",
                                 "September", "Oktober", "November", "Dezember"))

table$`Stromkosten [€]` <- table$`Stromkosten [€]` * -1


table_long <- table %>%
  pivot_longer(
    cols = c(`Einspeisevergütung [€]`, `Einsparungen durch Eigenverbrauch [€]`, `Stromkosten [€]`),
    names_to = "Variable",
    values_to = "Euro"
  )

table_line <- table_long

ggplot(table_long, aes(x = Monat, y = Euro, fill = Variable)) +
  geom_col() +
  geom_hline(yintercept = 0, linetype = "solid", color = "black")

# Das ganze hat schon mindestens 4 Stunden in Anspruch genommen (Hat aber spaß gemacht, und ich hab keine AI benutzt bis auf die Visualisierung)
# Demnach höre ich hier auf
  



