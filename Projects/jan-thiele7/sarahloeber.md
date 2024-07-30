## Solution for Jan’s project

This is my attempt for a solution for Jan’s project. I will use the
dataset that Jan provided.

### Libraries

    library(tidyverse)

    ## Warning: package 'ggplot2' was built under R version 4.2.3

    ## Warning: package 'dplyr' was built under R version 4.2.3

    ## Warning: package 'stringr' was built under R version 4.2.3

    ## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ## ✔ dplyr     1.1.4     ✔ readr     2.1.4
    ## ✔ forcats   1.0.0     ✔ stringr   1.5.1
    ## ✔ ggplot2   3.5.1     ✔ tibble    3.2.1
    ## ✔ lubridate 1.9.2     ✔ tidyr     1.3.0
    ## ✔ purrr     1.0.1     
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()
    ## ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

    library(ggrepel)

    ## Warning: package 'ggrepel' was built under R version 4.2.3

### Read in data

    # read in dataset
    food_data <- read.csv("./data_openfood.csv")
    head(food_data)

    ##   X                                 product_name countries_en nutriscore_grade
    ## 1 1                                     Andr\xe8      Germany             <NA>
    ## 2 2                                         Test      Germany             <NA>
    ## 3 3 Katsuobushi (Dried and smoked bonito flakes)      Germany                b
    ## 4 4                                         <NA>      Germany             <NA>
    ## 5 5                                     blabblub      Germany             <NA>
    ## 6 6                             Steak Kr\xe4uter      Germany          unknown
    ##   ecoscore_grade pnns_groups_1 pnns_groups_2
    ## 1        unknown       unknown       unknown
    ## 2        unknown       unknown       unknown
    ## 3        unknown       unknown       unknown
    ## 4        unknown       unknown       unknown
    ## 5        unknown       unknown       unknown
    ## 6        unknown       unknown       unknown


    ### Cleaning the data

    I'm getting the data ready for plotting first, then create the actual plot. I'm removing the unknown / not-applicable categories, drop the NAs (if there are any) and change the groups to factor. I am also summarising groups together so I have less groups in the plot later (which makes it easier to read compared to my first version.)


    ```r
    df <- food_data %>%
      drop_na(pnns_groups_1, nutriscore_grade, ecoscore_grade) %>%
      filter(
        pnns_groups_1 != "unknown" & 
        nutriscore_grade != "unknown" & 
        ecoscore_grade != "unknown" & 
        nutriscore_grade != "not-applicable" & 
        ecoscore_grade != "not-applicable"
      ) %>%
      mutate(
        pnns_groups_2 = factor(pnns_groups_2),
        pnns_groups_2 = case_when(
          pnns_groups_2 %in% c("Offals", "Meat") ~ "Meat",
          pnns_groups_2 %in% c("Fruit juices", "Fruit nectars") ~ "Fruit juices",
          pnns_groups_2 %in% c("Cereals", "Breakfast cereals") ~ "Cereals",
          pnns_groups_2 %in% c("Teas and herbal teas and coffees", "Unsweetened beverages") ~ "Unsweetened beverages",
          pnns_groups_2 %in% c("Plant-based milk substitutes", "Milk and yogurt") ~ "Milk and yogurt",
          pnns_groups_2 %in% c("Ice cream", "Dairy desserts") ~ "Dairy desserts",
          pnns_groups_2 %in% c("Biscuits and cakes", "Pastries") ~ "Pastries",
          pnns_groups_2 %in% c("Pizza pies and quiches") ~ "Pizza",
          pnns_groups_2 %in% c("Artificially sweetened beverages") ~ "Sweetened beverages",
          pnns_groups_2 %in% c("Dried fruit", "Nuts") ~ "Nuts and dried fruit",
          pnns_groups_2 %in% c("Sandwiches", "Soups") ~ "Sandwiches and soups",
          pnns_groups_2 %in% c("One-dish meals", "Salty and fatty products") ~ "Salty and fatty products",
          TRUE ~ as.character(pnns_groups_2)
        )
      )

For this next part, I did not really know how to approach it. I took
your idea from the description and started off with a heatmap, however,
that did not really work out as I wanted. The rownames have to be
unique, therefore cannot be grouped and a matrix takes numeric variables
only. It looks cool but did not help me much.

    # convert data to matrix 
    #df1 <- df %>%
    #  select(-c(X, countries_en, product_name, pnns_groups_1))

    #df1$nutriscore <- as.numeric(as.factor(df1$nutriscore_grade))
    #df1$ecoscore <- as.numeric(as.factor(df1$ecoscore_grade)) 
    #df1$pnns_group <- as.numeric(df1$pnns_groups_2) 

    #rn <- df1[,3]
    #rn <- make.unique(as.character(rn))
    #df1 <- df1[,-3]

    #df1 <- df1 %>%
    #  select(-c(nutriscore_grade, ecoscore_grade))
    #rownames(df1) <- rn

    #matrix <- as.matrix(df1)
    #heatmap(matrix, scale="column")

So I had ChatGPT do it in the end…

    nutriscore_levels <- c("a" = 1, "b" = 2, "c" = 3, "d" = 4, "e" = 5)
    ecoscore_levels <- c("a" = 1, "b" = 2, "c" = 3, "d" = 4, "e" = 5)

    # Compute the centers and sizes of the bubbles
    plot_data <- df %>%
      group_by(pnns_groups_2, nutriscore_grade, ecoscore_grade) %>%
      summarise(count = n()) %>%
      ungroup() %>%
      mutate(nutriscore_value = nutriscore_levels[nutriscore_grade],
             ecoscore_value = ecoscore_levels[ecoscore_grade])

    ## `summarise()` has grouped output by 'pnns_groups_2', 'nutriscore_grade'. You
    ## can override using the `.groups` argument.

    # Compute the size of bubbles based on the number of unique combinations within each group
    bubble_size <- df %>%
      group_by(pnns_groups_2) %>%
      summarise(size = n_distinct(nutriscore_grade, ecoscore_grade))

    # Merge bubble size with plot data
    plot_data <- plot_data %>%
      left_join(bubble_size, by = "pnns_groups_2") %>%
      group_by(pnns_groups_2) %>%
      slice_max(order_by = count, n = 1) %>%
      ungroup()

And this is the plot that came out of it. The labels are a bit tricky
since they overlap and that does not look great in the plot. I changed
the size of the circle around the circle so the colours are clearer.

    nutriscore_colors <- c("a" = "#009e73", "b" = "#d6db32", "c" = "#f7c239", "d" = "#e06666", "e" = "#e21a1a")
    ecoscore_colors <- c("a" = "#009e73", "b" = "#d6db32", "c" = "#f7c239", "d" = "#e06666", "e" = "#e21a1a")

    # Create the plot
    ggplot(plot_data, aes(x = ecoscore_value, y = nutriscore_value, size = size, label = pnns_groups_2)) +
      geom_point(aes(color = nutriscore_grade, fill = ecoscore_grade), alpha = 0.6, shape = 21, stroke = 2, 
                 position = position_jitter(width = 0.3, height = 0.3)) +
      scale_size_area(max_size = 14, guide = 'none') +
      scale_color_manual(values = nutriscore_colors) +
      scale_fill_manual(values = ecoscore_colors) +
      scale_x_continuous(breaks = 1:5, labels = names(ecoscore_levels)) +
      scale_y_continuous(breaks = 1:5, labels = names(nutriscore_levels)) +
      theme_minimal() +
      labs(
        title = "Relationship between Nutri- and Ecoscore",
        x = "Ecoscore",
        y = "Nutriscore"
      ) +
      geom_text_repel(size = 2, box.padding = 0.3, point.padding = 0.2)

![](sarahloeber_files/figure-markdown_strict/plot%20nutriscore-1.png)
