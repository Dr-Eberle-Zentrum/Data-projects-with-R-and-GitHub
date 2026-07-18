# What is the overall best movie?

The movie that has got the highest score when combining Movie Rating
(IMDB movie rating) and Metascore (metacritic movie rating).

<table class="table table-striped table-hover table-condensed" style="color: black; width: auto !important; margin-left: auto; margin-right: auto;">

<caption>

Top-rated movie
</caption>

<thead>

<tr>

<th style="text-align:left;">

Title
</th>

<th style="text-align:right;">

Year
</th>

<th style="text-align:right;">

IMDb Rating
</th>

<th style="text-align:right;">

Metascore
</th>

<th style="text-align:right;">

Total Score
</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

Metrópolis
</td>

<td style="text-align:right;">

1927
</td>

<td style="text-align:right;">

83
</td>

<td style="text-align:right;">

98
</td>

<td style="text-align:right;">

181
</td>

</tr>

</tbody>

</table>

<table class="table table-striped table-hover table-condensed" style="color: black; width: auto !important; margin-left: auto; margin-right: auto;">

<caption>

Top 10 Rated Movies
</caption>

<thead>

<tr>

<th style="text-align:left;">

Title
</th>

<th style="text-align:right;">

Year
</th>

<th style="text-align:right;">

IMDb Rating
</th>

<th style="text-align:right;">

Metascore
</th>

<th style="text-align:right;">

Total Score
</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

Metrópolis
</td>

<td style="text-align:right;">

1927
</td>

<td style="text-align:right;">

83
</td>

<td style="text-align:right;">

98
</td>

<td style="text-align:right;">

181
</td>

</tr>

<tr>

<td style="text-align:left;">

WALL·E
</td>

<td style="text-align:right;">

2008
</td>

<td style="text-align:right;">

84
</td>

<td style="text-align:right;">

95
</td>

<td style="text-align:right;">

179
</td>

</tr>

<tr>

<td style="text-align:left;">

La guerra de las galaxias
</td>

<td style="text-align:right;">

1977
</td>

<td style="text-align:right;">

86
</td>

<td style="text-align:right;">

90
</td>

<td style="text-align:right;">

176
</td>

</tr>

<tr>

<td style="text-align:left;">

Gravity
</td>

<td style="text-align:right;">

2013
</td>

<td style="text-align:right;">

77
</td>

<td style="text-align:right;">

96
</td>

<td style="text-align:right;">

173
</td>

</tr>

<tr>

<td style="text-align:left;">

Alien, el octavo pasajero
</td>

<td style="text-align:right;">

1979
</td>

<td style="text-align:right;">

84
</td>

<td style="text-align:right;">

89
</td>

<td style="text-align:right;">

173
</td>

</tr>

<tr>

<td style="text-align:left;">

La novia de Frankenstein
</td>

<td style="text-align:right;">

1935
</td>

<td style="text-align:right;">

78
</td>

<td style="text-align:right;">

95
</td>

<td style="text-align:right;">

173
</td>

</tr>

<tr>

<td style="text-align:left;">

Regreso al futuro
</td>

<td style="text-align:right;">

1985
</td>

<td style="text-align:right;">

85
</td>

<td style="text-align:right;">

87
</td>

<td style="text-align:right;">

172
</td>

</tr>

<tr>

<td style="text-align:left;">

¡Olvídate de mí!
</td>

<td style="text-align:right;">

2004
</td>

<td style="text-align:right;">

83
</td>

<td style="text-align:right;">

89
</td>

<td style="text-align:right;">

172
</td>

</tr>

<tr>

<td style="text-align:left;">

Spider-Man: Un nuevo universo
</td>

<td style="text-align:right;">

2018
</td>

<td style="text-align:right;">

84
</td>

<td style="text-align:right;">

87
</td>

<td style="text-align:right;">

171
</td>

</tr>

<tr>

<td style="text-align:left;">

Mad Max: Furia en la carretera
</td>

<td style="text-align:right;">

2015
</td>

<td style="text-align:right;">

81
</td>

<td style="text-align:right;">

90
</td>

<td style="text-align:right;">

171
</td>

</tr>

</tbody>

</table>

# Correlation between Movie Rating and Metascore

![](lea-immenkamp_files/figure-gfm/correlation%20visualization-1.png)<!-- -->

**Interpretation** The scatterplot shows a positive linear trend. Thus
it can be concluded that there is a positive correlation between Movie
rating and Metascore.

# The role of the different genres

The next step was to look at the correlation for different genres.

![](lea-immenkamp_files/figure-gfm/role%20of%20genre%20visualization-1.png)<!-- -->

**Interpretation** Across genres, there is a positive linear trend
between Movie rating and Metascore.

# Director Score

A horizontal bar plot for each director showing the average combined
score, as well as the standard deviation indicated by the whiskers. The
number of films is presented as a text annotation next to the bar.

![](lea-immenkamp_files/figure-gfm/director%20score-1.png)<!-- -->

# Do films that have a good rating also make more money?

![](lea-immenkamp_files/figure-gfm/optional%20task-1.png)<!-- -->

**Interpretation** There is a linear trend between Gross Equivalent
Earnings and the combined score. However, a lot of movies did not earn
any money (gross equivalent= 0), which acts as a floor effect and of
course influences the trend.

**Remove films with zero revenue**

![](lea-immenkamp_files/figure-gfm/remove%20films%20without%20revenue-1.png)<!-- -->

**Use the log function**

![](lea-immenkamp_files/figure-gfm/graph%20with%20log-1.png)<!-- -->
