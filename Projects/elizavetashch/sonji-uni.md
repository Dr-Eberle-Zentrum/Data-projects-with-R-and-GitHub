# Preparation

    library(tidyverse)

    ## Warning: Paket 'tidyverse' wurde unter R Version 4.1.3 erstellt

    ## Warning: Paket 'ggplot2' wurde unter R Version 4.1.3 erstellt

    ## Warning: Paket 'tibble' wurde unter R Version 4.1.3 erstellt

    ## Warning: Paket 'tidyr' wurde unter R Version 4.1.3 erstellt

    ## Warning: Paket 'readr' wurde unter R Version 4.1.3 erstellt

    ## Warning: Paket 'purrr' wurde unter R Version 4.1.3 erstellt

    ## Warning: Paket 'dplyr' wurde unter R Version 4.1.3 erstellt

    ## Warning: Paket 'stringr' wurde unter R Version 4.1.3 erstellt

    ## Warning: Paket 'forcats' wurde unter R Version 4.1.3 erstellt

    ## Warning: Paket 'lubridate' wurde unter R Version 4.1.3 erstellt

    ## -- Attaching core tidyverse packages ------------------------ tidyverse 2.0.0 --
    ## v dplyr     1.1.0     v readr     2.1.4
    ## v forcats   1.0.0     v stringr   1.5.0
    ## v ggplot2   3.4.1     v tibble    3.2.1
    ## v lubridate 1.9.2     v tidyr     1.3.0
    ## v purrr     1.0.1     
    ## -- Conflicts ------------------------------------------ tidyverse_conflicts() --
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()
    ## i Use the ]8;;http://conflicted.r-lib.org/conflicted package]8;; to force all conflicts to become errors

    datRaw <- read.csv2('Microplastic_Affect_Soil_Properties_and_Plant_Biomass.csv', encoding = 'UTF-8') |> 
      rename(shape = X.U.FEFF.shape)

# Filter polyethylene films

    dat <- datRaw |> 
      filter(shape == 'Films')

# Generate total biomass

    options(digits = 6)

    dat <- dat |> 
      mutate(shoot = as.numeric(shoot),
             root = as.double(root),
             totalBiomass = sum(shoot, root, na.rm = T))

    ## Warning: There was 1 warning in `mutate()`.
    ## i In argument: `root = as.double(root)`.
    ## Caused by warning:
    ## ! NAs durch Umwandlung erzeugt

The variable `root` is corrupt, in the sense that it contains a date as
well as numbers.
