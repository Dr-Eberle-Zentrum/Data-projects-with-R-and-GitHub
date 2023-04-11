# Reproduce this super nice chart!

It is often that you find a chart that you really like but have no idea
how to do. An example might be the following one.

<img src="Wildlife-comeback-in-Europe-1.png" style="width:50.0%" />

Which is shown and detailed on
[https://ourworldindata.org](https://ourworldindata.org/europe-mammal-comeback).

## Goal of the project

The idea of this project is to recreate this plot as close as possible
using `ggplot` and the data available in the provided [CSV
file](https://ourworldindata.org/uploads/2022/09/Mammal-comeback-in-Europe-data-OWID-download.csv)
with the following content:

<table>
<colgroup>
<col style="width: 16%" />
<col style="width: 16%" />
<col style="width: 26%" />
<col style="width: 7%" />
<col style="width: 6%" />
<col style="width: 26%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: left;">Common name of species</th>
<th style="text-align: left;">Species name</th>
<th style="text-align: right;">Number of mammal populations
included</th>
<th style="text-align: right;">Start year</th>
<th style="text-align: right;">End year</th>
<th style="text-align: left;">Average relative change in abundance</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">Eurasian beaver</td>
<td style="text-align: left;">Castor fiber</td>
<td style="text-align: right;">98</td>
<td style="text-align: right;">1960</td>
<td style="text-align: right;">2016</td>
<td style="text-align: left;">16705%</td>
</tr>
<tr class="even">
<td style="text-align: left;">European bison</td>
<td style="text-align: left;">Bison bonasus</td>
<td style="text-align: right;">20</td>
<td style="text-align: right;">1960</td>
<td style="text-align: right;">2016</td>
<td style="text-align: left;">16626%</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Grey seal</td>
<td style="text-align: left;">Halichoerus grypus</td>
<td style="text-align: right;">18</td>
<td style="text-align: right;">1978</td>
<td style="text-align: right;">2016</td>
<td style="text-align: left;">6273%</td>
</tr>
<tr class="even">
<td style="text-align: left;">Geoffroy’s bat</td>
<td style="text-align: left;">Myotis emarginatus</td>
<td style="text-align: right;">12</td>
<td style="text-align: right;">1974</td>
<td style="text-align: right;">2016</td>
<td style="text-align: left;">5392%</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Iberian wild goat</td>
<td style="text-align: left;">Capra pyrenaica</td>
<td style="text-align: right;">9</td>
<td style="text-align: right;">1966</td>
<td style="text-align: right;">2012</td>
<td style="text-align: left;">3502%</td>
</tr>
<tr class="even">
<td style="text-align: left;">Grey wolf</td>
<td style="text-align: left;">Canis lupus</td>
<td style="text-align: right;">86</td>
<td style="text-align: right;">1965</td>
<td style="text-align: right;">2016</td>
<td style="text-align: left;">1871%</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Southern chamois</td>
<td style="text-align: left;">Rupicapra pyrenaica</td>
<td style="text-align: right;">31</td>
<td style="text-align: right;">1970</td>
<td style="text-align: right;">2016</td>
<td style="text-align: left;">1549%</td>
</tr>
<tr class="even">
<td style="text-align: left;">Chamois</td>
<td style="text-align: left;">Rupicapra rupicapra</td>
<td style="text-align: right;">31</td>
<td style="text-align: right;">1960</td>
<td style="text-align: right;">2016</td>
<td style="text-align: left;">1045%</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Golden jackal</td>
<td style="text-align: left;">Canis aureus</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">2001</td>
<td style="text-align: right;">2015</td>
<td style="text-align: left;">886%</td>
</tr>
<tr class="even">
<td style="text-align: left;">Eurasian lynx</td>
<td style="text-align: left;">Lynx lynx</td>
<td style="text-align: right;">75</td>
<td style="text-align: right;">1963</td>
<td style="text-align: right;">2016</td>
<td style="text-align: left;">524%</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Alpine ibex</td>
<td style="text-align: left;">Capra ibex</td>
<td style="text-align: right;">6</td>
<td style="text-align: right;">1975</td>
<td style="text-align: right;">2016</td>
<td style="text-align: left;">417%</td>
</tr>
<tr class="even">
<td style="text-align: left;">Wild boar</td>
<td style="text-align: left;">Sus scrofa</td>
<td style="text-align: right;">73</td>
<td style="text-align: right;">1967</td>
<td style="text-align: right;">2016</td>
<td style="text-align: left;">390%</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Red deer</td>
<td style="text-align: left;">Cervus elaphus</td>
<td style="text-align: right;">63</td>
<td style="text-align: right;">1960</td>
<td style="text-align: right;">2016</td>
<td style="text-align: left;">331%</td>
</tr>
<tr class="even">
<td style="text-align: left;">Eurasian otter</td>
<td style="text-align: left;">Lutra lutra</td>
<td style="text-align: right;">31</td>
<td style="text-align: right;">1977</td>
<td style="text-align: right;">2016</td>
<td style="text-align: left;">294%</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Western roe deer</td>
<td style="text-align: left;">Capreolus capreolus</td>
<td style="text-align: right;">59</td>
<td style="text-align: right;">1966</td>
<td style="text-align: right;">2016</td>
<td style="text-align: left;">287%</td>
</tr>
<tr class="even">
<td style="text-align: left;">Iberian lynx</td>
<td style="text-align: left;">Lynx pardinus</td>
<td style="text-align: right;">7</td>
<td style="text-align: right;">1987</td>
<td style="text-align: right;">2016</td>
<td style="text-align: left;">252%</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Wolverine</td>
<td style="text-align: left;">Gulo gulo</td>
<td style="text-align: right;">19</td>
<td style="text-align: right;">1989</td>
<td style="text-align: right;">2016</td>
<td style="text-align: left;">196%</td>
</tr>
<tr class="even">
<td style="text-align: left;">Ringed seal</td>
<td style="text-align: left;">Pusa hispida</td>
<td style="text-align: right;">12</td>
<td style="text-align: right;">1971</td>
<td style="text-align: right;">2016</td>
<td style="text-align: left;">142%</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Eurasian badger</td>
<td style="text-align: left;">Meles meles</td>
<td style="text-align: right;">69</td>
<td style="text-align: right;">1960</td>
<td style="text-align: right;">2016</td>
<td style="text-align: left;">110%</td>
</tr>
<tr class="even">
<td style="text-align: left;">Harbour seal</td>
<td style="text-align: left;">Phoca vitulina</td>
<td style="text-align: right;">32</td>
<td style="text-align: right;">1960</td>
<td style="text-align: right;">2016</td>
<td style="text-align: left;">91%</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Loggerhead turtle</td>
<td style="text-align: left;">Caretta caretta</td>
<td style="text-align: right;">14</td>
<td style="text-align: right;">1984</td>
<td style="text-align: right;">2016</td>
<td style="text-align: left;">68%</td>
</tr>
<tr class="even">
<td style="text-align: left;">Brown bear</td>
<td style="text-align: left;">Ursus arctos</td>
<td style="text-align: right;">67</td>
<td style="text-align: right;">1960</td>
<td style="text-align: right;">2016</td>
<td style="text-align: left;">44%</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Humpback whale</td>
<td style="text-align: left;">Megaptera novaeangliae</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">1997</td>
<td style="text-align: right;">2009</td>
<td style="text-align: left;">37%</td>
</tr>
<tr class="even">
<td style="text-align: left;">Pine marten</td>
<td style="text-align: left;">Martes martes</td>
<td style="text-align: right;">25</td>
<td style="text-align: right;">1986</td>
<td style="text-align: right;">2016</td>
<td style="text-align: left;">21%</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Eurasian elk</td>
<td style="text-align: left;">Alces alces</td>
<td style="text-align: right;">55</td>
<td style="text-align: right;">1970</td>
<td style="text-align: right;">2016</td>
<td style="text-align: left;">17%</td>
</tr>
</tbody>
</table>

### Visualization priorities (from high to low)

-   line style with animal name labels
-   percent labels at line ends
-   time range label at line start
-   x-axis marks
-   arrow line style
-   annotation of brown bear
-   text coloring
-   relative font sizes
-   animal symbol for brown bear

Let’s see how close you can get! As a starting point, you might want to
have a look at [The R Graph Gallery](https://r-graph-gallery.com/).

Looking forward to see your solutions!

Best, Martin
