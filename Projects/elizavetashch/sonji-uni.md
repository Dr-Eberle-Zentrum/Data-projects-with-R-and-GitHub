# Table of content

1.  [Preparation](#preparation)  
2.  [Filter polyethylene films](#filter-polyethylene-films)  
3.  [Generate total biomass](#generate-total-biomass)

# Preparation

    library(tidyverse)
    datRaw <- read.csv2('Microplastic_Affect_Soil_Properties_and_Plant_Biomass.csv', encoding = 'UTF-8') |> 
      rename(shape = X.U.FEFF.shape)

# Data Processing

## Filter polyethylene films

    dat <- datRaw |> 
      filter(shape == 'Films')

## Generate total biomass

The variable `root` is corrupt, in the sense that it contains a date as
well as numbers. Dates have to be excluded.

    dat <- dat |> 
      filter(str_detect(root, '\\d$'))

    options(digits = 5)

    dat <- dat |> 
      rowwise() |> 
      mutate(shoot = as.numeric(shoot),
             root = as.double(root),
             biomass = root / shoot) |> 
      ungroup()

# Plot

    library(latticeExtra)
    library(grid)

    levelplot(biomass ~ shoot * root, 
              dat, 
              panel = panel.levelplot.points, 
              scales = list(x = list(at = seq(0, 400, by = 50)))) + 
      layer_(panel.2dsmoother(..., n = 200))

![Relationship between root and shoot, colored with the value of
biomass](sonji-uni_files/figure-markdown_strict/fig-rootShootRatio-1.png)
