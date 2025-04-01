# Data manipulation

Make the data set clean and tidy -&gt; 1 column = one variable, 1 row =
one observation, if there is no data -&gt; NA, always use the same
delimiter, watch out for commas that should not be read as a delimiter,
watch for spaces and Quotation marks etc.

\#Visualization

Plot the average imdb-score of each genre (group observation by genre)
against the time -&gt; which genre is the most liked by the judges, is
there a trend over the years? -&gt; Make a lineplot for each genre and
plot them all in the same graphic. Give every genre a different color,
make a legend. Sort the genres in the legend according to their current
imdb-score (-&gt; score for year 2022 -&gt; use factors for that!)

    ## Warning: Removed 3894 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

![](Bene-Klein_files/figure-markdown_strict/unnamed-chunk-3-1.png)

    ## Saving 7 x 5 in image

    ## Warning: Removed 3894 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

Do the same for “votes” (=audience opinion) and compare the results of
the two graphics (discrepancy between “professional” and “laymen”
taste).

    ## Warning: Removed 3894 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

![](Bene-Klein_files/figure-markdown_strict/unnamed-chunk-4-1.png)

    ## Saving 7 x 5 in image

    ## Warning: Removed 3894 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

    ## Warning: Removed 1820 rows containing non-finite outside the scale range
    ## (`stat_bin()`).

![](Bene-Klein_files/figure-markdown_strict/unnamed-chunk-5-1.png)

    ## Saving 7 x 5 in image

    ## Warning: Removed 1820 rows containing non-finite outside the scale range
    ## (`stat_bin()`).

![](Bene-Klein_files/figure-markdown_strict/unnamed-chunk-6-1.png)

    ## Saving 7 x 5 in image
