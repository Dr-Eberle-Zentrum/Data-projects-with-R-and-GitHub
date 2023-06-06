
# NLP: from German speeches to German history

## Topic: Contemporary Germany

The project consists of an NLP investigation of contemporary German
history through its political speeches. Assuming political discourse
addresses the most pressing subjects of their time, we can use this data
as a sample of the political climax of their time, trace the evolution
of public debate, and many other lines of research.

## Data

Text data collected from German media since 1990. The aggregated data
was updated in 2017. The corpus currently includes a total of **6,685
speeches by 71 speakers**, spanning a time from **1984 to 2017** and
amounting to about **13 million words.**

The files are accompanied by metadata encoded in XML format.

Here is the [link to the data](https://politische-reden.eu/).

### Origin

Text repositories of speeches by: - Official pages of the German
Presidency, Chancellery, Bundestag, Ministry of Foreign Affairs -
Personal pages of the Helmut Kohl archive, Wolfgang Thierse and Norbert
Lammert

## Data manipulation goals

Select by token or n-gram frequency what are the most important topics
discussed in the last three decades and create a tabular dataset. The
columns of the dataframe could include time-series data, categorical
(speakers, context, topics, etc.), numerical (for quantitative
analysis).

Some data wrangling processes will involve: - Tokenize words - Syntax
encoding - Stop-words deletion - Frequency preliminary analysis -
Feature engineering to create a tabular dataset.

## Visualization goals

-  Word clouds for each period
-  Frequency plots and time series