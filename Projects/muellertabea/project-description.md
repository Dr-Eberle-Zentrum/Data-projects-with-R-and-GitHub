# Charcoal analysis

## Background

------------------------------------------------------------------------

Charcoal analysis is a valuable tool for reconstructing past human and
environmental interactions. It can provide information about the types
of wood used, whether green or dry wood was used and whether tree sizes
and ages were prioritised. The reconstruction of the original tree
diameter is necessary to answer such questions, and this is achievable
by measuring the curvature of the last annual ring using different
methods.(Fig. 1) ![Fig. 1](description.jpg) However, understanding the
relationship between tree size and woodland management remains a
significant challenge. Management is assumed to lead to age and/or
diameter peaks, and the diameters of managed trees are supposed to be
larger in their age category. Still, unmanaged trees should reach a
higher age, as they are not felled in a planned manner. The difference
in size is explainable by the access to light, space and nutrients,
which is better in managed woods. However, it is also possible that
free-standing trees grow faster.

## Data

------------------------------------------------------------------------

The [data](Data_Project1.csv) is shortened and consists now of nine
columns:

-   **ID**: Number of every single piece, because of previous research
    purpose not abscond

-   **Localisation**: Description of the sampling area

-   **Taxa**: Identified wood species

-   **Radius\_number**: outermost annual ring 1 and then continuous (See
    fig.1)

-   **Radius1\_mean** & **Radius2\_mean** & **Radius3\_mean**: Each
    annual ring is measured three times and every measurement is written
    down

-   **Radius\_tot\_mean**: The mean of all three measurements

-   **Radius\_tot\_sd**: The standard deviation of the total mean radius

<table style="width:100%;">
<colgroup>
<col style="width: 3%" />
<col style="width: 12%" />
<col style="width: 7%" />
<col style="width: 12%" />
<col style="width: 12%" />
<col style="width: 12%" />
<col style="width: 12%" />
<col style="width: 14%" />
<col style="width: 12%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: right;">ID</th>
<th style="text-align: left;">Localisation</th>
<th style="text-align: left;">Taxa</th>
<th style="text-align: right;">Radius_number</th>
<th style="text-align: right;">Radius1_mean</th>
<th style="text-align: right;">Radius2_mean</th>
<th style="text-align: right;">Radius3_mean</th>
<th style="text-align: right;">Radius_tot_mean</th>
<th style="text-align: left;">Radius_tot_sd</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: right;">30</td>
<td style="text-align: left;">80/50-22</td>
<td style="text-align: left;">Populus</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">31.31</td>
<td style="text-align: right;">32.86</td>
<td style="text-align: right;">32.91</td>
<td style="text-align: right;">32.36000</td>
<td style="text-align: left;">0.90967027</td>
</tr>
<tr class="even">
<td style="text-align: right;">46</td>
<td style="text-align: left;">80/50-22</td>
<td style="text-align: left;">Indet</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">7.68</td>
<td style="text-align: right;">7.55</td>
<td style="text-align: right;">7.45</td>
<td style="text-align: right;">7.56000</td>
<td style="text-align: left;">0.115325626</td>
</tr>
<tr class="odd">
<td style="text-align: right;">166</td>
<td style="text-align: left;">80/50-22</td>
<td style="text-align: left;">Indet</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">22.38</td>
<td style="text-align: right;">22.53</td>
<td style="text-align: right;">23.68</td>
<td style="text-align: right;">22.86333</td>
<td style="text-align: left;">0.71121961</td>
</tr>
<tr class="even">
<td style="text-align: right;">166</td>
<td style="text-align: left;">80/50-22</td>
<td style="text-align: left;">Indet</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">12.44</td>
<td style="text-align: right;">12.43</td>
<td style="text-align: right;">12.29</td>
<td style="text-align: right;">12.38667</td>
<td style="text-align: left;">0.083864971</td>
</tr>
<tr class="odd">
<td style="text-align: right;">154</td>
<td style="text-align: left;">80/50-22</td>
<td style="text-align: left;">Indet</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">22.47</td>
<td style="text-align: right;">21.95</td>
<td style="text-align: right;">21.68</td>
<td style="text-align: right;">22.03333</td>
<td style="text-align: left;">0.401538707</td>
</tr>
</tbody>
</table>

## Task

------------------------------------------------------------------------

1.  Scatterplot with the mean radius size of each sample in which only
    the samples with Radius\_number 1 are considered. Differentiation
    between different taxa, colour gradient from smaller to larger
    diameter

-   I would assume that there is no difference between Populus and
    Indet. It’s interessting to see if there is a cluster by a specific
    radius size or if they are randomly distributed

1.  Barplot/Boxplot in which the number of samples with the different
    numbers of annual rings is shown

-   Just to know how many rings are on one piece of charcoal and if
    there is a dominance of a specific number

1.  Scatterplot with dependence of standard deviation on the mean value
    of the radius, differentiated by taxa, including for each taxa a
    linear trend line

-   I would except that with bigger radius the standard deviation
    inscrease

1.  **optional** (i) compute for each taxon a linear model of the radius
    1 data. (ii) substract the model value from each value and (iii)
    identify all points that are above/below the standard deviation of
    this “mean normalized” data, to identify “interesting” outlier. plot
    the original data with linear trendline and highlight (color) all
    outliers.
