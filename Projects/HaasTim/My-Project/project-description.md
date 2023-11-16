# General Topic

For this project we are examining the influence of the Covid-19 Pandemic
on bilateral trade for Germany.

# Data sets

In order to examine the differences in trade we will look at one data
set from 2019 and one from 2020. These data sets are available on
Harvard’s Database and public for everyone. You can find them
[here](https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/T4CHWJ)

There is also a table about the HS-2Digit-code and its corresponding
code name which I still had from a previous course.

# Data manipulation

1.  For both bilateral data sets: We are only interested in the overall
    product category and not the specific kind of product. Therefore,
    you should simplify the 6-digit product code by keeping the first
    two digits and then accumulate all products together (for each
    trading partner) which have the same two digits. Rename this column
    to “2digitcode”

2.  Merge both data sets so that we have both export and import levels
    from 2019 and 2020 in the same row for each country/product
    combination.

3.  Merge this new dataset with the HS\_2Digit\_List together (across
    the 2 digit code), so we have a product category for each code

# Visualization Goals

## First Graph

Now we are only interested in the differences in export and import
between 2019 and 2020 across all product categories. To do this, we
summarize the 2-digit code across all trading partners.

We are also creating 2 new columns (“Export\_Diff” and “Import\_Diff”)
from the perspective of 2020 to display the differences in trade for
each product category.

Our goal is to visualize the top five trade differences in product
categories (in absolute terms) for imports and exports. For our purposes
we will use a Circular stacked Barchart.
![](Circular%20stacked%20Barchart.png)

## Second Graph

Now let’s look at the trade differences at the trade partners level. To
do this, we summarize the imports and exports (for 2019 and 2020) across
all product categories for each country. In the next step we create a
new column “Total Trade Difference”, which sums up the exports and
imports for 2019 and 2020 respectively and then calculates the
difference (again from the perspective of 2020)

The objective is to display the Top10 trading partners with the highest
“Total Trade Difference” (in absolute terms) by using a Choropleth Map.
You can find more information about it
[here](https://r-graph-gallery.com/183-choropleth-map-with-leaflet.html)
