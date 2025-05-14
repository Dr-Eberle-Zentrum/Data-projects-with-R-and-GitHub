---
title: "Erasmus Mobility Heatmap"
author: "Svenja Pörstel"
output: 
  md_document:
    variant: markdown
---

## Project Background

As I am currently spending a semester abroad, I am particularly interested in where Erasmus students come from and which countries they go to. To explore this, I use the dataset available at [data.europa.eu](https://data.europa.eu/data/datasets/erasmus-mobility-raw-data?locale=en), specifically the file titled:

**"Erasmus+ Raw Mobility Data – Key Action 2"**

This dataset provides information on all Erasmus+ mobilities since 2014. My project focuses on aggregating how many students have gone from each sending country to each receiving country over the years.

The results will be visualized using a **heatmap**, which highlights the intensity of mobility flows between countries.

## Dataset Description

The dataset contains information on individual Erasmus+ mobilities, including the following relevant fields:

-   Sending Country
-   Receiving Country
-   Mobility Start Year/Month – timestamp of mobility
-   Actual Participants – number of people in that mobility record

## Consider for visualization

-   Only include long-term study mobility of pupils
-   Aggregate the total number of participants for each combination of `Sending Country` and `Receiving Country`, since all data since 2014 should be included.
-   Apply a respective color scale in order to highlight different intensities

## The visualization could look like this

![example visualization (not based on real data)](./Svenja/heatmap_example_datadraft_SvenjaPoerstel.PNG)
