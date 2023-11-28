# Project description

## crime project

------------------------------------------------------------------------

In this project, we will look into the number of Police-recorded offences, Income of households, and at-risk-of-poverty rate by region and time. We will use bubble map and bubble graph for visualisation. All of the dataset are from Eurostat, which has various data on EU countries.

### Dataset

------------------------------------------------------------------------

[1] Police-recorded offences by NUTS 3 regions by age, sex and NUTS 2 region <https://ec.europa.eu/eurostat/databrowser/view/crim_gen_reg/default/table?lang=en>

[2] Income of households by NUTS 2 regions <https://ec.europa.eu/eurostat/databrowser/view/nama_10r_2hhinc/default/table?lang=en>

[3] At-risk-of-poverty rate by NUTS regions <https://ec.europa.eu/eurostat/databrowser/view/ilc_li41/default/table?lang=en>

*The site provides the filters that allows you to set the range of the data that you want to download. Adjust the filter according to the description of project. (It will make it much easier)*

![]()![]()

### Task 1

------------------------------------------------------------------------

Plot **a bubble map** with ggplot 2 to visualize the number of Police-recorded offence in Germany. Use facet_wrap() to visualize all of the different crimes ( Intentional homicide, Assault, Robbery... Theft)

***bubble map : <https://r-graph-gallery.com/330-bubble-map-with-ggplot2.html>***

-   Each points : NUTS3 regions of Germany ( *you can filter it easily by using the code "DE" in the site* )

-   size: Police-recorded offence *(unit : Per hundred thousand inhabitants)*

-   color: Police-recorded offence *(unit Number)*

-   time : 2019

*-You can see data in different units by changing Unit of measure section.*

*-You can see different types of offence by changing International classification of crime for statistical purposes.*

*-If this is too easy for you, add an animation according to the years(Markdown output does not support interactive/animated graphics formats like SVG or GIF, so HTML output might be necessary for the animated/interactive components this task) Image example*

![](images/bubble-map.png)

### Task 2

------------------------------------------------------------------------

Plot **a bubble chart (with animation)** to visualize the relationship of Police-recorded offence, income of house hold and at risk of poverty in each EU country. Work only with the county that has all the necessary data. Use facet_wrap() to visualize all of the different crimes ( Intentional homicide, Assault, Robbery... Theft)

***bubble chart: <https://r-graph-gallery.com/bubble-chart.html>***

***animation: <https://r-graph-gallery.com/271-ggplot2-animated-gif-chart-with-gganimate.html>***

-   Each points : EU country

-   x : Income of households (unit: Euro per inhabitant and for other setting I recommand using default setting but if you know what are you doing, you can adjust it as you need)

-   y : Police-recorded offence (unit : Per hundred thousand inhabitants)

-   size : Police-recorded offence (unit: Number)

-   color : At risk of poverty rate

-   animation : every years from 2008 to latest

*-Use text label (or interactive components) to distinguish the countries of each bubbles.*

*-You can see data in different years by changing time section. You can see different types of offence by changing International classification of crime for statistica purposes.*

*-If this is too easy for you, add an interactive componet to each bubbles(Markdown output does not support interactive/animated graphics formats like SVG or GIF, so HTML output might be necessary for the animated/interactive components this task)*

![](images/thecode2-1.png)
