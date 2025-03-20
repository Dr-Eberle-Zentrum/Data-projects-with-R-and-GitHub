## Introduction

As we have seen in January wildfires are a real thread to nature on a
huge scale. Thus I’d like you to analyse the rate at which the
Treecoverage in each country is beeing affected.

## Dataset

The data set can be downloaded here
[data.xlsx](https://gfw2-data.s3.amazonaws.com/country-pages/country_stats/download/gfw_2023_statistics_summary_v30102024.xlsx).
The dataset I am interseted is located on the second page named “country
tree coverage loss” The columns are as follows: 1. country: Name of the
country 2. threshold: canopy cover in 2000 (Read\_Me) 3. area\_ha: Area
of the country in hectare 4. extent\_2000\_ha 5. extent\_2010\_ha 6.
gain\_2000-2020\_ha: 7.-29 tc\_loss\_ha\_2001 - tc\_loss\_ha\_2023: loss
of treecoverage in the given year in hectare

## Data manipulation

Please rearrange the dataset by only considering the 30% threshold data
and the columns should look smth like this: 1. country: Name of the
country 2. area\_ha: Area of the country in hectare 3.-25.
tc\_loss\_ha\_2001 - tc\_loss\_ha\_2023: loss of treecoverage in the
given year in hectare 26. expected\_tc\_ha\_2050: please make a fit (2nd
degree polynom (3 parameters)) of the tc\_loss\_ha 2001-2023 data and
output the data for your calculated 2050 here. 27.
var\_expected\_tc\_ha\_2050: please add the variance of the of the
previous value 28. R\_squared: please add the coefficient of
determination (R²) of the fit

## Visualisation goal

For confirmation of the of your fit I’d like a simple xy dotplot with
the data and fit of a country your choosing.

I’d like a visualization of a worldmap on which each country is color
coded on how much tree coverage in relation to the entire countrys area
has been destroyed in 2023. furthermore I’d like you to make predictions
onm how much tree coverage is gonna bee destroyed in the year 2030 via
extrapolation.
