# Phenological Trends in Wildflower Blooming in Germany

Wildflowers are key indicators of seasonal change and ecological health.
Their blooming periods are often tied to environmental cues such as
temperature and daylight. As climate change continues to affect
ecosystems, one visible consequence is the shift in flowering times.
This project focuses on analyzing blooming patterns of selected
wildflower species in Germany over time. The goal is to explore whether
these patterns show temporal or regional shifts that may relate to
environmental change.

## The Data

The data used in this project comes from the [Global Biodiversity
Information Facility (GBIF)](https://www.gbif.org), an open-access
international network and data infrastructure funded by governments
around the world.

II focus on three common wildflower species native to Germany:

-   [Taraxacum officinale (Dandelion) in
    Germany](https://www.gbif.org/occurrence/search?offset=0&q=Taraxacum%20officinale&country=DE&has_coordinate=true)
-   [Ranunculus acris (Meadow Buttercup) in
    Germany](https://www.gbif.org/occurrence/search?offset=0&q=Ranunculus%20acris&country=DE&has_coordinate=true)
-   [Anthriscus sylvestris (Wild Chervil) in
    Germany](https://www.gbif.org/occurrence/search?offset=0&q=Anthriscus%20sylvestris&country=DE&has_coordinate=true)

## Data manipulation goals

-   Filter for valid records
-   Convert `eventDate` into usable time units
-   Assign observations to German federal states
-   Aggregate observations per species per month/year
-   Detect potential outliers or errors in reported dates or locations

## Visualization goals

The aim is to create visualizations from the raw data that make seasonal
patterns, trends and regional differences visible.

-   Compare the number of observations per month/year per species and
    over the course of the years

-   Visualize observations on a map of Germany with flowering frequency
    by federal state

-   These visualizations should help to identify patterns
