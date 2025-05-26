## Project Background

As I am currently spending a semester abroad, I am particularly interested in where Erasmus students come from and which countries they go to. To explore this, I use the dataset available at [data.europa.eu](https://data.europa.eu/data/datasets/erasmus-mobility-raw-data?locale=en), specifically the file titled:

**"Erasmus+ Raw Mobility Data – Key Action 2"**

This dataset provides information on all Erasmus+ mobilities since 2014. My project focuses on aggregating how many students have gone from each sending country to each receiving country over the years.

## Dataset Description

The dataset contains information on individual Erasmus+ mobilities, including the following relevant fields:

-   Sending Country
-   Receiving Country
-   Mobility Start Year/Month – timestamp of mobility
-   Actual Participants – number of people in that mobility record

## Data manipulation

-   Only include long-term study mobility of pupils

-   Aggregate the total number of participants for each combination of `Sending Country` and `Receiving Country`, since all data since 2014 should be included.

-   Since the data is provided as an Excel XLSX file, which cannot be accessed directly from the internet via a URL in R, it would be great if you could include the following steps:

    -   The data file should be downloaded using R code from the URL: <https://ec.europa.eu/assets/eac/erasmus-plus/statistics/mobility/Erasmus-KA1-Mobility-Data-2015.xlsx>
    -   Then, the data should be read into R.
    -   Afterwards, the XLSX file should be deleted so that the rather large data file does not have to be managed via GitHub.

## Answer the following questions

-   Which 5 country pairs show the highest intensity of student exchange within the Erasmus+ programme?
-   Are there regional patterns or strong bilateral partnerships in student mobility? Identify mobility hotspots!
-   Where do the 5 most participating countries send their students and from which countries do they receive there students
-   Which countries have consistently attracted the highest number ob Erasmus+ students?

## Visualization goals

In order to answer the questions, visualize the following

-   create a **heatmap**, which highlights the intensity of mobility flows between countries. Each cell should represent the number of participants from one sending country to one receiving country. Apply a clear color scale to highlight intensity differences. You can choose whatever colors you want. The visualization could look like this (not bases on real data ./heatmap_example_datadraft_SvenjaPoerstel.PNG)

-   To further explore groupings and flow dynamics, create a **Sankey flow diagram**.

-   Generate a **barplot** to show the top 10 most popular receiving countries, the bars should be sorted in descending order by the number of incoming participants.
