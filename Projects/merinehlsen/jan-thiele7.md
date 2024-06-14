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
    survival<- read.csv2("flydata_survival.csv", sep=";", header=F)
    dev_time<- read.csv2("flydata_developmental_time.csv", sep = ";", header =FALSE)
    meta_pools<- read.csv2("flydata_metabolic_pools.csv", sep=";",
                           header=FALSE)

    survival_wide<- survival[c(1:6),] %>%
      rbind("Female SD", "Male SD", "Total SD")
    survival_wide[c(7:9), c(2:31)]<-NA


    test1=survival_wide[, seq(1, ncol(survival_wide), by = 2)]%>%
      drop_na()%>%
      select(-V1)

    test2=survival_wide[, seq(2, ncol(survival_wide), by = 2)]%>%
      drop_na()

    names(test1)<- names(test2)
    test3= rbind(test2,test1, make.row.names=F)

    survival_wide= cbind(survival_wide$V1, test3)

    survival_wide

    ##   survival_wide$V1    V2   V4   V6   V8  V10  V12  V14  V16  V18  V20  V22  V24
    ## 1             Diet   HPS  HPS  HPS  HPS  HPS  EPS  EPS  EPS  EPS  EPS  LPS  LPS
    ## 2             Line     1    2    3    4    5    1    2    3    4    5    1    2
    ## 3               n     10    5   10   10    7   10    5   10   10    6   10    5
    ## 4         Females   17,8 13,4 16,1 15,5 18,3   19 16,4 19,9 14,7 18,8 16,9 16,2
    ## 5           Males   17,8 16,8 16,1 13,7 15,6   18   11 14,9 15,3 13,2 16,2 18,4
    ## 6           Total   35,6 30,2 32,2 29,2 33,9   37 27,4 34,8   30   32 33,1 34,6
    ## 7        Female SD  1.14 1.03 1.02 1.63 1.71 1.26 1.63 1.23  0.9  1.3 1.37 1.11
    ## 8          Male SD 0.573  1.2 1.29 1.16 1.76 0.77 1.82 1.57 1.12  1.3 0.92 0.93
    ## 9         Total SD  0.78 1.07 0.83  1.2  1.3 1.17 2.62 1.45 1.32 1.03 1.39  1.4
    ##    V26  V28  V30
    ## 1  LPS  LPS  LPS
    ## 2    3    4    5
    ## 3   10   10    7
    ## 4 18,5 19,4 18,1
    ## 5 16,1   14   15
    ## 6 34,6 33,4 33,1
    ## 7 0.93 0.82 1.39
    ## 8  0.8 0.77 1.36
    ## 9 0.65 0.96 1.14
