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
    animals<- list(bear,hyaena,lion,wolf)

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

    # View the result for each dataframe
    print(animals_means)

    ## [[1]]
    ## # A tibble: 10 × 6
    ##    segments_X mean_stress...2 segments_Y mean_stress...4 segments_Z
    ##         <int>           <dbl>      <int>           <dbl>      <int>
    ##  1          1            1.81          1           13.5           1
    ##  2          2           13.6           2           12.1           2
    ##  3          3           11.8           3            9.89          3
    ##  4          4            8.66          4           10.8           4
    ##  5          5            7.55          5            9.25          5
    ##  6          6            8.71          6           14.9           6
    ##  7          7           13.5           7           28.6           7
    ##  8          8           18.9           8           23.4           8
    ##  9          9           15.1           9           12.9           9
    ## 10         10            3.48         10            6.64         10
    ## # ℹ 1 more variable: mean_stress...6 <dbl>
    ## 
    ## [[2]]
    ## # A tibble: 10 × 6
    ##    segments_X mean_stress...2 segments_Y mean_stress...4 segments_Z
    ##         <int>           <dbl>      <int>           <dbl>      <int>
    ##  1          1            8.93          1            20.5          1
    ##  2          2           51.9           2            26.8          2
    ##  3          3           27.0           3            23.6          3
    ##  4          4           14.9           4            23.7          4
    ##  5          5           13.6           5            19.5          5
    ##  6          6           14.5           6            36.5          6
    ##  7          7           20.3           7           101.           7
    ##  8          8           33.8           8           109.           8
    ##  9          9           49.9           9            72.3          9
    ## 10         10            5.34         10            23.4         10
    ## # ℹ 1 more variable: mean_stress...6 <dbl>
    ## 
    ## [[3]]
    ## # A tibble: 10 × 6
    ##    segments_X mean_stress...2 segments_Y mean_stress...4 segments_Z
    ##         <int>           <dbl>      <int>           <dbl>      <int>
    ##  1          1            6.60          1           10.8           1
    ##  2          2           22.8           2           10.5           2
    ##  3          3           15.3           3           11.9           3
    ##  4          4            8.59          4           10.7           4
    ##  5          5            5.35          5            9.55          5
    ##  6          6            6.53          6           12.5           6
    ##  7          7            9.00          7           23.9           7
    ##  8          8           16.4           8           34.3           8
    ##  9          9           18.9           9           31.4           9
    ## 10         10            4.21         10           12.7          10
    ## # ℹ 1 more variable: mean_stress...6 <dbl>
    ## 
    ## [[4]]
    ## # A tibble: 10 × 6
    ##    segments_X mean_stress...2 segments_Y mean_stress...4 segments_Z
    ##         <int>           <dbl>      <int>           <dbl>      <int>
    ##  1          1            1.81          1           13.5           1
    ##  2          2           13.6           2           12.1           2
    ##  3          3           11.8           3            9.89          3
    ##  4          4            8.66          4           10.8           4
    ##  5          5            7.55          5            9.25          5
    ##  6          6            8.71          6           14.9           6
    ##  7          7           13.5           7           28.6           7
    ##  8          8           18.9           8           23.4           8
    ##  9          9           15.1           9           12.9           9
    ## 10         10            3.48         10            6.64         10
    ## # ℹ 1 more variable: mean_stress...6 <dbl>
