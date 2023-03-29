# Table of content

1.  [Preparation](#preparation)  
2.  [Data Cleaning](#data-cleaning)
3.  [Data Processing](#data-processing)  
4.  [Plot](#plot)

# Preparation

    library(tidyverse)

    datRaw <- read.csv('project data.csv')

# Data Cleaning

## Select columns

    dat <- datRaw |> 
      select(P4_1:P4_3,
             S8_1:S8_2)

## Remove missings

    dat <- dat |> 
      na.omit()

## Recode columns

    dat <- dat |> 
      mutate_at(vars(starts_with('P4_')),
                ~ case_match(.x,
                             1 ~ T, 2 ~ F))

    dat <- dat |> 
      mutate(hw_time = S8_1*60 + S8_2) |> 
      select(-c(S8_1, S8_2))

## Rename columns

    names(dat) <- str_replace(names(dat),
                              pattern = 'P4',
                              replacement = 'dev')

# Data Processing

## Add group

> ## Access to electric devices
>
> There will be four colors representing the following four situations:
>
> 1.  computer/tablet, internet and smartphone  
> 2.  computer/tablet/smart phone but no internet  
> 3.  have internet but no computer/tablet/smart phone  
> 4.  have none of them

    dat <- dat |> 
      mutate(access = case_when(
         dev_1 &  dev_2 &  dev_3 ~ 1,
         dev_1 & !dev_2 &  dev_3 ~ 2,
        !dev_1 &  dev_2 & !dev_3 ~ 3,
        !dev_1 & !dev_2 & !dev_3 ~ 4,
        TRUE                     ~ 5
      ))

    dat <- dat |> 
      mutate(access = factor(access,
                             labels = c('Computer/Tablet, Smartphone and Internet',
                                        'Computer/Tablet and Smartphone',
                                        'Internet',
                                        'None',
                                        'Other')))

# Plot

    dat |> 
      ggplot(aes(x = hw_time,
                 fill = access)) +
      geom_bar()

![Relationship between access to different devices and time spent on
homework](sonji-uni_files/figure-markdown_strict/fig-deviceHomework-1.png)

The range of total time spent on homework is quite large (0 ≤ `hw_time`
≥ 1020. Therefore, I think that a bar plot is not really suitable here.
