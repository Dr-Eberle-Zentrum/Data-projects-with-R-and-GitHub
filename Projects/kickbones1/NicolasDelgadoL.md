    #knitr::opts_chunk$set(echo = TRUE, root.dir = here::here())
    options(repos = c(CRAN = "https://cloud.r-project.org/"))
    library(dplyr)

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

    library(ggplot2)

## Data Loading

    # Set working directory to the current file's location
    setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# Load the dataset

    data <- read.csv("kaggle_dataset.csv")

# Inspect the dataset

    str(data)

    ## 'data.frame':    700 obs. of  11 variables:
    ##  $ User.ID                   : int  1 2 3 4 5 6 7 8 9 10 ...
    ##  $ Device.Model              : chr  "Google Pixel 5" "OnePlus 9" "Xiaomi Mi 11" "Google Pixel 5" ...
    ##  $ Operating.System          : chr  "Android" "Android" "Android" "Android" ...
    ##  $ App.Usage.Time..min.day.  : int  393 268 154 239 187 99 350 543 340 424 ...
    ##  $ Screen.On.Time..hours.day.: num  6.4 4.7 4 4.8 4.3 2 7.3 11.4 7.7 6.6 ...
    ##  $ Battery.Drain..mAh.day.   : int  1872 1331 761 1676 1367 940 1802 2956 2138 1957 ...
    ##  $ Number.of.Apps.Installed  : int  67 42 32 56 58 35 66 82 75 75 ...
    ##  $ Data.Usage..MB.day.       : int  1122 944 322 871 988 564 1054 1702 1053 1301 ...
    ##  $ Age                       : int  40 47 42 20 31 31 21 31 42 42 ...
    ##  $ Gender                    : chr  "Male" "Female" "Male" "Male" ...
    ##  $ User.Behavior.Class       : int  4 3 2 3 3 2 4 5 4 4 ...

    head(data)

    ##   User.ID   Device.Model Operating.System App.Usage.Time..min.day.
    ## 1       1 Google Pixel 5          Android                      393
    ## 2       2      OnePlus 9          Android                      268
    ## 3       3   Xiaomi Mi 11          Android                      154
    ## 4       4 Google Pixel 5          Android                      239
    ## 5       5      iPhone 12              iOS                      187
    ## 6       6 Google Pixel 5          Android                       99
    ##   Screen.On.Time..hours.day. Battery.Drain..mAh.day. Number.of.Apps.Installed
    ## 1                        6.4                    1872                       67
    ## 2                        4.7                    1331                       42
    ## 3                        4.0                     761                       32
    ## 4                        4.8                    1676                       56
    ## 5                        4.3                    1367                       58
    ## 6                        2.0                     940                       35
    ##   Data.Usage..MB.day. Age Gender User.Behavior.Class
    ## 1                1122  40   Male                   4
    ## 2                 944  47 Female                   3
    ## 3                 322  42   Male                   2
    ## 4                 871  20   Male                   3
    ## 5                 988  31 Female                   3
    ## 6                 564  31   Male                   2

Data Manipulation Convert app usage time from minutes/day to hours/day.
Compute median app usage time for each device model. Calculate the
number of users for each device model.

# Convert app usage time to hours/day

    data <- data %>%
      mutate(Screen.On.Time..hours.day. = App.Usage.Time..min.day. / 60)

# Compute median app usage time and number of users per device model

    device_summary <- data %>%
      group_by(Device.Model) %>%
      summarise(
        MedianAppUsage = median(Screen.On.Time..hours.day.),
        TotalUsers = n()
      ) %>%
      arrange(desc(TotalUsers))

# Create age group categories for visualization

    data <- data %>%
      mutate(AgeGroup = case_when(
        Age >= 20 & Age <= 29 ~ "20-29",
        Age >= 30 & Age <= 39 ~ "30-39",
        Age >= 40 & Age <= 49 ~ "40-49",
        Age >= 50 & Age <= 59 ~ "50-59",
        TRUE ~ "Other"
      ))

Violin Plot by Device Model and Gender

# Create a violin plot with gender and age group differentiation

    ggplot(data, aes(x = Device.Model, y = Screen.On.Time..hours.day., fill = Gender)) +
      geom_violin(alpha = 0.3, color = "black") +  # Transparent violins
      geom_jitter(aes(color = AgeGroup), size = 1, width = 0.2) +  # Add points for age groups
      scale_color_manual(values = c("gray", "green", "purple", "blue", "orange")) +  # Custom colors for age groups
      labs(
        title = "Mobile Device Usage for Different Models",
        subtitle = "Shown is the median app usage time for different mobile devices, differentiated by gender and age group",
        x = "",
        y = "Median App Usage Time (hours/day)",
        fill = "Gender",
        color = "Age Group"
      ) +
      theme_minimal() +
      theme(
        axis.text.x = element_text(angle = 45, hjust = 1),
        plot.title = element_text(size = 14, face = "bold"),
        plot.subtitle = element_text(size = 12)
      )

![](NicolasDelgadoL_files/figure-markdown_strict/plot1-1.png)

Adding User Counts to the Plot

    # Add user count annotations below the x-axis
    device_summary <- device_summary %>%
      mutate(Label = paste(TotalUsers, "Users"))

    ggplot(data, aes(x = Device.Model, y = Screen.On.Time..hours.day., fill = Gender)) +
      geom_violin(alpha = 0.3, color = "black") +
      geom_jitter(aes(color = AgeGroup), size = 1, width = 0.2) +
      scale_color_manual(values = c("gray", "green", "purple", "blue", "orange")) +
      geom_text(
        data = device_summary,
        aes(x = Device.Model, y = -0.5, label = Label),
        inherit.aes = FALSE,
        size = 3,
        color = "black"
      ) +
      labs(
        title = "Mobile Device Usage for Different Models",
        subtitle = "Shown is the median app usage time for different mobile devices, differentiated by gender and age group",
        x = "",
        y = "Median App Usage Time (hours/day)",
        fill = "Gender",
        color = "Age Group"
      ) +
      theme_minimal() +
      theme(
        axis.text.x = element_text(angle = 45, hjust = 1),
        plot.title = element_text(size = 14, face = "bold"),
        plot.subtitle = element_text(size = 12),
        plot.margin = margin(20, 20, 40, 20)
      )

![](NicolasDelgadoL_files/figure-markdown_strict/plot2-1.png)

Conclusion This analysis highlights trends in app usage time across
device models and demographic groups. Key findings include:

Median app usage time varies significantly by device model. Gender and
age groups show distinct usage patterns. Further exploration could
examine differences across operating systems, app categories, or user
satisfaction.

------------------------------------------------------------------------
