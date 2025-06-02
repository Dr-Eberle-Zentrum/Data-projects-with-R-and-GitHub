# Project 1: crop vs climate

## solution by paula0013

Climate change is a huge challenge for farmers worldwide. It is causing
extreme weather events, such as droughts and floods, which can have
devastating effects on crops and livestock. This project focuses on
*crop production in the region of Tübingen and how it has been affected
by climate change.*

# Read and transform the data set of the weather data from 1976 to 2021

    ## # A tibble: 15 × 7
    ##    district             year species    `measure in yield` `Precipitation in mm`
    ##    <chr>               <int> <chr>                   <dbl>                 <dbl>
    ##  1 Tübingen, Landkreis  1979 grain mai…               6.47                 1016.
    ##  2 Tübingen, Landkreis  1979 spring ba…               3.77                 1016.
    ##  3 Tübingen, Landkreis  1979 winter wh…               4.78                 1016.
    ##  4 Tübingen, Landkreis  1980 grain mai…               5.5                   987.
    ##  5 Tübingen, Landkreis  1980 spring ba…               3.73                  987.
    ##  6 Tübingen, Landkreis  1980 winter wh…               4.84                  987.
    ##  7 Tübingen, Landkreis  1981 grain mai…               5.49                 1169.
    ##  8 Tübingen, Landkreis  1981 spring ba…               4.1                  1169.
    ##  9 Tübingen, Landkreis  1981 winter wh…               5.47                 1169.
    ## 10 Tübingen, Landkreis  1982 grain mai…               5.96                 1066.
    ## 11 Tübingen, Landkreis  1982 spring ba…               4.01                 1066.
    ## 12 Tübingen, Landkreis  1982 winter wh…               4.91                 1066.
    ## 13 Tübingen, Landkreis  1983 grain mai…               3.84                  972.
    ## 14 Tübingen, Landkreis  1983 spring ba…               3.35                  972.
    ## 15 Tübingen, Landkreis  1983 winter wh…               4.61                  972.
    ## # ℹ 2 more variables: `air temperature in °C` <dbl>,
    ## #   `frost days in number of days` <dbl>
