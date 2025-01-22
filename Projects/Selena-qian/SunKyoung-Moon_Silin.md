# Introduction

The report analyzes foreign language proficiency across selected
European countries (Germany, France, Sweden, and Austria) and compares
their performance to the EU average. The primary goal is to evaluate
differences in proficiency levels by the number of foreign languages
known among adults aged 18 to 69.

# Analysis

The dataset is filtered to include data from 2022 for the relevant
countries and age group. Key steps include below

1.  Renaming and reorganizing columns for clarity.

2.  Calculating the difference between each country’s proficiency
    percentage and the EU average for the same category (number of
    foreign languages known).

3.  Grouping data by country and number of languages for summary
    statistics, particularly focusing on the mean differences from the
    EU average.

The results are visualized using a bar chart, where red and blue
indicate whether a country’s proficiency level is above or below the EU
average.

# My Challenge

One of the main challenges was incorporating country flags and the EU
flag into the facet labels for enhanced visual clarity.

This was achieved using the ggtext library, which supports HTML
rendering in ggplot facet labels. Flags were added as <img> tags in the
facet labels, with specific sizes and alignments. The
element\_markdown() function in theme() allowed rendering these HTML
elements correctly.

# Result

The final plot effectively illustrates the proficiency levels of each
country compared to the EU average, with flags for each country and the
EU flag enhancing the visualization. You can see my code and Result
image below
