# Task description

------------------------------------------------------------------------

## Introduction

It is a dataset about netflix movies and tv-shows from kaggle. It
contains data from imdb (famous website for movie/tv show
ratings+reviews) and is specifically made to contain especially ugly
data to make the data manipulation more challenging. **The Data is from
2022.**

## Dataset

For getting the data:

[Look
here!](https://github.com/Dr-Eberle-Zentrum/Data-projects-with-R-and-GitHub/blob/main/Projects/Niclas38/movies.csv)

[Or download here! (you need to sign up for
this)](https://www.kaggle.com/datasets/bharatnatrayn/movies-dataset-for-feature-extracion-prediction?resource=download)

**MOVIES:** The movie names are given under the column

**YEAR:** The year of movie or tv shows telecast for audience

**GENRE:** The dataset contain many genres most valuable for
recommendation system

**RATING:** The audience thought about movie or tv show given

**ONE-LINE:** The short description about movie or tv show for audiences
first impression

**STARS:** The casting of art is define under this columns which makes
talk between audience

**VOTES:** The audience express their view under the columns its useful
to identify impact made by art

**RUNTIME:** The duration for runing time of art

**GROSS:** It gives the total amount earned in worldwide

## Data manipulation

-   Make the data set clean and tidy -&gt; 1 column = one variable, 1
    row = one observation, if there is no data -&gt; NA, always use the
    same delimiter, watch out for commas that should not be read as a
    delimiter, watch for spaces and Quotation marks etc.
-   Remove Directors (if given)
-   For “Starts” the data of one observation (= the actor names) is
    seperated by commas. change these comma seperated entries to
    list-entries (-&gt; every entry for “Stars” should be a list of
    names for each Movie/TV-show)
-   Do the same for the comma seperated entries of “Genre”
-   For the years every entry should only have one year. If it is an
    TV-show create an entry for each year of the given time span. If the
    show is still running create an entry for each year up until 2022.

## Visualisation

### Level 1: MANDATORY

-   Plot the average imdb-score of each **genre** (group observation by
    genre) against the time -&gt; which genre is the most liked by the
    judges, is there a trend over the years? -&gt; Make a lineplot for
    each genre and plot them all in the same graphic. Give every genre a
    different color, make a legend. Sort the genres in the legend
    according to their current imdb-score (-&gt; score for year 2022
    -&gt; use factors for that!)

-   Do the same for “votes” (=audience opinion) and compare the results
    of the two graphics (discrepancy between “professional” and “laymen”
    taste).

-   Rank the actors based on how often they appear and how good their
    Movies scored. For that rank them by mean imdb-score and select only
    the top 100 actors (if this gets too messy just use the top 50). Use
    them to create a scatterplot with the x-axis showing how often they
    appeared and the y-axis showing their mean imdb-score. Each star
    should be one data-point. **optional:** Add the names in the graphic
    for the 5 stars that appear the furthest in the upper right corner
    of the scatterplot

### Level 2: OPTIONAL

-   Is there a correlation between Audience votes/ imdb score and
    Earnings(Gross)? For this make two plots in one graph with different
    colors. One for the audience votes (Votes) and one for the
    imdb-score (Rating). Plot each of them against the earnings(Gross).
    Use lineplots with datapoints and calculate the correlation
    coefficient for both graphs. [Here you can find an explanation in
    german what a correlation coefficient is and how to calculate
    it](https://studyflix.de/statistik/korrelationskoeffizient-2290)
    Depending on the Correlation coefficient and the plots, do you think
    there is a correlation?

If you cant speak german translate the site or google it yourself. There
are plenty of websites providing information.

### Level 3: OPTIONAL-OPTIONAL (Only for the super ambitous ones that are on the search for a real challenge :D)

-   Give out a recomendation for a producer, on which type of movie he
    should produce in 2025 to have the best chance for the highest
    earnings (give out 2 genres, actors and runtime))

-   Give out a movie recomendation based on a “genre” + “time period”
    input. It should take the rankings, the earnings and the Actor
    rankings into account. For this input create a new column called
    “time period” that splits the release years into 3 time periods. The
    output should be the movie-name and the short description of it
    (“One-line”))
