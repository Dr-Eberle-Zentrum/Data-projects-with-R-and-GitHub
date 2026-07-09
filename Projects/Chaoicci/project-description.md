# Fun with languages

There are over 7000 languages spoken in the world. While some regions
are home to a rich diversity of languages, individual languages may also
be spoken across multiple countries. The provided dataset collects
information about over 7000 languages (including sign languages), such
as geographical information, information about religion and about
language families. I am particularly interested in the regions with the
greatest language diversity and in the (geographical) distribution of
languages. I also want to take a look at the corresponding language
families.

# Dataset and Cleanup

The dataset is quite extensive and can be downloaded
[here:](https://huggingface.co/datasets/lukeslp/world-languages/tree/main)
(`world_languages_integrated.json`) as a .json file. You can use the
`jsonlite` package in R to read the file. You will have to reformat the
data to a new dataframe.

There is a lot of information in the dataset, but for simplicity’s sake
I will only be interested in:

-   the language names (`$name`)
-   the countries the language is spoken in (all the keys starting with
    `$speaker_count$metadata$countries`) - note that there are multiple
    countries - in the new dataframe there should not be multiple
    columns, but if necessary a language can be listed multiple times
    (with different countries)
-   the (number of) speakers of the language (`$speaker_count$count`)
-   the language family (`$language_history$family_tree$path[[3]]`)

You may decide on how to work with NA data: it might be possible to
replace some of them, but some might have to be dropped.

Please document what you did with NAs.

# Questions and Tasks

### 1. Where is the place with the most diversity (regarding languages)?

Find the 20 countries with the most languages (so the 20 countries that
appear the most in the dataset). Create a table listing these countries
in descending order. Include the number of languages associated with
each country.

If possible, visualize how many languages are spoken in a country
(i.e. how often the country shows up in the dataset) on a world map by
coloring the countries depending on the number of languages. You can
draw a world map using the function `geom_map()` and `map_data("world")`
(both are included in `tidyverse`). The colors used should be high
contrast (i.e. not light blue to dark blue but e.g. red to blue). The
exact colors are up to you.



### 2. How are these languages distributed?

Find the five languages with the largest number of speakers. For each
language, create a world map highlighting all countries in which the
language is spoken. Present the results as five separate maps, one for
each language, and include the name of the corresponding language in the
title of each map.

Then, create a scatterplot with the 10 most spoken and the 10 most
wide-spread languages (they might overlap). On the x-axis should be the
number of speakers, on the y-axis the number of countries they are
spoken in. To make individual languages identifiable, consider labeling
the points with numbers enclosed in circles and providing a
corresponding legend.

### 3. What are the languages and the language families with the most speakers? What languages have the most speakers in their family?

Find the ten language families with the largest number of speakers. In
order to do this, you will have to calculate the number of speakers of a
language family by adding the number of speakers of the its child
languages.

Create a table listing these language families in descending order.
Include the number of speakers.

Plot the five language families with the largest amount of speakers and
their respective child languages as a stacked bar plot. Present the
results as five separate plots, one for each language family. Include
the name of the language family in the title.

# Copyright

The dataset uses a MIT license, which means that we can use, manipulate
and even distribute the dataset, but we need to credit it in a certain
way. Just copy the `license.txt` in my project folder and upload it
along your solution.
