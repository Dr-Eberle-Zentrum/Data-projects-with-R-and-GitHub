# Table of content

1.  [Preparation](#preparation)  
2.  [Data Processing](#data-processing)  
3.  [Plot](#plot)

# Preparation

    library(tidyverse)

    datRaw <- read.csv2('Microplastic_Affect_Soil_Properties_and_Plant_Biomass.csv', encoding = 'UTF-8') |> 
      rename(shape = X.U.FEFF.shape)

    datRaw <- read_csv2('Microplastic_Affect_Soil_Properties_and_Plant_Biomass.csv')

# Data Processing

> *Note:* The variable `root` is corrupt, in the sense that it contains
> a date as well as numbers. Dates have to be excluded.

    dat <- datRaw |> 
      # convert
      mutate(across(c(concentration, root, CO2),
                    as.double)) |> 
      # filter polyethylene films and concentrations and remove dates
      filter(shape == 'Films',
             str_detect(root, '\\d$')) |> 
      # generate total biomass
      mutate(root = as.double(root),
             biomass = root + shoot) |> 
      # recode soil aggregation
      mutate(WSA = WSA / 1000) |> 
      # select columns
      select(concentration,
             CO2,
             WSA,
             biomass) |> 
      # drop NAs
      na.omit()

# Plot

    library(latticeExtra)

    levelplot(biomass ~ WSA * CO2, 
              dat,
              panel = panel.levelplot.points,
              scales = list(x = list(at = seq(0, 6500, by = 500))), 
              colorkey = list(title = 'Total Biomass'),
              main = 'Figure 1',
              xlab = 'Soil Aggregation in % (in thousand)',
              ylab = 'Microbial Activity in μg CO2/(g*h)') + 
      layer_(panel.2dsmoother(..., n = 200))

![Relationship between Soil Aggregation and Microbial Activity, Colored
with the Value of
Biomass](sonji-uni_files/figure-markdown_strict/fig-1-1.png)
