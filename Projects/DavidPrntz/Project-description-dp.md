# Marketing Analysis of Bigmart sales

## Project Description

Big Mart is Grocery Super Market Brand. Grocery stores house thousands
of products that you can find in many different locations and sizes.
When considering their marketing, grocery stores can analyze different
variables to see what products need to be promoted or offered discounts
on. The BigMart dataset provides 14204 observations and 12
variables.These variables include weight, fat content, visibility, item
type, location, and more. It also includes over 1,500 products across 10
different stores. The dataset can be downloaded on kaggle
<https://www.kaggle.com/datasets/thedevastator/bigmart-product-sales-factors>

## Current Data

The Dataset has the following attributes: Item\_Weight is the weight of
the product in kilograms. (Numeric) Item\_Fat\_Content is the fat
content of the product. (Categorical) Item\_Visibility is the visibility
of the product in store or online. (Numeric) Item\_Type is the type of
product, such as limited offers or no offer. (Categorical) Item\_MRP is
the maximum retail price of the product. (Numeric)
Outlet\_Establishment\_Year is the year the outlet was established.
(Numeric) Outlet\_Size is the size of the outlet, either retail or
supermarket. (Categorical) Outlet\_Location\_Type is the type of
location of the outlet, such as urban or rural area. (Categorical)
Outlet\_Type is the type of outlet, such as sales departmental store or
supermarket. (Categorical) Item\_Outlet\_Sales is the sales of the
product in the outlet. (Numeric)

## Goal

My aim is to evaluate the effects of the variables on purchasing
behavior.

First of all I need to clean the data. There are many missing values
that needed to be converted to NA values along with some variables that
are insufficiently written for future analysis. For example there are
different spellings of fat content that need to be unified.

After the Data Cleaning I would like to answer the following questions
by creating charts with ggplot:

1.  Which products are sold the most?

To answer this question I want to create a bar chart that shows the
absolute number of all sales by item category. In addition, I want to
show the relative share as a number above each bar.

1.  Does this effect differ according to location, size, type of
    supermarket?

To figure this out, I would like to create the same plot from 1.
Separated by the attribute’s location, size and type of supermarket.
Using location type as an example, I would then have a plot showing
total sales for location type tier 1, tier 2 & tier 3 split by item
category. I would like to create these plots to show the influence of
location, size and type of supermarket on sales. Additionally, I would
like to create a plot for each of the same attributes showing the
relative share of sales by item category within each location, size and
type of supermarket category. I want to create these plots to explore
how the share of each item category differs within the attribute
categories. For example, “do baking goods have a similar share in all
locations?”.
