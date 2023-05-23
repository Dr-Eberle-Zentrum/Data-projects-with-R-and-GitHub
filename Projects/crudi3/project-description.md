---
editor_options: 
  markdown: 
    wrap: 72
---

## Project description

For the project, I want to use a research question I have previously
dealt with in an assignment, but have not done any visualization for.
The broad topic is about how Postmaterialism/Materialism (as seen in the
data through the Inglehart Index) affects the level of trust towards
(governmental) institutions. The data set in question would be the same
I used for my analysis, the [ALLBUS
2021](https://search.gesis.org/research_data/ZA5280).

The
[Codebook](https://github.com/Dr-Eberle-Zentrum/Advanced-data-processing-with-R/blob/main/Projects/crudi3/Codebook.pdf)
and [Data
Set](https://github.com/Dr-Eberle-Zentrum/Advanced-data-processing-with-R/blob/main/Projects/crudi3/ZA5280_v2-0-0.dta)
are uploaded in my project folder.

Theoretically I would be leaning towards the cultural backlash
hypoothesis introduced to populism research, explaining why materialists
tvote for populist parties more so then postmaterialists. Since populism
involves a certain amount of disagreement with the established political
culture, political trust should also be affected by
materialistic/postmaterialistic values of individuals.

The goal of this project is to visualize the average trust levels of
different institutions according to their
materialistic/postmaterialistic value system. The resulting graph may
look similar to this:

![](https://listentopeople.eu/wp-content/uploads/2019/10/INSTITUTIONAL-TRUST_all-countries_v2_txt.png)

Instead of countries, the x-axis should show the institutions the
respondets evaluate their trust towards. Colors may be used to allow for
easier distinguishing, however colors should primarily be used to be
able to see the differences between the groups of post-/materialism.
![](https://www.jingege.wang/bioinformatics/ggplot2/48-grouped-barplot-with-ggplot2_files/figure-html/thecode4-1.png)
The plot should look somewhat like this, with colorcoded groups
according to their level of post-/materialism.The data set provides
everything you need, from trustlevels to the inglehart index for
post-/materialism. The documentation of the dataset is in german, if
that proves to be an issue I will, of course, help with that.

# Visualization goals

-   barplot with every institutional mean trust level
-   group the trust levels according to the level of post-/materialism
-   only one bar per institution
-   color code materialistic and postmaterialistic groups universally
    accross all bars
-   another option is to give each institution a definitve color and
    changeing the hue for post-/materialsitic groups (like a more
    frosted colorversion for materialism and more radiant one for
    postmateralism)
-   include the average trust level irrespectible of post-/materialism
    as a number within each bar
-   highlight the biggest and smallest difference between the
    post-/materialistics groups --\> how, is up to you

Please let me know, if anything is unclear or wether there are problems
with the data. Yours, Christian
