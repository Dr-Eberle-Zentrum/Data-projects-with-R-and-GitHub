## 1. Which products are sold the most?

    data <-
      read_csv("data.csv", show_col_types = F) |>
      # drop NA entries
      drop_na() |>
      # compute revenue
      mutate(revenue = Item_MRP * 0.7 * Item_Outlet_Sales) |>
      group_by(Item_Type) |>
      # overall sales per item type
      summarise(
        sum_Sales = sum(Item_Outlet_Sales),
        sum_Revenue = sum(revenue),
        mean_Visibility = mean(Item_Visibility)
                ) |>
      # fraction of overall sales
      mutate(
        frac_Sales = sum_Sales / sum(sum_Sales) *100,
        frac_Revenue = sum_Revenue / sum(sum_Revenue) *100
      )

    # salesPlot <-
      data |>
      ggplot(aes(x = Item_Type, y = sum_Sales, fill = mean_Visibility)) +
      geom_col() +
      # rotated x label
      theme(axis.text.x = element_text(angle = 60, hjust = 1)) +
      labs(title = "Overall Sales per Item Type",
           x = "Item Type",
           y = "Overall Sales",
           fill = "Average\nVisibility") +
      # grouping marks in thousands
      scale_y_continuous(labels = scales::number_format(big.mark = ",")) +
      # show frac_Sales on top of each bar
      geom_text(aes(label = paste0(round(frac_Sales,1),"%")), vjust = -0.5, size=3)

![](martin_files/figure-markdown_strict/salesPlot-1.png)

    # revenuePlot <-
      data |>
      ggplot(aes(x = Item_Type, y = sum_Revenue, fill = mean_Visibility)) +
      geom_col() +
      # rotated x label
      theme(axis.text.x = element_text(angle = 60, hjust = 1)) +
      labs(title = "Overall Revenue per Item Type",
           x = "Item Type",
           y = "Overall Revenue",
           fill = "Average\nVisibility") +
      # grouping marks in thousands
      scale_y_continuous(labels = scales::number_format(big.mark = ",")) +
      # show frac_Sales on top of each bar
      geom_text(aes(label = paste0(round(frac_Revenue,1),"%")), vjust = -0.5, size=3)

![](martin_files/figure-markdown_strict/salesPlot-2.png)

    # # plot both plots side by side
    # gridExtra::grid.arrange(salesPlot, revenuePlot, ncol=2)

## 2. Does this effect differ according to location and size?

    # data <-
      read_csv("data.csv", show_col_types = F) |>
      # drop NA entries
      drop_na() |>
      group_by(Item_Type, Outlet_Location_Type) |>
      summarize(normSales = sum(Item_Outlet_Sales)/length(unique(Outlet_Identifier)),
                mean_Visibility = mean(Item_Visibility),
                .groups = "drop") |>
      ggplot(aes(x = Item_Type, y = normSales, fill = mean_Visibility)) +
        geom_col() +
        # rotated x label
        theme(axis.text.x = element_text(angle = 60, hjust = 1)) +
        labs(title = "Overall Sales per Item Type",
             x = "Item Type",
             y = "Overall Sales normalized by #(Stores)",
             fill = "Average\nVisibility") +
        # grouping marks in thousands
        scale_y_continuous(labels = scales::number_format(big.mark = ",")) +
        # faceting by Outlet_Location_Type
        facet_wrap(~Outlet_Location_Type)

![](martin_files/figure-markdown_strict/locationPlot-1.png)

    # data <-
    read_csv("data.csv", show_col_types = F) |>
      # drop NA entries
      drop_na() |>
      group_by(Item_Type, Outlet_Type) |>
      summarize(normSales = sum(Item_Outlet_Sales)/length(unique(Outlet_Identifier)),
                mean_Visibility = mean(Item_Visibility),
                .groups = "drop") |>
      ggplot(aes(x = Item_Type, y = normSales, fill = mean_Visibility)) +
      geom_col() +
      # rotated x label
      theme(axis.text.x = element_text(angle = 60, hjust = 1)) +
      labs(title = "Overall Sales per Item Type",
           x = "Item Type",
           y = "Overall Sales normalized by #(Stores)",
           fill = "Average\nVisibility") +
      # grouping marks in thousands
      scale_y_continuous(labels = scales::number_format(big.mark = ",")) +
      # faceting by Outlet_Location_Type
      facet_wrap(~Outlet_Type)

![](martin_files/figure-markdown_strict/locationPlot-2.png)