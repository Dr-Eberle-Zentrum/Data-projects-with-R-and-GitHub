# Setup and Libraries

    library(tidyverse) 

    ## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ## ✔ dplyr     1.1.4     ✔ readr     2.1.5
    ## ✔ forcats   1.0.0     ✔ stringr   1.5.1
    ## ✔ ggplot2   3.5.0     ✔ tibble    3.2.1
    ## ✔ lubridate 1.9.3     ✔ tidyr     1.3.1
    ## ✔ purrr     1.0.2     
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()
    ## ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

    library(ggplot2) 
    library(rio)
    library(scales)

    ## 
    ## Attache Paket: 'scales'
    ## 
    ## Das folgende Objekt ist maskiert 'package:purrr':
    ## 
    ##     discard
    ## 
    ## Das folgende Objekt ist maskiert 'package:readr':
    ## 
    ##     col_factor

    setwd("~/STUDIUM/Programming/R2 Data projects/Data-projects-with-R-and-GitHub/Projects/DavidPrntz")

    # import dataset
    import("data.csv", setclass = "tibble") -> BMdata 

# Data Cleaning

    # replace all empty values with na values
    BMdata[BMdata == ""] <- NA

    # create new column "revenue"
    BMdata$revenue <- BMdata$Item_MRP * 0.7 * BMdata$Item_Outlet_Sales

# Data Visualization

## Sales Plot

    # First sum the sales by item category
    sales_by_category <- aggregate(Item_Outlet_Sales ~ Item_Type, data = BMdata, FUN = sum)

    # Calculate the total sum of sales for the relative share
    total_sales <- sum(sales_by_category$Item_Outlet_Sales)

    # Relative Share
    sales_by_category$relative_share <- sales_by_category$Item_Outlet_Sales / total_sales

    # Sales bar plot with share%
    sales_bar_plot <- ggplot(sales_by_category, aes(x = Item_Type, y = Item_Outlet_Sales, fill = Item_Type)) +
      geom_bar(stat = "identity") +
      geom_text(aes(label = paste0(round(relative_share * 100, 2), "%")),
                position = position_stack(vjust = 0.8),
                size = 3, color = "black") +
      labs(title = "Total Sales by Item Category with Relative Share", 
           x = "Item Category", 
           y = "Total Sales",
           fill = "Item Category") +
      theme_minimal() +
      theme(axis.text.x = element_text(size = 11.5, angle = 90, hjust = 1, color = "black"),
            axis.text.y = element_text(size = 11.5, color="black")) +
      scale_y_continuous(labels = comma)

    print(sales_bar_plot)

![](Deeznis_files/figure-markdown_strict/Sales%20Plot-1.png)

## Revenue plot

    # Compute average item visibility by item category
    BMdata <- BMdata %>%
      group_by(Item_Type) %>%
      mutate(avg_visibility = mean(Item_Visibility))

    # revenue bar chart with color scale by avg visibility
    rev_bar_plot <- ggplot(BMdata, aes(x = Item_Type, y = revenue, fill = avg_visibility)) +
      geom_bar(stat = "identity") +
      labs(title = "Total Revenue by Item Category",
           x = "Item Category",
           y = "Total Revenue",
           fill = "Average Visibility") +
      scale_fill_gradient(low = "lightblue", high = "darkblue") +
      theme_minimal() +
      theme(axis.text.x = element_text(size = 11.5, angle = 45, hjust = 1, color = "black"),
            axis.text.y = element_text(size = 11.5, color="black"),
            legend.position = "none")  +
      scale_y_continuous(labels = comma)

    print(rev_bar_plot)

![](Deeznis_files/figure-markdown_strict/Revenue%20Plot-1.png)

    ### Zweiter teil kommt noch
    ![Sales Plot](/Projects/DavidPrntz/SolutionsByDennis/Sales_Plot.png)
    ![Revenue Plot](/Projects/DavidPrntz/SolutionsByDennis/RPlot.png)
