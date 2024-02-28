## About the Data

The data contains information about soil. Soil samples where taken from
soil profiles somewhere in the Naturpark Schönbuch and analysed in a
laboratory. Each soil profile consists of several horizons and samples
where taken from every horizon, so the rows represent the horizonts of
all the profiles. The data table comes as .csv file but was not managed
well, which means there is some cleaning to do.

## Columns explained

-   `Labornummer Tübingen`: individual sample number
-   `Profil_2`: number of profile
-   `Horizont_43`: number of horizon (per profile)
-   `Tiefe_44`: accumulated depth of the horizons
-   `Horizontbezeichnung_45`: type of horizon
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
    clay)

## What to do

### 1. The data needs some cleanup

-   the column KAKpot2 is not needed
-   the header displays numbers which do not make much sense. Also,
    there is a second header with the units of the data. Both is not
    needed. Instead, the header should display the column names without
    the numbers but with the unit integrated such like this:
    Tiefe\_\[cm\]
-   there is a typo in the column “Expozition”. It should actually be
    “Exposition”
-   99999 and 99999,99 are the NA values, but R does not know this, so
    all these values need to be set to NA
-   two columns need to be calculated: base\_saturation\_\[%\] by
    dividing “Kationen” by “KAKpot” and SOM\_\[%\] by multiplying Corg
    with 1,72

### 2. Visualisation

-   I would like to aggregate the columns Ca, Mg, K, Na and Kationen by
    profile number and visualize them with a grouped or stacked barplot
    like this
    <https://r-graph-gallery.com/48-grouped-barplot-with-ggplot2_files/figure-html/thecode4-1.png>
-   then I would like to have 3 piecharts of the “Ah” horizons of the
    profiles 82, 111 and 134 next to each other where I can see the
    portion of S (Sand), U (silt) and T (clay). See below:
    <img src="/Projects/timow98/sketch_1.jpg" id="id" class="class"
    style="width:50.0%;height:50.0%" alt="Sketch of piechart" />
-   I would like to know where the profiles are - maybe they can be
    visualized on a simple map using the coordinates of the respective
    columns?
