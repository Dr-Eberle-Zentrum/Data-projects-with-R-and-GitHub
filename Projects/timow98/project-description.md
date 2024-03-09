## About the Data

The dataset ([SoilData.csv](SoilData.csv)) contains information about
soil. Soil samples where taken from soil profiles somewhere in the
Naturpark Schönbuch and analysed in a laboratory. Each soil profile
consists of several horizons (see below) and samples where taken from
every horizon, so the rows represent the horizons of all the profiles.
The data table comes as .csv file but was not managed well, which means
there is some cleaning to do.

This is what a soil profile looks like ![soil profile](soilprofile.jpg)
As you can see, a profile can be differed into several horizons
(O,A,B,C) as mentioned above. Here is a preview of the first few lines
of the dataset:

<table style="width:100%;">
<caption>Preview of the data table</caption>
<colgroup>
<col style="width: 7%" />
<col style="width: 3%" />
<col style="width: 4%" />
<col style="width: 3%" />
<col style="width: 8%" />
<col style="width: 2%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 5%" />
<col style="width: 1%" />
<col style="width: 2%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 2%" />
<col style="width: 2%" />
<col style="width: 2%" />
<col style="width: 2%" />
<col style="width: 1%" />
<col style="width: 2%" />
<col style="width: 2%" />
<col style="width: 2%" />
<col style="width: 2%" />
<col style="width: 2%" />
<col style="width: 2%" />
<col style="width: 2%" />
<col style="width: 3%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: left;">Labornummer Tübingen</th>
<th style="text-align: left;">Profil_2</th>
<th style="text-align: left;">Horizont_43</th>
<th style="text-align: left;">Tiefe_44</th>
<th style="text-align: left;">Horizontbezeichnung_45</th>
<th style="text-align: left;">East_84</th>
<th style="text-align: left;">North_85</th>
<th style="text-align: left;">Neigung_16</th>
<th style="text-align: left;">Expozition_17</th>
<th style="text-align: left;">Corg</th>
<th style="text-align: left;">CaCO3</th>
<th style="text-align: left;">Ca</th>
<th style="text-align: left;">Mg</th>
<th style="text-align: left;">K</th>
<th style="text-align: left;">Na</th>
<th style="text-align: left;">Kationen</th>
<th style="text-align: left;">KAKpot</th>
<th style="text-align: left;">KAKpot 2</th>
<th style="text-align: left;">gS</th>
<th style="text-align: left;">mS</th>
<th style="text-align: left;">fS</th>
<th style="text-align: left;">S</th>
<th style="text-align: left;">gU</th>
<th style="text-align: left;">mU</th>
<th style="text-align: left;">fU</th>
<th style="text-align: left;">U</th>
<th style="text-align: left;">gT</th>
<th style="text-align: left;">mT+fT</th>
<th style="text-align: left;">T</th>
<th style="text-align: left;">S+U+T</th>
<th style="text-align: left;">Bodenart</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">[]</td>
<td style="text-align: left;">[]</td>
<td style="text-align: left;">[]</td>
<td style="text-align: left;">[cm]</td>
<td style="text-align: left;">[]</td>
<td style="text-align: left;">[]</td>
<td style="text-align: left;">[]</td>
<td style="text-align: left;">[ % ]</td>
<td style="text-align: left;">[]</td>
<td style="text-align: left;">[%]</td>
<td style="text-align: left;">[%]</td>
<td style="text-align: left;">[mmol/kg]</td>
<td style="text-align: left;">[mmol/kg]</td>
<td style="text-align: left;">[mmol/kg]</td>
<td style="text-align: left;">[mmol/kg]</td>
<td style="text-align: left;">[mmol/kg]</td>
<td style="text-align: left;">[mmol/kg]</td>
<td style="text-align: left;">[cmol/kg]</td>
<td style="text-align: left;">[%]</td>
<td style="text-align: left;">[%]</td>
<td style="text-align: left;">[%]</td>
<td style="text-align: left;">[%]</td>
<td style="text-align: left;">[%]</td>
<td style="text-align: left;">[%]</td>
<td style="text-align: left;">[%]</td>
<td style="text-align: left;">[%]</td>
<td style="text-align: left;">[%]</td>
<td style="text-align: left;">[%]</td>
<td style="text-align: left;">[%]</td>
<td style="text-align: left;">[%]</td>
<td style="text-align: left;">[]</td>
</tr>
<tr class="even">
<td style="text-align: left;">50300</td>
<td style="text-align: left;">2</td>
<td style="text-align: left;">1</td>
<td style="text-align: left;">5</td>
<td style="text-align: left;">Aeh</td>
<td style="text-align: left;">498818</td>
<td style="text-align: left;">5380428</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">99999,99</td>
<td style="text-align: left;">3,99</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">20,56</td>
<td style="text-align: left;">3,79</td>
<td style="text-align: left;">1,12</td>
<td style="text-align: left;">0,50</td>
<td style="text-align: left;">25,46</td>
<td style="text-align: left;">110,85</td>
<td style="text-align: left;">11,08</td>
<td style="text-align: left;">40,86</td>
<td style="text-align: left;">27,71</td>
<td style="text-align: left;">10,97</td>
<td style="text-align: left;">79,50</td>
<td style="text-align: left;">3,40</td>
<td style="text-align: left;">5,60</td>
<td style="text-align: left;">4,00</td>
<td style="text-align: left;">13,00</td>
<td style="text-align: left;">3,60</td>
<td style="text-align: left;">3,70</td>
<td style="text-align: left;">7,30</td>
<td style="text-align: left;">99,80</td>
<td style="text-align: left;">Sl2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">50301</td>
<td style="text-align: left;">2</td>
<td style="text-align: left;">2</td>
<td style="text-align: left;">26</td>
<td style="text-align: left;">Bv</td>
<td style="text-align: left;">498818</td>
<td style="text-align: left;">5380428</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">99999,99</td>
<td style="text-align: left;">0,13</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0,05</td>
<td style="text-align: left;">0,41</td>
<td style="text-align: left;">0,25</td>
<td style="text-align: left;">0,50</td>
<td style="text-align: left;">0,50</td>
<td style="text-align: left;">33,14</td>
<td style="text-align: left;">3,31</td>
<td style="text-align: left;">57,34</td>
<td style="text-align: left;">19,04</td>
<td style="text-align: left;">6,72</td>
<td style="text-align: left;">83,10</td>
<td style="text-align: left;">2,50</td>
<td style="text-align: left;">3,50</td>
<td style="text-align: left;">3,30</td>
<td style="text-align: left;">9,30</td>
<td style="text-align: left;">3,40</td>
<td style="text-align: left;">4,10</td>
<td style="text-align: left;">7,50</td>
<td style="text-align: left;">99,90</td>
<td style="text-align: left;">St2</td>
</tr>
<tr class="even">
<td style="text-align: left;">50302</td>
<td style="text-align: left;">2</td>
<td style="text-align: left;">3</td>
<td style="text-align: left;">40</td>
<td style="text-align: left;">II Bv</td>
<td style="text-align: left;">498818</td>
<td style="text-align: left;">5380428</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">99999,99</td>
<td style="text-align: left;">0,70</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0,05</td>
<td style="text-align: left;">0,10</td>
<td style="text-align: left;">0,25</td>
<td style="text-align: left;">0,50</td>
<td style="text-align: left;">0,50</td>
<td style="text-align: left;">49,16</td>
<td style="text-align: left;">4,92</td>
<td style="text-align: left;">33,65</td>
<td style="text-align: left;">30,71</td>
<td style="text-align: left;">10,37</td>
<td style="text-align: left;">74,72</td>
<td style="text-align: left;">3,70</td>
<td style="text-align: left;">6,10</td>
<td style="text-align: left;">5,30</td>
<td style="text-align: left;">15,10</td>
<td style="text-align: left;">4,30</td>
<td style="text-align: left;">5,70</td>
<td style="text-align: left;">10,00</td>
<td style="text-align: left;">99,82</td>
<td style="text-align: left;">Sl3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">50303</td>
<td style="text-align: left;">2</td>
<td style="text-align: left;">4</td>
<td style="text-align: left;">58</td>
<td style="text-align: left;">III Sd-P-lCv</td>
<td style="text-align: left;">498818</td>
<td style="text-align: left;">5380428</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">99999,99</td>
<td style="text-align: left;">0,14</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">58,55</td>
<td style="text-align: left;">40,37</td>
<td style="text-align: left;">2,14</td>
<td style="text-align: left;">0,50</td>
<td style="text-align: left;">101,07</td>
<td style="text-align: left;">143,74</td>
<td style="text-align: left;">14,37</td>
<td style="text-align: left;">21,17</td>
<td style="text-align: left;">23,79</td>
<td style="text-align: left;">9,44</td>
<td style="text-align: left;">54,40</td>
<td style="text-align: left;">1,50</td>
<td style="text-align: left;">2,20</td>
<td style="text-align: left;">2,50</td>
<td style="text-align: left;">6,20</td>
<td style="text-align: left;">4,20</td>
<td style="text-align: left;">35,10</td>
<td style="text-align: left;">39,30</td>
<td style="text-align: left;">99,90</td>
<td style="text-align: left;">Ts3</td>
</tr>
<tr class="even">
<td style="text-align: left;">50304</td>
<td style="text-align: left;">2</td>
<td style="text-align: left;">5</td>
<td style="text-align: left;">90</td>
<td style="text-align: left;">III lCv</td>
<td style="text-align: left;">498818</td>
<td style="text-align: left;">5380428</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">99999,99</td>
<td style="text-align: left;">0,12</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">122,43</td>
<td style="text-align: left;">75</td>
<td style="text-align: left;">0,25</td>
<td style="text-align: left;">0,50</td>
<td style="text-align: left;">197,43</td>
<td style="text-align: left;">212,45</td>
<td style="text-align: left;">21,24</td>
<td style="text-align: left;">8</td>
<td style="text-align: left;">7,28</td>
<td style="text-align: left;">10,78</td>
<td style="text-align: left;">26,06</td>
<td style="text-align: left;">3,90</td>
<td style="text-align: left;">9,30</td>
<td style="text-align: left;">14,70</td>
<td style="text-align: left;">27,90</td>
<td style="text-align: left;">14,20</td>
<td style="text-align: left;">31,80</td>
<td style="text-align: left;">46,00</td>
<td style="text-align: left;">99,96</td>
<td style="text-align: left;">Tl</td>
</tr>
<tr class="odd">
<td style="text-align: left;">50305</td>
<td style="text-align: left;">2</td>
<td style="text-align: left;">6</td>
<td style="text-align: left;">100</td>
<td style="text-align: left;">IV elCn</td>
<td style="text-align: left;">498818</td>
<td style="text-align: left;">5380428</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">99999,99</td>
<td style="text-align: left;">0,04</td>
<td style="text-align: left;">0,81</td>
<td style="text-align: left;">143,19</td>
<td style="text-align: left;">77,98</td>
<td style="text-align: left;">0,25</td>
<td style="text-align: left;">0,50</td>
<td style="text-align: left;">221,17</td>
<td style="text-align: left;">221,25</td>
<td style="text-align: left;">22,13</td>
<td style="text-align: left;">5,90</td>
<td style="text-align: left;">3,40</td>
<td style="text-align: left;">5,70</td>
<td style="text-align: left;">15,00</td>
<td style="text-align: left;">3,50</td>
<td style="text-align: left;">13,60</td>
<td style="text-align: left;">19,60</td>
<td style="text-align: left;">36,70</td>
<td style="text-align: left;">17,20</td>
<td style="text-align: left;">30,40</td>
<td style="text-align: left;">47,60</td>
<td style="text-align: left;">99,30</td>
<td style="text-align: left;">Tu2</td>
</tr>
<tr class="even">
<td style="text-align: left;">50315</td>
<td style="text-align: left;">5</td>
<td style="text-align: left;">1</td>
<td style="text-align: left;">5</td>
<td style="text-align: left;">Ah</td>
<td style="text-align: left;">498795</td>
<td style="text-align: left;">5380779</td>
<td style="text-align: left;">1</td>
<td style="text-align: left;">E</td>
<td style="text-align: left;">4,69</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">9,59</td>
<td style="text-align: left;">2,49</td>
<td style="text-align: left;">0,64</td>
<td style="text-align: left;">0,50</td>
<td style="text-align: left;">12,71</td>
<td style="text-align: left;">152,26</td>
<td style="text-align: left;">15,23</td>
<td style="text-align: left;">16,61</td>
<td style="text-align: left;">32,35</td>
<td style="text-align: left;">13,49</td>
<td style="text-align: left;">62,50</td>
<td style="text-align: left;">5,10</td>
<td style="text-align: left;">6,10</td>
<td style="text-align: left;">6,70</td>
<td style="text-align: left;">17,90</td>
<td style="text-align: left;">6,60</td>
<td style="text-align: left;">13,20</td>
<td style="text-align: left;">19,80</td>
<td style="text-align: left;">100,20</td>
<td style="text-align: left;">Ls4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">50316</td>
<td style="text-align: left;">5</td>
<td style="text-align: left;">2</td>
<td style="text-align: left;">20</td>
<td style="text-align: left;">Bv</td>
<td style="text-align: left;">498795</td>
<td style="text-align: left;">5380779</td>
<td style="text-align: left;">1</td>
<td style="text-align: left;">E</td>
<td style="text-align: left;">0,91</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">7,09</td>
<td style="text-align: left;">2,55</td>
<td style="text-align: left;">0,25</td>
<td style="text-align: left;">0,50</td>
<td style="text-align: left;">9,64</td>
<td style="text-align: left;">86,33</td>
<td style="text-align: left;">8,63</td>
<td style="text-align: left;">18,78</td>
<td style="text-align: left;">26,12</td>
<td style="text-align: left;">12,39</td>
<td style="text-align: left;">57,30</td>
<td style="text-align: left;">4,50</td>
<td style="text-align: left;">6,20</td>
<td style="text-align: left;">8</td>
<td style="text-align: left;">18,70</td>
<td style="text-align: left;">7,80</td>
<td style="text-align: left;">16,40</td>
<td style="text-align: left;">24,20</td>
<td style="text-align: left;">100,20</td>
<td style="text-align: left;">Ls4</td>
</tr>
<tr class="even">
<td style="text-align: left;">50317</td>
<td style="text-align: left;">5</td>
<td style="text-align: left;">3</td>
<td style="text-align: left;">47</td>
<td style="text-align: left;">II Swd-P-Bv</td>
<td style="text-align: left;">498795</td>
<td style="text-align: left;">5380779</td>
<td style="text-align: left;">1</td>
<td style="text-align: left;">E</td>
<td style="text-align: left;">0,44</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">128,22</td>
<td style="text-align: left;">27,04</td>
<td style="text-align: left;">0,25</td>
<td style="text-align: left;">0,50</td>
<td style="text-align: left;">155,26</td>
<td style="text-align: left;">207,79</td>
<td style="text-align: left;">20,78</td>
<td style="text-align: left;">2,41</td>
<td style="text-align: left;">26,98</td>
<td style="text-align: left;">4,74</td>
<td style="text-align: left;">34,13</td>
<td style="text-align: left;">1,70</td>
<td style="text-align: left;">2,50</td>
<td style="text-align: left;">4,30</td>
<td style="text-align: left;">8,50</td>
<td style="text-align: left;">8,10</td>
<td style="text-align: left;">49,10</td>
<td style="text-align: left;">57,20</td>
<td style="text-align: left;">99,83</td>
<td style="text-align: left;">Ts2</td>
</tr>
</tbody>
</table>

Preview of the data table

The first line contains the column names. The second line contains the
units. But we can only have one header and we do not want the second
line as it messes up the data type of the columns.

## Columns explained

-   `Labornummer Tübingen`: individual sample number
-   `Profil_2`: number of the profile
-   `Horizont_43`: number of horizon (per profile) example: as you see
    in the preview above, the profile number two was divided into 6
    horizons and there was a sample taken from each of these horizons.
    This means, that if I want to compare profile, I will need to
    calculate the data from all its horizons
-   `Tiefe_44`: accumulated depth of the horizons
-   `Horizontbezeichnung_45`: type of horizon (each main horizon as
    shown above can be divided into subhorizonts like Ah and Al for
    example)
-   `East_84`: Coordinates “Easting” in meters (UTM coordinates)
-   `North_85`: Coordinates “Northing” in meters (UTM coordinates)
-   `Neigung_16`: slope
-   `Expozition_17`: direction (N, NE, …)
-   `Corg`: percentage of organic carbon
-   `CaCO3`: percentage of carbonate
-   `Ca`, `Mg`, `K`, `Na`: calcium, magnesium, potassium and sodium
-   `Kationen`: cations
-   `KAKpot`, `KAKpot2`: potential cation exchange capacity - same data
    but KAKpot2 has the decimal point at the wrong location
-   `gS`, `mS`, `fS`, `S`: coarse, middle and fine fraction of sand -
    added together to Sand (S)
-   `gU`, `mU`, `fU`, `U`: coarse, middle and fine fraction of silt -
    added together to silt (U)
-   `gT`, `mT+fT`, `T`: coarse and middle + fine fraction of clay -
    added together to clay (T)
-   `S+U+T`: all portions of grain sizes together (theoretically 100%)
-   `Bodenart`: soil type according to Kartieranleitung 5 (sand, silt,
    clay) Soil consists of the grain sizes Sand (S), Silt (U) and Clay
    (T). The three fractions can be divided into subcategories (coarse
    (g), middle (m), fine (f)). Knowing the proportions can tell us a
    lot about the soil. For example the fertility, water capacity and
    infiltration rate. Theoretically it adds up to 100% (column S+U+T)
    but in reality there might be some loss or it might even be more
    than 100% which is due to the laboratory method.

## What to do

### 1. The data needs some cleanup

-   the column KAKpot2 is not needed
-   the header displays numbers which do not make much sense. I would
    like to get rid of them by using rename\_with() in combination with
    regular expressions.
-   Also, there is a second header with the respective units. Leaving
    this line will interfere with the datatype in R, that’s why I want
    to delete this line and instead integrate the unit into the header
    such like this: Tiefe\_\[cm\]
-   there is a typo in the column “Expozition”. It should actually be
    “Exposition”
-   99999 and 99999,99 are the NA values, but R does not know this, so
    all these values need to be set to NA. It should be noted that some
    of these NA values might be actual numbers, but some might also be
    of datatype character.
-   two columns need to be calculated: base\_saturation\_\[%\] by
    dividing “Kationen” by “KAKpot” and SOM\_\[%\] by multiplying Corg
    with 1,72

### 2. Visualisation

1.  I would like to aggregate (summarize) the columns Ca, Mg, K, Na and
    Kationen by profile number and visualize them with a stacked barplot
    like this (example): ![Stacked
    barplot](https://r-graph-gallery.com/48-grouped-barplot-with-ggplot2_files/figure-html/thecode4-1.png)
2.  then I would like to have 3 piecharts of the “Ah” horizons of the
    profiles 82, 111 and 134 next to each other where I can see the
    portion of S (Sand), U (silt) and T (clay). See below: ![Sketch of
    piechart](sketch_1.jpg)
3.  I would like to know where the profiles are. There are columns with
    coordinates which can be used to map the profiles. There are several
    packages for this, for example openstreetmap, mapview, ggplot2 and
    sf.
    [<span style="color:blue">This</span>](https://stackoverflow.com/questions/66827313/plotting-utm-coordinates)
    might be a good point to start. Depending on your way to do it you
    might need additional information: Coordinate Reference System: UTM
    Zone 32 N WGS 84 EPSG: 25832 proj4string: “+proj=utm +zone=32
    +datum=WGS84 +units=m +no\_defs”
