    #load packages
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

    library(dplyr)

    #loading datasets
    bear<- read.csv("smooth_stress_tensor (bear).csv")
    hyaena<- read.csv("smooth_stress_tensor (hyaena).csv")
    lion<- read.csv("smooth_stress_tensor (lion).csv")
    wolf<- read.csv("smooth_stress_tensor (bear).csv")

    #to make work flow easier data frames are put into a list
    animals<- list(bear=bear,hyaena=hyaena,lion=lion,wolf=wolf)

The project requires the following steps: 1. Removing the top 2 % of the
Von Misses Stress Measurement in each data set 2. Dividing each dataset
along it’s three axis into 10 equal sized segments 3. Calculating
average von Misses Stress on each section for each animal and axis 4.
Creating plots that display the average Von Misses Stress within each
axis for each animal

1.  Removing top 2%

<!-- -->

    #defining a function to remove the top 2% (0.02)
    top2 <- function(df, column, percent) {
      
    #calculating cutoff value 
        upper_cutoff <- max(df[[column]]) - percent * (max(df[[column]]) -min(df[[column]]))
        
        # Filter the DataFrame to remove the top X% rows
    filtered_df<-df %>%
            filter(df[[column]] < upper_cutoff)

    return(filtered_df)
    }

    animals_filtered<-lapply(animals, top2, column = "Von.Misses.Stress", percent = 0.02)

1.  Dividing axis of the datasets into 10 equal parts

<!-- -->

    #Creating a function that segments dataframes axis into 10 equal parts
    segments <- function(df) {
        df %>%
            mutate(
                segments_X = cut(X, breaks = 10, labels = FALSE),
                segments_Y = cut(Y, breaks = 10, labels = FALSE),
                segments_Z = cut(Z, breaks = 10, labels = FALSE)
            )
    }

    #applying function to animals 
    animals_segmented <- lapply(animals, segments)

1.  Calculating averages Von Misses Stress per section

<!-- -->

    # Define the segment columns and the variable to summarize
    segment_cols <- c("segments_X", "segments_Y", "segments_Z")
    value_col <- "Von.Misses.Stress"

    # Function to calculate mean per segment
    mean_segment <- function(df, segment_col, value_col) {
        df %>%
            group_by(across(all_of(segment_col))) %>%
            summarize(mean_stress = mean(.data[[value_col]], na.rm = TRUE), .groups = 'drop')
    }
    # 

    #function to apply on all dataframes
    all_segments <- function(df, segment_cols, value_col) {
        means_list <- map(segment_cols, ~ mean_segment(df, .x, value_col))
        names(means_list) <- segment_cols
        reduce(means_list, bind_cols)
    }

    #apply onto each frame within animal segmented
    animals_means <- map(animals_segmented, ~ all_segments(.x, segment_cols, value_col))

    ## New names:
    ## New names:
    ## New names:
    ## New names:
    ## New names:
    ## New names:
    ## New names:
    ## New names:
    ## • `mean_stress` -> `mean_stress...2`
    ## • `mean_stress` -> `mean_stress...4`

1.  Extracting Mean Values per Axis

<!-- -->

    #we need to create three dataframes containing the X/Y/Z means for Von Misses Stress for each animal
    names(animals_means) <- c("bear", "hyena", "lion", "wolf")

    # Select columns that end with "2" in each dataframe for the x axis
    x_axis<- map(animals_means, ~ select(.x, ends_with("2")))

    # and combine them into one dataframe
    x_axis <- bind_cols(animals_means[[1]]$segments_X,x_axis$bear,x_axis$hyena,x_axis$lion,x_axis$wolf)

    ## New names:
    ## • `` -> `...1`
    ## • `mean_stress...2` -> `mean_stress...3`
    ## • `mean_stress...2` -> `mean_stress...4`
    ## • `mean_stress...2` -> `mean_stress...5`

    names(x_axis)<- c("segment","bear","hyena","lion","wolf")

    # Select columns that end with "4" in each dataframe for the x axis
    y_axis<- map(animals_means, ~ select(.x, ends_with("4")))

    # and combine them into one dataframe
    y_axis <- bind_cols(animals_means[[1]]$segments_Y,y_axis$bear,y_axis$hyena,y_axis$lion,y_axis$wolf)

    ## New names:
    ## • `` -> `...1`
    ## • `mean_stress...4` -> `mean_stress...2`
    ## • `mean_stress...4` -> `mean_stress...3`
    ## • `mean_stress...4` -> `mean_stress...5`

    names(y_axis)<- c("segment","bear","hyena","lion","wolf")

    # Select columns that end with "4" in each dataframe for the x axis
    z_axis<- map(animals_means, ~ select(.x, ends_with("6")))

    # and combine them into one dataframe
    z_axis <- bind_cols(animals_means[[1]]$segments_Z,z_axis$bear,z_axis$hyena,z_axis$lion,z_axis$wolf)

    ## New names:
    ## • `` -> `...1`
    ## • `mean_stress...6` -> `mean_stress...2`
    ## • `mean_stress...6` -> `mean_stress...3`
    ## • `mean_stress...6` -> `mean_stress...4`
    ## • `mean_stress...6` -> `mean_stress...5`

    names(z_axis)<- c("segment","bear","hyena","lion","wolf")

1.  Creating plots

<!-- -->

    x_axis_longer<- x_axis %>%
        pivot_longer(cols = c("bear","hyena","lion","wolf"),
                     names_to = "animal",
                     values_to = "value")

    x_axis_longer%>%
      ggplot(aes(x = segment, y = value, color = animal)) +
        geom_point() +
        geom_line() +
        labs(y = "Stress", title = "Stress by Segment for Different Animals") +
        theme_minimal()

![](janthiele7_files/figure-markdown_strict/unnamed-chunk-12-1.png)

    y_axis_longer<- y_axis %>%
        pivot_longer(cols = c("bear","hyena","lion","wolf"),
                     names_to = "animal",
                     values_to = "value")

    y_axis_longer%>%
      ggplot(aes(x = segment, y = value, color = animal)) +
        geom_point() +
        geom_line() +
        labs(y = "Stress", title = "Stress by Segment for Different Animals") +
        theme_minimal()

![](janthiele7_files/figure-markdown_strict/unnamed-chunk-13-1.png)

    z_axis_longer<- z_axis %>%
        pivot_longer(cols = c("bear","hyena","lion","wolf"),
                     names_to = "animal",
                     values_to = "value")

    z_axis_longer%>%
      ggplot(aes(x = segment, y = value, color = animal)) +
        geom_point() +
        geom_line() +
        labs(y = "Stress", title = "Stress by Segment for Different Animals") +
        theme_minimal()

![](janthiele7_files/figure-markdown_strict/unnamed-chunk-14-1.png)
