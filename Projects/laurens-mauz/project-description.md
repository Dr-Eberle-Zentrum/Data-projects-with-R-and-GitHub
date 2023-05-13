# Background

Since the outbreak of the SARS-CoV-2, there was a lot of talk about the
dangers and especially the mortality rate of this new Virus. Mortality
rates are interesting as they can highlight which countries had the most
difficulties to combat the virus. Mortality rates may also provide some
insight into the effectiveness of different measures to protect people
from severe cases of the disease.

------------------------------------------------------------------------

# Data

The Johns Hopkins University Center for Systems Science and Engineering
has compiled epidemiological data since 22 January 2020 from various
sources (WHO, NHC, CCDC…). They track confirmed cases of SARS-Cov-2 as
well as deaths caused by SARS-CoV-2. They provide this data on their
[Git-Hub
page](https://github.com/CSSEGISandData/COVID-19/tree/master/csse_covid_19_data/csse_covid_19_time_series)
as a time series (time\_series\_covid19\_confimed-global.csv and
time\_series\_covid19\_deaths\_global.csv).  
Important columns:

-   Province/State
-   Country/Region
-   Lat (the latitude of the Country/Region)
-   Long (the longitude of the Country/Region)
-   confirmed cases/deaths (depending on which time series) for day x
    (e.g. 1/29/20)

<table style="width:100%;">
<colgroup>
<col style="width: 22%" />
<col style="width: 20%" />
<col style="width: 11%" />
<col style="width: 13%" />
<col style="width: 10%" />
<col style="width: 10%" />
<col style="width: 10%" />
</colgroup>
<thead>
<tr class="header">
<th>Province/State</th>
<th>Country/Region</th>
<th>Lat</th>
<th>Long</th>
<th>1/22/20</th>
<th>1/23/20</th>
<th>1/24/20</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td></td>
<td>Afghanistan</td>
<td>33.93911</td>
<td>67.709953</td>
<td>0</td>
<td>0</td>
<td>0</td>
</tr>
<tr class="even">
<td></td>
<td>Albania</td>
<td>41.1533</td>
<td>20.1683.</td>
<td>0</td>
<td>0</td>
<td>0</td>
</tr>
<tr class="odd">
<td>South Australia</td>
<td>Australia</td>
<td>-34.9285</td>
<td>138.6007</td>
<td>0</td>
<td>0</td>
<td>0</td>
</tr>
</tbody>
</table>

------------------------------------------------------------------------

# Goal

I am interested in the average mortality rates for the SARS-COV-2 virus
at different stages of the pandemic for the US, Germany, Italy,
Australia, China, South Korea, New Zealand, Senegal and to visualize the
results with heat maps.

### To do:

-   calculate the average mortality rate for the time-windows
    february-april and juni-september of 2020, 2021 and 2022 for the
    aforementioned countries from the time series.

-   visualize the average mortality rates for the aforementioned
    countries and for each time-window using a heat map (you will have
    to create six heat maps since there are six averages/time-windows)

The visualitzation should look somewhat like this:

![](images.jpg)

------------------------------------------------------------------------

I hope I was clear

Best Laurens
