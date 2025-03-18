# Task description

## Introduction

Starting from a US Census dataset with a mixture of binary, integer and categorical data, you should create tables with summary statistics (since the outcome is dichotomous, the frequency should be enough for it; if you want to also report the summary statistics for the distribution of the other variables, you should at least include the mean and the standard deviation) and/or plots for the marginal distribution of the outcome variable ("income", reported as a dichotomous variable with value) while conditioning on each the categorical variables (individually; example: distribution of the income among married persons,divorced persons, never married persons...; distribution of the income among white persons, black persons,...); in other words, one should consider only the units with a specific value of a categorical variable and report the distribution of the outcome variable in that subgroup.
This should be done for every value of the categorical variables; for example of how the output should look, please refer to the table below.

+----------------------------+---------------+--------------+
| Variable                   | Income        |              |
+============================+:=============:+:============:+
| -   Race                   | -   \<=50k \$ | -   \>50k\$  |
+----------------------------+---------------+--------------+
| -   <div>                  | 70 %          | 30 %         |
|                            |               |              |
|     -   White              | n=350         | n=150        |
|                            |               |              |
|     </div>                 |               |              |
+----------------------------+---------------+--------------+
| -   <div>                  | 65 %          | 35 %         |
|                            |               |              |
|     -   Black              | n=130         | n=70         |
|                            |               |              |
|     </div>                 |               |              |
+----------------------------+---------------+--------------+
| -   <div>                  | ...           | ...          |
|                            |               |              |
|     -   Asian-Pac-Islander |               |              |
|                            |               |              |
|     </div>                 |               |              |
+----------------------------+---------------+--------------+
| -   <div>                  | ...           | ...          |
|                            |               |              |
|     -   ...                |               |              |
|                            |               |              |
|     </div>                 |               |              |
+----------------------------+---------------+--------------+
| -   <div>                  | ...           | ...          |
|                            |               |              |
|     -   Others             |               |              |
|                            |               |              |
|     </div>                 |               |              |
+----------------------------+---------------+--------------+
| -   Marital status         |               |              |
+----------------------------+---------------+--------------+
| -   <div>                  | ...           | ...          |
|                            |               |              |
|     -   Married            |               |              |
|                            |               |              |
|     </div>                 |               |              |
+----------------------------+---------------+--------------+
| -   <div>                  | ...           | ...          |
|                            |               |              |
|     -   Divorced           |               |              |
|                            |               |              |
|     </div>                 |               |              |
+----------------------------+---------------+--------------+
| ...                        | ...           | ...          |
+----------------------------+---------------+--------------+
| -   Native country         |               |              |
+----------------------------+---------------+--------------+
| -   <div>                  |               |              |
|                            |               |              |
|     -   US                 |               |              |
|                            |               |              |
|     </div>                 |               |              |
+----------------------------+---------------+--------------+
| -   <div>                  |               |              |
|                            |               |              |
|     -   England            |               |              |
|                            |               |              |
|     </div>                 |               |              |
+----------------------------+---------------+--------------+
| -   <div>                  |               |              |
|                            |               |              |
|     -   ...                |               |              |
|                            |               |              |
|     </div>                 |               |              |
+----------------------------+---------------+--------------+
| -   <div>                  |               |              |
|                            |               |              |
|     -   Missing            |               |              |
|                            |               |              |
|     </div>                 |               |              |
+----------------------------+---------------+--------------+

Note: the example above could be modified by excluding one column (since they sum up to 100 % and the value of one column can be obtained from the other one), reporting the total number of units in a subgroup ("n=...") separately, adding the total number of units per subgroup (for example, a column could be added to the right to have the value "350+150=500" for the first row, "200" for the second row and so on and so forth; in this case, the number of units below the percentage values could be omitted).
One could also split the table into variable-specific tables; the "indexing" of variable values could also be modified (see the dark and white dots near the categorical variable values).

The nature of the project is exploratory: we want to visualize the bivariate distribution of the outcome variable and the other ones (it is bivariate because we only consider the pairs "{outcome,*one of the other variables*}"); no assumption is made regarding such distributions and no hypothesis is formulated.

## Dataset

The dataset consists of census data from 1994.
It features numerical and categorical variables describing people's demographic characteristics, though some values are missing.
The source of the file is the [UC Irvine Machine Learning repository](https://archive.ics.uci.edu/dataset/2/adult), a famous repository for benchmark datasets for ML and statistics; you can find the details on the datasets characteristics there, alongside some papers that made use of it.

A few notes on the variables:

-   fnwgl: number of persons of the population that are represented by the individual in the census sample; can be ignored for simplicity (in practice, this value is rather important, but one should analyse the way it was obtained to make use of it and that is beyond the scope of the project);

-   education-num: same as "education" but in a numerical format;

-   relationship: represents what this individual is relative to others; there is some overlapping with the "marital status" variable.

-   income: "1" for those with a yearly salary above 50.000 \$ and "0" for the rest.

To avoid the loading of unnecessary data, you should read the dataset from the zipped folder, without prior extraction.
The dataset that you should use is called "adult.data"; try using the "preview" that RStudio offers before importing anything, or some other kind of preliminary visualization tool, to make sure that there is no mistake (like commas being used instead of dots) and that the ata structure is clear to you.

## Dataset manipulation

Try to include information on the missing values in your results; you can also try to incorporate them in your results and see how the output changes.
I'll leave the choice of the inclusion method to you (some kind of imputation, interpolation); just make sure that your choice is well communicated.
Please note that imputation methods can affect summary statistics (e.g.: assigning the mean value of the units with observed values to the missing units reduces the variance of the dataset); if you are not familiar with imputation methods, I would recommend simply reporting or displaying the distribution of the outcome in the subgroup with missing value (see table above).

## Data visualization

For categorical predictors, you can provide a table with the summary statistics of the conditional distribution of the outcome variable ("income", which is dichotomous, see the "Dataset" section) when conditioning on the values of the conditioning variable.
In case of missing values, make the results that include them easily comparable to the ones obtained without the missing values (or by treating the missing values as a separate category).
For numerical predictors, you can provide a plot; in that case, you can use summary statistics for the relation between a dichotomous variable and a numerical one (keep in mind the "real" nature of the outcome variable!).

Some numerical predictors might need to be re-factored: for example, education, which is reported as a numerical variable indicating the highest level of education achieved by an individual, should be treated as a categorical variable; this is because treating it like numerical variable assumes that the various values of it are equally distant and that going from, say, level 1 to level 2 is the same as going from level 2 to level 3, while in reality level 2 might be closer to level 3 than it is to level 1 in terms of outcome distributions.

In this particular case, we actually have both the numerical and the categorical variable for education, so the step above is not necessary, but other variables might need this treatment: \
for example, instead of (or in addition to) using the continuous "hours-per-week" variable, one might use a newly defined variable which takes value 0 when "hours-per-week" equals 0, 2 for those working full-time and 1 for the rest; note that the US definition of "full-time" might be different from yours, so make sure that you specify what you consider as a full-time worker if you decide to redefine the variable in this or in a similar way.
Another variable that could be refactored is the "marital status" one: it has 3 "married" status so, depending on the characteristics of the relative subgroups, one might decide to only include the results for all of them in one plot (again, make sure that this is properly explained).
Similarly, the "native country" one might be refactored to only include macro-areas (examples of possible values for an English person: "Uk & Ireland", "Western Europe", "Europe", "Not US").

Since no assumption is made here for this and other variables, they should be treated like (ordered) categorical variables.

If you opt for plots, I would recommend:

-   barplots for categorical or discrete numerical variables.
    The [R graph gallery](https://r-graph-gallery.com/stacked-barplot.html) has many useful examples of such plots (note that, in our case, the X-axis has the non-outcome variable and the Y-axis has either the number of units or the percentage of each income group in the selected subgroup; missing values should be treated has a separate value, like in the table above);

-   ridgeline charts or violin plots for continuous variables.
    The R graph gallery has examples that you can find [here](https://r-graph-gallery.com/ridgeline-plot.html) and [here](https://r-graph-gallery.com/violin.html).
    Continuous variables do not have missing values.
