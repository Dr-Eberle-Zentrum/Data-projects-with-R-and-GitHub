## Background

------------------------------------------------------------------------

For the project I want to use a data set I have previously dealt with in
an assignment for a seminar, but this time I will have new research
questions.

The data set is from PISA study from the data collection cycle in year
2018 and I will only deal with the results of Germany. PISA tests the
skills and knowledge of 15-year-old students in reading, mathematics and
science. Seventy-nine countries and economies took part in the 2018
assessment, which focused on reading, and the data were released by the
OECD on 3rd December 2019.

The goal of this project is to visualize how often students and their
parents read different types of book.

In each data collection cycle PISA tests students’ reading skills.
Reading is the foundation of learning. It is the primary way in which
knowledge is acquired across subjects and disciplines. Students with
strong reading skills can comprehend textbooks, instructions,
assignments, and other educational materials more effectively, leading
to better academic performance.

[How Kids Benefit From Reading A Variety Of
Books](https://www.huffpost.com/archive/ca/entry/how-kids-benefit-from-reading-a-variety-of-books_n_4108646)

## Data

------------------------------------------------------------------------

The data set contains 10 variables with the different book types, the
endings of st and pa indicate the subjects are the students or the
parents. The values of the variables show how often (on a scale from 1 =
Never or almost never to 5 = Several times a week) the subject reads
this type of book.

    pisa_reading <- read.csv ("D:/Desktop/R2/Advanced-data-processing-with-R/Projects/yaolu-pan/pisa_reading_16-05-2023.csv", header = TRUE, stringsAsFactors = FALSE)

    head(pisa_reading)

    ##   X Journals.Magazines_st Comics_st Fiction..novels..short.stories..stories._st
    ## 1 1                     2         1                                           1
    ## 2 2                     4         1                                           5
    ## 3 3                     2         1                                           3
    ## 4 4                     3         1                                           2
    ## 5 5                     3         1                                           5
    ## 6 6                     1         1                                           1
    ##   Nonfiction..history..biography..science..technology._st Daily.newspapers_st
    ## 1                                                       3                   2
    ## 2                                                       2                   1
    ## 3                                                       2                   3
    ## 4                                                       2                   4
    ## 5                                                       4                   2
    ## 6                                                       1                   4
    ##   Journals.Magazines_pa Comics_pa Fiction..novels..short.stories..stories._pa
    ## 1                    NA        NA                                          NA
    ## 2                     4         1                                           5
    ## 3                     5         1                                           5
    ## 4                     3         1                                           2
    ## 5                     2         1                                           4
    ## 6                     2         1                                           2
    ##   Nonfiction..history..biography..science..technology._pa Daily.newspapers_pa
    ## 1                                                      NA                  NA
    ## 2                                                       2                   5
    ## 3                                                       5                   5
    ## 4                                                       1                   5
    ## 5                                                       4                   4
    ## 6                                                       4                   4

    #####

## Visualization goals:

------------------------------------------------------------------------

-   one single diagramm for barplots of different book types
-   grouped plots for students and parents
