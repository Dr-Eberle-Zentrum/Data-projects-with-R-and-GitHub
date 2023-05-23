# Project description

## The data set

Since the 1970s the Eurobarometer is regularly monitoring the public opinion on different topics in the whole European Union.

We want to look at one of the newest surveys of the Eurobarometer from 2022. In this survey the people were asked about their opinion on the EU and the coronavirus, european citizenship, and their media use.

The problem about this [data set](https://github.com/Dr-Eberle-Zentrum/Advanced-data-processing-with-R/blob/main/Projects/nico-afentoulidis/ZA7848_v1-0-0.csv) is that its really big and that the variables don't the have right names. This mix makes working with the data set really annoying.
I already cleared the data a little bit. So that they are only the variables you need.

If you are interested on the other variables asked in the survey you can download the whole data set and get more information about it, for example about the sampling procedure, on the website of the [GESIS Leibniz-Institut fuer Sozialwissenschaften](https://search.gesis.org/research_data/ZA7848).

If you do so, you will see that it's necessary to look up the variables within the questionnaire. You can use [the german one](https://github.com/Dr-Eberle-Zentrum/Advanced-data-processing-with-R/blob/ea479ad59ea86eb1be75b50fd344e5eae8615050/Projects/nico-afentoulidis/ZA7848_q_de.pdf) or [the english one](https://github.com/Dr-Eberle-Zentrum/Advanced-data-processing-with-R/blob/ea479ad59ea86eb1be75b50fd344e5eae8615050/Projects/nico-afentoulidis/ZA7848_q_gb.pdf) to find out which variable says what. I know that the questionnaire doesn't look nice and is hard to read because it is made for computer assisted telephone interviews and not for the data analyses which comes after.


## Goals

We are mainly interested in the differences in media usage and their impact between different european countries. Because the Eurobarometer is executed regularly, the idea to compare different cohorts suggests itself. The problem therefore is, that the questions and topics may not have been surveyed in each execution. So we try to compare different countries. (Variable "isocntry" or variable "country" tells you the nationality).


The main goal is to visualise the media usage of the different EU countries. I thought a map could be a nice representation like the one below. But if you have other good ideas I would love see them. The variables from "qd3_1" to "qd3_7" show the amount of usage for different media. The values tell you how often the media is used per month. I think you should use them.

Every variable stands for another type of media:
qd3_1: TV
qd3_2: TV via Internet
qd3_3: Radio
qd3_4: Podcast
qd3_5: Written press
qd3_6: Internet
qd3_7: Social media

![](https://static.wixstatic.com/media/d18dad_00f962f736a448a885bc377ee3caec60~mv2.gif/v1/fill/w_220,h_165,q_90/d18dad_00f962f736a448a885bc377ee3caec60~mv2.gif)

[The R Gallery](https://r-graph-gallery.com/) maybe has some useful tips on how to make a map like this.

I think that one map for each medium will look good.The map should show the mean for each country. Use 3-4 categories for a better visualization.
Don't forget that some of the values, e.g. "Inap. (not 1 in eu27b)", should be treated as NAs.

After that, we could use the information to show that there may be a correlation between the amount of time using social media (variable "qd3_7") and the financial situation in the own household (variable "qa1_5").
The x-axis should show the financial situation, while the y-axis should show the amount of social media usage. It could look like this:

![](https://r-graph-gallery.com/img/graph/89-box-and-scatter-plot-with-ggplot22.png)

Make one chart for each of the three countries: Germany, Greece and Spain.

## Exercise

1.  Get the data in R.
2.  Find the relevant variables and maybe rename them.
3.  Try to visualize the differences in media usage (variables from "qd3_1" to "qd3_7") between the EU countries within a map for each medium.
4.  Show the correlation between the usage of social media (variable "qd3_7") and the variable about the financial situation in his/her own household (variable "qa1_5"). Therefore draw a chart with boxplots for the three countries Germany, Greece and Spain.
Can you think of another nice visualization to show a possible correlation?

Good luck and have fun!

Nico
