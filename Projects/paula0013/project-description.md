# Project 1 R2 Course - Pauline Röhner

# Topic of the project

Dragonflies are flight-active insects whose behavior is strongly
influenced by environmental conditions. In this project, the flight
activity of the autumn mosaic dragonfly (*Aeshna mixta*) is linked to
meteorological data to find out **under which weather conditions this
species prefers to fly**.

# Data sets for the project

The two data sets were provided directly by the operators of the fishing
station in Bukowo, Poland.

## Weather data from the weather station at the fishing station in Bukowo in Poland

🔗
[Weather\_Data\_Poland.csv](https://github.com/Dr-Eberle-Zentrum/Data-projects-with-R-and-GitHub/blob/main/Projects/paula0013/Weather_Data_Poland.csv)

    ##                   Time    Temp Wet.Bulb.Temp. Rel..Hum.  Baro. Altitude
    ## 1  yyyy-MM-dd hh:mm:ss Celsius        Celsius         %     mb   Meters
    ## 2  2024-07-29 14:00:00    27.0           20.9      58.4 1016.0      -25
    ## 3  2024-07-29 15:00:00    25.9           19.9      58.0 1015.7      -24
    ## 4  2024-07-29 16:00:00    26.0           20.1      58.2 1015.2      -18
    ## 5  2024-07-29 17:00:00    26.2           20.2      58.2 1015.0      -17
    ## 6  2024-07-29 18:00:00    26.5           20.5      58.5 1014.7      -14
    ## 7  2024-07-29 19:00:00    26.6           20.6      58.6 1014.9      -16
    ## 8  2024-07-29 20:00:00    26.6           20.6      58.8 1014.7      -13
    ## 9  2024-07-29 21:00:00    26.5           20.5      58.6 1014.2      -10
    ## 10 2024-07-29 22:00:00    26.4           20.4      58.5 1014.2      -10
    ##    Station.P. Wind.Speed Heat.Index Dew.Point Dens..Alt. Crosswind Headwind
    ## 1          mb        m/s    Celsius   Celsius     Meters       m/s      m/s
    ## 2      1016.0        0.0       27.7      18.1        474       0.0      0.0
    ## 3      1015.9        0.0       26.2      17.0        434       0.0      0.0
    ## 4      1015.2        0.0       26.4      17.2        446       0.0      0.0
    ## 5      1015.1        0.0       26.7      17.4        453       0.0      0.0
    ## 6      1014.8        0.0       27.2      17.7        468       0.0      0.0
    ## 7      1014.9        0.0       27.2      17.8        471       0.0      0.0
    ## 8      1014.7        0.0       27.2      17.8        473       0.0      0.0
    ## 9      1014.2        0.0       27.0      17.7        474       0.0      0.0
    ## 10     1014.3        0.0       27.0      17.6        471       0.0      0.0
    ##    Mag..Dir. True.Dir. Wind.Chill  X
    ## 1    Degrees   Degrees    Celsius NA
    ## 2        267       267       26.9 NA
    ## 3        266       267       25.9 NA
    ## 4        245       245       26.0 NA
    ## 5        244       244       26.2 NA
    ## 6        244       244       26.5 NA
    ## 7        244       244       26.5 NA
    ## 8        245       246       26.5 NA
    ## 9        245       246       26.4 NA
    ## 10       243       244       26.4 NA

# Catch data for the dragonflies

🔗
[Fangdaten\_Poland.csv](https://github.com/Dr-Eberle-Zentrum/Data-projects-with-R-and-GitHub/blob/main/Projects/paula0013/Fangdaten_Poland.csv)

    ## # A tibble: 10 × 1
    ##    `ID;Datum;Uhrzeit;Geschlecht`
    ##    <chr>                        
    ##  1 BK1;01.08.2024;Morning;m     
    ##  2 BK2;13.08.2024;Morning;m     
    ##  3 BK3;15.08.2024;Morning;m     
    ##  4 BK4;29.08.2024;Morning;f     
    ##  5 BK5;30.08.2024;Morning;m     
    ##  6 BK6;31.08.2024;Morning;f     
    ##  7 BK7;31.08.2024;Afternoon;m   
    ##  8 BK8;02.09.2024;Morning;m     
    ##  9 BK9;03.09.2024;Morning;m     
    ## 10 BK10;03.09.2024;Afternoon;m

# Goals for data manipulation of weather data

1.  Cleaning up the weather data:

1.1 Remove the row with the unit declaration

1.2 Extraction and renaming of the following columns: - Time -&gt; Time
in yyyy-MM-dd hh:mm:ss - Temp. -&gt; Temperature in Celsius - Wind Speed
-&gt; Wind speed in m/s - True Dir. -&gt; Wind direction in degrees

1.3 Separation of the time column into two columns (date and time)

1.4. Form mean values from the extracted and revised weather data for
the morning (10 a.m. to 2 p.m.) and midday (2 p.m. to 4 p.m.) periods

1.5. Creation of a new column based on the wind direction in degrees
(True Dir.) with the wind direction in compass direction (e.g. NW, SSO)

1.  Merging the data from the revised weather file with the dragonfly
    catch data

# Goals of the visual representation of the data

-   Display the temperature values for the two daily periods as a trend
    line with an error corridor over the entire catch period.
-   Display the temperature values of the individual catches with the ID
    of the dragonflies to order in a small extrapolation over the entire
    catch period.
-   Display the number of catches of dragonflies as stacked bars by sex
    over the entire catch period
-   Display the wind direction as compass direction with arrow and
    designation below the diagram as well as the wind speed in m/s

![](https://raw.githubusercontent.com/Dr-Eberle-Zentrum/Data-projects-with-R-and-GitHub/main/Projects/paula0013/Visualization_dragonflies.jpeg)
