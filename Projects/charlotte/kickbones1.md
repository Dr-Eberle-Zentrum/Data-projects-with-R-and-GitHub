# Luis’ solution of Charlotte’s project

## The R Code

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

    ###############################
    #        DATA CLEANING
    ###############################

    data <- read_delim(
        file = "https://www.landesdatenbank.nrw.de/ldbnrwws/downloader/00/tables/21331-02i_00.csv",
        delim = ";",
        locale = locale(encoding = "ISO-8859-1"),
        skip = 6, # skip the first 6 rows before reading data
        col_names = c("Semester", "University", "Total", "Male", "Female"),
        col_types = cols(Semester = col_character(),
                        University = col_character(),
                        Total = col_integer(), Male = col_integer(), Female = col_integer()),
        trim_ws = FALSE, #keep white spaces in the data
        na = c("-", "NA")) #replace missing data with NA

    ## Warning: One or more parsing issues, call `problems()` on your data frame for details,
    ## e.g.:
    ##   dat <- vroom(...)
    ##   problems(dat)

    dt_proc <- data %>%
        mutate(
            # replace missing data with corresponding number if possible
            Total = if_else(is.na(Total) & !is.na(Male) & !is.na(Female), Female + Male, Total),
            Male = if_else(!is.na(Total) & is.na(Male) & !is.na(Female), Total - Female, Male),
            Female = if_else(!is.na(Total) & !is.na(Male) & is.na(Female), Total - Male, Female),

            # calculate hierarchy from leading spaces
            hierarchy = str_count(University, "^\\s+"),

            # remove leading spaces
            University = str_replace(University, "^\\s+", "")
        ) %>%
        # filter for Universities of Bielefeld, Bochum and Bonn
        filter(University %in% c("Universität Bielefeld", "Universität Bochum", "Universität Bonn")) %>%
        
        # drop attributes not used for analysis
        select(Semester, University, Total)

    # Create a summary row for each year
    summary_rows <- dt_proc %>%
        group_by(Semester) %>%
        summarise(
            University = "Uni_total",
            Total = sum(Total)
        )

    # Bind the summary rows to the original data
    dt_proc <- 
      bind_rows(dt_proc, summary_rows) %>%
      arrange(Semester)


    ###############################
    #      DATA VISUALIZATION
    ###############################

    # convert Semester to int for later animation
    dt_conv <- dt_proc %>%
        mutate(Semester = as.integer(str_extract(Semester, "\\d{4}")))

    dt_plot <- dt_conv %>%
        ggplot(aes(x = Semester, y = Total, group = University, color = University)) +
        geom_point() +
        geom_line() +
        # custom color grading
        scale_color_manual(
            values = c(
                "Uni_total" = "red", 
                "Universität Bielefeld" = "black", 
                "Universität Bochum" = "black", 
                "Universität Bonn" = "black")) +
       # custom labels
        labs(
            title = "Total Number of Guest Students at Selected Universities",
            x = "Semester",
            y = "Total number of students"
        ) +
        theme_minimal() +
        theme(
            legend.position = "none"
        ) +
        # flip x-axis labels
        theme(axis.text.x = element_text(angle = 50, hjust = 1)) +
        # increase y-axis limits
        ylim(0, 3000) +
        # custom x-axis labels with 2007/08 as start and 2023/24 as end
        scale_x_continuous(breaks = seq(2007, 2023, 1), labels = paste0("WS ", c(2007:2023), "/", c(2008:2024)))  
        
    ###############################
    #       DATA ANIMATION
    ###############################

    library(gganimate)
    library(ggplot2)

    # Create an animation of the data over time
    plot_animate <- dt_plot +
        geom_text(aes(label = University), hjust = -0.1, vjust = 0.5) + # Add text labels
        transition_reveal(along = Semester)

    # Save the animation
    anim_save("animation.gif", animation = plot_animate)

    ## `geom_line()`: Each group consists of only one observation.
    ## ℹ Do you need to adjust the group aesthetic?
    ## `geom_line()`: Each group consists of only one observation.
    ## ℹ Do you need to adjust the group aesthetic?

## The Plot
![](luis_animation.gif)