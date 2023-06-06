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

<table style="width:95%;">
<caption>Power Plants in Germany over 100 MW in the year 2022</caption>
<colgroup>
<col style="width: 9%" />
<col style="width: 9%" />
<col style="width: 9%" />
<col style="width: 9%" />
<col style="width: 9%" />
<col style="width: 9%" />
<col style="width: 9%" />
<col style="width: 9%" />
<col style="width: 9%" />
<col style="width: 9%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: left;"><p>Kraftwerksname / Standort</p></th>
<th style="text-align: left;"><p>Betreiber</p></th>
<th style="text-align: left;"><p>Bundesland</p></th>
<th style="text-align: left;"><p>Standort-PLZ</p></th>
<th style="text-align: left;"><p>Kraftwerksstandort</p></th>
<th style="text-align: right;"><p>Elektrische Bruttoleistung MW</p></th>
<th style="text-align: left;"><p>Fernwärme-leistung MW</p></th>
<th style="text-align: left;"><p>Inbetriebnahme ggf.
Ertüchtigung</p></th>
<th style="text-align: left;"><p>Anlagenart</p></th>
<th style="text-align: left;"><p>Primärenergieträger</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p>Albatros</p></td>
<td style="text-align: left;"><p>EnBW Albatros GmbH &amp; Co. KG /
Enbridge Inc.</p></td>
<td style="text-align: left;"><p>Offshore</p></td>
<td style="text-align: left;"><p>NA</p></td>
<td style="text-align: left;"><p>Nordsee</p></td>
<td style="text-align: right;"><p>112.0</p></td>
<td style="text-align: left;"><p>NA</p></td>
<td style="text-align: left;"><p>2019</p></td>
<td style="text-align: left;"><p>WEA</p></td>
<td style="text-align: left;"><p>Wind O</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>Albbruck-Dogern / Rhein</p></td>
<td style="text-align: left;"><p>Rheinkraftwerk Albbruck-Dogern AG / RWE
Vertrieb AG</p></td>
<td style="text-align: left;"><p>BW</p></td>
<td style="text-align: left;"><p>79774</p></td>
<td style="text-align: left;"><p>Albbruck</p></td>
<td style="text-align: right;"><p>108.9</p></td>
<td style="text-align: left;"><p>NA</p></td>
<td style="text-align: left;"><p>1933 / 2009 2020</p></td>
<td style="text-align: left;"><p>LWK</p></td>
<td style="text-align: left;"><p>Wasser</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>Altbach/Deizisau GT A-C, E</p></td>
<td style="text-align: left;"><p>EnBW Kraftwerke AG</p></td>
<td style="text-align: left;"><p>BW</p></td>
<td style="text-align: left;"><p>73776</p></td>
<td style="text-align: left;"><p>Altbach</p></td>
<td style="text-align: right;"><p>305.0</p></td>
<td style="text-align: left;"><p>NA</p></td>
<td style="text-align: left;"><p>1971-1997</p></td>
<td style="text-align: left;"><p>GT</p></td>
<td style="text-align: left;"><p>Erdgas</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>Altbach/Deizisau HKW 1</p></td>
<td style="text-align: left;"><p>EnBW Kraftwerke AG</p></td>
<td style="text-align: left;"><p>BW</p></td>
<td style="text-align: left;"><p>73776</p></td>
<td style="text-align: left;"><p>Altbach</p></td>
<td style="text-align: right;"><p>476.0</p></td>
<td style="text-align: left;"><p>280</p></td>
<td style="text-align: left;"><p>1985 2006</p></td>
<td style="text-align: left;"><p>HKW</p></td>
<td style="text-align: left;"><p>Steinkohle</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>Altbach/Deizisau HKW 2</p></td>
<td style="text-align: left;"><p>EnBW Kraftwerke AG</p></td>
<td style="text-align: left;"><p>BW</p></td>
<td style="text-align: left;"><p>73776</p></td>
<td style="text-align: left;"><p>Altbach</p></td>
<td style="text-align: right;"><p>379.0</p></td>
<td style="text-align: left;"><p>280</p></td>
<td style="text-align: left;"><p>1997 2012</p></td>
<td style="text-align: left;"><p>HKW DT</p></td>
<td style="text-align: left;"><p>Steinkohle</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>Alttrebbin</p></td>
<td style="text-align: left;"><p>EnBW Solarpark GmbH /
ALH-Gruppe</p></td>
<td style="text-align: left;"><p>BB</p></td>
<td style="text-align: left;"><p>15320</p></td>
<td style="text-align: left;"><p>Neutrebbin</p></td>
<td style="text-align: right;"><p>150.0</p></td>
<td style="text-align: left;"><p>NA</p></td>
<td style="text-align: left;"><p>2022</p></td>
<td style="text-align: left;"><p>PV</p></td>
<td style="text-align: left;"><p>Licht</p></td>
</tr>
</tbody>
</table>

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

+------------+-----------+------------------+
| bundesland | energie   | total_renewbable |
+:===========+:==========+=================:+
| BB         | Fossil    | 62.65760         |
+------------+-----------+------------------+
| BB         | Renewable | 37.34240         |
+------------+-----------+------------------+
| BE         | Fossil    | 100.00000        |
+------------+-----------+------------------+
| BW         | Fossil    | 72.70887         |
+------------+-----------+------------------+
| BW         | Renewable | 24.52884         |
+------------+-----------+------------------+
| BW         | NA        | 2.76229          |
+------------+-----------+------------------+

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
