# Comparison of salaries of global remote data scientists!

Remote working became a norm during covid-19. And with remote work came
more concern about salary. Let’s see using the
[data](https://github.com/Dr-Eberle-Zentrum/Data-projects-with-R-and-GitHub/blob/main/Projects/Supti7/Salaries_data_scientists.csv)
from
[kaggle](https://www.kaggle.com/datasets/abhinavshaw09/data-science-job-salaries-2024?resource=download)
whether there is any difference in salary of remote data scientists in
different countries.

Here is a first look at the data:

    library(tidyverse)

    ## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ## ✔ dplyr     1.1.4     ✔ readr     2.1.5
    ## ✔ forcats   1.0.0     ✔ stringr   1.5.1
    ## ✔ ggplot2   3.5.2     ✔ tibble    3.2.1
    ## ✔ lubridate 1.9.4     ✔ tidyr     1.3.1
    ## ✔ purrr     1.0.4     
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()
    ## ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

    data <- read.csv("Salaries_data_scientists.csv")
    head(data)

    ##   work_year experience_level employment_type                       job_title
    ## 1      2024               SE              FT                     AI Engineer
    ## 2      2024               SE              FT       Machine Learning Engineer
    ## 3      2024               SE              FT       Machine Learning Engineer
    ## 4      2024               SE              FT       Machine Learning Engineer
    ## 5      2024               SE              FT       Machine Learning Engineer
    ## 6      2024               MI              FT Business Intelligence Developer
    ##   salary salary_currency salary_in_usd employee_residence remote_ratio
    ## 1  90000             USD         90000                 AE            0
    ## 2 180500             USD        180500                 US            0
    ## 3  96200             USD         96200                 US            0
    ## 4 235000             USD        235000                 AU            0
    ## 5 175000             USD        175000                 AU            0
    ## 6  95413             USD         95413                 US          100
    ##   company_location company_size
    ## 1               AE            L
    ## 2               US            M
    ## 3               US            M
    ## 4               AU            M
    ## 5               AU            M
    ## 6               US            M

## Visualization Goal of the project

The goal of this project is to summarize the visual information
primarily.The purpose is to see the regional differences in remote ratio
and salaries.Use choropleth maps to visualize the data.

-   Show first the percentage of data scientists working remotely
    globally.
-   Generate two plots in one figure showing the percentage of remote
    work between Europe and America.

Have fun and looking forward to seeing your work!

Kind regards, Supti
