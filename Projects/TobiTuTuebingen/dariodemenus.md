    # Import using readr. 
    # The locale encoding argument helps ensure special characters are read correctly.
    wind_data <- read_delim("WindenergieBW.csv", 
                            delim = ",", 
                            locale = locale(encoding = "UTF-8"))

    # Inspect column names to ensure no BOM artifacts (like "ï..Zuständige")
    colnames(wind_data)

    ##  [1] "Zuständige Dienststelle"        "Standortgemeinde"              
    ##  [3] "Hersteller"                     "Typbezeichnung des Herstellers"
    ##  [5] "Generatorleistung [MW]"         "Nabenhöhe [m]"                 
    ##  [7] "Rotordurchmesser [m]"           "Status"                        
    ##  [9] "Inbetriebnahmedatum"            "Stilllegedatum"                
    ## [11] "Ost"                            "Nord"                          
    ## [13] "Herkunft der Daten"             "Stand der Daten"

    # Data Cleaning Pipeline
    clean_wind <- wind_data %>%
      # Rename columns for easier access (CamelCase or English is often easier)
      rename(
        Landkreis = `Zuständige Dienststelle`,
        Gemeinde = Standortgemeinde,
        Leistung_MW = `Generatorleistung [MW]`,
        Nabenhoehe_m = `Nabenhöhe [m]`,
        Rotor_m = `Rotordurchmesser [m]`,
        Inbetriebnahme = Inbetriebnahmedatum
      ) %>%
      # Convert Date from character (German format dd.mm.yyyy) to Date object
      mutate(Inbetriebnahme = dmy(Inbetriebnahme)) %>%
      mutate(Jahr = year(Inbetriebnahme)) %>%
      # Filter out rows that might have missing coordinates if necessary for the map
      filter(!is.na(Ost), !is.na(Nord))

    # Preview
    head(clean_wind)

    ## # A tibble: 6 × 15
    ##   Landkreis  Gemeinde Hersteller Typbezeichnung des H…¹ Leistung_MW Nabenhoehe_m
    ##   <chr>      <chr>    <chr>      <chr>                        <dbl>        <dbl>
    ## 1 Landratsa… Hardtha… Enercon    E-115                          3           149 
    ## 2 Landratsa… Widdern  Enercon    E-115                          3           149.
    ## 3 Landratsa… Obersulm Nordex     N-149                          4.5         164 
    ## 4 Landratsa… Forchte… Enercon    E-115                          3           149 
    ## 5 Landratsa… Weißbach Vestas De… V126-3.3 MW                    3.3         137 
    ## 6 Landratsa… Weißbach Vestas De… V126-3.3 MW                    3.3         137 
    ## # ℹ abbreviated name: ¹​`Typbezeichnung des Herstellers`
    ## # ℹ 9 more variables: Rotor_m <dbl>, Status <chr>, Inbetriebnahme <date>,
    ## #   Stilllegedatum <lgl>, Ost <dbl>, Nord <dbl>, `Herkunft der Daten` <chr>,
    ## #   `Stand der Daten` <dbl>, Jahr <dbl>
