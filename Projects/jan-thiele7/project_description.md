A while back I did a data class where we had to do a project on any
dataset we wanted. Our group decided on the Openfoodfacts data set. We
were interested in the relationship between nutritional value and
environmental impact of food products sold in Germany. We did the
project in Python and now I would like to know how it would like in R.

### About the Data set

Openfoodfacts is an app and website where users can look up any
information about food products either by scanning the bar code or
searching for it manually.

The information users can look up include e.g production places,
nutritional information like fat, sugar, protein per 100g and
front-package labels such as the Nutriscore, Ecoscore and NOVA groups.

The data on the website is crowdsourced, meaning users can enter
information about food products on their own. This results in a lot of
missing and therefore messy data.

There are two options to download the dataset.

1.  Downloading the whole data set.

It is quite huge which could make computations difficult. But if you
know ways of dealing with huge data sets in R feel free to download the
whole dataset from the [Openfoodfacts
Website](https://world.openfoodfacts.org/data).

1.  Downloading a subset of the data

Using the [advanced search
form](https://world.openfoodfacts.org/cgi/search.pl) you can download a
subset of the data by specifying a criterion like **countries =
Germany** to get all the products sold in Germany.

### Goal of the Project

The goal of this project is to analyze the relationship between
nutritional value and environmental impact of different food groups sold
within germany. Particularly we are interested in discovering foods
which are both healthy and environmentally friendly.

Both factors are summarised as the Nutriscore and Ecoscore respectively.
They are front-package labels originating from France, which try to
communicate health and impact on the environment on a 5 step colored
scale.

-   A = highly nutritional / low environmental impact
-   E = low nutritional value / high environmental impact

## Visualization Goals

In the end I would like to see a bubble plot that shows the relationship
between Nutriscore and Ecoscore divided by categories. Here you can see
an example.

![](bubble_plot.png)

#### Visualization priorities (from high to low)

-   Ecoscore on the x axis
-   Nutriscore on the y axis
-   adjusting size of the bubble by deviation within one
    category(e.g. if there is high variance between nutri- and ecoscore
    within a category then the bubble should be bigger)
-   coloring of the bubbles with the colors of the nutriscore and
    ecoscore colors (e.g. if something has nutriscore of B and an
    ecoscore of B then it is colored green. Pay attention to the in
    between cases (e.g Nutriscore B and Ecoscore D), maybe you can find
    a clever way of deciding on their color.)

**Note:** The data set contains several categorization variables. The
plot above uses the *pnns\_groups\_1* and *pnns\_groups\_2* from the
full data set. The same variables are called *off:food\_groups* and
*off:food\_groups\_tags* in the subset data set.
