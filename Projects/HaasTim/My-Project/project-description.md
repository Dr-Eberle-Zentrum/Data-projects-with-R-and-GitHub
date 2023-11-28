# General Topic

For this project we are examining the **influence of the Covid-19
Pandemic on bilateral trade for Germany**.

# Data sets

In order to examine the differences in trade we will look at one data
set from **2019** and one from **2020**. The original data sets are
available on Harvard’s Database and public for everyone. If you are
interested you can find them
[**here**](https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/T4CHWJ).
However, the data set provided within the project is a manipulated
version (removed unimportant columns and selected Germany (DEU) as the
only “location\_code”).

    library(haven)
    Data2019 <- read_dta("~/Data-projects-with-R-and-GitHub2/Projects/HaasTim/My-Project/Data2019.dta")
    First10 <- head(Data2019, 5)
    print(First10)

    ## # A tibble: 5 × 6
    ##    year export_value import_value location_code partner_code hs_product_code
    ##   <dbl>        <dbl>        <dbl> <chr>         <chr>        <chr>          
    ## 1  2019        19358            0 DEU           AFG          040500         
    ## 2  2019     19964078            0 DEU           ARE          040500         
    ## 3  2019        52703            0 DEU           ARG          040500         
    ## 4  2019     72324616      8284852 DEU           AUT          040500         
    ## 5  2019     53605292     77260392 DEU           BEL          040500

I think the first 5 column are pretty straightforward and
self-explaining. The sixth one is about product codes. Each six-digit
number gives you a product for example, **“040500”** translates to
butter.

There is also a table about the **HS-2Digit-code** and its corresponding
code name which I still had from a previous course. This table is very
helpful because, we are not interested in a certain product rather in a
product category. To follow up on the previous example, “**040500”**
belongs to the”**04”** product category which describes: DAIRY PRODUCE;
BIRDS’ EGGS; NATURAL HONEY; EDIB

# Data manipulation

1.  For both bilateral data sets: We are only interested in the overall
    product category and not the specific kind of product. Therefore,
    you should **simplify** the 6-digit product code by keeping the
    first two digits and then **accumulate** all products together (for
    each trading partner) which have the same two digits. **Rename**
    this column to “2-digit\_code”

2.  **Merge** both data sets so that we have both export and import
    levels from 2019 and 2020 in the same row for each **country/product
    combination**.

3.  **Merge** this new dataset with the HS\_2Digit\_List together
    (across the 2 digit code), so we have a product category for each
    code

# Visualization Goals

## First Graph

Now, we are only interested in the differences in export and import
between 2019 and 2020 across all product categories. To do this, we
**summarize** the 2-digit code across all trading partners.

We are also **creating** 2 new columns (“Export\_Diff” and
“Import\_Diff”) from the perspective of 2020 to display the differences
in trade for each product category.

Our goal is to **visualize** the top five trade differences in product
categories (in absolute terms) for imports and exports (5 for imports
and 5 for exports. For our purposes we will use a Circular stacked
Barchart. ![](Circular%20stacked%20Barchart.png).

**Labelling the graph:**

1.  Utilize four distinct colors:
    -   Red and Green to indicate negative and positive trade
        differences, respectively.

    -   Two shades of Red and Blue to differentiate between imports and
        exports.
2.  Label each bar with its corresponding code name, using shortened
    versions where applicable (e.g., “04” for Dairy Produces).
3.  Create a legend to explain the meaning of the four colors and also
    add a headline to the chart.

## Second Graph

Now let’s look at the trade differences at the trade partners level. To
do this, we summarize the imports and exports (for 2019 and 2020) across
all product categories for each country. In the next step we create a
new column “Total Trade Difference”, which sums up the exports and
imports for 2019 and 2020 respectively and then calculates the
difference (again from the perspective of 2020).

This graph is optional as it requires HTML output. If graphing is not
preferred just create a table for the same purpose. The objective is to
showcase the Top10 trading partners with the highest “Total Trade
Difference” (in absolute terms) by using a Choropleth Map. You can find
more information about it
[here](https://r-graph-gallery.com/183-choropleth-map-with-leaflet.html)
