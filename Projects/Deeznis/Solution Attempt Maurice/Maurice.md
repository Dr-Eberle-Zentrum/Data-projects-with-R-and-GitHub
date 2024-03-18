    rm(list = ls()) #Clears the workspace to avoid any conflicts when first running the code
    options(scipen=999) #Disable scientific notation

    ##################################### Importing Packages #####################################

    if (!require(magrittr)) install.packages(magrittr)

    ## Loading required package: magrittr

    if (!require(dplyr)) install.packages(dplyr)

    ## Loading required package: dplyr

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

    if (!require(ggplot2)) install.packages(ggplot)

    ## Loading required package: ggplot2

    if (!require(tidyr)) install.packages(tidyr)

    ## Loading required package: tidyr

    ## 
    ## Attaching package: 'tidyr'

    ## The following object is masked from 'package:magrittr':
    ## 
    ##     extract

    library(magrittr) #Used for piping
    library(dplyr) #Used for adding new column  
    library(ggplot2) #Used for visualizations
    library(tidyr) #Pivot data

    ##################################### Setting Working Directory #####################################

    #I get the data directly from the GitHub site
    url_to_csv <- "https://dr-eberle-zentrum.github.io/Data-projects-with-R-and-GitHub/Projects/Deeznis/Housing_prices.csv"

    #I use ; as seperator.
    housing_prices <- read.csv(url_to_csv, sep =";")

    ##################################### Data Manipulation Goals #####################################

    #I first replace the . in the names of the columns with a _
    #This makes it easier to read
    colnames(housing_prices) <- gsub("\\.", "_", colnames(housing_prices))

    #I remove any excess _ at the end of the column names.
    remove_excess_ <- function(data) {
      names(data) <- gsub("_+$", "", names(data))
      return(data)
    }

    housing_prices <- remove_excess_(housing_prices)

    #I change the values of the below columns so that:

    # - Percentage Columns are shown as Decimal
    # - Infrastructure Investment values are actually in million. 

    housing_prices <- housing_prices %>%
      mutate(Percentage_of_Workforce_Working_Remotely = Percentage_of_Workforce_Working_Remotely / 100) %>%
      mutate(Urban_Population_Growth_Rate = Urban_Population_Growth_Rate / 100) %>%
      mutate(Rural_Population_Growth_Rate = Rural_Population_Growth_Rate / 100) %>%
      mutate(Public_Transport_Ridership_Change = Public_Transport_Ridership_Change / 100) %>%
      mutate(Internet_Infrastructure_Investment__Million_USD = Internet_Infrastructure_Investment__Million_USD * 1000000)

    #I reorder the data by Country and Year in preparation of calculating the home price growth
    housing_prices <- housing_prices %>%
      arrange(Country, Year)

    #I calculate the home price growth as the current index divided by the lagged index - 1 for each country.
    #I do this by grouping the operation by the Country column.
    housing_prices <- housing_prices %>% 
      group_by(Country) %>% 
      mutate(Home_Price_Growth = (Average_Urban_Housing_Price_Index / lag(Average_Urban_Housing_Price_Index)) - 1) %>%
      mutate(Remote_Workforce_Growth = (Percentage_of_Workforce_Working_Remotely / lag(Percentage_of_Workforce_Working_Remotely)) - 1)

    head(housing_prices)

    ## # A tibble: 6 × 12
    ## # Groups:   Country [1]
    ##    Year Country Country_Abbreviation Percentage_of_Workforce_Working_Remotely
    ##   <int> <chr>   <chr>                                                   <dbl>
    ## 1  2007 China   CN                                                     0.329 
    ## 2  2008 China   CN                                                     0.367 
    ## 3  2009 China   CN                                                     0.146 
    ## 4  2010 China   CN                                                     0.111 
    ## 5  2011 China   CN                                                     0.0565
    ## 6  2012 China   CN                                                     0.208 
    ## # ℹ 8 more variables: Average_Urban_Housing_Price_Index <dbl>,
    ## #   Urban_Population_Growth_Rate <dbl>, Rural_Population_Growth_Rate <dbl>,
    ## #   Public_Transport_Ridership_Change <dbl>,
    ## #   Internet_Infrastructure_Investment__Million_USD <dbl>,
    ## #   Environmental_Impact_Score__1_100 <dbl>, Home_Price_Growth <dbl>,
    ## #   Remote_Workforce_Growth <dbl>

    housing_Prices_long <- pivot_longer(housing_prices, 
                                        cols = c(Home_Price_Growth, Remote_Workforce_Growth), 
                                        names_to = "Variable",
                                        values_to = "Value")

    housing_Prices_long <- housing_Prices_long[, c("Year", "Country", "Variable", "Value")]

    head(housing_Prices_long)

    ## # A tibble: 6 × 4
    ## # Groups:   Country [1]
    ##    Year Country Variable                 Value
    ##   <int> <chr>   <chr>                    <dbl>
    ## 1  2007 China   Home_Price_Growth       NA    
    ## 2  2007 China   Remote_Workforce_Growth NA    
    ## 3  2008 China   Home_Price_Growth       -0.287
    ## 4  2008 China   Remote_Workforce_Growth  0.115
    ## 5  2009 China   Home_Price_Growth        1.26 
    ## 6  2009 China   Remote_Workforce_Growth -0.602
