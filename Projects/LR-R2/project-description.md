# Task description

## Introduction

Starting from a US Census dataset with a mixture of binary, integer and
categorical data, you should create tables (with summary statistics like
quantiles, standard deviation and mean) and/or plots for the marginal
distribution of the outcome variable (“income”) while conditioning on
each the categorical variables (individually; example: distribution of
the income among married persons,divorced persons, nerver married
persons…; distribution of the income among white persons, balck
persons,…).

## Dataset

The dataset consists of census data from 1994. It features numerical and
categorical variables describing people’s demographic characteristics,
though some values are missing. The source of the file is the [UC Irvine
Machine Learning
repository](https://archive.ics.uci.edu/dataset/2/adult), a famous
repository for benchmark datasets for ML and statistics; you can find
the details on the datasets characteristics there, alongside some papers
that made use of it.

## Dataset manipulation

Try to include the missing values in your results and compare them with
the results obtained without them. I’ll leave the choice of the
inclusion method to you (some kind of imputation, interpolation); just
make sure that your choice is well communicated.

## Data visualization

For categorical predictors, you can provide a table with the summary
statistics of the conditional distribution of the outcome variable
(“income”, which is dichotomous) when conditioning on the values of the
conditioning variable. In case of missing values, make the results that
include them easily comparable to the ones obtained without the missing
values (or by treating the missing values as a separate category). For
numerical predictors, you can provide a plot; in that case, you can use
summary statistics for the relation between a dichotomous variable and a
numerical one (keep in mind the “real” nature of the outcome variable!).
Note that imputation methods can affect summary statistics (e.g.:
assigning the mean value of the units with observed values to the
missing units reduces the variance of the dataset). Some numerical
predictors might need to be refactored.
