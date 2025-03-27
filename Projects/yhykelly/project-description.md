## introduction

------------------------------------------------------------------------

This project aims to investigate the development of film industry
throughout the past century. Potentially we can track the trends of
movie genres, the popularity of different genres over time, and even
what factors contribute to a “successful” film. In particular, “success”
can be defined differently depending on individual interpretation - by
revenue, by profit, by view ratings etc. I am (hope you are too)
interested in seeing the secret of a film success.

## dataset

------------------------------------------------------------------------

These files contain metadata for all 45,000 movies listed in the Full
MovieLens Dataset. The dataset consists of movies released on or before
July 2017. Data points include cast, crew, plot keywords, budget,
revenue, posters, release dates, languages, production companies,
countries, TMDB vote counts and vote averages.

(source:
<https://www.kaggle.com/datasets/rounakbanik/the-movies-dataset/data?select=movies_metadata.csv>)

The csv file (dataset) can be found [here](./movies_metadata.csv).

The columns are mostly self-explanatory, only that the `popularity` is a
little bit tricky - it should be a score reflecting some rating
attributes such as “Number of votes for the day”, “Number of views for
the day” (for more info please see
[**Popularity**](https://developer.themoviedb.org/docs/popularity-and-trending)**.)**
As far as I understand, the higher the score, the more popular it is
regarded.

## data manipulation goals

------------------------------------------------------------------------

-   **Data Tidying**: Since not all columns are needed for this project,
    some can be disregarded in the first place. Also, some data is
    stored as JSON format so we have to extract the usable information
    first. Do not forget to check for duplicates or null values
    (e.g. does runtime 0 min or budget $0 make sense?) .

-   **Data Wrangling**: Group the films by genres, year or language to
    analyse the how well the film did (in terms of revenue, ratings
    etc.)

-   Note 1: There are columns in JSON format, so make sure we use a
    proper json parser package to transform them into normal R data
    (good if a list column that can be unnested if needed)

## visualization goals

------------------------------------------------------------------------

-   number of films by year and country (use line chart)

-   number of genres through different year (use ridgeline plot)

-   correlation between revenue and budget (can also visualize whether
    it is a profit or loss in the end) (use scatter plot)

-   expected visualization looks like these:

Note: for the density plot the country needs not to be differentiated by
line styles, but can also by colors.

![](images/Screenshot%202025-03-27%20at%203.52.44%20PM.png)
