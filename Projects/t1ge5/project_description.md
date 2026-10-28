- grobe themeneinführung

- datensatz (online direkt via URL, oder hier im ordner)

  - quelle dokumentieren!

  - beschreibung der elemente (ggf. header oder teil zeigen)

- ausführliche arbeitsanweisung (ziel beschreiben)

  - schrittweise

  - skizzen

<!-- -->

    library(tidyverse)

    data <- read_csv(
      "https://raw.githubusercontent.com/Dr-Eberle-Zentrum/Data-projects-with-R-and-GitHub/main/Projects/martin-raden/Mammal-comeback-in-Europe-data-OWID-download.csv",
      show_col_types = FALSE) |> 
      head(10)
