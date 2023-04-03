# Table of content

1.  [Preparation](#preparation)  
2.  [Data Processing](#data-processing)  
3.  [Plot](#plot)

# Preparation

    library(tidyverse)

    datRaw <- read.csv('project data.csv')

# Data Processing

    dat <- datRaw |> 
      # select columns
      select(P4_1:P4_3,
             S8_1:S8_2) |> 
      # remove missings
      na.omit() |> 
      # recode columns
      mutate(across(starts_with('P4_'),
                    ~ case_match(.x,
                                 1 ~ T, 2 ~ F)),
             hw_time = round((S8_1*60 + S8_2) / 60)) |> 
      # rename columns
      rename('dev_computer' = P4_1,
             'dev_internet' = P4_2,
             'dev_smart' = P4_3,
             'hw_hours' = S8_1,
             'hw_minutes' = S8_2)

## Add group

> **Access to electric devices**
>
> There will be four colors representing the following four situations:
>
> 1.  computer/tablet, internet and smartphone  
> 2.  computer/tablet/smart phone but no internet  
> 3.  have internet but no computer/tablet/smart phone  
> 4.  have none of them

    dat <- dat |> 
      mutate(access = case_when(
         dev_computer &  dev_internet &  dev_smart ~ 'Computer/Tablet, Smartphone and Internet',
         dev_computer & !dev_internet &  dev_smart ~ 'Computer/Tablet and Smartphone',
        !dev_computer &  dev_internet & !dev_smart ~ 'Internet',
        !dev_computer & !dev_internet & !dev_smart ~ 'None',
                                              TRUE ~ 'Other') |> 
          factor())

# Plot

    dat |> 
      ggplot(aes(x = hw_time,
                 fill = access)) +
      geom_bar() +
      labs(title = 'Figure 1',
           x = 'Time Spent On Homework (in hours)',
           y = 'Count',
           fill = 'Access to Device')

![Relationship Between Access To Different Devices And Time Spent On
Homework](sonji-uni_files/figure-markdown_strict/fig-deviceHomework-1.png)
