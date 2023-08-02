I first tried to make a simple scatterplot for the total mean radius of
the three measurements of each Taxa.

![](laurens-mauz_files/figure-markdown_strict/ex1-1.png)

I remembered that Martin advised Nico to make Violin plots, so I did as
well. I think with violin plots the distribution of the data is a little
bit easier to see. It seems that most rings have a mean radius between 0
and 50, although there are some exceptions.

![](laurens-mauz_files/figure-markdown_strict/ex1%20violin-1.png)

Here I make a Barplot for the number of tree rings. There seems to be a
clear trend: more trees have a fewer number of rings
![](laurens-mauz_files/figure-markdown_strict/ex2-1.png)

I made the scatterfplot of mean radius against the standard deviation of
the mean radius and added a linear approximation of the data for INdet
and Populus.

    ## `geom_smooth()` using formula = 'y ~ x'

![](laurens-mauz_files/figure-markdown_strict/ex3-1.png)

I wanted to see how good the linear regression fits the data. You can
see that R squared for Populus is ca. 0,7 and for Indet it is ca. 0,35.
The linear model seems to fit the Populs Taxa a lot better
