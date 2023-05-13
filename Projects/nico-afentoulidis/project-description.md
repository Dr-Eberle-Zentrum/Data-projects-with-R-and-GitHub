
# Project description

## The data set

Since the 1970s the Eurobarometer is regularly monitoring the public opinion on different topics in the whole European Union.

We want to look at one of the newest surveys of the Eurobarometer from 2022. In this survey the people were asked about their opinion on the EU and the coronavirus, european citizenship, and their media use.

The problem about this [data set](https://github.com/Dr-Eberle-Zentrum/Advanced-data-processing-with-R/blob/ea479ad59ea86eb1be75b50fd344e5eae8615050/Projects/nico-afentoulidis/ZA7848_v1-0-0.csv) is that its really big and that the variables don't the have right names. This mix makes working with the data set really annoying. It's necessary to look up the variables within the questionnaire. You can use [the german one](https://github.com/Dr-Eberle-Zentrum/Advanced-data-processing-with-R/blob/ea479ad59ea86eb1be75b50fd344e5eae8615050/Projects/nico-afentoulidis/ZA7848_q_de.pdf) or [the english one](https://github.com/Dr-Eberle-Zentrum/Advanced-data-processing-with-R/blob/ea479ad59ea86eb1be75b50fd344e5eae8615050/Projects/nico-afentoulidis/ZA7848_q_gb.pdf) to find out which variable says what.
I know that the questionnaire doesn't look nice and is hard to read because it is made for computer assisted telephone interviews and not for the data analyses which comes after.
Also was the data set cut off to make the filesize smaller.

You can get more information about the dataset, for example about the sampling procedure, on the website of the [GESIS Leibniz-Institut fuer Sozialwissenschaften](https://search.gesis.org/research_data/ZA7848).

## Goals

We are mainly interested in the differences in media usage and their impact between different european countries. Because the Eurobarometer is executed regularly, the idea to compare different cohorts suggests itself. The problem therefore is, that the questions and topics may not have been surveyed in each execution. So we try to compare different countries. (Variable "isocntry" tells you the nationality)

The main goal is to visualise the media usage of the different EU countries. I thought a map could be a nice representation like the one below. But if you have other good ideas I would love see them.
The variables from "qd3_1" to "qd3_8" show the amount of usage for different media. I think you should use them.

![](https://static.wixstatic.com/media/d18dad_00f962f736a448a885bc377ee3caec60~mv2.gif/v1/fill/w_220,h_165,q_90/d18dad_00f962f736a448a885bc377ee3caec60~mv2.gif){width="492"}

After that, we could use the information to show that there may be a correlation between the amount of media consumption and the financial situation in the own household. The variable "ga1_5" should show exactly this.

## Exercise

1.  Get the data in R.
2.  Find the relevant variables and maybe rename or even mutate them.
3.  Try to visualize the differences in media usage (variables from "qd3_1" to "qd3_8") between the EU countries.
4.  Can you think of a nice visualization to show correlations between the media usage and the variable about the financial situation in his/her own household (variable "qa1_5").


Good luck and have fun!

Nico

