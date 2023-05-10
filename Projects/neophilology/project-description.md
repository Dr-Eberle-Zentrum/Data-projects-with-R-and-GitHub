## Topic: Contemporary Germany

The project consists of an NLP investigation of contemporary German
history through its political speeches. Assuming political discourse
addresses the most pressing subjects of their time, we can use this data
as a sample of the political climax of their time, trace the evolution
of pudblic debate, and many other lines of research.

## Data

Text data collected from German media since 1990. The aggregated data
was updated in 2017. The corpus currently includes a total of **6,685
speeches by 71 speakers**, spanning a time from **1984 to 2017** and
amounting to about **13 million words.**

The files are accompanied with metadata encoded in XML format.

Here is the link. <https://politische-reden.eu/>

### Origin

Text repositories of speeches by: - Official pages of the German
Presidency, Chancellery, Bundestag, Ministry of Foreign Affairs -
Personal pages of the Helmut Kohl archive, Wolfgang Thierse and Norbert
Lammert

## Data manipulation goals

Select by token or n-gram frequency what are the most important topics
discussed in the las three decades and create a tabular dataset. The
columns of the dataframe could include time-series data, categorical
(speakers, context, topics, etc.), numerical (for quantitative
analysis).

Some data wrangling process will involve: - Tokenize words - Syntax
encoding - Stop-words deletion - Frequency preiminary analysis - Feature
engineering to create a tabular dataset

## Visualization goals

-   Word clouds
-   time series anaysis and plots

## R Markdown

This is an R Markdown document. Markdown is a simple formatting syntax
for authoring HTML, PDF, and MS Word documents. For more details on
using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that
includes both content as well as the output of any embedded R code
chunks within the document. You can embed an R code chunk like this:

    summary(cars)

    ##      speed           dist       
    ##  Min.   : 4.0   Min.   :  2.00  
    ##  1st Qu.:12.0   1st Qu.: 26.00  
    ##  Median :15.0   Median : 36.00  
    ##  Mean   :15.4   Mean   : 42.98  
    ##  3rd Qu.:19.0   3rd Qu.: 56.00  
    ##  Max.   :25.0   Max.   :120.00

## Including Plots

You can also embed plots, for example:

![](project-description_files/figure-markdown_strict/pressure-1.png)

Note that the `echo = FALSE` parameter was added to the code chunk to
prevent printing of the R code that generated the plot.
