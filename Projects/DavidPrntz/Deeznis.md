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
    sales_bar_plot <- ggplot(sales_by_category, aes(x = Item_Type, y = Item_Outlet_Sales, fill = Item_Outlet_Sales)) +
      geom_bar(stat = "identity") +
      geom_text(aes(label = paste0(round(relative_share * 100, 1), "%")),
                position = position_stack(vjust = 0.8),
                size = 3, color = "black") +
      labs(title = "Total Sales by Item Category with Relative Share", 
           x = "Item Category", 
           y = "Total Sales",
           fill = "Total Sales") +
      scale_fill_gradient(low = "khaki", high = "olivedrab4") +
      theme_minimal() +
      theme(axis.text.x = element_text(size = 11.5, angle = 45, hjust = 1, color = "black"),
            axis.text.y = element_text(size = 11.5, color="black"), 
            legend.position = "none") +
      scale_y_continuous(labels = comma)

    print(sales_bar_plot)

![](Deeznis_files/figure-markdown_strict/Sales%20Plot-1.png)

## Sales plot by Location Tier

    # First sum the sales by item category and location type
    #sales_by_category_location <- aggregate(Item_Outlet_Sales ~ Item_Type + Outlet_Location_Type, data = BMdata, FUN = sum)

    sales_by_category_location <- BMdata %>%
      group_by(Item_Type, Outlet_Location_Type) %>%
      summarise(total_sales = sum(Item_Outlet_Sales),
                avg_sales_per_store = sum(Item_Outlet_Sales) / n_distinct(Outlet_Identifier))

    ## `summarise()` has grouped output by 'Item_Type'. You can override using the
    ## `.groups` argument.

    # Create the sales bar plot with facets for Outlet_Location_Type
    sales_bar_plot_location <- ggplot(sales_by_category_location, aes(x = Item_Type, y = avg_sales_per_store, fill = avg_sales_per_store)) +
      geom_bar(stat = "identity") +
      labs(title = "Average Sales per Store by Item Category and Location Type", 
           x = "Item Category", 
           y = "Average Sales per Store",
           fill = "Average Sales per Store") +
      scale_fill_gradient(low = "khaki", high = "olivedrab4") +
      facet_wrap(~ Outlet_Location_Type, nrow = 1) +  
      theme_minimal() +
      theme(axis.text.x = element_text(size = 8, angle = 90, hjust = 1, color = "black"),
            axis.text.y = element_text(size = 11.5, color="black"), 
            legend.position = "none") +
      scale_y_continuous(labels = comma)


    print(sales_bar_plot_location)

![](Deeznis_files/figure-markdown_strict/Sales%20plot%20by%20Location%20Tier-1.png)

    ggsave("SolutionsByDennis/sales_bar_plot_location.png", plot = sales_bar_plot_location, 
           width = 300, height = 200, units = "mm", dpi = 600, bg = "white")

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

![](Deeznis_files/figure-markdown_strict/Revenue%20Plot-1.png) \##
Revenue by Tier type plot

    # Calculate total revenue and average revenue per store by item category and outlet location type
    revenue_by_category_location <- BMdata %>%
      group_by(Item_Type, Outlet_Location_Type) %>%
      summarise(total_revenue = sum(revenue),
                avg_revenue_per_store = sum(revenue) / n_distinct(Outlet_Identifier))

    ## `summarise()` has grouped output by 'Item_Type'. You can override using the
    ## `.groups` argument.

    # Revenue bar chart with color scale by average visibility and facet by Outlet_Location_Type
    rev_bar_plot_location <- ggplot(revenue_by_category_location, aes(x = Item_Type, y = total_revenue, fill = avg_revenue_per_store)) +
      geom_bar(stat = "identity") +
      labs(title = "Total Revenue by Item Category and Outlet Location",
           x = "Item Category",
           y = "Total Revenue",
           fill = "Average Visibility") +
      scale_fill_gradient(low = "lightblue", high = "darkblue") +
      facet_wrap(~ Outlet_Location_Type, nrow = 1) +  # Facet by Outlet_Location_Type
      theme_minimal() +
      theme(axis.text.x = element_text(size = 8, angle = 90, hjust = 1, color = "black"),
            axis.text.y = element_text(size = 11.5, color="black"),
            legend.position = "none") +
      scale_y_continuous(labels = comma)


    print(rev_bar_plot_location)

![](Deeznis_files/figure-markdown_strict/Rev%20plot%20by%20Location%20Tier-1.png)

    ggsave("SolutionsByDennis/rev_bar_plot_location.png", plot = rev_bar_plot_location, 
           width = 300, height = 200, units = "mm", dpi = 600, bg = "white")
