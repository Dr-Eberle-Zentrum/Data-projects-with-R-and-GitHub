# Self-control, Sleep Quality and Smartphone Usage

## Introduction

Welcome to my project!

For this project, I used data collected as part of a data collection
seminar. The aim was to investigate the relationship between
self-control, sleep quality, and smartphone usage.

The dataset may seem messy at first glance, but it is not that
complicated. The crucial aspect for this project is the columns
containing answers to so-called “items.” For example, the item
“PS03\_01” was about the question: “How would you rate the overall
quality of your sleep over the last four weeks?” In empirical research,
questionnaires with these items are used to explore e.g. correlations,
such as between school self-concept and school achievement.

A unique aspect of our approach is the construction of scales from a set
of items that inquire about a specific variable in different ways. In
this case, we have items to build scales for the variables
“Self-Control” and “Smartphone Usage” (and also for sleep quality, but
in this project, we won’t construct a scale for sleep quality and
instead use the answers for item “PS03\_01”).


## Task 1 - Get in Touch with the Material

1.  Take a look at the dataset in R

    -   How many oberservations do we have?

2.  Examine the table
    [variables\_smaschkon\_2023-02-11\_09-24.csv](variables_smaschkon_2023-02-11_09-24.csv)

    -   What is the question behind the items “SC01\_14”, “TS01\_01”?

3.  Examine the table
    [values\_smaschkon\_2023-02-11\_09-24.csv](values_smaschkon_2023-02-11_09-24.csv)

    -   What are the possible values for the item “PS03\_01”, “SC01\_14”, “TS01\_01”?
    -   What does “-9” mean? And how should “-9” be presented in R?

4.  Back to R

    -   Check with R for the observed values for “PS03\_01,” “SC01\_14,”, “TS01\_17” (use, for example, the table() function).
    -   Check whether you have successfully imported the data so that the codes for “not answered” are noted as “NA” in the table.
        -   If so: great! If not: find a way to correct this, perhaps by adjusting the import or defining missing values as NAs throughout the dataset.


## Task 2 - Building Scales

A common method to create variables is to calculate means for each
person over all the items related to the variable.

------------------------------------------------------------------------

Example:

We have a dataset with 3 items about confidence in math:

From 1 (no confidence) to 4 (full confidence)

item1: i am good im math item2: i am never afraid of taking tasks in
math class item3: i hope math will be part in my future job

<table>
<thead>
<tr class="header">
<th>Students</th>
<th>item1</th>
<th>item2</th>
<th>item3</th>
<th>mean</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Student1</td>
<td>4</td>
<td>3</td>
<td>4</td>
<td>3,67</td>
</tr>
<tr class="even">
<td>Student2</td>
<td>2</td>
<td>1</td>
<td>1</td>
<td>1,33</td>
</tr>
<tr class="odd">
<td>Student3</td>
<td>2</td>
<td>2</td>
<td>2</td>
<td>2</td>
</tr>
</tbody>
</table>

In this example, the column “mean” serves as our scale for math
confidence. A common procedure in empirical educational research
involves calculating several such scales, e.g., for confidence in math
and math performance, and then calculating correlations or plotting the
relationships.

------------------------------------------------------------------------

Now, here is a list of all the items to build scales with:

-   Sleep quality: “PS03\_01”

-   Self-control: “SC01\_14”, “SC01\_02”, “SC01\_03”, “SC01\_04”,
    “SC01\_05”, “SC01\_06”, “SC01\_07”, “SC01\_08”, “SC01\_09”,
    “SC01\_10”, “SC01\_11”, “SC01\_12”, “SC01\_13”

-   Smartphone Usage: “TS01\_01”, “TS01\_02”, “TS01\_03”, “TS01\_04”,
    “TS01\_05”, “TS01\_06”, “TS01\_07”, “TS01\_08”, “TS01\_09”,
    “TS01\_10”, “TS01\_11”, “TS01\_12”, “TS01\_13”, “TS01\_14”,
    “TS01\_15”, “TS01\_16”, “TS01\_17”, “TS01\_18”, “TS01\_19”

---

1.  Some preparation is needed: Item “SC01\_09” must be recoded.

    -   Examine the question behind item “SC01\_09” again. What is unique
        about this question, and why should this item be “recoded”?
    -   Find a way to recode the item in the dataset.

2.  **Find a way to build the scales.** Different methods can be used.
    As mentioned earlier, we want row-wise means over the items that
    belong to the specific scale. (You can use either `Base R` or
    `tidyverse`.)


## Task 3 - Plot Something Beautiful for Me

I would like to have a cool graphic in which you can see the correlation
between self-control and smartphone usage. The study participants should
be divided into groups for the graph: The groups should result from the
answers to item “PS03\_01”.

I have tried to create a graph but I just can’t get it any better than
this:

![](Rplot.png)

Please try to recreate the graphic and add a few things: \* Use colors
that are easier to distinguish. \* Include a legend. \* Provide clear
axis labels. \* Set axis ticks analogous to the answer options of the
items. \* Choose a nice theme. \* Try to add a convex hull for each
group.

Good luck!
