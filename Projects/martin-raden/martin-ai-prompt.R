
# Ich möchte eine tidyverse-basierte Datenverarbeitungspipeline in R haben.
# Im Unterordner "PV" liegen mehrere ZIP Dateien, die jeweils eine CSV Datei gleichen Namens enthalten.
# Ich möchte alle CSV Dateien einlesen, ohne temporäre Dateien anzulegen.
# Alle eingelesenen Datentabellen haben die gleiche Spaltenstruktur und sollen in eine Tabelle zusammengeführt werden.
# Aus den Spaltennamen soll "[kWh]" entfernt werden sowie Leerzeichen.
# Basierend auf der enthaltenen Spalte "Datum" soll die Tabelle (1) auf das Jahr 2025 eingeschränkt werden und (b) für jeden Monat die Spalte "Netzeinspeisung" aufsummiert und mit 8 Cent multipliziert werden.
# Die entstandene Tabelle soll als Balkendiagramm mit Euro-Werten auf der y-Achse visualisiert werden und die Summe aller Monate im Titel aufgeführt werden.



library(tidyverse)
library(lubridate)

# 1. Pfad zum Unterordner
pfad <- "PV"

# 2. Alle ZIP-Dateien finden
zip_files <- list.files(pfad, pattern = "\\.zip$", full.names = TRUE)

# 3. CSV-Dateien direkt aus ZIPs einlesen und zusammenführen
daten <- map_dfr(zip_files, ~ {
  # Dateiname ohne Pfad und .zip
  dateiname <- tools::file_path_sans_ext(basename(.x))

  # CSV aus ZIP lesen
  read_csv2(unz(.x, paste0(dateiname, ".csv")))
})

# 4. Spaltennamen bereinigen
daten <- daten %>%
  rename_with(~ str_replace_all(., "\\[kWh\\]", "")) %>%
  rename_with(~ str_replace_all(., "\\s+", ""))

# 5. Filter auf Jahr 2025
daten <- daten %>%
  mutate(Datum = as.Date(Datum)) %>%
  filter(year(Datum) == 2025)

# 6. Monatliche Summen berechnen und mit 0.08 € multiplizieren
monatswerte <- daten %>%
  group_by(Monat = floor_date(Datum, "month")) %>%
  summarise(Einnahmen = sum(Netzeinspeisung, na.rm = TRUE) * 0.08) %>%
  ungroup()

# Gesamtsumme für Titel
gesamt <- sum(monatswerte$Einnahmen)

# 7. Balkendiagramm erstellen
ggplot(monatswerte, aes(x = Monat, y = Einnahmen)) +
  geom_col(fill = "steelblue") +
  scale_y_continuous(labels = scales::label_euro()) +
  labs(
    title = paste("Einnahmen aus Netzeinspeisung 2025 (Gesamt:", scales::label_euro()(gesamt), ")"),
    x = "Monat",
    y = "Einnahmen (€)"
  ) +
  theme_minimal()


