# Marketing analysis of Bigmart sales - Solution by Baptiste

## Data wrangling

### The original `Dataset` needs some small changes:

-   Creation of `Item_Revenue`
-   Removing the rows with `NA` in `Outlet_Size`
-   I decided to keep the rows having `NA` in `Item_Weight` since we
    will not use this variable, so it will not cause any problems

<!-- -->

    Dataset <- Dataset |>
      mutate(Item_Revenue = Item_MRP * 0.7 * Item_Outlet_Sales) |>
      filter(!is.na(Outlet_Size))

    kable(Dataset[1:10, ])

<table>
<colgroup>
<col style="width: 7%" />
<col style="width: 5%" />
<col style="width: 7%" />
<col style="width: 7%" />
<col style="width: 10%" />
<col style="width: 4%" />
<col style="width: 8%" />
<col style="width: 11%" />
<col style="width: 5%" />
<col style="width: 9%" />
<col style="width: 8%" />
<col style="width: 8%" />
<col style="width: 5%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: left;">Item_Identifier</th>
<th style="text-align: right;">Item_Weight</th>
<th style="text-align: left;">Item_Fat_Content</th>
<th style="text-align: right;">Item_Visibility</th>
<th style="text-align: left;">Item_Type</th>
<th style="text-align: right;">Item_MRP</th>
<th style="text-align: left;">Outlet_Identifier</th>
<th style="text-align: right;">Outlet_Establishment_Year</th>
<th style="text-align: left;">Outlet_Size</th>
<th style="text-align: left;">Outlet_Location_Type</th>
<th style="text-align: left;">Outlet_Type</th>
<th style="text-align: right;">Item_Outlet_Sales</th>
<th style="text-align: right;">Item_Revenue</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">FDA15</td>
<td style="text-align: right;">9.300</td>
<td style="text-align: left;">Low Fat</td>
<td style="text-align: right;">0.0160473</td>
<td style="text-align: left;">Dairy</td>
<td style="text-align: right;">249.8092</td>
<td style="text-align: left;">OUT049</td>
<td style="text-align: right;">1999</td>
<td style="text-align: left;">Medium</td>
<td style="text-align: left;">Tier 1</td>
<td style="text-align: left;">Supermarket Type1</td>
<td style="text-align: right;">3735.1380</td>
<td style="text-align: right;">653150.28</td>
</tr>
<tr class="even">
<td style="text-align: left;">DRC01</td>
<td style="text-align: right;">5.920</td>
<td style="text-align: left;">Regular</td>
<td style="text-align: right;">0.0192782</td>
<td style="text-align: left;">Soft Drinks</td>
<td style="text-align: right;">48.2692</td>
<td style="text-align: left;">OUT018</td>
<td style="text-align: right;">2009</td>
<td style="text-align: left;">Medium</td>
<td style="text-align: left;">Tier 3</td>
<td style="text-align: left;">Supermarket Type2</td>
<td style="text-align: right;">443.4228</td>
<td style="text-align: right;">14982.56</td>
</tr>
<tr class="odd">
<td style="text-align: left;">FDN15</td>
<td style="text-align: right;">17.500</td>
<td style="text-align: left;">Low Fat</td>
<td style="text-align: right;">0.0167601</td>
<td style="text-align: left;">Meat</td>
<td style="text-align: right;">141.6180</td>
<td style="text-align: left;">OUT049</td>
<td style="text-align: right;">1999</td>
<td style="text-align: left;">Medium</td>
<td style="text-align: left;">Tier 1</td>
<td style="text-align: left;">Supermarket Type1</td>
<td style="text-align: right;">2097.2700</td>
<td style="text-align: right;">207907.83</td>
</tr>
<tr class="even">
<td style="text-align: left;">NCD19</td>
<td style="text-align: right;">8.930</td>
<td style="text-align: left;">Low Fat</td>
<td style="text-align: right;">0.0000000</td>
<td style="text-align: left;">Household</td>
<td style="text-align: right;">53.8614</td>
<td style="text-align: left;">OUT013</td>
<td style="text-align: right;">1987</td>
<td style="text-align: left;">High</td>
<td style="text-align: left;">Tier 3</td>
<td style="text-align: left;">Supermarket Type1</td>
<td style="text-align: right;">994.7052</td>
<td style="text-align: right;">37503.35</td>
</tr>
<tr class="odd">
<td style="text-align: left;">FDP36</td>
<td style="text-align: right;">10.395</td>
<td style="text-align: left;">Regular</td>
<td style="text-align: right;">0.0000000</td>
<td style="text-align: left;">Baking Goods</td>
<td style="text-align: right;">51.4008</td>
<td style="text-align: left;">OUT018</td>
<td style="text-align: right;">2009</td>
<td style="text-align: left;">Medium</td>
<td style="text-align: left;">Tier 3</td>
<td style="text-align: left;">Supermarket Type2</td>
<td style="text-align: right;">556.6088</td>
<td style="text-align: right;">20027.10</td>
</tr>
<tr class="even">
<td style="text-align: left;">FDO10</td>
<td style="text-align: right;">13.650</td>
<td style="text-align: left;">Regular</td>
<td style="text-align: right;">0.0127411</td>
<td style="text-align: left;">Snack Foods</td>
<td style="text-align: right;">57.6588</td>
<td style="text-align: left;">OUT013</td>
<td style="text-align: right;">1987</td>
<td style="text-align: left;">High</td>
<td style="text-align: left;">Tier 3</td>
<td style="text-align: left;">Supermarket Type1</td>
<td style="text-align: right;">343.5528</td>
<td style="text-align: right;">13866.19</td>
</tr>
<tr class="odd">
<td style="text-align: left;">FDP10</td>
<td style="text-align: right;">NA</td>
<td style="text-align: left;">Low Fat</td>
<td style="text-align: right;">0.1274699</td>
<td style="text-align: left;">Snack Foods</td>
<td style="text-align: right;">107.7622</td>
<td style="text-align: left;">OUT027</td>
<td style="text-align: right;">1985</td>
<td style="text-align: left;">Medium</td>
<td style="text-align: left;">Tier 3</td>
<td style="text-align: left;">Supermarket Type3</td>
<td style="text-align: right;">4022.7636</td>
<td style="text-align: right;">303451.30</td>
</tr>
<tr class="even">
<td style="text-align: left;">FDY07</td>
<td style="text-align: right;">11.800</td>
<td style="text-align: left;">Low Fat</td>
<td style="text-align: right;">0.0000000</td>
<td style="text-align: left;">Fruits and Vegetables</td>
<td style="text-align: right;">45.5402</td>
<td style="text-align: left;">OUT049</td>
<td style="text-align: right;">1999</td>
<td style="text-align: left;">Medium</td>
<td style="text-align: left;">Tier 1</td>
<td style="text-align: left;">Supermarket Type1</td>
<td style="text-align: right;">1516.0266</td>
<td style="text-align: right;">48328.11</td>
</tr>
<tr class="odd">
<td style="text-align: left;">FDA03</td>
<td style="text-align: right;">18.500</td>
<td style="text-align: left;">Regular</td>
<td style="text-align: right;">0.0454638</td>
<td style="text-align: left;">Dairy</td>
<td style="text-align: right;">144.1102</td>
<td style="text-align: left;">OUT046</td>
<td style="text-align: right;">1997</td>
<td style="text-align: left;">Small</td>
<td style="text-align: left;">Tier 1</td>
<td style="text-align: left;">Supermarket Type1</td>
<td style="text-align: right;">2187.1530</td>
<td style="text-align: right;">220633.74</td>
</tr>
<tr class="even">
<td style="text-align: left;">FDX32</td>
<td style="text-align: right;">15.100</td>
<td style="text-align: left;">Regular</td>
<td style="text-align: right;">0.1000135</td>
<td style="text-align: left;">Fruits and Vegetables</td>
<td style="text-align: right;">145.4786</td>
<td style="text-align: left;">OUT049</td>
<td style="text-align: right;">1999</td>
<td style="text-align: left;">Medium</td>
<td style="text-align: left;">Tier 1</td>
<td style="text-align: left;">Supermarket Type1</td>
<td style="text-align: right;">1589.2646</td>
<td style="text-align: right;">161842.79</td>
</tr>
</tbody>
</table>

### New dataset for visualisation 1

To simplify data handling before the visualisation of Sales or Revenue
vs. Item type, I suggest to create a intermdiate data table
`Dataset_V1`, which summarise:  
- the sum of all `Item_Outlet_Sales` of each `Item_Type` into
`Sum_Sales`  
- the sum of all `Item_Revenue` of each `Item_Type` into `Sum_Revenue`  
- the average `Item_visibility` of each `Item_Type` into
`Avg_Visibility`  
- the proportion of `Sum_Sales` represented by each `Item_Type` into
`Prop_Sales`  
- the proportion of `Sum_Revenue` represented by each `Item_Type` into
`Prop_Revenue`

Here is an extract of the new `Dataset_V1` table:

    Dataset_V1 <- Dataset |>
      group_by(Item_Type) |>
      summarise(Sum_Sales = sum(Item_Outlet_Sales), 
                Sum_Revenue = sum(Item_Revenue),
                Avg_Visibility = mean(Item_Visibility)) |>
      mutate(Prop_Sales = Sum_Sales * 100 / sum(Sum_Sales),
             Prop_Revenue = Sum_Revenue * 100 / sum(Sum_Revenue))

    kable(Dataset_V1[1:5, ])

<table style="width:100%;">
<colgroup>
<col style="width: 17%" />
<col style="width: 13%" />
<col style="width: 16%" />
<col style="width: 20%" />
<col style="width: 14%" />
<col style="width: 17%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: left;">Item_Type</th>
<th style="text-align: right;">Sum_Sales</th>
<th style="text-align: right;">Sum_Revenue</th>
<th style="text-align: right;">Avg_Visibility</th>
<th style="text-align: right;">Prop_Sales</th>
<th style="text-align: right;">Prop_Revenue</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">Baking Goods</td>
<td style="text-align: right;">1570068.8</td>
<td style="text-align: right;">169308117</td>
<td style="text-align: right;">0.0650101</td>
<td style="text-align: right;">6.898270</td>
<td style="text-align: right;">6.311537</td>
</tr>
<tr class="even">
<td style="text-align: left;">Breads</td>
<td style="text-align: right;">675871.1</td>
<td style="text-align: right;">79072793</td>
<td style="text-align: right;">0.0692290</td>
<td style="text-align: right;">2.969514</td>
<td style="text-align: right;">2.947708</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Breakfast</td>
<td style="text-align: right;">297418.1</td>
<td style="text-align: right;">34359988</td>
<td style="text-align: right;">0.0817859</td>
<td style="text-align: right;">1.306739</td>
<td style="text-align: right;">1.280886</td>
</tr>
<tr class="even">
<td style="text-align: left;">Canned</td>
<td style="text-align: right;">1733425.9</td>
<td style="text-align: right;">199341944</td>
<td style="text-align: right;">0.0646045</td>
<td style="text-align: right;">7.615997</td>
<td style="text-align: right;">7.431150</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Dairy</td>
<td style="text-align: right;">1855828.6</td>
<td style="text-align: right;">235641680</td>
<td style="text-align: right;">0.0694151</td>
<td style="text-align: right;">8.153787</td>
<td style="text-align: right;">8.784346</td>
</tr>
</tbody>
</table>

### New dataset for visualisation 2

For the objectives of visualisation 2, we will need to create two subset
of the orinigal `Dataset`:  
- `Dataset_V2a` that summarise the sales and revenue of the items by
`Outlet_Type`  
- `Dataset_V2b` that summarise the sales and revenue of the items by
`Outlet_Size`

Here we have `Dataset_V2a`:

    Dataset_V2a <- Dataset |>
      group_by(Item_Type, Outlet_Size) |>
      summarise(Sum_Sales = sum(Item_Outlet_Sales), 
                Sum_Revenue = sum(Item_Revenue),
                Avg_Visibility = mean(Item_Visibility))

    kable(Dataset_V2a[1:5, ])

<table>
<thead>
<tr class="header">
<th style="text-align: left;">Item_Type</th>
<th style="text-align: left;">Outlet_Size</th>
<th style="text-align: right;">Sum_Sales</th>
<th style="text-align: right;">Sum_Revenue</th>
<th style="text-align: right;">Avg_Visibility</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">Baking Goods</td>
<td style="text-align: left;">High</td>
<td style="text-align: right;">230800.5</td>
<td style="text-align: right;">24812892</td>
<td style="text-align: right;">0.0606052</td>
</tr>
<tr class="even">
<td style="text-align: left;">Baking Goods</td>
<td style="text-align: left;">Medium</td>
<td style="text-align: right;">820327.2</td>
<td style="text-align: right;">87950420</td>
<td style="text-align: right;">0.0607233</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Baking Goods</td>
<td style="text-align: left;">Small</td>
<td style="text-align: right;">518941.1</td>
<td style="text-align: right;">56544805</td>
<td style="text-align: right;">0.0717687</td>
</tr>
<tr class="even">
<td style="text-align: left;">Breads</td>
<td style="text-align: left;">High</td>
<td style="text-align: right;">98197.7</td>
<td style="text-align: right;">11367276</td>
<td style="text-align: right;">0.0667221</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Breads</td>
<td style="text-align: left;">Medium</td>
<td style="text-align: right;">352582.4</td>
<td style="text-align: right;">40949451</td>
<td style="text-align: right;">0.0631757</td>
</tr>
</tbody>
</table>

And here we have an extract of the new `Dataset_V2b`:

    Dataset_V2b <- Dataset |>
      group_by(Item_Type, Outlet_Location_Type) |>
      summarise(Sum_Sales = sum(Item_Outlet_Sales), 
                Sum_Revenue = sum(Item_Revenue),
                Avg_Visibility = mean(Item_Visibility))

    kable(Dataset_V2b[1:5, ])

<table>
<colgroup>
<col style="width: 18%" />
<col style="width: 29%" />
<col style="width: 14%" />
<col style="width: 16%" />
<col style="width: 21%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: left;">Item_Type</th>
<th style="text-align: left;">Outlet_Location_Type</th>
<th style="text-align: right;">Sum_Sales</th>
<th style="text-align: right;">Sum_Revenue</th>
<th style="text-align: right;">Avg_Visibility</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">Baking Goods</td>
<td style="text-align: left;">Tier 1</td>
<td style="text-align: right;">522299.0</td>
<td style="text-align: right;">56134987</td>
<td style="text-align: right;">0.0700132</td>
</tr>
<tr class="even">
<td style="text-align: left;">Baking Goods</td>
<td style="text-align: left;">Tier 2</td>
<td style="text-align: right;">237145.4</td>
<td style="text-align: right;">26385470</td>
<td style="text-align: right;">0.0626393</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Baking Goods</td>
<td style="text-align: left;">Tier 3</td>
<td style="text-align: right;">810624.3</td>
<td style="text-align: right;">86787660</td>
<td style="text-align: right;">0.0615195</td>
</tr>
<tr class="even">
<td style="text-align: left;">Breads</td>
<td style="text-align: left;">Tier 1</td>
<td style="text-align: right;">217368.8</td>
<td style="text-align: right;">25864284</td>
<td style="text-align: right;">0.0759657</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Breads</td>
<td style="text-align: left;">Tier 2</td>
<td style="text-align: right;">110667.9</td>
<td style="text-align: right;">13103125</td>
<td style="text-align: right;">0.0675557</td>
</tr>
</tbody>
</table>

------------------------------------------------------------------------

## Visualisation goals

### Sales vs. Item type

    #' First I want to generate the vector that will be used for the % labels.
    Prop_Sales_lab <- Dataset_V1$Prop_Sales |>
      round(3) |>
      sprintf(fmt = "%.2f") |>
      str_c("%")

    ggobj1 <-
      ggplot(data = Dataset_V1, aes(x = Item_Type, y = Sum_Sales, fill = Avg_Visibility)) +
      geom_col() +
      labs(x = "Item type", y = "Total sales",
           fill = "Average\nvisibility") +
      theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
      scale_y_continuous(labels = scales::comma) +
      geom_text(aes(label = Prop_Sales_lab), size = 3, vjust = -0.5, hjust = 0.5) +
      scale_fill_gradient2(low = "tomato", mid = "lightyellow", high = "forestgreen", midpoint = mean(Dataset_V1$Avg_Visibility))

    ggsave("Plots_baptistesolard/1_Sales_Type.png", plot = ggobj1, 
           width = 300, height = 200, units = "mm", dpi = 600)

<figure id="id">
<img src="%22Plots_baptistesolard/1_Sales_Type.png%22" class="class"
style="width:100.0%" alt="Plot Sales vs Type" />
<figcaption aria-hidden="true">Plot Sales vs Type</figcaption>
</figure>

Turns out that there are not much difference in `Avg_Visibility` between
the different `Item_Type`.  
An explanation could be that the `Item_Visibility` is calculated for
each indiviual item within its own category (= `Item_Type`), i.e.,
already homogenised.

### Revenue vs. Item type

I took the liberty of putting the scale of `Sum_Revenue` in million
dollars.

    #' First I want to generate the vector that will be used for the % labels.
    Prop_Revenue_lab <- Dataset_V1$Prop_Revenue |>
      round(3) |>
      sprintf(fmt = "%.2f") |>
      str_c("%")

    ggobj2 <-
      ggplot(data = Dataset_V1, aes(x = Item_Type, y = Sum_Revenue / 1e6, fill = Avg_Visibility)) +
      geom_col() +
      labs(x = "Item type", y = "Total revenue (in M$)",
                  fill = "Average\nvisibility") +
      theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
      geom_text(aes(label = Prop_Revenue_lab), size = 3, vjust = -0.5, hjust = 0.5) +
      scale_fill_gradient2(low = "tomato", mid = "lightyellow", high = "forestgreen", midpoint = mean(Dataset_V1$Avg_Visibility))

    ggsave("Plots_baptistesolard/2_Revenue_Type.png", plot = ggobj2, 
           width = 300, height = 200, units = "mm", dpi = 600)

<figure id="id">
<img src="%22Plots_baptistesolard/2_Revenue_Type.png%22" class="class"
style="width:100.0%" alt="Plot Revenue vs Type" />
<figcaption aria-hidden="true">Plot Revenue vs Type</figcaption>
</figure>

Looks like the relative proportion of `Sum_Sales` and `Sum_Revenue` are
pretty much the same between `Item_Type`.

### Total sales by outlet size

For the next 4 facet plots, I took the liberty to display the facets on
the same row, so the comparison of the y-axis is easier to make. I also
kept the labels on the x-axis turned to 90° and not slanted, otherwise
they are too cramped to be displayed properly.

    ggobj3 <-
      ggplot(data = Dataset_V2a, aes(x = Item_Type, y = Sum_Sales, fill = Avg_Visibility)) +
      geom_col() +
      facet_wrap(~ factor(Outlet_Size, levels = c("Small", "Medium", "High")), nrow = 1) +
      labs(x = "Item type", y = "Total sales",
           fill = "Average\nvisibility") +
      theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5)) +
      scale_y_continuous(labels = scales::comma) +
      scale_fill_gradient2(low = "tomato", mid = "lightyellow", high = "forestgreen", midpoint = mean(Dataset_V1$Avg_Visibility))

    ggsave("Plots_baptistesolard/3_Sales_Type_Size.png", plot = ggobj3, 
           width = 300, height = 200, units = "mm", dpi = 600)

<figure id="id">
<img src="%22Plots_baptistesolard/3_Sales_Type_Size.png%22"
class="class" style="width:100.0%" alt="Plot Sales vs Type by Size" />
<figcaption aria-hidden="true">Plot Sales vs Type by Size</figcaption>
</figure>

There are more sales in medium-sized outlets.  
Here it seems that the `Avg_Visibility` changes according to
`Outlet_Size`. The small-sized outlets have the best average visibility
of their products.

### Total sales by location type

    ggobj4 <-
      ggplot(data = Dataset_V2b, aes(x = Item_Type, y = Sum_Sales, fill = Avg_Visibility)) +
      geom_col() +
      facet_wrap(~ Outlet_Location_Type, nrow = 1) +
      labs(x = "Item type", y = "Total sales",
           fill = "Average\nvisibility") +
      theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5)) +
      scale_y_continuous(labels = scales::comma) +
      scale_fill_gradient2(low = "tomato", mid = "lightyellow", high = "forestgreen", midpoint = mean(Dataset_V1$Avg_Visibility))

    ggsave("Plots_baptistesolard/4_Sales_Type_Location.png", plot = ggobj4, 
           width = 300, height = 200, units = "mm", dpi = 600)

<figure id="id">
<img src="%22Plots_baptistesolard/4_Sales_Type_Location.png%22"
class="class" style="width:100.0%" alt="Sales vs Type by Location" />
<figcaption aria-hidden="true">Sales vs Type by Location</figcaption>
</figure>

Interestingly, there are more sales in Tier 3 outlets, although the
highest visibility is seen in Tier 1 outlets.

### Total revenue by outlet size

    ggobj5 <-
      ggplot(data = Dataset_V2a, aes(x = Item_Type, y = Sum_Revenue / 1e6, fill = Avg_Visibility)) +
      geom_col() +
      facet_wrap(~ factor(Outlet_Size, levels = c("Small", "Medium", "High")), nrow = 1) +
      labs(x = "Item type", y = "Total revenue (in M$)",
           fill = "Average\nvisibility") +
      theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5)) +
      scale_fill_gradient2(low = "tomato", mid = "lightyellow", high = "forestgreen", midpoint = mean(Dataset_V1$Avg_Visibility))

    ggsave("Plots_baptistesolard/5_Revenue_Type_Size.png", plot = ggobj5, 
           width = 300, height = 200, units = "mm", dpi = 600)

<figure id="id">
<img src="%22Plots_baptistesolard/5_Revenue_Type_Size.png%22"
class="class" style="width:100.0%" alt="Plot Revenue vs Type by Size" />
<figcaption aria-hidden="true">Plot Revenue vs Type by Size</figcaption>
</figure>

Similarly to what we observed in the total number of sales, the sum of
revenue is higher in medium-sized outlets.

### Total revenue by outlet location type

    ggobj6 <-
      ggplot(data = Dataset_V2b, aes(x = Item_Type, y = Sum_Revenue / 1e6, fill = Avg_Visibility)) +
      geom_col() +
      facet_wrap(~ Outlet_Location_Type, nrow = 1) +
      labs(x = "Item type", y = "Total revenue (in M$)",
           fill = "Average\nvisibility") +
      theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5)) +
      scale_fill_gradient2(low = "tomato", mid = "lightyellow", high = "forestgreen", midpoint = mean(Dataset_V1$Avg_Visibility))

    ggsave("Plots_baptistesolard/6_Revenue_Type_Location.png", plot = ggobj6, 
           width = 300, height = 200, units = "mm", dpi = 600)

<figure id="id">
<img src="%22Plots_baptistesolard/6_Revenue_Type_Location.png%22"
class="class" style="width:100.0%"
alt="Plot Revenue vs Type by Location" />
<figcaption aria-hidden="true">Plot Revenue vs Type by
Location</figcaption>
</figure>

Again, we have a similar results than for the total number of sales: the
revenues are generally higher in Tier 3 outlets.
