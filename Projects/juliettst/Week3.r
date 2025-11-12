# Load libraries
library(dplyr)
library(ggplot2)
library(lubridate)
library(tidyr)

# Set path to PV data folder
pv_path <- "./PV"

# List all ZIP files dynamically from the folder
zip_files <- list.files(pv_path, pattern = "*.zip", full.names = TRUE)

# Function to read CSV inside ZIP without extracting
read_pv_csv <- function(zipfile) {
  zname <- unzip(zipfile, list = TRUE)$Name[1]
  df <- read.csv(unz(zipfile, zname), sep = ";", dec = ",", stringsAsFactors = FALSE)
  return(df)
}

# Import all data and combine
pv_data <- lapply(zip_files, read_pv_csv) %>%
  bind_rows() %>%
  mutate(Datum = dmy(DatumNetzeinspeisung.kWh.)) %>%
  select(Datum,
         Netzeinspeisung = Netzeinspeisung..kWh.,
         Netzbezug = Netzbezug..kWh.,
         Speicherung = Speicherung..kWh.,
         PV_Ertrag = PV.Ertrag..kWh.) %>%
  filter(year(Datum) == 2025)

# Data integrity checks and cleaning
# 1. Remove rows with missing values if cannot impute
pv_data <- pv_data %>% drop_na()

# 2. Remove duplicates keeping the one with higher PV_Ertrag
pv_data <- pv_data %>%
  group_by(Datum) %>%
  slice_max(PV_Ertrag, with_ties = FALSE) %>%
  ungroup()

# Calculate additional columns
pv_data <- pv_data %>%
  mutate(
    Eigenverbrauch = PV_Ertrag - Netzeinspeisung - Speicherung,
    Gesamtverbrauch = Eigenverbrauch + Netzbezug,
    Eigenverbrauchsanteil = (Eigenverbrauch / Gesamtverbrauch) * 100
  ) %>%
  arrange(Datum)

# Monthly aggregation and added calculated columns
monthly_summary <- pv_data %>%
  mutate(Monat = month(Datum, label = TRUE, abbr = FALSE)) %>%
  group_by(Monat) %>%
  summarise(
    PV_Ertrag = sum(PV_Ertrag),
    Eigenverbrauch = sum(Eigenverbrauch),
    Gesamtverbrauch = sum(Gesamtverbrauch),
    Netzeinspeisung = sum(Netzeinspeisung),
    Netzbezug = sum(Netzbezug)
  ) %>%
  mutate(
    Stromkosten = Netzbezug * 0.30,
    Einspeisevergütung = Netzeinspeisung * 0.08,
    Einsparungen_Eigenverbrauch = Eigenverbrauch * 0.30,
    Gesamtwirtschaftlichkeit = Einsparungen_Eigenverbrauch + Einspeisevergütung - Stromkosten
  ) %>%
  mutate(across(where(is.numeric), round, 2)) %>%
  arrange(match(Monat, month.name))

# Print monthly summary as markdown table
print(monthly_summary)

# Plot grouped bar chart
library(reshape2)
plot_data <- monthly_summary %>%
  select(Monat, Stromkosten, Einspeisevergütung, Einsparungen_Eigenverbrauch, Gesamtwirtschaftlichkeit) %>%
  mutate(Stromkosten = -Stromkosten) %>%
  melt(id.vars = "Monat", variable.name = "Kategorie", value.name = "Euro")

ggplot(plot_data, aes(x = Monat, y = Euro, fill = Kategorie)) +
  geom_bar(stat = "identity", position = position_stack(reverse = TRUE)) +
  geom_line(data = monthly_summary, aes(x = Monat, y = Gesamtwirtschaftlichkeit, group = 1), color = "purple") +
  theme_minimal() +
  labs(title = "Kosten, Vergütung und Einsparungen pro Monat",
       y = "Euro (€)",
       fill = "Kategorie")

# Yearly summary calculations
total_einsparung <- sum(monthly_summary$Einsparungen_Eigenverbrauch + monthly_summary$Einspeisevergütung)
avg_netzbezug <- mean(pv_data$Netzbezug)
tage_voll_speicher <- sum(pv_data$Speicherung < 0.5) / nrow(pv_data) * 100
tage_überdurchschnittlich <- sum(pv_data$Netzbezug > (avg_netzbezug + sd(pv_data$Netzbezug))) / nrow(pv_data) * 100

yearly_summary <- tibble(
  Amortisierung = round(total_einsparung, 2),
  Durchschnittlicher_Netzbezug_kWh = round(avg_netzbezug, 2),
  Tage_mit_vollem_Speicher_pct = round(tage_voll_speicher, 2),
  Tage_mit_überdurchschnittlichem_Netzbezug_pct = round(tage_überdurchschnittlich, 2)
)

# Print yearly summary as markdown table
print(yearly_summary)

# Pie chart for amortization
library(scales)
investition <- 12000
einsparung_anteil <- total_einsparung * 0.30 / investition
einspeise_anteil <- total_einsparung * 0.08 / investition

pie_data <- data.frame(
  Kategorie = c("Einsparungen durch Eigenverbrauch", "Einspeisevergütung"),
  Wert = c(total_einsparung * 0.30, total_einsparung * 0.08)
)

ggplot(pie_data, aes(x = "", y = Wert, fill = Kategorie)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar(theta = "y") +
  theme_void() +
  geom_text(aes(label = scales::percent(Wert / sum(Wert), accuracy = 0.1)),
            position = position_stack(vjust = 0.5)) +
  labs(title = "Amortisierung der PV-Anlage 2025") +
  scale_fill_manual(values = c("pink", "purple"))
