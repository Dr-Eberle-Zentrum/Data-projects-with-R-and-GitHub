---
editor_options: 
  markdown: 
    wrap: 72
---

# Power Plants in Germany

    ## Warning: package 'raster' was built under R version 4.2.3

    ## Loading required package: sp

    ## Warning: package 'sp' was built under R version 4.2.3

    ## The legacy packages maptools, rgdal, and rgeos, underpinning this package
    ## will retire shortly. Please refer to R-spatial evolution reports on
    ## https://r-spatial.org/r/2023/05/15/evolution4.html for details.
    ## This package is now running under evolution status 0

    ## Warning: package 'cartography' was built under R version 4.2.3

    ## This project is in maintenance mode. 
    ## Core functionalities of `cartography` can be found in `mapsf`.
    ## https://riatelab.github.io/mapsf/

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:raster':
    ## 
    ##     intersect, select, union

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

    ## 
    ## Attaching package: 'tidyr'

    ## The following object is masked from 'package:raster':
    ## 
    ##     extract

The following is a proposed solution to the project [Large Scale Energy
Production](https://github.com/Dr-Eberle-Zentrum/Advanced-data-processing-with-R/blob/main/Projects/PaulKirschner/ProjectIdea_Energy.md)
created by Paul Kishner.

## Data Table - Power Plants in Germany over 100 MW in the year 2022

The data collected by National Environmental Agency:
[UBA](https://www.umweltbundesamt.de/dokument/datenbank-kraftwerke-in-deutschland)
are organized into 15 variables, including the locations of the power
generation companies, the raw materials used, the amount of energy
produced, among others.

| Kraftwerksname / Standort  | Betreiber                                           | Bundesland | Standort-PLZ | Kraftwerksstandort | Elektrische Bruttoleistung MW | Fernwärme-leistung MW | Inbetriebnahme ggf. Ertüchtigung | Anlagenart | Primärenergieträger |
|:---------------------------|:----------------------------------------------------|:-----------|:-------------|:-------------------|------------------------------:|:----------------------|:---------------------------------|:-----------|:--------------------|
| Albatros                   | EnBW Albatros GmbH & Co. KG / Enbridge Inc.         | Offshore   | NA           | Nordsee            |                         112.0 | NA                    | 2019                             | WEA        | Wind O              |
| Albbruck-Dogern / Rhein    | Rheinkraftwerk Albbruck-Dogern AG / RWE Vertrieb AG | BW         | 79774        | Albbruck           |                         108.9 | NA                    | 1933 / 2009 2020                 | LWK        | Wasser              |
| Altbach/Deizisau GT A-C, E | EnBW Kraftwerke AG                                  | BW         | 73776        | Altbach            |                         305.0 | NA                    | 1971-1997                        | GT         | Erdgas              |
| Altbach/Deizisau HKW 1     | EnBW Kraftwerke AG                                  | BW         | 73776        | Altbach            |                         476.0 | 280                   | 1985 2006                        | HKW        | Steinkohle          |
| Altbach/Deizisau HKW 2     | EnBW Kraftwerke AG                                  | BW         | 73776        | Altbach            |                         379.0 | 280                   | 1997 2012                        | HKW DT     | Steinkohle          |
| Alttrebbin                 | EnBW Solarpark GmbH / ALH-Gruppe                    | BB         | 15320        | Neutrebbin         |                         150.0 | NA                    | 2022                             | PV         | Licht               |

: Power Plants in Germany over 100 MW in the year 2022

Power Plants in Germany over 100 MW in the year 2022

In order to meet the objectives proposed in the project, these data need
to be modified or expanded. First, we add to our data the longitude and
latitude for each of the locations or cities, where the producing
companies are located. For the identification of these variables we use
the Batch geocoder for journalist tool.

Secondly, we created a variable to normalize the date to a single year.

Thirdly, we separate the raw materials for the cases in which the power
plant manipulates or works with different sources.

Finally, we will classify them based on whether the materials are
renewable or fossil fuels.

#### Identify historic eras for energy sources (coal, water, renewable)

![](danilopenagos_files/figure-markdown_strict/historic_eras-1.png)

We can see that water is a resource that has been present all the time.
Renewable energies are a phenomenon that appeared in the last quarter of
the 20th century and the beginning of the 21st century. Fossil resources
such as gas and coal have dominated since the 1930s.

### Group the energy sources by renewable vs. fossil types Bundesland

    ## Warning in getData(country = "DEU", level = 1): getData will be removed in a future version of raster
    ## . Please use the geodata package instead

    ## Regions defined for each Polygons

![](danilopenagos_files/figure-markdown_strict/fossil_vs_renewable-1.png)

With this map we see that renewable energy production is located in the
east of the country. While the fossil production is centralized in
Nordrhein-Westfalen and the Rhine river basin.

### Challenge (first try)

First we calculate the percentage of energy produced by Bundesland (both
fossil and renewable).

    ## `summarise()` has grouped output by 'bundesland'. You can override using the
    ## `.groups` argument.

| bundesland | energie   | total_renewbable |
|:-----------|:----------|-----------------:|
| BB         | Fossil    |         62.65760 |
| BB         | Renewable |         37.34240 |
| BE         | Fossil    |        100.00000 |
| BW         | Fossil    |         72.70887 |
| BW         | Renewable |         24.52884 |
| BW         | NA        |          2.76229 |

: Percent of Energie Production by Bundesland and Type

Percent of Energie Production by Bundesland and Type

Then, we filtered by renewable energy and merged this data with the
spacial dataframe.

Finally, with the `choroLayer` function of the `cartography` library, we
color the Bundesland by percentage of renewable energy production.

![](danilopenagos_files/figure-markdown_strict/challenge_renewable-1.png)

### To Improve

-   Calculate percent of renewable energies
-   Use updated libraries
-   Create a interactive map using leaflet library
-   Improve labels
