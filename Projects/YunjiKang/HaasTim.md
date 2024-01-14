## Data

# First, load the datasets

    library(readr)
    Poverty_rate <- read_csv("At-risk-of-poverty rate.gz", show_col_types = FALSE, 
                             col_select = c("freq", "unit", "geo", "TIME_PERIOD", "OBS_VALUE"))

    Household_Income <- read_csv("Income of households.gz", show_col_types = FALSE, 
                                 col_select = c("freq", "unit", "direct", "na_item", "geo", "TIME_PERIOD", "OBS_VALUE"))

    Crime_data_1 <- read_csv("Crime_data_for_Task1.gz", show_col_types = FALSE, 
                             col_select = c("freq", "unit", "iccs", "geo", "TIME_PERIOD", "OBS_VALUE"))

    Crime_data_2 <- read_csv("Crime_data_for_Task2.gz", show_col_types = FALSE, 
                             col_select = c("freq", "unit", "iccs", "geo", "TIME_PERIOD", "OBS_VALUE"))

## Task 1

Only keep the data for 2019

    library(dplyr)

    ## 
    ## Attache Paket: 'dplyr'

    ## Die folgenden Objekte sind maskiert von 'package:stats':
    ## 
    ##     filter, lag

    ## Die folgenden Objekte sind maskiert von 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

    Crime_data_1.2 <- filter(Crime_data_1, TIME_PERIOD == "2019" )

Plotting

    library(maps)

    ## Warning: Paket 'maps' wurde unter R Version 4.3.2 erstellt

    library(viridis)

    ## Warning: Paket 'viridis' wurde unter R Version 4.3.2 erstellt

    ## Lade nötiges Paket: viridisLite

    ## 
    ## Attache Paket: 'viridis'

    ## Das folgende Objekt ist maskiert 'package:maps':
    ## 
    ##     unemp

    library(ggplot2)

    Ger <- map_data("world") |>  
      filter(region =="Germany")

    #ggplot() +
    #  geom_polygon(data = Ger, aes(x=long, y = lat, #group = group), fill="grey", alpha=0.3) +
    #  geom_point( data= Crime_data_1.2, aes(x=long, #y=lat, size= OBS_VALUE, color= OBS_VALUE)) +
    #  scale_size_continuous(range=c(1,12)) +
    #  scale_color_viridis(trans="log") +
    #  theme_void() + 
    #  ylim(50,59) + 
    #  coord_map() 

## Task2

lets only look at data from 2008

    Crime_data_2.1 <- filter(Crime_data_2, TIME_PERIOD == "2008")

    Household_Income2 <-filter(Household_Income, TIME_PERIOD == "2008")

    Poverty_rate2 <- filter(Poverty_rate, TIME_PERIOD == "2008")

merge the datasets together by countries

    Household_Income2 <-
      Household_Income2 |> 
      rename(Household_Income_EUR_HAB = OBS_VALUE) |> 
      select( - c(freq, unit, direct, na_item, TIME_PERIOD))

    Poverty_rate2 <-
      Poverty_rate2 |>
      rename(Poverty_rate_PC = OBS_VALUE) |> 
      select(- c(freq, unit, TIME_PERIOD))

    Crime <- Crime_data_2.1 |> 
     left_join(Household_Income2, by="geo") |> 
     left_join(Poverty_rate2, by="geo") |>
      na.omit()

Splitting the unit variable by NR and P\_HTHAB. Creating a new data set
with the observed values from NR and P\_HTHAB in the same row, so we can
use for y the P\_HTHAB observed values and for the size the NR observed
value. (before I created this new data set, I tried using a ifelse
function for “y” and the “size” in the aes function, but it wasn’t
working. So, there is prob a more elegant way to do it :)

    Crime_NR <- subset(Crime, unit == "NR", select = -unit) |> 
      rename(OBS_VALUE_NR = OBS_VALUE)
    Crime_P_HTHAB <- subset(Crime, unit == "P_HTHAB", select = -unit) |> 
      rename(OBS_VALUE_P_HTHAB = OBS_VALUE)

    Crime_merged <- merge(Crime_NR, Crime_P_HTHAB, by = c("geo", "freq", "iccs", "TIME_PERIOD", 
                                                          "Household_Income_EUR_HAB", "Poverty_rate_PC"))

    ggplot(Crime_merged, 
           aes(x = Household_Income_EUR_HAB, 
               y = OBS_VALUE_P_HTHAB, 
               size = OBS_VALUE_NR, 
               color = Poverty_rate_PC)) +
      geom_point(alpha = 0.7) +
      geom_text(aes(label = geo), vjust = 1.5, size = 2, color = "black") +
      scale_size_continuous(range = c(3, 10)) +
      scale_color_viridis_c() +
      facet_wrap(~iccs, scales = "free_y", ncol = 3, 
                 labeller = labeller(iccs = c(ICCS0101 = "Intentional Homicide", ICCS02011 = "Assault",
                                              ICCS0401 = "Robbery", ICCS0501 = "Burglary", 
                                              ICCS05012 = "Burglary of private residential premises",
                                              ICCS0502 = "Theft", 
                                              ICCS050211 = "Theft of a motorized land vehicle"))) +
      labs(x = "Income of Households (Euro per inhabitant)",
           y = "Police-recorded Offence (Per hundred thousand inhabitants)",
           size = "Police-recorded Offence (Number)",
           color = "At Risk of Poverty Rate") +
      theme_minimal() +
      theme(legend.position = "bottom", 
            strip.text = element_text(size = 7.5, margin = margin(0, 0, 5, 0)),
            text = element_text(size = 7))

![](HaasTim_files/figure-markdown_strict/unnamed-chunk-6-1.png)

            #axis.text.x = element_text(angle = 45, hjust = 1))
