# Data manipulation

Make the data set clean and tidy -&gt; 1 column = one variable, 1 row =
one observation, if there is no data -&gt; NA, always use the same
delimiter, watch out for commas that should not be read as a delimiter,
watch for spaces and Quotation marks etc.

# Visualization

Plot the average imdb-score of each genre (group observation by genre)
against the time -&gt; which genre is the most liked by the judges, is
there a trend over the years? -&gt; Make a lineplot for each genre and
plot them all in the same graphic. Give every genre a different color,
make a legend. Sort the genres in the legend according to their current
imdb-score.

![](Bene-Klein_files/figure-markdown_strict/unnamed-chunk-3-1.png)

[Critic feedback](critic_feedback.pdf)

Do the same for “votes” (=audience opinion) and compare the results of
the two graphics (discrepancy between “professional” and “laymen”
taste).
![](Bene-Klein_files/figure-markdown_strict/unnamed-chunk-4-1.png)

[audience feedback](audience_feedback.pdf)

![](Bene-Klein_files/figure-markdown_strict/unnamed-chunk-5-1.png)

[discrepancy of feedback](discrepancy_of_feedback.pdf)

Rank the actors based on how often they appear and how good their Movies
scored. For that rank them by mean imdb-score and select only the top 50
actors

![](Bene-Klein_files/figure-markdown_strict/unnamed-chunk-6-1.png)

[Top 50 stars rating](Top_50_stars_rating.pdf)
