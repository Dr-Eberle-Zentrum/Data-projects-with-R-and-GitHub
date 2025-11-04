
require(this.path)


#######################################
# set workding directory
#######################################
setwd( this.path::this.dir() )

# list all zip files in current directory
list.files(pattern = "\\.zip$", path = "./PV") |>
  # unzip each file and read the CSV inside without storing the unzipped file on disk
  lapply(function(zipfile) {
    # get the name of the CSV file inside the zip
    csvfile <- unzip(zipfile, list = TRUE)$Name[1]
    # read the CSV file directly from the zip
    suppressWarnings( # suppress warnings about parsing of last ";" in each data row
      data <-
        read_csv2(unz(zipfile, csvfile),
                  locale = locale(decimal_mark = ",", grouping_mark = "."),
                  show_col_types = F)
    )
    return(data)
  }) |>
  # merge all data frames into one
  bind_rows() |>
  # cleanup
  mutate( `PV Ertrag [kWh]` =
            str_remove(`PV Ertrag [kWh]`,";") |>
            parse_double(locale=locale(decimal_mark = ",", grouping_mark = ".")) ) |>
  mutate( Datum = dmy(Datum) ) |>
  # remove duplicates
  distinct() |>
  # filter for dates from 2025-01-01 onwards
  filter( Datum >= ymd("2025-01-01") ) ->
  # store in variable
  rawData


# Nach dem Import der Daten sollen folgende zusätzlichen Spalten berechnet und dem DataFrame hinzugefügt werden:
#
# Eigenverbrauch [kWh]: Die Menge an Strom (in Kilowattstunden), die von der Photovoltaikanlage direkt im Haushalt verbraucht wurde.
# Berechnung: PV Ertrag - Netzeinspeisung - Speicherung
# Gesamtverbrauch [kWh]: Die Gesamtmenge an Strom (in Kilowattstunden), die im Haushalt verbraucht wurde.
# Berechnung: Eigenverbrauch + Netzbezug
# Eigenverbrauchsanteil [%]: Der Anteil des Eigenverbrauchs am Gesamtverbrauch.
# Berechnung: (Eigenverbrauch / Gesamtverbrauch) * 100
rawData |>
  mutate( `Eigenverbrauch [kWh]` = `PV Ertrag [kWh]` - `Netzeinspeisung [kWh]` - `Speicherung [kWh]` ) |>
  mutate( `Gesamtverbrauch [kWh]` = `Eigenverbrauch [kWh]` + `Netzbezug [kWh]` ) |>
  mutate( `Eigenverbrauchsanteil [%]` = (`Eigenverbrauch [kWh]` / `Gesamtverbrauch [kWh]`) * 100 ) ->
  # store in variable
  enrichedData

# (!) Berechne für jeden Monat die folgenden Kennzahlen und stelle sie in einer übersichtlichen Tabelle dar:
#
#   Monat: Der Monat (z.B. Januar, Februar, etc.).
# PV Ertrag [kWh]: Die Summe des PV Ertrags für den Monat.
# Eigenverbrauch [kWh]: Die Summe des Eigenverbrauchs für den Monat.
# Gesamtverbrauch [kWh]: Die Summe des Gesamtverbrauchs für den Monat.
# Netzeinspeisung [kWh]: Die Summe der Netzeinspeisung für den Monat.
# Netzbezug [kWh]: Die Summe des Netzbezugs für den Monat.
#
# (!) Verwenden sie Sie die dplyr Bibliothek für die Datenmanipulation und -aggregation. Insbesondere group_by() und accross() können hierbei hilfreich sein.

enrichedData |>
  mutate( Monat = floor_date(Datum, "month") ) |>
  group_by(Monat) |>
  summarise(
    across(
      c(`PV Ertrag [kWh]`, `Eigenverbrauch [kWh]`, `Gesamtverbrauch [kWh]`, `Netzeinspeisung [kWh]`, `Netzbezug [kWh]`),
      sum,
      .names = "{col}"
    )
  ) |>
  ungroup() ->
  # store in variable
  monthlySummary

# (!) Erweitern Sie die Tabelle umfolgende Spalten.
#
# Stromkosten [€]: Die Kosten für den Netzbezug, basierend auf einem angenommenen Strompreis von 0,30 €/kWh.
# Berechnung: Netzbezug * 0.30
# Einspeisevergütung [€]: Die Einnahmen aus der Netzeinspeisung, basierend auf einer angenommenen Einspeisevergütung von 0,08 €/kWh.
# Berechnung: Netzeinspeisung * 0.08
# Einsparungen durch Eigenverbrauch [€]: Die Einsparungen, die durch den Eigenverbrauch erzielt wurden, basierend auf dem angenommenen Strompreis von 0,30 €/kWh.
# Berechnung: Eigenverbrauch * 0.30
# Gesamtwirtschaftlichkeit [€]: Die Gesamtwirtschaftlichkeit der Anlage für den Monat, berechnet als Einsparungen durch Eigenverbrauch plus Einspeisevergütung minus Stromkosten.
# Berechnung: Einsparungen durch Eigenverbrauch + Einspeisevergütung - Stromkosten
#
# (!) Alle Daten der Tabelle auf zwei Nachkommastellen runden.
#
# (!) Die Tabelle soll nach Monat sortiert sein (beginnend mit Januar) und als Markdown Tabelle in der Ausgabe dargestellt werden.

monthlySummary |>
  mutate( `Stromkosten [€]` = `Netzbezug [kWh]` * 0.30 ) |>
  mutate( `Einspeisevergütung [€]` = `Netzeinspeisung [kWh]` * 0.08 ) |>
  mutate( `Einsparungen durch Eigenverbrauch [€]` = `Eigenverbrauch [kWh]` * 0.30 ) |>
  mutate( `Gesamtwirtschaftlichkeit [€]` = `Einsparungen durch Eigenverbrauch [€]` + `Einspeisevergütung [€]` - `Stromkosten [€]` ) |>
  mutate(across(where(is.numeric), ~ round(.x, 2))) |>
  arrange(Monat) ->
  finalSummary

# finalSummary |>
#   knitr::kable() |>
#   print()

# (!) Erstellen Sie ein gruppiertes Balkendiagramm, das die Stromkosten als negative Werte und die Einspeisevergütung sowie die Einsparungen durch Eigenverbrauch als positive Werte für jeden Monat darstellt. Wobei die positiven Werte (Einspeisevergütung und Einsparungen durch Eigenverbrauch) gestapelt dargestellt werden sollen. Zudem soll mit einer Linie die Gesamtwirtschaftlichkeit für jeden Monat dargestellt werden.

finalSummary |>
  ggplot(aes(x = Monat)) +
  geom_bar(aes(y = -`Stromkosten [€]`, fill = "Stromkosten"), stat = "identity") +
  geom_bar(aes(y = `Einspeisevergütung [€]`+`Einsparungen durch Eigenverbrauch [€]`, fill = "Einspeisevergütung"), stat = "identity") +
  geom_bar(aes(y = `Einsparungen durch Eigenverbrauch [€]`, fill = "Einsparungen durch Eigenverbrauch"), stat = "identity") +
  geom_line(aes(y = `Gesamtwirtschaftlichkeit [€]`, group = 1, color = "Gesamtwirtschaftlichkeit"), size = 1) +
  geom_point(aes(y = `Gesamtwirtschaftlichkeit [€]`, color = "Gesamtwirtschaftlichkeit"), size = 2) +
  scale_y_continuous(labels = scales::dollar_format(prefix = "€")) +
  scale_fill_manual(
    name = "Balken",
    values = c(
      "Stromkosten" = "red",
      "Einspeisevergütung" = "green",
      "Einsparungen durch Eigenverbrauch" = "blue"
    )
  ) +
  scale_color_manual(
    name = "Linie",
    values = c("Gesamtwirtschaftlichkeit" = "black")
  ) +
  labs(
    title = "Monatliche Stromkosten, Einspeisevergütung, Einsparungen durch Eigenverbrauch und Gesamtwirtschaftlichkeit",
    x = "Monat",
    y = "Betrag (€)"
  ) +
  theme_minimal() +
  theme(
    legend.position = "bottom"
  )

#
# (!) Berechnen Sie hierfür die folgenden Kennzahlen für das gesamte Jahr 2025:
#
#   Amortisierung [€]: Summe der Einsparung und Einspeisevergütung für das Jahr.
# Durchschnittlicher Netzbezug [kWh]: Durchschnittlicher Netzbezug pro Tag.
# Tage mit vollem Speicher [%]: Anteil der Tage im Datensatz, an denen der Batteriespeicher vollständig genutzt wurde (d.h. die Speicherung an diesem Tag liegt unter 0,5 kWh).
# Berechnung: (Anzahl der Tage mit Speicherung < 0.5 kWh / Gesamtanzahl der Tage) * 100
# Tage mit überdurchschnittlichem Netzbezug [%]: Anteil der Tage im Datensatz, an denen der Netzbezug deutlich über dem Durchschnitt liegt.
# Berechnung: (Anzahl der Tage mit Netzbezug > (Mittelwert + Standardabweichung) / Gesamtanzahl der Tage) * 100
#
# (!) Stellen Sie die Jahresübersicht in einer übersichtlichen Tabelle dar, wobei alle Werte auf zwei Nachkommastellen gerundet sind.


enrichedData |>
  filter( year(Datum) == 2025 ) |>
  summarise(
    `Amortisierung [€]` = sum(`Eigenverbrauch [kWh]` * 0.30 + `Netzeinspeisung [kWh]` * 0.08),
    `Durchschnittlicher Netzbezug [kWh]` = mean(`Netzbezug [kWh]`),
    `Tage mit vollem Speicher [%]` = (sum(`Speicherung [kWh]` < 0.5) / n()) * 100,
    `Tage mit überdurchschnittlichem Netzbezug [%]` = (sum(`Netzbezug [kWh]` > (mean(`Netzbezug [kWh]`) + sd(`Netzbezug [kWh]`))) / n()) * 100
  ) |>
  mutate(across(where(is.numeric), ~ round(.x, 2))) ->
  yearlySummary

# (!) Visualisieren sie die Amortisierung in einem Tortendiagramm, das die Anteile der Einsparungen durch Eigenverbrauch und der Einspeisevergütung darstellt, wenn die Gesamtinvestition der Anlage 12.000 € beträgt.
# ZUSATZINFOS:
# Gesamtkosten sind 12000 €.
# bisherige Amortisierung soll prozentual angegeben werden

yearlySummary |>
  mutate(
    `Einsparungen durch Eigenverbrauch [€]` = `Amortisierung [€]` - (sum(enrichedData$`Netzeinspeisung [kWh]` * 0.08)),
    `Einspeisevergütung [€]` = sum(enrichedData$`Netzeinspeisung [kWh]` * 0.08),
    `Restinvestition [€]` = 12000 - `Amortisierung [€]`
  ) |>
  select(`Einsparungen durch Eigenverbrauch [€]`, `Einspeisevergütung [€]`, `Restinvestition [€]`) |>
  pivot_longer(everything(), names_to = "Kategorie", values_to = "Betrag") |>
  ggplot(aes(x = "", y = Betrag, fill = Kategorie)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y", start = 1.6) +
  scale_fill_manual(
    values = c(
      "Einsparungen durch Eigenverbrauch [€]" = "blue",
      "Einspeisevergütung [€]" = "green",
      "Restinvestition [€]" = "red"
    )
  ) +
  labs(
    title = "Amortisierung der Photovoltaikanlage im Jahr 2025",
    x = NULL,
    y = NULL
  ) +
  theme_minimal() +
  theme(
    axis.ticks = element_blank(),
    axis.text = element_blank(),
    legend.position = "bottom"
  )+
  # konkrete Zahlen als label die nicht überlappen
  geom_text(aes(label = paste0(Kategorie, ": ", round(Betrag,2), " €")),
            position = position_stack(vjust = 0.5),
            col="gray")



