    library(tidyverse)

## Background

------------------------------------------------------------------------

Charcoal analysis is a valuable tool for reconstructing past human and
environmental interactions. It can provide information about the types
of wood used, whether green or dry wood was used and whether tree sizes
and ages were prioritised. The reconstruction of the original tree
diameter is necessary to answer such questions, and this is achievable
by measuring the curvature of the last annual ring using different
methods. However, understanding the relationship between tree size and
woodland management remains a significant challenge. Management is
assumed to lead to age and/or diameter peaks, and the diameters of
managed trees are supposed to be larger in their age category. Still,
unmanaged trees should reach a higher age, as they are not felled in a
planned manner. The difference in size is explainable by the access to
light, space and nutrients, which is better in managed woods. However,
it is also possible that free-standing trees grow faster.

## Data

------------------------------------------------------------------------

The data is shortened and consists now of nine columns:

-   ID: Number of every single piece, because of previous research
    purpose not abscond

-   Localisation: Description of the sampling area

-   Taxa: Identified wood species

-   Radius\_number: outermost annual ring 1 and then continuous (See
    fig. below) ![Numbering
    radius](Projects/muellertabea/description.jpg)

-   Radius1\_mean & Radius2\_mean & Radius3\_mean: Each annual ring is
    measured three times

-   Radius\_tot\_mean: The mean of all three measurements

-   Radius\_tot\_sd: The standard deviation of the total mean radius

<!-- -->

    read.csv("Projects/muellertabea/Data_Project1.csv", sep = ";") %>%
      head(5,)

    ##    ID Localisation    Taxa Radius_number Radius1_mean Radius2_mean Radius3_mean
    ## 1  30     80/50-22 Populus             1        31.31        32.86        32.91
    ## 2  46     80/50-22   Indet             1         7.68         7.55         7.45
    ## 3 166     80/50-22   Indet             1        22.38        22.53        23.68
    ## 4 166     80/50-22   Indet             2        12.44        12.43        12.29
    ## 5 154     80/50-22   Indet             1        22.47        21.95        21.68
    ##   Radius_tot_mean Radius_tot_sd
    ## 1        32.36000    0.90967027
    ## 2         7.56000   0.115325626
    ## 3        22.86333    0.71121961
    ## 4        12.38667   0.083864971
    ## 5        22.03333   0.401538707

## Task

------------------------------------------------------------------------

-   Plot with the mean radius size of each sample in which only the
    samples with Radius\_number 1 are considered. Differentiation
    between different taxa, colour gradient from smaller to larger
    diameter

-   Plot in which the number of samples with the different numbers of
    annual rings is shown

-   Plot with dependence of standard deviation on the mean value of the
    radius, differentiated by taxa
