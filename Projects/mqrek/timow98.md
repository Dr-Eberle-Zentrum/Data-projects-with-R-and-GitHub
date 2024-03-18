## Data Manipulation Goals

\*Converting the ‘Date’ column to a proper date format to facilitate
time-based analysis.

Read the CSV file and display the head of the data. We can format the
date column when importing the file.

    NVDA <- read_csv("NVDA_messedUp_final.csv", 
        col_types = cols(Date = col_date(format = "%Y-%m-%d"))) # Date format
    head(NVDA)

    ## # A tibble: 6 × 7
    ##   Date        Open  High   Low Close Adj.Close   Volume
    ##   <date>     <dbl> <dbl> <dbl> <dbl>     <dbl>    <dbl>
    ## 1 2014-06-20  4.80  4.82  4.70  4.73      4.51 35314800
    ## 2 2014-06-23  4.67  4.68  4.62  4.68      4.45 41420000
    ## 3 2014-06-24  4.67  4.71  4.58  4.61      4.38 27578000
    ## 4 2014-06-25  4.62  4.66  4.58  4.65      4.43 21542000
    ## 5 2014-06-26  4.65  4.66  4.58  4.59      4.37 25690800
    ## 6 2014-06-27  4.58  4.62  4.56  4.60      4.37 30282000

\*Calculating monthly closing values from the dataset to identify trends
and patterns in the stock performance over time. Here we can use dplyr
to get a new dataframe with mean closing values per month.

    NVDA_monthly <- NVDA %>%
      mutate(month = format(Date, "%Y-%m")) %>%
      group_by(month) %>%
      summarise(mean_close = mean(Close, na.rm = TRUE))

    NVDA_weekly <- NVDA %>%
      mutate(week = format(Date, "%Y-%W")) %>%
      group_by(week) %>%
      summarise(mean_close = mean(Close, na.rm = TRUE))

    print(NVDA_monthly)

    ## # A tibble: 290 × 2
    ##    month   mean_close
    ##    <chr>        <dbl>
    ##  1 2000-02       1.30
    ##  2 2000-03       1.87
    ##  3 2000-04       1.75
    ##  4 2000-05       2.01
    ##  5 2000-06       2.87
    ##  6 2000-07       2.65
    ##  7 2000-08       2.95
    ##  8 2000-09       3.08
    ##  9 2000-10       2.74
    ## 10 2000-11       2.58
    ## # ℹ 280 more rows

    print(NVDA_weekly)

    ## # A tibble: 1,264 × 2
    ##    week    mean_close
    ##    <chr>        <dbl>
    ##  1 2000-09       1.27
    ##  2 2000-10       1.85
    ##  3 2000-11       2.33
    ##  4 2000-12       2.00
    ##  5 2000-13       1.68
    ##  6 2000-14       1.85
    ##  7 2000-15       1.69
    ##  8 2000-16       1.66
    ##  9 2000-17       1.77
    ## 10 2000-18       1.87
    ## # ℹ 1,254 more rows

## Visualisation

The closing values are now used to produce two charts \*A plot with a
logarithmic scale to highlight percentage changes over time.

First of all, the new dataframe with the column month is of type
character. I need to change it back to the date format.

    NVDA_monthly$month <- as.Date(paste0(NVDA_monthly$month, "-01"))

When using logarithmic scales, NA values would create an error message,
so first of all we need to do something about that. It would be possible
to add just a tiny constant to all the NA values or just delete them.

    NVDA_monthly <- NVDA_monthly %>%
      filter(mean_close > 0)

Adding a small constant would look like this:
NVDA\_monthly*m**e**a**n*<sub>*c*</sub>*l**o**s**e*<sub>*p*</sub> &lt;  − *N**V**D**A*<sub>*m*</sub>*o**n**t**h**l**y*mean\_close +
1e-6 But it would not be useful because there is only one NA value which
is basically the recent month.

Now we can plot it.

    # This is for the labels on the x-axis
    break_years <- as.Date(c("2000-01-01", "2010-01-01", "2020-01-01"))

    p1 <- ggplot(NVDA_monthly, aes(x = month, y = mean_close)) +
      geom_line(group = 1, color = "blue", size = 1) +
      scale_y_log10(breaks = c(1, 10, 100, 1000))+
      scale_x_date(breaks = break_years, labels = format(break_years, "%Y"), date_labels = "%Y") +
      labs(
        x = "Date",
        y = "Monthly values (log)",
        title = "NVIDIA STOCK CHART - Logarithmic scale") +
      theme(panel.grid = element_line(colour = "lightgrey"),
            panel.background = element_rect(fill = "white"))

    ## Warning: Using `size` aesthetic for lines was deprecated in ggplot2 3.4.0.
    ## ℹ Please use `linewidth` instead.
    ## This warning is displayed once every 8 hours.
    ## Call `lifecycle::last_lifecycle_warnings()` to see where this warning was
    ## generated.

\*A plot with a linear scale to provide a clear representation of
absolute stock values.

    # This is for the labels on the x-axis
    break_years <- as.Date(c("2000-01-01", "2010-01-01", "2020-01-01"))

    p2 <- ggplot(NVDA_monthly, aes(x = month, y = mean_close)) +
      geom_line(group = 1, color = "black", size = 1) +
      scale_y_continuous(breaks = c(0,200,400,600,800), limits = c(0,800))+
      scale_x_date(breaks = break_years, labels = format(break_years, "%Y"), date_labels = "%Y") +
      labs(
        x = "Date",
        y = "Monthly values",
        title = "NVIDIA STOCK CHART - Linear scale") +
      theme(panel.grid = element_line(colour = "lightgrey"),
            panel.background = element_rect(fill = "white"))

Now both plots next to each other

    plot_grid(p1, p2, ncol = 2)

![](timow98_files/figure-markdown_strict/plot_grid_output-1.png)
