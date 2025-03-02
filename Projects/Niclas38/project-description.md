# Task description

------------------------------------------------------------------------

## Introduction

It is a dataset about netflix movies and tv-shows around 2020/21 from
kaggle. It contains data from imdb (famous website for movie/tv show
ratings+reviews) and is specifically made to contain especially ugly
data to make the data manipulation more challenging.

## Dataset

[Download
here!](https://www.kaggle.com/datasets/bharatnatrayn/movies-dataset-for-feature-extracion-prediction?resource=download)

[Or look
here!](%22C:\Users\steph\Git\Data-projects-with-R-and-GitHub\Projects\Niclas38\movies.csv%22)

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
to identify impact make by art

**RUNTIME:** The duration for runing time of art

**GROSS:** It gives the total amount earned in worldwide

## Data manipulation

Make the data set clean and tidy -&gt; 1 column = one variable, 1 row =
one observation, if there is no data -&gt; NA, always use the same
delimiter, watch out for commas that should not be read as a delimiter
and change it, watch for spaces and Quotation marks etc.

## Visualisation

-   Plot the average imdb score of each genre (group observation by
    genre) against the time -&gt; which genre is the most liked by the
    judges, is there a trend over the years?

-   Do the same for “votes” (=audience opinion)

-   Rank the actors based on how often they appear and how good their
    Movies scored

-   Is there a correlation between Audience votes/ imdb score and
    Earnings(Gross), is there a correlation between RunTime and
    earnings/popularity

(- Give out a recomendation for a producer, on which type of movie he
should produce in 2025 to have the best chance for the highest earnings
(give out genre, actors and runtime))

(- Give out a movie recomendation based on a “genre” + “time period”
input. It should take the rankings, the earnings and the Actor rankings
into account. For this input create a new column called “time period”
that splits the release years into 3 time periods. The output should be
the movie-name and the short description of it (“One-line”))
