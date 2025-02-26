# Task description

## Introduction

This project explores the distribution of chess ratings across different
age groups and countries using the official FIDE rating list from
February 2025. The goal is to identify trends in rating strength by age,
compare different federations, and analyze how age-based performance
varies across regions. How do chess skills develop and do certain
federations have stronger youth or veteran players?

## Dataset

The dataset is sourced from the [FIDE rating list Feb
2025](https://ratings.fide.com/download_lists.phtml).  
It contains numerical and categorical variables describing players’
demographic characteristics, including:  
- **Player ID**: Unique identifier for each player  
- **Name**: Player’s full name  
- **Federation**: The country of the player  
- **Title**: GM, IM, FM, etc. (if available)  
- **Rating**: Current rating  
- **Birth year**: Year of birth (some values may be missing)

Since some records have missing values, data preprocessing will be
required before analysis.

## Dataset Manipulation

To prepare the data for visualization, the following steps will be
taken:  
1. **Cleaning missing values**: Handling missing birth years and ratings
appropriately.  
2. **Grouping players by age categories**: Creating bins such as:  
- Under 18  
- 18–29  
- 30–39  
- 40–49  
- 50+  
3. **Aggregating ratings by federation**: Computing average and median
ratings for each country within each age group.  
4. **Filtering and normalizing data**: Removing outliers and ensuring
meaningful comparisons across federations with different player base
sizes.

## Data Visualization

To analyze the rating distributions across age groups and federations,
we will use various visualization techniques:

-   **Density Plots**:
    -   We will create density plots similar to \[![this
        example](https://i.sstatic.net/iqr9f.png)\], where the x-axis
        represents ratings and the y-axis represents density.  
    -   Each line will represent an age group, allowing for a direct
        comparison of rating distributions across age categories.  
    -   We will generate separate density plots for different
        federations to compare trends across countries.
-   **Boxplots & Violin plots**: Showing rating distributions within
    each age group across different countries.  
-   **Heatmaps**: Comparing the strength of different federations by age
    group using color-coded maps.  

These visualizations will provide insights into whether certain age
groups dominate in specific federations, whether younger players
outperform older ones consistently, and how the chess landscape differs
across regions.
