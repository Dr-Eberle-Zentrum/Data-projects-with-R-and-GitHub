---
title: "Projektbeschreibung Charlotte"
output: md_document
---

### Charlottes Project 🐌🐌🐌

🐌 **0: Dataset**

The Dataset looks at guest students in universities and other institutions for higher education by sex in NRW.

I got the dataset from the Internetpage GOVDATA, a platform for Data from Germany. The data provider is the Open.NRW portal.

🐌 **1: Datenbereinigung**

-   Load the dataset (this is the link to the dataset: <https://www.govdata.de/suche/daten/gasthorer-nach-hochschularten-hochschulen-und-geschlecht-land-wintersemester> )

-   Create new variable: Chose 3 Universities (chose 3 with least missing data) and create a variable "Uni 3" That shows the sum of the "Insgesamt" of the 3 universities per wintersemester

-   Important: We have a lot of missing Data. Sometimes all the information (for "männlich", "weiblich" and "Insgesamt") is missing, sometimes we have the information for "männlich" and "Insgesamt" but not for "weiblich" or vice verca. Think about how to treat the missing data.

-   Important: The Dataset is arranged in a way that is (in my opinion) not intuitive. Maybe try to arrange the data differently to make it easier to work with

🐌**Exercise 2: Datavisualisation**

**`First part: create the plot`**

Your visualisation should look something like this. Don´t forget to put a header and axis label that fit the data.

![](images/Mein%20Projekt%20Bild%201-01.png)

-   the x-axis should be the wintersemester, the y-axis the number of guest students ("Insgesamt")

-   The dots for the WS and number of guest students for the universities should be connected with thin lines.

-   At the end of the line, the name of the university should be placed in a box with a black border

-   All lines and points should have the same color, except the lines and points for the variable 'Total Universities,' which should have a unique color

**`Zweiter Teil: animate the plot :)`**

![](images/Mein%20Projekt%20Bild%202.png)

Attempt to animate the graph with `gganimate()`. Initially, only the data points for the winter semester 07/08 should be visible, followed by lines connecting to each subsequent winter semester, and the labels for each line should animate along with it.
