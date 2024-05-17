## Project Objective

My project has three primary objectives. The first two of those are if
(a) the majority of immigrants in Argentina benefit from the AUH
(Universal Child Allowance) social welfare program, and (b) if the
majority of the beneficiaries of the program are immigrants. The third
objective (c) is to characterize the beneficiaries of this particular
program. In other words, what trends in origin, age, gender, employment
(if any), and education level of the recipients of the AUH exist.

## Background

In recent years, the current government of Argentina has been asserting
that immigrants are the primary beneficiaries of various social welfare
programs in Argentina. Although the survey does not explicitly ask
whether an individual benefits from any social welfare programs, the
survey can be used to determine eligibility for such programs. Following
the example of Mariana Marchionni, I assume intention-to-treat, i.e. all
those who are eligible also benefit from the program. By identifying
whether an individual fulfills the social program’s criteria, I am able
to determine whether they (most likely) receive the benefits from the
program or not.

## Data Set

The data set sources from the [Argentinian Department of
Statistics](https://www.indec.gob.ar/indec/web/Institucional-Indec-BasesDeDatos).
The survey is known as the EPH (The Permanent Household Survey), and I
will be using data from 2016. The survey includes a general household
section and individual section, the latter of which asks each household
resident questions on background, employment, and income. Using these
variables, I can identify the criteria for receiving the benefits from
the AUH program, (details to be explained later) and then measure up the
share of immigrants and non-immigrants eligible for the program. To
assist with pulling the data from the database, I will use the package
[eph](https://ropensci.github.io/eph/index.html).

## Data Manipulation Goals:

The first course of action is to identify the criteria for eligibility
of receiving the AUH. In brief, the AUH is a cash transfer program aimed
at unemployed and informal workers earning below minimum wage with
children or dependents, somewhat similar to the German institution of
“Kindergeld”. Additionally, in Argentina, approximately 30% of minors
receive the AUH, so it is a very well-known and widespread program. Note
that, a household may receive multiple transfer payments, one for each
child or dependent with a max of five. The survey contains information
on the familial relation of house residents to one another, so the head
of household and his/her spouse are the relevant individuals whose
employment type will be analyzed. Using these guidelines, I can identify
whether either of the parents/guardians are eligible to receive any (and
how many) transfer payments.

## Data Visualization Goals:

Data visualization will be relatively simple bar graphs measuring (a)
the percentage of immigrants who are eligible for the AUH vs. the
percentage of non-immigrants eligible for the AUH; (b) the number of
immigrants who are eligible for the AUH vs. the number of non-immigrants
eligible for the AUH; and (c) of those who are eligible, what are the
percentages based on gender, age group, country of origin (within South
America), province of origin (if Argentinian), employment type (if
employed), and education level (each being a separate graph).

Here is a rough idea of my data visualization, with the y being the
fraction or count and x being the categorical variables:
![](https://media.geeksforgeeks.org/wp-content/uploads/20210705121552/barplotcount.png)

## References

Garganta, S., Gasparini, L., Marchionni, M. et al. The Effect of Cash
Transfers on Fertility: Evidence from Argentina. Popul Res Policy Rev
36, 1–24 (2017). <https://doi.org/10.1007/s11113-016-9417-x>
