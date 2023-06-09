## ![Nutri-Score Picture](1920px-Nutri-score-A_light_background_logo.svg.png){width="250"}

## Looking at Food Facts

Data Source: [OpenFoodFacts](https://app.gigasheet.com/spreadsheet/OpenFoodFacts-org-Products-Database/9a056567_9b41_4dda_a673_37fe1d3526b5)

The given data is a subset of the data containing 25 000 rows.

The data table is pretty sparse, in a lot of rows column data is missing. For any analysis you'd have to explain which subset of the data you used, and how you got this subset. **You may use a subset of the data for any analysis,** as long as you explain your decision.

To better understand the tasks, briefly learn about the Nutri-score, most importantly about the scoring system: [Nutri-Score (Wikipedia, english)](https://en.wikipedia.org/wiki/Nutri-Score), [Nutri-Score (Wikipedia, Deutsch)](https://de.wikipedia.org/wiki/Nutri-Score) where processed food products get assigned a class from A(best) to E(worst) depending on some amounts of ingredients.

# Preprocessing:

1.  Define a subset of the table without any Nestle products or products using palm oil.

2.  Use kj/100g to fill out the blanks in kcal/100g and vice versa.

3.  Preprocess some (for you) relevant data columns as you need (eg. transform packaging to plastic, not-plastic, unknown)

# Tasks

-   The Nutriscore consists of a score between -15 and 40 and a class assignment depending on this score. Plot the frequency of each score and color them by class for a selection of the data (eg. beverages from 2020 or 2500 random rows where no column is empty). Is there anything striking about this result?

-   Group foods depending on type (pnns_groups_1), and find the average nutriscore(number) for each group. Visualize this in a suitable plot, using the nutri-score colors if applicable.

-   The Nutri-Score was first established in 2016 in France, and voluntarily adopted in Germany in 2021. Did the introduction change the way some convenience food was prepared? Try to find a suitable approach to answer this question, either by contrasting the countries, or by contrasting data from one country from different years. Hint: there are only 7 columns necessary to compute the Nutri-Score yourself.

-   Look at additives in the food and try to find correlations between foodgroups and additives.

-   Try to find a method to classify (define classes yourself) the foods for CO2-usage (carbon foodprint 100g), and use this method to classify the food items from each unique country with the highest/lowest/median energy-kcal_100g

-   Visualize the exports of every country with a sufficiently large number of different exports by food type

-   Visualize whatever you find most interesting here

**Helpful Stuff:**

All the necessary parameters to read in the data from one file

```{r}
read.table(file="Food_data_0.txt",allowEscapes = TRUE, header=TRUE, sep="\t", dec="\n",  fill=TRUE,quote = "", comment.char = "")

```

Some subsets of column names

```{r}
important_cols<-c("product_name","abbreviated_product_name","generic_name","quantity","packaging","packaging_tags","packaging_en","brands","brands_tags","countries_en","ingredients_tags","ingredients_analysis_tags","traces_tags","traces_en","additives","additives_n","additives_tags","nutriscore_grade","nutriscore_score","pnns_groups_1","pnns_groups_2","food_groups","food_groups_tags","food_groups_en","brand_owner","energy.kj_100g","energy.kcal_100g","energy_100g","energy.from.fat_100g","saturated.fat_100g","unsaturated.fat_100g","cholesterol_100g","carbohydrates_100g","sugars_100g","added.sugars_100g","fiber_100g","proteins_100g","salt_100g","added.salt_100g","sodium_100g","fruits.vegetables.nuts_100g")

nutriscore_cols<-c("nutriscore_grade","nutriscore_score","energy_100g","sugars_100g","saturated.fat_100g","fruits.vegetables.nuts_100g","fiber_100g","proteins_100g","salt_100g") 
```

Hexcodes of Nutri-Score Colors

```{r}
Nutri_Colors<-c("#058b49","#74c928","#fbc801","#f4730e","#ef2d1a")
```

Upper Limits of classes (highest number still included)

```{r}
Upper_lim<-c(-1,2,10,18,40)
```

Points for Positive Scoring (the bad stuff), for 100g of product, cut-off (anything this amount or lower will be assigned a lower point-score)

```{r}
 pos_points_cutoff<-matrix(data=c(1 ,  335 ,  4.5 ,  1 ,  90
                     ,2 ,  670 ,  9 ,  2 ,  180
                     ,3 ,  1005 ,  13.5 ,  3 ,  270
                     ,4 ,  1340 ,  18 ,  4 ,  360
                     ,5 ,  1675 ,  22.5 ,  5 ,  450
                     ,6 ,  2010 ,  27 ,  6 ,  540
                     ,7 ,  2345 ,  31 ,  7 ,  630
                     ,8 ,  2680 ,  36 ,  8 ,  720
                     ,9 ,  3015 ,  40 ,  9 ,  810
                     ,10 ,  3350 ,  45 ,  10 ,  900 ),nrow = 10, byrow = TRUE)
```

Points for Negative Scoring (the good stuff), for 100g of product, cut-off (anything this amount or lower will be assigned a lower point-score)

```{r}
neg_point_cutoff<-matrix(data=c(1 , 40 , 0.9 , 1.6
  ,2 , 60 , 1.9 , 3.2
  ,3 ,NA, 2.8 , 4.8
  ,4 ,NA, 3.7 , 6.4
  ,5 , 80 , 4.7 , 8.0  ), nrow = 5, byrow=TRUE)
```

======= \## ![Nutri-Score Picture](1920px-Nutri-score-A_light_background_logo.svg.png){width="250"}

## Looking at Food Facts

Data Source: [OpenFoodFacts](https://app.gigasheet.com/spreadsheet/OpenFoodFacts-org-Products-Database/9a056567_9b41_4dda_a673_37fe1d3526b5)

The given data is a subset of the data containing 25 000 rows.

The data table is pretty sparse, in a lot of rows column data is missing. For any analysis you'd have to explain which subset of the data you used, and how you got this subset. **You may use a subset of the data for any analysis,** as long as you explain your decision.

To better understand the tasks, briefly learn about the Nutri-score, most importantly about the scoring system: [Nutri-Score (Wikipedia, english)](https://en.wikipedia.org/wiki/Nutri-Score), [Nutri-Score (Wikipedia, Deutsch)](https://de.wikipedia.org/wiki/Nutri-Score) where processed food products get assigned a class from A(best) to E(worst) depending on some amounts of ingredients.

# Preprocessing:

1.  Define a subset of the table without any Nestle products or products using palm oil.

2.  Use kj/100g to fill out the blanks in kcal/100g and vice versa.

3.  Preprocess some (for you) relevant data columns as you need (eg. transform packaging to plastic, not-plastic, unknown)

# Tasks

-   The Nutriscore consists of a score between -15 and 40 and a class assignment depending on this score. Plot the frequency of each score and color them by class for a selection of the data (eg. beverages from 2020 or 2500 random rows where no column is empty). Is there anything striking about this result?

-   Group foods depending on type (pnns_groups_1), and find the average nutriscore(number) for each group. Visualize this in a suitable plot, using the nutri-score colors if applicable.

-   The Nutri-Score was first established in 2016 in France, and voluntarily adopted in Germany in 2021. Did the introduction change the way some convenience food was prepared? Try to find a suitable approach to answer this question, either by contrasting the countries, or by contrasting data from one country from different years. Hint: there are only 7 columns necessary to compute the Nutri-Score yourself.

-   Look at additives in the food and try to find correlations between foodgroups and additives.

-   Try to find a method to classify (define classes yourself) the foods for CO2-usage (carbon foodprint 100g), and use this method to classify the food items from each unique country with the highest/lowest/median energy-kcal_100g

-   Visualize the exports of every country with a sufficiently large number of different exports by food type

-   Visualize whatever you find most interesting here

**Helpful Stuff:**

Hexcodes of Nutri-Score Colors

```{r}
Nutri_Colors<-c("#058b49","#74c928","#fbc801","#f4730e","#ef2d1a")
```

Upper Limits of classes (highest number still included)

```{r}
Upper_lim<-c(-1,2,10,18,40)
```

Points for Positive Scoring (the bad stuff), for 100g of product, cut-off (anything this amount or lower will be assigned a lower point-score)

```{r}
 pos_points_cutoff<-matrix(data=c(1 ,  335 ,  4.5 ,  1 ,  90
                     ,2 ,  670 ,  9 ,  2 ,  180
                     ,3 ,  1005 ,  13.5 ,  3 ,  270
                     ,4 ,  1340 ,  18 ,  4 ,  360
                     ,5 ,  1675 ,  22.5 ,  5 ,  450
                     ,6 ,  2010 ,  27 ,  6 ,  540
                     ,7 ,  2345 ,  31 ,  7 ,  630
                     ,8 ,  2680 ,  36 ,  8 ,  720
                     ,9 ,  3015 ,  40 ,  9 ,  810
                     ,10 ,  3350 ,  45 ,  10 ,  900 ),nrow = 10, byrow = TRUE)
```

Points for Negative Scoring (the good stuff), for 100g of product, cut-off (anything this amount or lower will be assigned a lower point-score)

```{r}
neg_point_cutoff<-matrix(data=c(1 , 40 , 0.9 , 1.6
  ,2 , 60 , 1.9 , 3.2
  ,3 ,NA, 2.8 , 4.8
  ,4 ,NA, 3.7 , 6.4
  ,5 , 80 , 4.7 , 8.0  ), nrow = 5, byrow=TRUE)
```
