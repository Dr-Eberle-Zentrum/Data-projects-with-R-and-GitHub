# First Attempt at solving the art gallery project

## Data Wrangling

### Load and merge the spreadsheets to r

First thing to do, would be loading the file with all slides. For that
reason the rio package would first need to be installed. The rio package
is used to merge all the spreadsheets within the excel document
together. Please be aware, that you might have to install rio first,
using install.packages(“rio”).

    library(tidyverse)

    ## Warning: Paket 'stringr' wurde unter R Version 4.3.0 erstellt

    ## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ## ✔ dplyr     1.1.2     ✔ readr     2.1.4
    ## ✔ forcats   1.0.0     ✔ stringr   1.5.0
    ## ✔ ggplot2   3.4.1     ✔ tibble    3.2.1
    ## ✔ lubridate 1.9.2     ✔ tidyr     1.3.0
    ## ✔ purrr     1.0.1     
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()
    ## ℹ Use the ]8;;http://conflicted.r-lib.org/conflicted package]8;; to force all conflicts to become errors

    library(rio)
    df <- import_list("PG_BD_INVITACIONES_SM05-20-2021.xlsx", rbind = TRUE)

### Creating a working data frame

The second step would be to slim the data down and clean it up. The
Variable I chose are the ones you recommended, “Nombre, Galeria,
Espacio” and “Artistas”. The other issue concerns the documentation of
the artists. Since galleries have invited multiple artists to an
exhibition, the documentation in the data frame consist of multiple
Artists in a single row separated by commas. Using the seperate\_rows
function, the rows where multiple artists were documented are being
separated by their separating comma and stored in their individual row.
The last clean-up is about the rows containing NAs, omitting them from
the data.

    # Create a subset dataset using the variables: "Nombre / Galeria / Espacio", "Artistas", 
    data <- subset(df, select = c("Nombre / Galeria / Espacio", "Artistas","Año de fecha de inauguracion (aaaa)"))

    # splitting the strings of Artistas and saving as new variable
    data1<-data |> separate_rows(Artistas, sep = ", ")
    data1$Artistas<-iconv(data1$Artistas, to='ASCII//TRANSLIT')
    data1$`Nombre / Galeria / Espacio`<- iconv(data1$`Nombre / Galeria / Espacio`, to='ASCII//TRANSLIT')

    # removing all the cases with NA
    length(data1$`Año de fecha de inauguracion (aaaa)`)

    ## [1] 31115

    table(data1$`Año de fecha de inauguracion (aaaa)`)

    ## 
    ##         [2004]         [2011]           1940           1948           1949 
    ##              4              1              1             11              5 
    ##           1950           1952           1960           1962           1963 
    ##              1             66              2            325            146 
    ##           1966           1967           1968           1969           1970 
    ##              2             29            111            220             91 
    ##           1971           1972           1973           1974           1975 
    ##             11            117            103            393            103 
    ##           1976           1977           1978           1979           1980 
    ##            307             49             87            215             54 
    ##           1981           1982           1983           1984           1985 
    ##            201             96             42             87            553 
    ##           1986           1987           1988           1989           1990 
    ##            153            611            365            526            543 
    ##           1991           1992           1993           1994           1995 
    ##            576            176            273            346            194 
    ##           1996           1997           1998           1999           2000 
    ##            309            799            371            343            689 
    ##           2001           2002           2003           2004           2005 
    ##            318            506           1088            507            693 
    ##           2006           2007           2008           2009           2010 
    ##            886            321            124            273            145 
    ##           2011 2011-2012-2013           2012           2013           2014 
    ##            231             32            329            373            397 
    ##           2015           2016           2017           2018           2020 
    ##            751           1096           1153            863              1 
    ##             29             74          marzo              n            N/A 
    ##              1              2              1              1           3116 
    ##             NN            S.I           s.i.   S.I/S.I/2009            S/F 
    ##              1            632           6920              1            500

    list <- c("2011-2012-2013", "marzo", "29", "n", "N/A", "NN", "S.I", "s.i.", "S.I/S.I/2009", "S/F")

    for (i in list) {
    data1$`Año de fecha de inauguracion (aaaa)` <- na_if(data1$`Año de fecha de inauguracion (aaaa)`, i)
    } #removing values that aren't helpful and can't be deciphered

    data1$`Año de fecha de inauguracion (aaaa)`<-ifelse(data1$`Año de fecha de inauguracion (aaaa)`=="[2004]","2004", ifelse(data1$`Año de fecha de inauguracion (aaaa)`=="[2011]","2011",data1$`Año de fecha de inauguracion (aaaa)`))

    data2<-data1[complete.cases(data1), ]
    data2

    ## # A tibble: 19,738 × 3
    ##    `Nombre / Galeria / Espacio` Artistas              Año de fecha de inaugura…¹
    ##    <chr>                        <chr>                 <chr>                     
    ##  1 Centro Colombo Americano     Antonio Maria Benitez 1980                      
    ##  2 Centro Colombo Americano     Lorena Espitia        2009                      
    ##  3 Centro Colombo Americano     Alejandro Castano     2007                      
    ##  4 Centro Colombo Americano     Mauricio MOller       1995                      
    ##  5 Centro Colombo Americano     Barbara Nessim        1995                      
    ##  6 Centro Colombo Americano     Alvaro Salamanca      1995                      
    ##  7 Centro Colombo Americano     Cecilia Ordonez       1995                      
    ##  8 Centro Colombo Americano     Maria Moran           1995                      
    ##  9 Centro Colombo Americano     Ramon Vanegas         1995                      
    ## 10 Centro Colombo Americano     Leyla Castaneda       1978                      
    ## # ℹ 19,728 more rows
    ## # ℹ abbreviated name: ¹​`Año de fecha de inauguracion (aaaa)`

### Date-Variable recoding to a decade-Variable

To compact the data set further, individual years may be a bit overkill
for the later diagram. To solve this, while still remaining accurate, I
use decades.

    data2$`Año de fecha de inauguracion (aaaa)`<- as.integer(data2$`Año de fecha de inauguracion (aaaa)`)

    list <- c(1940,1950,1960,1970,1980,1990,2000,2010,2020)
    data2$decade=data2$`Año de fecha de inauguracion (aaaa)`

    data2$decade <- ifelse(data2$decade>=1940 & data2$decade<1950,1950,
                           ifelse(data2$decade>=1950 & data2$decade<1960,1960,
                                  ifelse(data2$decade>=1960 & data2$decade<1970,1970,
                                         ifelse(data2$decade>=1970 & data2$decade<1980,1980,
                                                ifelse(data2$decade>=1980 & data2$decade<1990,1990,
                                                       ifelse(data2$decade>=1990 & data2$decade<2000,2000,
                                                              ifelse(data2$decade>=2000 & data2$decade<2010,2010,2020)))))))

    table(data2$decade)

    ## 
    ## 1950 1960 1970 1980 1990 2000 2010 2020 
    ##   16   67  835 1476 2686 3925 5404 5329

    length(data2$decade)

    ## [1] 19738

### Counting the time artists were invited to which galleries and merging a complete data frame

Lastly, the data set needs a variable that displays, how many times
artists were invited to each gallery. To create such a data frame, we
need to group the data according to the artists and galleries and then
count how many times a gallery invited the artist. That way, duplicated
information is eliminated and the data frame is reduced from 19.738 to
8,567 rows

    artgal<-data2|>
      group_by(Artistas, `Nombre / Galeria / Espacio`,decade) |>
      count(Artistas)
    artgal

    ## # A tibble: 8,567 × 4
    ## # Groups:   Artistas, Nombre / Galeria / Espacio, decade [8,567]
    ##    Artistas                      `Nombre / Galeria / Espacio`       decade     n
    ##    <chr>                         <chr>                               <dbl> <int>
    ##  1 " Angel Rodriguez."           Aexandes / Galeria Espacio Alterno   2010     1
    ##  2 " Arnulfo Luna"               Galeria Alfred Wild                  1990     4
    ##  3 " Jhon de Rhodes"             Galeria Belarca                      2000     1
    ##  4 " Josh Blackwell"             Galeria Casas Riegner                2020     1
    ##  5 " Juan Mejia"                 SN MaCarena                          2020     1
    ##  6 " Juan Mejia."                SN MaCarena                          2020     2
    ##  7 " Plashtic"                   Casa Tres Cruces                     2020     1
    ##  8 " Plinio Barraza"             Galeria El Museo                     2010     2
    ##  9 "10 artistas"                 Kastalian Art - Galeria de Arte I…   2020     1
    ## 10 "8 artistas del eje cafetero" Geba Art Gallery                     2020     2
    ## # ℹ 8,557 more rows

# Further reduction

Since more than 8.000 unique cases are still too much for the diagram, I
should reduce the data based on the number of invitations, omitting
those with just 1,2,3, etc. invitations.

    list=1:10
    for (i in list) {
      artgal$n <- na_if(artgal$n,i)
    }
    artgal<-artgal[complete.cases(artgal), ]
    artgal

    ## # A tibble: 179 × 4
    ## # Groups:   Artistas, Nombre / Galeria / Espacio, decade [179]
    ##    Artistas              `Nombre / Galeria / Espacio`            decade     n
    ##    <chr>                 <chr>                                    <dbl> <int>
    ##  1 Aguirre               Galeria Buchholz                          1970    24
    ##  2 Alejandro Obregon     Galeria Alfred Wild                       1990    23
    ##  3 Alejandro Obregon     Galeria Alfred Wild                       2000    15
    ##  4 Alejandro Obregon     Galeria El Callejon                       1970    13
    ##  5 Alejandro Sanchez     Galeria El Garaje                         2020    13
    ##  6 Alex Katz             Galeria Alfred Wild                       1990    25
    ##  7 Alex Katz             Galeria Alfred Wild                       2000    11
    ##  8 Alice R. Butler       Centro Colombo Americano                  1990    22
    ##  9 Ana Maria Rueda       Espacio Vacio                             2000    19
    ## 10 Ana Patricia Palacios Galeria de Arte Diners / Galeria Diners   2010    15
    ## # ℹ 169 more rows

Now there are only 179 rows in the data set. It has been set to only
include those artists who have been invited more than 10 times to a
specific gallery in a decade. While that might seem very specific, the
previous data sets would be too large for the diagram. Depending on the
visualization task, further slimming down might be required.

# To-Do and questions:

-   generate the JSON file
    -   Why do I need a JSON format? Has it something to do with the
        Sankey diagram?
    -   a unique identifier for each artist would be pointless with a
        number of &gt;10.000, the diagram would be so over saturated,
        that the smaller artists/galleries would get drowned out or it
        would be so chaotic that they are indistinguishable. You
        mentioned, that only those invited more than three times would
        be considered, however if you run this code: sort(artgal$n,
        decreasing = TRUE), you see how many times some have been
        invited. Additionally, this sample shows just the number of
        invitations from just one gallery, some artists are invited to
        multiple galleries (I think the highest count I saw was
        over 500) –&gt; What should I do about that?
-   create the Sankey diagram
    -   what context do you want explored? which gallery invited which
        artist or which artist was invited by the most galleries,…?

## JSON file

## Visualization
