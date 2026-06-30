# Solution for Michael’s Project “Demographic Shift in Germany”

    data <- read.csv("FReDA_panel_4waves_long_labeled.csv")
    head(data)

    ##       id welle    pid sample sat3 pa27 sd3 sd40 sd43 sd11 sd7e1 pstat
    ## 1 111000     2     NA    101   -3   NA  NA   NA   NA   NA    NA     0
    ## 2 111000     3     NA    101   -3   NA  NA   NA   NA   NA    NA     0
    ## 3 111000     4     NA    101   -3   NA  NA   NA   NA   NA    NA     0
    ## 4 828000     3 828103    101    9    2  NA   NA   NA   NA    NA     1
    ## 5 828000     4 828104    101    9    2  NA   NA   NA   NA    NA     1
    ## 6 907000     2     NA    101   -3   NA  NA   NA   NA   NA    NA     0
    ##   separation relstat reldur sd5ezby pa64 pa65 pa66 pa68i1 pa17i1 pa17i2 pa17i4
    ## 1         -7       6     -3      NA   NA   NA   NA     NA     NA     NA     NA
    ## 2         -3       6     -3      NA   NA   NA   NA     NA     NA     NA     NA
    ## 3         -3       6     -3      NA   NA   NA   NA     NA     NA     NA     NA
    ## 4         -7       3     -7      NA   NA   NA   NA     NA      5      4      2
    ## 5          0       3     36      NA   -3    5   NA     NA      5      5      2
    ## 6         -7       6     -3      NA   NA   NA   NA     NA     NA     NA     NA
    ##   pa17i5 pa17i6 pa17i8 pa21i7 pa21i8 pa21i9 pa21i10 pa21i11 pa21i12 pa21i13
    ## 1     NA     NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 2     NA     NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 3     NA     NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 4      5      1      5     NA     NA     NA      NA      NA      NA      NA
    ## 5      4      1      5      3      1      1       1       1       1       1
    ## 6     NA     NA     NA     NA     NA     NA      NA      NA      NA      NA
    ##   pa22ri1 pa22ri9 pa22ri10 pa22ri11 pa22ri12 pa22ri8 pa18i1 pa18i2 pa18i3
    ## 1      NA      NA       NA       NA       NA      NA     NA     NA     NA
    ## 2      NA      NA       NA       NA       NA      NA     NA     NA     NA
    ## 3      NA      NA       NA       NA       NA      NA     NA     NA     NA
    ## 4       1       1        5        1        2       5      4      1      2
    ## 5       1       1        5        1        2       4     NA     NA     NA
    ## 6      NA      NA       NA       NA       NA      NA     NA     NA     NA
    ##   pa18i4 pa18i6 pa18i7 pa18i8 pa18i10 pa18i11 pa18i12 pa18i13 pa18i14 pa18i15
    ## 1     NA     NA     NA     NA      NA      NA      NA      NA      NA      NA
    ## 2     NA     NA     NA     NA      NA      NA      NA      NA      NA      NA
    ## 3     NA     NA     NA     NA      NA      NA      NA      NA      NA      NA
    ## 4      1      4      1      1       1       4       2       1       2       2
    ## 5     NA     NA     NA     NA      NA      NA      NA      NA      NA      NA
    ## 6     NA     NA     NA     NA      NA      NA      NA      NA      NA      NA
    ##   pa18i16 pa19i1 pa19i8 pa14i6 pa14i7 pa14i8 pa14i9 pa14i10 pa14i11 pa14i12
    ## 1      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 2      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 3      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 4       5      5      5      4      2      3      5       1       3       2
    ## 5      NA     NA     NA      4      1      3      5       1       3       2
    ## 6      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ##   pa15 sat13 sat14 pa67i1 pa67i2 pa67i3 pa67i4 pa67i5 sd55 sat10 job48 job49
    ## 1   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA    NA    NA
    ## 2   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA    NA    NA
    ## 3   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA    NA    NA
    ## 4    3    NA    -3     NA     NA     NA     NA     NA   NA    NA    NA    NA
    ## 5    4     8    -3     -3     -3     -3     -3     -3   NA    NA    NA    NA
    ## 6   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA    NA    NA
    ##   job25 job60 job66 job61i1 job61i2 job61i3 job61i4 job61i5 sdp64 pjob42 sex30
    ## 1     2     1     1       3       4       4       4       4    -3     NA    NA
    ## 2     1     1     1       3       3       4       4       4    -3     NA    NA
    ## 3     4     1     1       4       4       4       4       4    -3     NA    NA
    ## 4    NA    NA     1      NA      NA      NA      NA      NA    -2     NA     1
    ## 5    NA    NA     1      NA      NA      NA      NA      NA    -3     NA     1
    ## 6    -3    -3    -3      -3      -3      -3      -3      -3    -3     NA    NA
    ##   inc13 hhincnet inc52 sdp42 inc42i1 inc42i2 inc43i1 inc43i2 hc13 bhc1 bhc10
    ## 1  1700     1700     5    -3      NA      NA      NA      NA   NA    2     1
    ## 2  1700     1700     5    -3      NA      NA      NA      NA   NA    1    -3
    ## 3  2200     2200     4    -3      NA      NA      NA      NA   NA    1    -3
    ## 4   -10     3250     5    -4      -3      -3      -3      -3   NA    2     1
    ## 5  3700     3700     5     1      NA      NA      NA      NA   NA    2     1
    ## 6  1200     1200     1    -3      NA      NA      NA      NA   NA    2     1
    ##   crn119 crn123 crn134 crn136m crn125w crn124i1 crn124i2 crn124i3 crn124i4
    ## 1     NA     NA     NA      NA      NA       NA       NA       NA       NA
    ## 2     NA     NA     NA      NA      NA       NA       NA       NA       NA
    ## 3     NA     NA     NA      NA      NA       NA       NA       NA       NA
    ## 4     -3     -3     -3      -3      NA       -3       -3       NA       -3
    ## 5     -3     -3     NA      -3      NA       -3       -3       NA       -3
    ## 6     NA     NA     NA      NA      NA       NA       NA       NA       NA
    ##   crn124i5 crn124i6 crn124i7 crn124i8 crn124i9 crn11i7 crn11i10 crn20i1 crn20i2
    ## 1       NA       NA       NA       NA       NA      NA       NA      NA      NA
    ## 2       NA       NA       NA       NA       NA      NA       NA      NA      NA
    ## 3       NA       NA       NA       NA       NA      NA       NA      NA      NA
    ## 4       NA       -3       -3       NA       -3      NA       NA      NA      NA
    ## 5       NA       -3       -3       NA       -3      NA       NA      NA      NA
    ## 6       NA       NA       NA       NA       NA      NA       NA      NA      NA
    ##   crn21i1 crn21i2 crn21i3 nkids sdp4g frt69 frt68 frt70 frt5 frt67 frt43i1
    ## 1      NA      NA      NA     3    NA    NA    NA    NA   NA    NA      NA
    ## 2      NA      NA      NA     3    NA    NA    NA    NA   NA    NA      NA
    ## 3      NA      NA      NA     3    NA    NA    NA    NA   NA    NA      NA
    ## 4      NA      NA      NA     0    NA     3    NA     2    2    NA      NA
    ## 5      NA      NA      NA     0    NA     3     5     2    2     2      NA
    ## 6      NA      NA      NA     2    NA    NA    NA    NA   NA    NA      NA
    ##   frt43i2 frt43i3 frt43i4 frt43i5 frt43i6 frt43i7 frt43i8 frt43i9 frt43i10
    ## 1      NA      NA      NA      NA      NA      NA      NA      NA       NA
    ## 2      NA      NA      NA      NA      NA      NA      NA      NA       NA
    ## 3      NA      NA      NA      NA      NA      NA      NA      NA       NA
    ## 4      NA      NA      NA      NA      NA      NA      NA      NA       NA
    ## 5      NA      NA      NA      NA      NA      NA      NA      NA       NA
    ## 6      NA      NA      NA      NA      NA      NA      NA      NA       NA
    ##   frt43i11 frt47i1 frt47i2 frt47i3 frt47i4 frt47i5 frt47i6 frt47i7 frt47i8
    ## 1       NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 2       NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 3       NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 4       NA       0       0       0       0       0       0       0       0
    ## 5       NA       0       0       0       0       0       0       0       0
    ## 6       NA      NA      NA      NA      NA      NA      NA      NA      NA
    ##   frt47i9 frt41 frt42 frt45 frt46 sex32 sex33 sex34 omo19i1 omo19i2 val7i3
    ## 1      NA    NA    NA    NA    NA    NA    NA    NA       4       2     NA
    ## 2      NA    NA    NA    NA    NA    NA    NA    NA      NA      NA     NA
    ## 3      NA    NA    NA    NA    NA    NA    NA    NA      NA      NA      2
    ## 4       1     4     4    NA     2    -3    -3   -10      NA      NA     NA
    ## 5       1     4     4    NA     2    -3    -3     2      NA      NA     NA
    ## 6      NA    NA    NA    NA    NA    NA    NA    NA       5       5     NA
    ##   per3i7 val1i3 val1i5 val1i11 val1i12 val1i14 val1i15 val1i16 val1i17 val9i1
    ## 1      4     NA      2      NA      NA       4       1       1       4     NA
    ## 2     NA     NA     NA      NA      NA      NA      NA      NA      NA     NA
    ## 3     NA     NA     NA      NA      NA      NA      NA      NA      NA     NA
    ## 4     NA     NA     NA      NA      NA      NA      NA      NA      NA     NA
    ## 5     NA     NA     NA      NA      NA      NA      NA      NA      NA     NA
    ## 6      3     NA      2      NA      NA       4       2       2       4     NA
    ##   val9i6 val10i1 val10i2 val10i3 val10i4 val10i5 val11i1 val11i2 val11i3
    ## 1     NA      NA      NA      NA      NA      NA       2      25       1
    ## 2     NA      NA      NA      NA      NA      NA       1      -3       1
    ## 3     NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 4     NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 5     NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 6     NA      NA      NA      NA      NA      NA      -2      -3      -2
    ##   val11i4 val2i7 val2i8 val2i9 val13i1 val13i2 val13i3 val13i4 val13i5 val13i6
    ## 1      -3     NA     NA     NA      NA      NA      NA      NA      NA      NA
    ## 2      -3     NA     NA     NA       4       4       2       2       4       2
    ## 3      NA     NA     NA     NA      NA      NA      NA      NA      NA      NA
    ## 4      NA     NA     NA     NA      NA      NA      NA      NA      NA      NA
    ## 5      NA     NA     NA     NA      NA      NA      NA      NA      NA      NA
    ## 6      -3     NA     NA     NA      NA      NA      NA      NA      NA      NA
    ##   val13i7 val13i8 val13i9 omo41i1 omo41i2 omo41i3 omo41i4 omo41i5 omo41i6 sex
    ## 1      NA      NA      NA      NA      NA      NA      NA      NA      NA   2
    ## 2       2       4       2       3       4       4       4       3       3   2
    ## 3      NA      NA      NA       3       3       3       3       2       3   2
    ## 4      NA      NA      NA      NA      NA      NA      NA      NA      NA   1
    ## 5      NA      NA      NA      NA      NA      NA      NA      NA      NA   1
    ## 6      NA      NA      NA      NA      NA      NA      NA      NA      NA   2
    ##   doby age east isced11 sd57 mig10 hw10 hw11w hw11m sd47i1
    ## 1 1971  51    1       3   NA    NA   NA    NA    NA    -10
    ## 2 1971  52    1       3   NA    NA   NA    NA    NA    -10
    ## 3 1971  53    1       3   NA    NA   NA    NA    NA    -10
    ## 4 1992  30    1       4   NA    NA   NA    NA    NA      1
    ## 5 1992  31    1       4   NA    NA   NA    NA    NA    -10
    ## 6 1981  41    0       2   NA    NA   NA    NA    NA    -10

    library(tidyverse)

    ## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ## ✔ dplyr     1.2.1     ✔ readr     2.2.0
    ## ✔ forcats   1.0.1     ✔ stringr   1.6.0
    ## ✔ ggplot2   4.0.3     ✔ tibble    3.3.1
    ## ✔ lubridate 1.9.5     ✔ tidyr     1.3.2
    ## ✔ purrr     1.2.2     
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()
    ## ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

    library(dplyr)
    library(ggplot2)
    library(kableExtra)

    ## 
    ## Attaching package: 'kableExtra'
    ## 
    ## The following object is masked from 'package:dplyr':
    ## 
    ##     group_rows

    library(ppcor)

    ## Loading required package: MASS
    ## 
    ## Attaching package: 'MASS'
    ## 
    ## The following object is masked from 'package:dplyr':
    ## 
    ##     select

    #Where possible, use functions of the loaded packages

## Analysis of Reasons for the low Fertility Rate

    # mutating values with `-2` to `NA` for the variable `fertility_rate
    data <- data %>%
     mutate(
       across(c(sat3,frt68,frt69,age,nkids,reldur),~replace(.x, .x<0, NA)))
      

    #1.1
    cor(data$sat3, data$frt68, use = "complete.obs")

    ## [1] 0.1555075

    cor(data$sat3, data$frt69, use = "complete.obs")

    ## [1] 0.1458812

    #1.2
    # heat map, sat3 on x axis, frt69 on y axis, I want to see how much percent of people are in each box which displays the relative frequency of people with a specific combination of relationship satisfaction and intention to get children in the next 3 years.

    data%>%
      mutate(
      #  percentages = (n)/sum(n)
      ) 

    ##           id welle      pid sample sat3 pa27 sd3 sd40 sd43 sd11 sd7e1 pstat
    ## 1     111000     2       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 2     111000     3       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 3     111000     4       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 4     828000     3   828103    101    9    2  NA   NA   NA   NA    NA     1
    ## 5     828000     4   828104    101    9    2  NA   NA   NA   NA    NA     1
    ## 6     907000     2       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 7     945000     2       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 8     945000     3       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 9     945000     4       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 10   1028000     2  1028101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 11   1028000     3  1028101    101    8   NA  NA   NA   NA   NA    NA     1
    ## 12   1028000     4  1028101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 13   1133000     2  1133101    101   10   NA  NA   NA   NA   NA    NA     1
    ## 14   1133000     3  1133101    101   10   NA  NA   NA   NA   NA    NA     1
    ## 15   1133000     4  1133101    101   10   NA  NA   NA   NA   NA    NA     1
    ## 16   1420000     2  1420103    101    9    2  NA   NA   NA   NA    NA     1
    ## 17   1624000     2  1624101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 18   1624000     3  1624101    101    9    2  NA   NA   NA   NA    NA     1
    ## 19   1624000     4  1624101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 20   1665000     2  1665103    101    8   NA  NA   NA   NA   NA    NA     1
    ## 21   1665000     3  1665103    101    9   NA  NA   NA   NA   NA    NA     1
    ## 22   1665000     4  1665103    101    8   NA  NA   NA   NA   NA    NA     1
    ## 23   1909000     2  1909103    101    8   NA  NA   NA   NA   NA    NA     1
    ## 24   1909000     3  1909103    101    8   NA  NA   NA   NA   NA    NA     1
    ## 25   1909000     4  1909103    101    9   NA  NA   NA   NA   NA    NA     1
    ## 26   2546000     2       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 27   2546000     3       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 28   2546000     4       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 29   2581000     2  2581103    101    8   NA  NA   NA   NA   NA    NA     1
    ## 30   2581000     3  2581103    101    9   NA  NA   NA   NA   NA    NA     1
    ## 31   2581000     4  2581103    101    7   NA  NA   NA   NA   NA    NA     1
    ## 32   2674000     2  2674101    101    7    2  NA   NA   NA   NA    NA     1
    ## 33   2720000     2  2720102    101    8   NA  NA   NA   NA   NA    NA     1
    ## 34   2720000     3  2720102    101    9   NA  NA   NA   NA   NA    NA     1
    ## 35   2720000     4  2720102    101    8   NA  NA   NA   NA   NA    NA     1
    ## 36   3134000     2       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 37   3134000     3       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 38   3134000     4  3134101    101    5   NA  NA   NA   NA   NA    NA     1
    ## 39   3491000     2       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 40   3491000     3       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 41   3491000     4       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 42   3651000     2  3651101    101    6   NA  NA   NA   NA   NA    NA     1
    ## 43   3651000     3       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 44   3651000     4  3651102    101    6    2  NA   NA   NA   NA    NA     1
    ## 45   3788000     2  3788101    101    6   NA  NA   NA   NA   NA    NA     1
    ## 46   3788000     3  3788101    101    7   NA  NA   NA   NA   NA    NA     1
    ## 47   3788000     4  3788101    101    6   NA  NA   NA   NA   NA    NA     1
    ## 48   3902000     2  3902101    101    5   -9  NA   NA   NA   NA    NA     1
    ## 49   4199000     2  4199101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 50   4199000     3  4199101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 51   4199000     4  4199101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 52   5444000     2  5444102    101    9   NA  NA   NA   NA   NA    NA     1
    ## 53   5444000     3  5444102    101    9   NA  NA   NA   NA   NA    NA     1
    ## 54   5444000     4  5444102    101    7   NA  NA   NA   NA   NA    NA     1
    ## 55   5810000     2       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 56   5810000     3       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 57   5810000     4       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 58   5843000     2  5843103    101    9   NA  NA   NA   NA   NA    NA     1
    ## 59   5843000     3  5843103    101   10   NA  NA   NA   NA   NA    NA     1
    ## 60   5843000     4  5843103    101   10   NA  NA   NA   NA   NA    NA     1
    ## 61   5988000     2  5988101    101    6   NA  NA   NA   NA   NA    NA     1
    ## 62   5988000     3  5988101    101    7   NA  NA   NA   NA   NA    NA     1
    ## 63   5988000     4  5988101    101    7   NA  NA   NA   NA   NA    NA     1
    ## 64   6151000     2  6151101    101    7   NA  NA   NA   NA   NA    NA     1
    ## 65   6151000     3  6151101    101    8   NA  NA   NA   NA   NA    NA     1
    ## 66   6151000     4  6151101    101    8   NA  NA   NA   NA   NA    NA     1
    ## 67   6340000     2  6340102    101    8   NA  NA   NA   NA   NA    NA     1
    ## 68   6340000     3  6340102    101    9   NA  NA   NA   NA   NA    NA     1
    ## 69   6340000     4  6340102    101    8    2  NA   NA   NA   NA    NA     1
    ## 70   6465000     2  6465101    101    8   NA  NA   NA   NA   NA    NA     1
    ## 71   6465000     3  6465101    101   10   NA  NA   NA   NA   NA    NA     1
    ## 72   6465000     4  6465101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 73   6519000     2  6519101    101    8   NA  NA   NA   NA   NA    NA     1
    ## 74   6519000     3  6519101    101    8   NA  NA   NA   NA   NA    NA     1
    ## 75   6519000     4  6519101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 76   7631000     2  7631101    101    7    2  NA   NA   NA   NA    NA     1
    ## 77   8075000     2  8075101    101   10   NA  NA   NA   NA   NA    NA     1
    ## 78   8075000     3  8075101    101   10   NA  NA   NA   NA   NA    NA     1
    ## 79   8075000     4  8075101    101   10   NA  NA   NA   NA   NA    NA     1
    ## 80   8465000     2  8465101    101   10   NA  NA   NA   NA   NA    NA     1
    ## 81   8465000     3  8465101    101   10   NA  NA   NA   NA   NA    NA     1
    ## 82   8465000     4  8465101    101   10   NA  NA   NA   NA   NA    NA     1
    ## 83   8948000     2       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 84   8948000     3  8948102    101   10   NA  NA   NA   NA   NA    NA     1
    ## 85   8948000     4       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 86   9139000     2  9139102    101   10   NA  NA   NA   NA   NA    NA     1
    ## 87   9139000     3  9139102    101   10   NA  NA   NA   NA   NA    NA     1
    ## 88   9139000     4  9139102    101   10   NA  NA   NA   NA   NA    NA     1
    ## 89   9161000     2       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 90   9161000     3       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 91   9161000     4       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 92   9346000     2       NA    101   NA   -3  NA   NA   NA   NA    NA     0
    ## 93   9346000     3       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 94   9346000     4       NA    101   NA   -3  NA   NA   NA   NA    NA     0
    ## 95   9598000     2  9598101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 96   9598000     3  9598101    101    8   NA  NA   NA   NA   NA    NA     1
    ## 97   9917000     2  9917101    101   10   NA  NA   NA   NA   NA    NA     1
    ## 98   9917000     3  9917101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 99   9917000     4  9917101    101    9    2  NA   NA   NA   NA    NA     1
    ## 100 10250000     2 10250102    101    5   NA  NA   NA   NA   NA    NA     1
    ## 101 10250000     3 10250102    101    4   NA  NA   NA   NA   NA    NA     1
    ## 102 10250000     4 10250102    101    4   NA  NA   NA   NA   NA    NA     1
    ## 103 10665000     2 10665101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 104 10665000     3 10665101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 105 10665000     4 10665101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 106 10789000     2 10789101    101    7   NA  NA   NA   NA   NA    NA     1
    ## 107 10789000     3       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 108 10789000     4       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 109 10957000     2 10957101    101   10    2  NA   NA   NA   NA    NA     1
    ## 110 11002000     2 11002101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 111 11002000     3 11002101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 112 11002000     4 11002101    101    7   NA  NA   NA   NA   NA    NA     1
    ## 113 11132000     2 11132103    101    7   NA  NA   NA   NA   NA    NA     1
    ## 114 11132000     3 11132103    101    7   NA  NA   NA   NA   NA    NA     1
    ## 115 11132000     4 11132103    101    8   NA  NA   NA   NA   NA    NA     1
    ## 116 11295000     2 11295101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 117 11295000     3       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 118 11295000     4 11295102    101   10   NA  NA   NA   NA   NA    NA     1
    ## 119 12092000     2 12092101    101   10   NA  NA   NA   NA   NA    NA     1
    ## 120 12092000     3 12092101    101   10   NA  NA   NA   NA   NA    NA     1
    ## 121 12092000     4 12092101    101   10   NA  NA   NA   NA   NA    NA     1
    ## 122 12266000     2 12266102    101    6   NA  NA   NA   NA   NA    NA     1
    ## 123 12266000     3 12266102    101    8   NA  NA   NA   NA   NA    NA     1
    ## 124 12490000     2 12490101    101    8   NA  NA   NA   NA   NA    NA     1
    ## 125 12490000     3 12490101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 126 12490000     4 12490101    101    6   NA  NA   NA   NA   NA    NA     1
    ## 127 12542000     2 12542102    101    2   NA  NA   NA   NA   NA    NA     1
    ## 128 12542000     3 12542102    101    3    1  NA   NA   NA   NA    NA     1
    ## 129 12542000     4 12542103    101    8   NA  NA   NA   NA   NA    NA     1
    ## 130 12915000     2       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 131 12915000     3       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 132 12915000     4       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 133 13102000     2 13102101    101   10   NA  NA   NA   NA   NA    NA     1
    ## 134 13102000     3 13102101    101    8   NA  NA   NA   NA   NA    NA     1
    ## 135 13102000     4 13102101    101    8   NA  NA   NA   NA   NA    NA     1
    ## 136 13404000     2 13404103    101    7   NA  NA   NA   NA   NA    NA     1
    ## 137 13404000     3 13404103    101    9   NA  NA   NA   NA   NA    NA     1
    ## 138 13404000     4 13404103    101   10   NA  NA   NA   NA   NA    NA     1
    ## 139 14116000     2 14116101    101    6    1  NA   NA   NA   NA    NA     1
    ## 140 14116000     3 14116101    101    7    1  NA   NA   NA   NA    NA     1
    ## 141 14116000     4 14116101    101    3    1  NA   NA   NA   NA    NA     1
    ## 142 14685000     2 14685101    101    8    2  NA   NA   NA   NA    NA     1
    ## 143 14722000     2 14722101    101    5   NA  NA   NA   NA   NA    NA     1
    ## 144 14722000     3 14722101    101    5   NA  NA   NA   NA   NA    NA     1
    ## 145 14722000     4 14722101    101    5   NA  NA   NA   NA   NA    NA     1
    ## 146 15401000     2 15401103    101    6   NA  NA   NA   NA   NA    NA     1
    ## 147 15401000     3 15401103    101    5   NA  NA   NA   NA   NA    NA     1
    ## 148 15401000     4 15401103    101    6   NA  NA   NA   NA   NA    NA     1
    ## 149 15479000     2       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 150 15479000     3 15479106    101    6   NA  NA   NA   NA   NA    NA     1
    ## 151 15479000     4       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 152 15595000     2 15595101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 153 15595000     3 15595101    101   10   NA  NA   NA   NA   NA    NA     1
    ## 154 15595000     4 15595101    101   10   NA  NA   NA   NA   NA    NA     1
    ## 155 15627000     2 15627101    101    6   NA  NA   NA   NA   NA    NA     1
    ## 156 15627000     3 15627101    101    6   NA  NA   NA   NA   NA    NA     1
    ## 157 15627000     4 15627101    101    8   NA  NA   NA   NA   NA    NA     1
    ## 158 15882000     2 15882103    101    9    2  NA   NA   NA   NA    NA     1
    ## 159 15975000     2 15975102    101    6    2  NA   NA   NA   NA    NA     1
    ## 160 15975000     3 15975102    101    7   NA  NA   NA   NA   NA    NA     1
    ## 161 15975000     4 15975102    101    7   NA  NA   NA   NA   NA    NA     1
    ## 162 16402000     2 16402101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 163 16402000     3 16402101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 164 16402000     4 16402101    101   10   NA  NA   NA   NA   NA    NA     1
    ## 165 16512000     2 16512101    101    8    2  NA   NA   NA   NA    NA     1
    ## 166 16512000     3 16512101    101    8    2  NA   NA   NA   NA    NA     1
    ## 167 16512000     4 16512101    101    7   NA  NA   NA   NA   NA    NA     1
    ## 168 16629000     2 16629102    101    6   NA  NA   NA   NA   NA    NA     1
    ## 169 16629000     3 16629102    101    7   NA  NA   NA   NA   NA    NA     1
    ## 170 16629000     4 16629102    101    7   NA  NA   NA   NA   NA    NA     1
    ## 171 16806000     2       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 172 16806000     3       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 173 16806000     4       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 174 17018000     2 17018101    101   10   NA  NA   NA   NA   NA    NA     1
    ## 175 17018000     3 17018101    101   10   NA  NA   NA   NA   NA    NA     1
    ## 176 17018000     4 17018101    101   10   NA  NA   NA   NA   NA    NA     1
    ## 177 17048000     2       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 178 17048000     3       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 179 17048000     4       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 180 17385000     2       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 181 17385000     3       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 182 17385000     4 17385105    101    8   NA  NA   NA   NA   NA    NA     1
    ## 183 17552000     2 17552101    101   10   NA  NA   NA   NA   NA    NA     1
    ## 184 17552000     3 17552101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 185 17552000     4 17552101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 186 17960000     2 17960101    101    8   NA  NA   NA   NA   NA    NA     1
    ## 187 17960000     3 17960101    101    7   NA  NA   NA   NA   NA    NA     1
    ## 188 17960000     4 17960101    101    7   NA  NA   NA   NA   NA    NA     1
    ## 189 18605000     2 18605101    101    8   NA  NA   NA   NA   NA    NA     1
    ## 190 18605000     3 18605101    101    8   NA  NA   NA   NA   NA    NA     1
    ## 191 18605000     4 18605101    101    8   NA  NA   NA   NA   NA    NA     1
    ## 192 18814000     2       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 193 18814000     3       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 194 18814000     4       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 195 19935000     2 19935103    101    7   NA  NA   NA   NA   NA    NA     1
    ## 196 19935000     3 19935103    101    7   NA  NA   NA   NA   NA    NA     1
    ## 197 19935000     4 19935103    101    7   NA  NA   NA   NA   NA    NA     1
    ## 198 19949000     2       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 199 19949000     3       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 200 19949000     4 19949102    101    7   NA  NA   NA   NA   NA    NA     1
    ## 201 20180000     2 20180103    101    8   NA  NA   NA   NA   NA    NA     1
    ## 202 20180000     3 20180103    101    7   NA  NA   NA   NA   NA    NA     1
    ## 203 20180000     4 20180103    101    8   NA  NA   NA   NA   NA    NA     1
    ## 204 20344000     2       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 205 20344000     3       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 206 20344000     4       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 207 20618000     2 20618101    101   10   NA  NA   NA   NA   NA    NA     1
    ## 208 20618000     3 20618101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 209 20618000     4 20618101    101    8   NA  NA   NA   NA   NA    NA     1
    ## 210 20633000     2 20633103    101    6   NA  NA   NA   NA   NA    NA     1
    ## 211 20633000     3 20633103    101    8   NA  NA   NA   NA   NA    NA     1
    ## 212 20633000     4 20633103    101    8   NA  NA   NA   NA   NA    NA     1
    ## 213 20970000     2 20970101    101    5   NA  NA   NA   NA   NA    NA     1
    ## 214 20970000     3 20970101    101    5   NA  NA   NA   NA   NA    NA     1
    ## 215 20970000     4 20970101    101    4   NA  NA   NA   NA   NA    NA     1
    ## 216 21088000     2 21088103    101    7   NA  NA   NA   NA   NA    NA     1
    ## 217 21088000     3 21088103    101    7    2  NA   NA   NA   NA    NA     1
    ## 218 21088000     4 21088103    101    7   NA  NA   NA   NA   NA    NA     1
    ## 219 21446000     2 21446101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 220 21446000     3 21446101    101    6   NA  NA   NA   NA   NA    NA     1
    ## 221 21446000     4 21446101    101    8   NA  NA   NA   NA   NA    NA     1
    ## 222 21637000     2 21637101    101    5   NA  NA   NA   NA   NA    NA     1
    ## 223 21637000     3 21637101    101    5   NA  NA   NA   NA   NA    NA     1
    ## 224 21637000     4 21637101    101    6   NA  NA   NA   NA   NA    NA     1
    ## 225 22083000     2 22083101    101    7   NA  NA   NA   NA   NA    NA     1
    ## 226 22083000     3 22083101    101   10   NA  NA   NA   NA   NA    NA     1
    ## 227 22083000     4 22083101    101   10   NA  NA   NA   NA   NA    NA     1
    ## 228 22234000     2       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 229 22234000     3       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 230 22234000     4       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 231 23561000     2 23561102    101    7   NA  NA   NA   NA   NA    NA     1
    ## 232 23561000     3 23561102    101    8   NA  NA   NA   NA   NA    NA     1
    ## 233 23561000     4 23561102    101    8   NA  NA   NA   NA   NA    NA     1
    ## 234 24573000     2 24573101    101    7    2  NA   NA   NA   NA    NA     1
    ## 235 24573000     3 24573101    101    7   NA  NA   NA   NA   NA    NA     1
    ## 236 24573000     4 24573101    101    8   NA  NA   NA   NA   NA    NA     1
    ## 237 24908000     2 24908101    101    5   NA  NA   NA   NA   NA    NA     1
    ## 238 24908000     3 24908101    101    7   NA  NA   NA   NA   NA    NA     1
    ## 239 24908000     4 24908101    101    5   NA  NA   NA   NA   NA    NA     1
    ## 240 25498000     2 25498101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 241 25498000     3 25498101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 242 25498000     4 25498101    101    8    2  NA   NA   NA   NA    NA     1
    ## 243 25694000     2       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 244 25694000     3       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 245 25694000     4       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 246 25758000     2 25758102    101   10   NA  NA   NA   NA   NA    NA     1
    ## 247 25758000     3 25758102    101    9   NA  NA   NA   NA   NA    NA     1
    ## 248 25758000     4 25758102    101    8   NA  NA   NA   NA   NA    NA     1
    ## 249 26265000     2 26265101    101    7   NA  NA   NA   NA   NA    NA     1
    ## 250 26265000     3 26265101    101    7   NA  NA   NA   NA   NA    NA     1
    ## 251 26265000     4 26265101    101    8   NA  NA   NA   NA   NA    NA     1
    ## 252 26574000     2 26574103    101   10   NA  NA   NA   NA   NA    NA     1
    ## 253 26574000     3 26574103    101   10   NA  NA   NA   NA   NA    NA     1
    ## 254 26574000     4 26574103    101   10   NA  NA   NA   NA   NA    NA     1
    ## 255 26926000     2       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 256 26926000     3       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 257 26926000     4       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 258 27152000     2 27152101    101    7   NA  NA   NA   NA   NA    NA     1
    ## 259 27152000     3 27152101    101    5   NA  NA   NA   NA   NA    NA     1
    ## 260 27152000     4 27152101    101    6   NA  NA   NA   NA   NA    NA     1
    ## 261 27939000     3 27939104    101   10   NA  NA   NA   NA   NA    NA     1
    ## 262 27939000     4 27939104    101   10    2  NA   NA   NA   NA    NA     1
    ## 263 27945000     2 27945102    101    8   NA  NA   NA   NA   NA    NA     1
    ## 264 27945000     3 27945102    101    8   NA  NA   NA   NA   NA    NA     1
    ## 265 27945000     4 27945102    101    7   NA  NA   NA   NA   NA    NA     1
    ## 266 27997000     2 27997102    101   10   NA  NA   NA   NA   NA    NA     1
    ## 267 27997000     3 27997102    101   10   NA  NA   NA   NA   NA    NA     1
    ## 268 27997000     4 27997102    101   10   NA  NA   NA   NA   NA    NA     1
    ## 269 28322000     2 28322101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 270 28322000     3 28322101    101    8   NA  NA   NA   NA   NA    NA     1
    ## 271 28322000     4 28322101    101    8   NA  NA   NA   NA   NA    NA     1
    ## 272 28386000     2 28386101    101   10   NA  NA   NA   NA   NA    NA     1
    ## 273 28386000     3 28386101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 274 28386000     4 28386101    101    9    2  NA   NA   NA   NA    NA     1
    ## 275 28952000     2 28952103    101    8    2  NA   NA   NA   NA    NA     1
    ## 276 28952000     3 28952103    101   10   NA  NA   NA   NA   NA    NA     1
    ## 277 29457000     2 29457102    101    9   NA  NA   NA   NA   NA    NA     1
    ## 278 29457000     3 29457102    101    9   NA  NA   NA   NA   NA    NA     1
    ## 279 29457000     4 29457102    101    9   NA  NA   NA   NA   NA    NA     1
    ## 280 30233000     2 30233101    101    8   NA  NA   NA   NA   NA    NA     1
    ## 281 30233000     3 30233101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 282 30233000     4 30233101    101    7    1  NA   NA   NA   NA    NA     1
    ## 283 30296000     2 30296102    101    9   NA  NA   NA   NA   NA    NA     1
    ## 284 30296000     3 30296102    101   10    2  NA   NA   NA   NA    NA     1
    ## 285 30296000     4 30296102    101   10   NA  NA   NA   NA   NA    NA     1
    ## 286 30569000     2 30569101    101    8   NA  NA   NA   NA   NA    NA     1
    ## 287 30569000     3 30569101    101    7   NA  NA   NA   NA   NA    NA     1
    ## 288 30569000     4 30569101    101    6   NA  NA   NA   NA   NA    NA     1
    ## 289 30631000     2 30631101    101    8   NA  NA   NA   NA   NA    NA     1
    ## 290 30631000     3       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 291 30631000     4       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 292 30834000     2 30834101    101    9    2  NA   NA   NA   NA    NA     1
    ## 293 30834000     3 30834101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 294 30834000     4 30834101    101    8   NA  NA   NA   NA   NA    NA     1
    ## 295 31045000     2 31045103    101    5   NA  NA   NA   NA   NA    NA     1
    ## 296 31045000     3       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 297 31045000     4       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 298 31649000     2 31649102    101    9    2  NA   NA   NA   NA    NA     1
    ## 299 31649000     3 31649102    101   10   NA  NA   NA   NA   NA    NA     1
    ## 300 31649000     4 31649102    101    8   NA  NA   NA   NA   NA    NA     1
    ## 301 31743000     2 31743102    101    7   NA  NA   NA   NA   NA    NA     1
    ## 302 31743000     3 31743102    101    7   NA  NA   NA   NA   NA    NA     1
    ## 303 31743000     4 31743102    101    8   NA  NA   NA   NA   NA    NA     1
    ## 304 32927000     2 32927103    101    8    2  NA   NA   NA   NA    NA     1
    ## 305 33141000     2       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 306 33141000     3       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 307 33141000     4       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 308 33552000     2 33552101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 309 33552000     3 33552101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 310 33552000     4 33552101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 311 33828000     2       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 312 33828000     3       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 313 33828000     4       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 314 34283000     2 34283101    101    7   NA  NA   NA   NA   NA    NA     1
    ## 315 34283000     3 34283101    101    8   NA  NA   NA   NA   NA    NA     1
    ## 316 34283000     4 34283101    101    8   NA  NA   NA   NA   NA    NA     1
    ## 317 34293000     2 34293104    101    8   NA  NA   NA   NA   NA    NA     1
    ## 318 34293000     3 34293104    101    5    1  NA   NA   NA   NA    NA     1
    ## 319 34293000     4 34293105    101    8   NA  NA   NA   NA   NA    NA     1
    ## 320 34452000     2 34452102    101    8    2  NA   NA   NA   NA    NA     1
    ## 321 34452000     3 34452102    101    6   NA  NA   NA   NA   NA    NA     1
    ## 322 34452000     4 34452102    101    8   NA  NA   NA   NA   NA    NA     1
    ## 323 34495000     2 34495103    101   10   NA  NA   NA   NA   NA    NA     1
    ## 324 34495000     3 34495103    101    8   NA  NA   NA   NA   NA    NA     1
    ## 325 34495000     4 34495103    101    7   NA  NA   NA   NA   NA    NA     1
    ## 326 35228000     2 35228102    101    6   NA  NA   NA   NA   NA    NA     1
    ## 327 35228000     3 35228102    101    0   NA  NA   NA   NA   NA    NA     1
    ## 328 35228000     4 35228102    101    0    1  NA   NA   NA   NA    NA     1
    ## 329 35280000     2 35280103    101   10   NA  NA   NA   NA   NA    NA     1
    ## 330 35280000     3 35280103    101    8   NA  NA   NA   NA   NA    NA     1
    ## 331 35280000     4 35280103    101    8   NA  NA   NA   NA   NA    NA     1
    ## 332 35429000     2 35429101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 333 35429000     3 35429101    101    8   NA  NA   NA   NA   NA    NA     1
    ## 334 35429000     4 35429101    101    9    2  NA   NA   NA   NA    NA     1
    ## 335 35550000     2 35550101    101    6   NA  NA   NA   NA   NA    NA     1
    ## 336 35550000     3 35550101    101    6   NA  NA   NA   NA   NA    NA     1
    ## 337 35550000     4 35550101    101    7   NA  NA   NA   NA   NA    NA     1
    ## 338 36504000     2 36504101    101   10   NA  NA   NA   NA   NA    NA     1
    ## 339 36504000     3 36504101    101   10   NA  NA   NA   NA   NA    NA     1
    ## 340 36504000     4 36504101    101   10   NA  NA   NA   NA   NA    NA     1
    ## 341 36510000     2       NA    101   NA   -3  NA   NA   NA   NA    NA     0
    ## 342 37681000     2       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 343 37681000     3       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 344 37681000     4       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 345 38162000     2       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 346 38162000     3       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 347 38162000     4       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 348 38791000     2 38791101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 349 38791000     3 38791101    101    7   NA  NA   NA   NA   NA    NA     1
    ## 350 38791000     4 38791101    101    8   NA  NA   NA   NA   NA    NA     1
    ## 351 38855000     2 38855101    101    3   NA  NA   NA   NA   NA    NA     1
    ## 352 38855000     3 38855101    101    5   NA  NA   NA   NA   NA    NA     1
    ## 353 38855000     4 38855101    101    3   NA  NA   NA   NA   NA    NA     1
    ## 354 39291000     2 39291101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 355 39291000     3 39291101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 356 39291000     4 39291101    101   10   NA  NA   NA   NA   NA    NA     1
    ## 357 39449000     2 39449101    101    7   NA  NA   NA   NA   NA    NA     1
    ## 358 39449000     3 39449101    101    7   NA  NA   NA   NA   NA    NA     1
    ## 359 39449000     4 39449101    101    7   NA  NA   NA   NA   NA    NA     1
    ## 360 39562000     2 39562101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 361 39562000     3 39562101    101   10   NA  NA   NA   NA   NA    NA     1
    ## 362 39562000     4 39562101    101   10   NA  NA   NA   NA   NA    NA     1
    ## 363 39600000     2 39600103    101    8   NA  NA   NA   NA   NA    NA     1
    ## 364 39600000     3 39600104    101   10   NA  NA   NA   NA   NA    NA     1
    ## 365 39600000     4 39600104    101   10   NA  NA   NA   NA   NA    NA     1
    ## 366 39642000     2 39642101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 367 39642000     3 39642101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 368 39642000     4 39642101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 369 39727000     2 39727102    101   10   NA  NA   NA   NA   NA    NA     1
    ## 370 39727000     3 39727102    101    9   NA  NA   NA   NA   NA    NA     1
    ## 371 39727000     4 39727102    101   10   NA  NA   NA   NA   NA    NA     1
    ## 372 39980000     2 39980103    101    9   NA  NA   NA   NA   NA    NA     1
    ## 373 39980000     3 39980103    101    9   NA  NA   NA   NA   NA    NA     1
    ## 374 39980000     4 39980103    101    7   NA  NA   NA   NA   NA    NA     1
    ## 375 40158000     2 40158104    101    9   NA  NA   NA   NA   NA    NA     1
    ## 376 40158000     3 40158104    101   10   NA  NA   NA   NA   NA    NA     1
    ## 377 40158000     4 40158104    101   10   NA  NA   NA   NA   NA    NA     1
    ## 378 40476000     2 40476101    101    8   NA  NA   NA   NA   NA    NA     1
    ## 379 40476000     3 40476101    101    8   NA  NA   NA   NA   NA    NA     1
    ## 380 40476000     4 40476101    101    8   NA  NA   NA   NA   NA    NA     1
    ## 381 40826000     2 40826101    101    8    2  NA   NA   NA   NA    NA     1
    ## 382 40826000     3 40826101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 383 40826000     4 40826101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 384 41058000     2 41058101    101    4   NA  NA   NA   NA   NA    NA     1
    ## 385 41058000     3 41058101    101    5   NA  NA   NA   NA   NA    NA     1
    ## 386 41058000     4 41058101    101    5   NA  NA   NA   NA   NA    NA     1
    ## 387 41571000     2 41571103    101   10   NA  NA   NA   NA   NA    NA     1
    ## 388 41571000     3 41571103    101   10   NA  NA   NA   NA   NA    NA     1
    ## 389 41571000     4 41571103    101   10   NA  NA   NA   NA   NA    NA     1
    ## 390 41686000     2 41686104    101    9   NA  NA   NA   NA   NA    NA     1
    ## 391 41686000     3       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 392 41686000     4       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 393 41957000     2       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 394 41957000     3       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 395 41957000     4       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 396 42069000     2 42069101    101   10   NA  NA   NA   NA   NA    NA     1
    ## 397 42069000     3 42069101    101   10   NA  NA   NA   NA   NA    NA     1
    ## 398 42069000     4 42069101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 399 42573000     2 42573101    101    8   NA  NA   NA   NA   NA    NA     1
    ## 400 42573000     3 42573101    101    8   NA  NA   NA   NA   NA    NA     1
    ## 401 42573000     4 42573101    101    8   NA  NA   NA   NA   NA    NA     1
    ## 402 42654000     2 42654101    101    8   NA  NA   NA   NA   NA    NA     1
    ## 403 42654000     3 42654101    101    7    1  NA   NA   NA   NA    NA     1
    ## 404 42654000     4 42654101    101    6    1  NA   NA   NA   NA    NA     1
    ## 405 42755000     2 42755101    101    8   NA  NA   NA   NA   NA    NA     1
    ## 406 42755000     3 42755101    101    8   NA  NA   NA   NA   NA    NA     1
    ## 407 42755000     4 42755101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 408 43181000     2 43181102    101    8   NA  NA   NA   NA   NA    NA     1
    ## 409 43700000     2 43700102    101    9   NA  NA   NA   NA   NA    NA     1
    ## 410 43730000     2 43730103    101    9    2  NA   NA   NA   NA    NA     1
    ## 411 43730000     4 43730103    101    6    2  NA   NA   NA   NA    NA     1
    ## 412 44495000     2       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 413 44495000     3       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 414 44495000     4       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 415 44502000     2 44502105    101   10   NA  NA   NA   NA   NA    NA     1
    ## 416 44502000     3 44502105    101   10   NA  NA   NA   NA   NA    NA     1
    ## 417 44502000     4 44502105    101    2   NA  NA   NA   NA   NA    NA     1
    ## 418 45374000     2 45374101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 419 45374000     3 45374101    101    8   NA  NA   NA   NA   NA    NA     1
    ## 420 45374000     4 45374101    101    8   NA  NA   NA   NA   NA    NA     1
    ## 421 45881000     2       NA    101   NA   -3  NA   NA   NA   NA    NA     0
    ## 422 46686000     2 46686101    101    9    2  NA   NA   NA   NA    NA     1
    ## 423 46686000     3       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 424 46686000     4       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 425 46895000     2       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 426 46895000     3       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 427 46895000     4       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 428 47230000     2       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 429 47230000     3 47230101    101    6   NA  NA   NA   NA   NA    NA     1
    ## 430 48484000     2 48484105    101    7   NA  NA   NA   NA   NA    NA     1
    ## 431 48484000     3 48484105    101    5   NA  NA   NA   NA   NA    NA     1
    ## 432 48484000     4 48484105    101    4   NA  NA   NA   NA   NA    NA     1
    ## 433 48544000     2 48544103    101    9   NA  NA   NA   NA   NA    NA     1
    ## 434 48544000     3 48544103    101   10   NA  NA   NA   NA   NA    NA     1
    ## 435 48544000     4 48544103    101   10   NA  NA   NA   NA   NA    NA     1
    ## 436 48626000     2 48626101    101    9    2  NA   NA   NA   NA    NA     1
    ## 437 49066000     2 49066101    101    5   NA  NA   NA   NA   NA    NA     1
    ## 438 49164000     2 49164101    101    5   NA  NA   NA   NA   NA    NA     1
    ## 439 49164000     3 49164101    101    5   NA  NA   NA   NA   NA    NA     1
    ## 440 49164000     4 49164101    101    5   NA  NA   NA   NA   NA    NA     1
    ## 441 49244000     2 49244101    101    9    2  NA   NA   NA   NA    NA     1
    ## 442 50194000     2 50194101    101    5   NA  NA   NA   NA   NA    NA     1
    ## 443 50288000     2       NA    101   NA   -3  NA   NA   NA   NA    NA     0
    ## 444 50288000     3       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 445 50288000     4       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 446 51030000     2 51030103    101    7   NA  NA   NA   NA   NA    NA     1
    ## 447 51030000     3 51030103    101    7    2  NA   NA   NA   NA    NA     1
    ## 448 51030000     4 51030103    101    7   NA  NA   NA   NA   NA    NA     1
    ## 449 51058000     2 51058101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 450 51058000     3 51058101    101    8   NA  NA   NA   NA   NA    NA     1
    ## 451 51058000     4 51058101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 452 51330000     2 51330103    101    9   NA  NA   NA   NA   NA    NA     1
    ## 453 51330000     3 51330103    101    9   NA  NA   NA   NA   NA    NA     1
    ## 454 51330000     4 51330103    101    8   NA  NA   NA   NA   NA    NA     1
    ## 455 51364000     2 51364101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 456 51364000     3 51364101    101    9   NA  NA   NA   NA   NA    NA     1
    ## 457 51364000     4 51364101    101   10   NA  NA   NA   NA   NA    NA     1
    ## 458 52154000     2 52154103    101    9   NA  NA   NA   NA   NA    NA     1
    ## 459 52154000     3 52154103    101    9   NA  NA   NA   NA   NA    NA     1
    ## 460 52154000     4 52154103    101    9   NA  NA   NA   NA   NA    NA     1
    ## 461 52186000     2 52186102    101    9   NA  NA   NA   NA   NA    NA     1
    ## 462 52186000     3 52186102    101    9   NA  NA   NA   NA   NA    NA     1
    ## 463 52186000     4 52186102    101    8   NA  NA   NA   NA   NA    NA     1
    ## 464 52244000     2 52244101    101    7   NA  NA   NA   NA   NA    NA     1
    ## 465 52244000     3 52244101    101    8   NA  NA   NA   NA   NA    NA     1
    ## 466 52244000     4 52244101    101    7   NA  NA   NA   NA   NA    NA     1
    ## 467 53084000     2 53084102    101    8   NA  NA   NA   NA   NA    NA     1
    ## 468 53084000     3 53084102    101    7    1  NA   NA   NA   NA    NA     1
    ## 469 53122000     2 53122102    101   10    2  NA   NA   NA   NA    NA     1
    ## 470 53208000     2 53208102    101   10   NA  NA   NA   NA   NA    NA     1
    ## 471 53208000     3 53208102    101   10   NA  NA   NA   NA   NA    NA     1
    ## 472 53208000     4 53208102    101    9   NA  NA   NA   NA   NA    NA     1
    ## 473 53356000     2 53356101    101    8   NA  NA   NA   NA   NA    NA     1
    ## 474 53356000     3 53356101    101    8   NA  NA   NA   NA   NA    NA     1
    ## 475 53356000     4 53356101    101    6    2  NA   NA   NA   NA    NA     1
    ## 476 53887000     2 53887101    101    8   NA  NA   NA   NA   NA    NA     1
    ## 477 53887000     3 53887101    101    8   NA  NA   NA   NA   NA    NA     1
    ## 478 53887000     4 53887101    101    8   NA  NA   NA   NA   NA    NA     1
    ## 479 54043000     2 54043101    101    5   NA  NA   NA   NA   NA    NA     1
    ## 480 54043000     3 54043101    101    6   NA  NA   NA   NA   NA    NA     1
    ## 481 54043000     4 54043101    101    5   NA  NA   NA   NA   NA    NA     1
    ## 482 54985000     2 54985103    101    4   NA  NA   NA   NA   NA    NA     1
    ## 483 54985000     3 54985103    101    5   NA  NA   NA   NA   NA    NA     1
    ## 484 54985000     4 54985103    101    6   NA  NA   NA   NA   NA    NA     1
    ## 485 55104000     2 55104101    101    6   NA  NA   NA   NA   NA    NA     1
    ## 486 55104000     3 55104101    101    5   NA  NA   NA   NA   NA    NA     1
    ## 487 55104000     4 55104101    101    4   NA  NA   NA   NA   NA    NA     1
    ## 488 56108000     2 56108101    101    5   NA  NA   NA   NA   NA    NA     1
    ## 489 56108000     3 56108101    101    5   NA  NA   NA   NA   NA    NA     1
    ## 490 56108000     4 56108101    101    5   NA  NA   NA   NA   NA    NA     1
    ## 491 56217000     2       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ## 492 56217000     3       NA    101   NA   NA  NA   NA   NA   NA    NA     0
    ##     separation relstat reldur sd5ezby pa64 pa65 pa66 pa68i1 pa17i1 pa17i2
    ## 1           -7       6     NA      NA   NA   NA   NA     NA     NA     NA
    ## 2           -3       6     NA      NA   NA   NA   NA     NA     NA     NA
    ## 3           -3       6     NA      NA   NA   NA   NA     NA     NA     NA
    ## 4           -7       3     NA      NA   NA   NA   NA     NA      5      4
    ## 5            0       3     36      NA   -3    5   NA     NA      5      5
    ## 6           -7       6     NA      NA   NA   NA   NA     NA     NA     NA
    ## 7           -7       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 8           -3       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 9           -3       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 10           0       4    210      NA   NA   NA   NA     NA     NA     NA
    ## 11           0       4    223      NA   NA   NA   NA     NA     NA     NA
    ## 12           0       4    235      NA   NA   NA   NA     NA     NA     NA
    ## 13           0       3    121      NA   NA   NA   NA     NA     NA     NA
    ## 14           0       3    133      NA   NA   NA   NA     NA     NA     NA
    ## 15           0       4    145      NA   NA   NA   NA     NA     NA     NA
    ## 16           0       4    123      NA   NA   NA   NA     NA      4      4
    ## 17           0       4    284      NA   NA   NA   NA     NA     NA     NA
    ## 18           0       4    291      NA   NA   NA   NA     NA      5      3
    ## 19           0       4    309      NA   NA   NA   NA     NA     NA     NA
    ## 20           0       3    101      NA   NA   NA   NA     NA     NA     NA
    ## 21           0       3    113      NA   NA   NA   NA     NA     NA     NA
    ## 22           0       4    126      NA   NA   NA   NA     NA     NA     NA
    ## 23           0       4     42      NA   NA   NA   NA     NA     NA     NA
    ## 24           0       4     54      NA   NA   NA   NA     NA     NA     NA
    ## 25           0       4     66      NA   NA   NA   NA     NA     NA     NA
    ## 26          -7       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 27          -3       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 28          -3       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 29           0       3     18      NA   NA   NA   NA     NA     NA     NA
    ## 30           0       3     30      NA   NA   NA   NA     NA     NA     NA
    ## 31           0       3     42      NA   NA   NA   NA     NA     NA     NA
    ## 32           0       4    144      NA   NA   NA   NA     NA      5      3
    ## 33           0       3    118      NA   NA   NA   NA     NA     NA     NA
    ## 34           0       3    130      NA   NA   NA   NA     NA     NA     NA
    ## 35           0       3    142      NA   NA   NA   NA     NA     NA     NA
    ## 36          -7       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 37          -3       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 38          -3       2      5      NA   NA   NA   NA     NA     NA     NA
    ## 39          -7       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 40          -3       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 41          -3       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 42           0       8    177      NA   NA   NA   NA     NA     NA     NA
    ## 43           1       6     NA      NA   NA   NA   NA     NA     NA     NA
    ## 44          -3       7      3      NA    3    1   NA     NA      4      3
    ## 45           0       4    171      NA   NA   NA   NA     NA     NA     NA
    ## 46           0       4    183      NA   NA   NA   NA     NA     NA     NA
    ## 47           0       4    195      NA   NA   NA   NA     NA     NA     NA
    ## 48           0       4    247      NA   NA   NA   NA     NA      3      3
    ## 49           0       4    267      NA   NA   NA   NA     NA     NA     NA
    ## 50           0       4    279      NA   NA   NA   NA     NA     NA     NA
    ## 51           0       4    291      NA   NA   NA   NA     NA     NA     NA
    ## 52           0       3     97      NA   NA   NA   NA     NA     NA     NA
    ## 53           0       3    106      NA   NA   NA   NA     NA     NA     NA
    ## 54           0       3    119      NA   NA   NA   NA     NA     NA     NA
    ## 55          -7       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 56          -3       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 57          -3       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 58          -3       2      0      NA   NA   NA   NA     NA     NA     NA
    ## 59           0       4     12      NA   NA   NA   NA     NA     NA     NA
    ## 60           0       4     25      NA   NA   NA   NA     NA     NA     NA
    ## 61           0       3     47      NA   NA   NA   NA     NA     NA     NA
    ## 62           0       3     59      NA   NA   NA   NA     NA     NA     NA
    ## 63           0       3     71      NA   NA   NA   NA     NA     NA     NA
    ## 64           0       4    290      NA   NA   NA   NA     NA     NA     NA
    ## 65           0       4    302      NA   NA   NA   NA     NA     NA     NA
    ## 66           0       4    314      NA   NA   NA   NA     NA     NA     NA
    ## 67           0       4    162      NA   NA   NA   NA     NA     NA     NA
    ## 68           0       4    174      NA   NA   NA   NA     NA     NA     NA
    ## 69           0       4    182      NA   -3   -3   NA     NA      3      3
    ## 70           0       4    168      NA   NA   NA   NA     NA     NA     NA
    ## 71           0       4    180      NA   NA   NA   NA     NA     NA     NA
    ## 72           0       4    192      NA   NA   NA   NA     NA     NA     NA
    ## 73           0       4    337      NA   NA   NA   NA     NA     NA     NA
    ## 74           0       4    348      NA   NA   NA   NA     NA     NA     NA
    ## 75           0       4    361      NA   NA   NA   NA     NA     NA     NA
    ## 76           0       4    216      NA   NA   NA   NA     NA      4      4
    ## 77           0       4    210      NA   NA   NA   NA     NA     NA     NA
    ## 78           0       4    221      NA   NA   NA   NA     NA     NA     NA
    ## 79           0       4    233      NA   NA   NA   NA     NA     NA     NA
    ## 80           0       4     51      NA   NA   NA   NA     NA     NA     NA
    ## 81           0       4     64      NA   NA   NA   NA     NA     NA     NA
    ## 82           0       4     77      NA   NA   NA   NA     NA     NA     NA
    ## 83          -7       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 84          -3       2      5      NA   NA   NA   NA     NA     NA     NA
    ## 85          -3       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 86           0       4    168      NA   NA   NA   NA     NA     NA     NA
    ## 87           0       4    178      NA   NA   NA   NA     NA     NA     NA
    ## 88           0       4    190      NA   NA   NA   NA     NA     NA     NA
    ## 89          -7       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 90          -3       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 91          -3       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 92          -3       1     NA      NA   NA   NA   NA     NA     -3     -3
    ## 93          -3       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 94          -3       1     NA      NA   -3   -3   NA     NA     -3     -3
    ## 95           0       4     NA      NA   NA   NA   NA     NA     NA     NA
    ## 96           0       4     NA      NA   NA   NA   NA     NA     NA     NA
    ## 97           0       4    300      NA   NA   NA   NA     NA     NA     NA
    ## 98           0       4    311      NA   NA   NA   NA     NA     NA     NA
    ## 99           0       4    320      NA   -3   -3   NA     NA      4      4
    ## 100          0       4    130      NA   NA   NA   NA     NA     NA     NA
    ## 101          0       4    142      NA   NA   NA   NA     NA     NA     NA
    ## 102          0       4    153      NA   NA   NA   NA     NA     NA     NA
    ## 103          0       4    177      NA   NA   NA   NA     NA     NA     NA
    ## 104          0       4    189      NA   NA   NA   NA     NA     NA     NA
    ## 105          0       4    201      NA   NA   NA   NA     NA     NA     NA
    ## 106          0       2    107      NA   NA   NA   NA     NA     NA     NA
    ## 107          1       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 108         -3       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 109          0       4    194      NA   NA   NA   NA     NA      4      4
    ## 110          0       4    141      NA   NA   NA   NA     NA     NA     NA
    ## 111          0       4    153      NA   NA   NA   NA     NA     NA     NA
    ## 112          0       4    166      NA   NA   NA   NA     NA     NA     NA
    ## 113          0       4     59      NA   NA   NA   NA     NA     NA     NA
    ## 114          0       4     71      NA   NA   NA   NA     NA     NA     NA
    ## 115          0       4     84      NA   NA   NA   NA     NA     NA     NA
    ## 116          0       4    336      NA   NA   NA   NA     NA     NA     NA
    ## 117          1       6     NA      NA   NA   NA   NA     NA     NA     NA
    ## 118          0       8     11      NA   NA   NA   NA     NA     NA     NA
    ## 119          0       4    291      NA   NA   NA   NA     NA     NA     NA
    ## 120          0       4    303      NA   NA   NA   NA     NA     NA     NA
    ## 121          0       4    315      NA   NA   NA   NA     NA     NA     NA
    ## 122          0      11     12      NA   NA   NA   NA     NA     NA     NA
    ## 123          0      11     24      NA   NA   NA   NA     NA     NA     NA
    ## 124          0       4    298      NA   NA   NA   NA     NA     NA     NA
    ## 125          0       4    310      NA   NA   NA   NA     NA     NA     NA
    ## 126          0       4    322      NA   NA   NA   NA     NA     NA     NA
    ## 127          0       3     38      NA   NA   NA   NA     NA     NA     NA
    ## 128          0       3     45      NA   NA   NA   NA     NA      2      3
    ## 129          0       3     18      NA   NA   NA   NA     NA     NA     NA
    ## 130         -7       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 131         -3       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 132         -3       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 133          0       4    172      NA   NA   NA   NA     NA     NA     NA
    ## 134          0       4    183      NA   NA   NA   NA     NA     NA     NA
    ## 135          0       4    195      NA   NA   NA   NA     NA     NA     NA
    ## 136          0      -7     31      NA   NA   NA   NA     NA     NA     NA
    ## 137          0      -7     43      NA   NA   NA   NA     NA     NA     NA
    ## 138          0      -7     55      NA   NA   NA   NA     NA     NA     NA
    ## 139          0       3     77      NA   NA   NA   NA     NA      3      3
    ## 140          0       3     88      NA   NA   NA   NA     NA      4      4
    ## 141          0       3    101      NA   -3    2   NA     NA      2      2
    ## 142          0       4    213      NA   NA   NA   NA     NA      4      4
    ## 143          0       4    319      NA   NA   NA   NA     NA     NA     NA
    ## 144          0       4    331      NA   NA   NA   NA     NA     NA     NA
    ## 145          0       4    344      NA   NA   NA   NA     NA     NA     NA
    ## 146          0       3     91      NA   NA   NA   NA     NA     NA     NA
    ## 147          0       4    103      NA   NA   NA   NA     NA     NA     NA
    ## 148          0       4    115      NA   NA   NA   NA     NA     NA     NA
    ## 149         -7       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 150          0       2      7      NA   NA   NA   NA     NA     NA     NA
    ## 151         -3       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 152          0       4    335      NA   NA   NA   NA     NA     NA     NA
    ## 153          0       4    347      NA   NA   NA   NA     NA     NA     NA
    ## 154          0       4    360      NA   NA   NA   NA     NA     NA     NA
    ## 155          0       3    141      NA   NA   NA   NA     NA     NA     NA
    ## 156          0       3    153      NA   NA   NA   NA     NA     NA     NA
    ## 157          0       3    165      NA   NA   NA   NA     NA     NA     NA
    ## 158          0       4     44      NA   NA   NA   NA     NA      4      5
    ## 159          0       4    148      NA   NA   NA   NA     NA      4      3
    ## 160          0       4    165      NA   NA   NA   NA     NA     NA     NA
    ## 161          0       4    178      NA   NA   NA   NA     NA     NA     NA
    ## 162          0       4    110      NA   NA   NA   NA     NA     NA     NA
    ## 163          0       4    121      NA   NA   NA   NA     NA     NA     NA
    ## 164          0       4    133      NA   NA   NA   NA     NA     NA     NA
    ## 165          0       4    302      NA   NA   NA   NA     NA      4      3
    ## 166          0       4    314      NA   NA   NA   NA     NA      4      3
    ## 167          0       4    331      NA   NA   NA   NA     NA     NA     NA
    ## 168          0       4    157      NA   NA   NA   NA     NA     NA     NA
    ## 169          0       4    168      NA   NA   NA   NA     NA     NA     NA
    ## 170          0       4    180      NA   NA   NA   NA     NA     NA     NA
    ## 171         -7       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 172         -3       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 173         -3       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 174          0       5    387      NA   NA   NA   NA     NA     NA     NA
    ## 175          0       4    400      NA   NA   NA   NA     NA     NA     NA
    ## 176          0       4    411      NA   NA   NA   NA     NA     NA     NA
    ## 177         -7       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 178         -3       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 179         -3       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 180         -7       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 181         -3       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 182         -3       3      4      NA   NA   NA   NA     NA     NA     NA
    ## 183          0       3     81      NA   NA   NA   NA     NA     NA     NA
    ## 184          0       3     93      NA   NA   NA   NA     NA     NA     NA
    ## 185          0       4    105      NA   NA   NA   NA     NA     NA     NA
    ## 186          0       4    213      NA   NA   NA   NA     NA     NA     NA
    ## 187          0       4    226      NA   NA   NA   NA     NA     NA     NA
    ## 188          0       4    238      NA   NA   NA   NA     NA     NA     NA
    ## 189          0       4    214      NA   NA   NA   NA     NA     NA     NA
    ## 190          0       4    226      NA   NA   NA   NA     NA     NA     NA
    ## 191          0       4    239      NA   NA   NA   NA     NA     NA     NA
    ## 192         -7       6     NA      NA   NA   NA   NA     NA     NA     NA
    ## 193         -3       6     NA      NA   NA   NA   NA     NA     NA     NA
    ## 194         -3       6     NA      NA   NA   NA   NA     NA     NA     NA
    ## 195          0       3     45      NA   NA   NA   NA     NA     NA     NA
    ## 196          0       3     56      NA   NA   NA   NA     NA     NA     NA
    ## 197          0       3     68      NA   NA   NA   NA     NA     NA     NA
    ## 198         -7       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 199         -3       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 200          0       2      7      NA   NA   NA   NA     NA     NA     NA
    ## 201          0       2    134      NA   NA   NA   NA     NA     NA     NA
    ## 202          0       2    148      NA   NA   NA   NA     NA     NA     NA
    ## 203          0       2    158      NA   NA   NA   NA     NA     NA     NA
    ## 204         -7       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 205         -3       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 206         -3       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 207          0       4    141      NA   NA   NA   NA     NA     NA     NA
    ## 208          0       4    153      NA   NA   NA   NA     NA     NA     NA
    ## 209          0       4    165      NA   NA   NA   NA     NA     NA     NA
    ## 210          0       3     11      NA   NA   NA   NA     NA     NA     NA
    ## 211          0       3     22      NA   NA   NA   NA     NA     NA     NA
    ## 212          0       3     35      NA   NA   NA   NA     NA     NA     NA
    ## 213          0       4    369      NA   NA   NA   NA     NA     NA     NA
    ## 214          0       4    381      NA   NA   NA   NA     NA     NA     NA
    ## 215          0       4    393      NA   NA   NA   NA     NA     NA     NA
    ## 216          0       4    102      NA   NA   NA   NA     NA     NA     NA
    ## 217          0       4    110      NA   NA   NA   NA     NA      4      3
    ## 218          0       4    127      NA   NA   NA   NA     NA     NA     NA
    ## 219          0       4    304      NA   NA   NA   NA     NA     NA     NA
    ## 220          0       4    315      NA   NA   NA   NA     NA     NA     NA
    ## 221          0       4    327      NA   NA   NA   NA     NA     NA     NA
    ## 222          0       4    545      NA   NA   NA   NA     NA     NA     NA
    ## 223          0       4    557      NA   NA   NA   NA     NA     NA     NA
    ## 224          0       4    569      NA   NA   NA   NA     NA     NA     NA
    ## 225         -3       2      0      NA   NA   NA   NA     NA     NA     NA
    ## 226          0       2     12      NA   NA   NA   NA     NA     NA     NA
    ## 227          0       3     24      NA   NA   NA   NA     NA     NA     NA
    ## 228         -7       6     NA      NA   NA   NA   NA     NA     NA     NA
    ## 229         -3       6     NA      NA   NA   NA   NA     NA     NA     NA
    ## 230         -3       6     NA      NA   NA   NA   NA     NA     NA     NA
    ## 231          0      -7     49      NA   NA   NA   NA     NA     NA     NA
    ## 232          0      -7     61      NA   NA   NA   NA     NA     NA     NA
    ## 233          0      -7     73      NA   NA   NA   NA     NA     NA     NA
    ## 234          0       3    187      NA   NA   NA   NA     NA      4      3
    ## 235          0       4    207      NA   NA   NA   NA     NA     NA     NA
    ## 236          0       4    218      NA   NA   NA   NA     NA     NA     NA
    ## 237          0       4    365      NA   NA   NA   NA     NA     NA     NA
    ## 238          0       4    377      NA   NA   NA   NA     NA     NA     NA
    ## 239          0       4    389      NA   NA   NA   NA     NA     NA     NA
    ## 240          0       4    379      NA   NA   NA   NA     NA     NA     NA
    ## 241          0       4    391      NA   NA   NA   NA     NA     NA     NA
    ## 242          0       4    398      NA   -3   -3   NA     NA      4      4
    ## 243         -7       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 244         -3       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 245         -3       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 246          0       4     27      NA   NA   NA   NA     NA     NA     NA
    ## 247          0       4     39      NA   NA   NA   NA     NA     NA     NA
    ## 248          0       4     51      NA   NA   NA   NA     NA     NA     NA
    ## 249          0       4    417      NA   NA   NA   NA     NA     NA     NA
    ## 250          0       4    430      NA   NA   NA   NA     NA     NA     NA
    ## 251          0       4    443      NA   NA   NA   NA     NA     NA     NA
    ## 252          0       3     28      NA   NA   NA   NA     NA     NA     NA
    ## 253          0       3     40      NA   NA   NA   NA     NA     NA     NA
    ## 254          0       3     52      NA   NA   NA   NA     NA     NA     NA
    ## 255         -7       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 256         -3       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 257         -3       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 258          0       4    115      NA   NA   NA   NA     NA     NA     NA
    ## 259          0       4    126      NA   NA   NA   NA     NA     NA     NA
    ## 260          0       4    138      NA   NA   NA   NA     NA     NA     NA
    ## 261          0       4     82      NA   NA   NA   NA     NA     NA     NA
    ## 262          0       4     89      NA   -3   -3   NA     NA      5      5
    ## 263          0       4     53      NA   NA   NA   NA     NA     NA     NA
    ## 264          0       4     65      NA   NA   NA   NA     NA     NA     NA
    ## 265          0       4     77      NA   NA   NA   NA     NA     NA     NA
    ## 266          0       3     10      NA   NA   NA   NA     NA     NA     NA
    ## 267          0       3     22      NA   NA   NA   NA     NA     NA     NA
    ## 268          0       3     35      NA   NA   NA   NA     NA     NA     NA
    ## 269          0       4    219      NA   NA   NA   NA     NA     NA     NA
    ## 270          0       4    231      NA   NA   NA   NA     NA     NA     NA
    ## 271          0       4    243      NA   NA   NA   NA     NA     NA     NA
    ## 272          0       4    231      NA   NA   NA   NA     NA     NA     NA
    ## 273          0       4    243      NA   NA   NA   NA     NA     NA     NA
    ## 274          0       4    250      NA   -3   -3   NA     NA      4      4
    ## 275          0       3     27      NA   NA   NA   NA     NA      5      4
    ## 276          0       3     44      NA   NA   NA   NA     NA     NA     NA
    ## 277          0       3     74      NA   NA   NA   NA     NA     NA     NA
    ## 278          0       3     87      NA   NA   NA   NA     NA     NA     NA
    ## 279          0       4     97      NA   NA   NA   NA     NA     NA     NA
    ## 280          0       4    367      NA   NA   NA   NA     NA     NA     NA
    ## 281          0       4    377      NA   NA   NA   NA     NA     NA     NA
    ## 282          0       4    385      NA   -3   -3   NA     NA      3      2
    ## 283          0       4    133      NA   NA   NA   NA     NA     NA     NA
    ## 284          0       4    140      NA   NA   NA   NA     NA      3      4
    ## 285          0       4    156      NA   NA   NA   NA     NA     NA     NA
    ## 286          0       4    248      NA   NA   NA   NA     NA     NA     NA
    ## 287          0       4    260      NA   NA   NA   NA     NA     NA     NA
    ## 288          0       4    272      NA   NA   NA   NA     NA     NA     NA
    ## 289          0       4    250      NA   NA   NA   NA     NA     NA     NA
    ## 290          1       6     NA      NA   NA   NA   NA     NA     NA     NA
    ## 291         -3       6     NA      NA   NA   NA   NA     NA     NA     NA
    ## 292          0       4     93      NA   NA   NA   NA     NA      5      4
    ## 293          0       4    110      NA   NA   NA   NA     NA     NA     NA
    ## 294          0       4    122      NA   NA   NA   NA     NA     NA     NA
    ## 295          0       3     43      NA   NA   NA   NA     NA     NA     NA
    ## 296         -3       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 297         -3       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 298          0       3     NA      NA   NA   NA   NA     NA      4      4
    ## 299          0       4     NA      NA   NA   NA   NA     NA     NA     NA
    ## 300          0       4     NA      NA   NA   NA   NA     NA     NA     NA
    ## 301          0       4    116      NA   NA   NA   NA     NA     NA     NA
    ## 302          0       4    126      NA   NA   NA   NA     NA     NA     NA
    ## 303          0       4    138      NA   NA   NA   NA     NA     NA     NA
    ## 304          0       4    125      NA   NA   NA   NA     NA      4      4
    ## 305         -7       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 306         -3       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 307         -3       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 308          0       4    261      NA   NA   NA   NA     NA     NA     NA
    ## 309          0       4    273      NA   NA   NA   NA     NA     NA     NA
    ## 310          0       4    285      NA   NA   NA   NA     NA     NA     NA
    ## 311         -7       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 312         -3       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 313         -3       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 314          0       4    387      NA   NA   NA   NA     NA     NA     NA
    ## 315          0       4    399      NA   NA   NA   NA     NA     NA     NA
    ## 316          0       4    411      NA   NA   NA   NA     NA     NA     NA
    ## 317          0       3     59      NA   NA   NA   NA     NA     NA     NA
    ## 318          0       3     67      NA   NA   NA   NA     NA      4      2
    ## 319         -3       2      4      NA   NA   NA   NA     NA     NA     NA
    ## 320          0      11     54      NA   NA   NA   NA     NA      3      3
    ## 321          0      11     71      NA   NA   NA   NA     NA     NA     NA
    ## 322          0      11     85      NA   NA   NA   NA     NA     NA     NA
    ## 323          0       4     87      NA   NA   NA   NA     NA     NA     NA
    ## 324          0       4     99      NA   NA   NA   NA     NA     NA     NA
    ## 325          0       4    112      NA   NA   NA   NA     NA     NA     NA
    ## 326          0       2     35      NA   NA   NA   NA     NA     NA     NA
    ## 327          0       2     48      NA   NA   NA   NA     NA     NA     NA
    ## 328          0       2     54      NA    3    3   NA     NA      2      4
    ## 329          0       3     73      NA   NA   NA   NA     NA     NA     NA
    ## 330          0       4     85      NA   NA   NA   NA     NA     NA     NA
    ## 331          0       4     99      NA   NA   NA   NA     NA     NA     NA
    ## 332          0       4    318      NA   NA   NA   NA     NA     NA     NA
    ## 333          0       4    330      NA   NA   NA   NA     NA     NA     NA
    ## 334          0       4    339      NA   -3   -3   NA     NA      4      5
    ## 335          0       3    124      NA   NA   NA   NA     NA     NA     NA
    ## 336          0       3    136      NA   NA   NA   NA     NA     NA     NA
    ## 337          0       3    149      NA   NA   NA   NA     NA     NA     NA
    ## 338          0       4    191      NA   NA   NA   NA     NA     NA     NA
    ## 339          0       4    203      NA   NA   NA   NA     NA     NA     NA
    ## 340          0       4    216      NA   NA   NA   NA     NA     NA     NA
    ## 341          1       1     NA      NA   NA   NA   NA     NA     -3     -3
    ## 342         -7       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 343         -3       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 344         -3       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 345         -7       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 346         -3       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 347         -3       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 348          0       4    106      NA   NA   NA   NA     NA     NA     NA
    ## 349          0       4    118      NA   NA   NA   NA     NA     NA     NA
    ## 350          0       4    130      NA   NA   NA   NA     NA     NA     NA
    ## 351          0       2     NA      NA   NA   NA   NA     NA     NA     NA
    ## 352          0       2     NA      NA   NA   NA   NA     NA     NA     NA
    ## 353          0       2     NA      NA   NA   NA   NA     NA     NA     NA
    ## 354          0       4    207      NA   NA   NA   NA     NA     NA     NA
    ## 355          0       4    219      NA   NA   NA   NA     NA     NA     NA
    ## 356          0       4    231      NA   NA   NA   NA     NA     NA     NA
    ## 357          0       4    233      NA   NA   NA   NA     NA     NA     NA
    ## 358          0       4    245      NA   NA   NA   NA     NA     NA     NA
    ## 359          0       4    257      NA   NA   NA   NA     NA     NA     NA
    ## 360          0       4    304      NA   NA   NA   NA     NA     NA     NA
    ## 361          0       4    316      NA   NA   NA   NA     NA     NA     NA
    ## 362          0       4    328      NA   NA   NA   NA     NA     NA     NA
    ## 363          0       4    102      NA   NA   NA   NA     NA     NA     NA
    ## 364          1       7      3      NA   NA   NA   NA     NA     NA     NA
    ## 365          0       8     15      NA   NA   NA   NA     NA     NA     NA
    ## 366          0       4    254      NA   NA   NA   NA     NA     NA     NA
    ## 367          0       4    265      NA   NA   NA   NA     NA     NA     NA
    ## 368          0       4    278      NA   NA   NA   NA     NA     NA     NA
    ## 369          0       4    146      NA   NA   NA   NA     NA     NA     NA
    ## 370          0       4    158      NA   NA   NA   NA     NA     NA     NA
    ## 371          0       4    170      NA   NA   NA   NA     NA     NA     NA
    ## 372          0       4    106      NA   NA   NA   NA     NA     NA     NA
    ## 373          0       4    117      NA   NA   NA   NA     NA     NA     NA
    ## 374          0       4    129      NA   NA   NA   NA     NA     NA     NA
    ## 375          0       3     36      NA   NA   NA   NA     NA     NA     NA
    ## 376          0       3     48      NA   NA   NA   NA     NA     NA     NA
    ## 377          0       4     60      NA   NA   NA   NA     NA     NA     NA
    ## 378          0       4    300      NA   NA   NA   NA     NA     NA     NA
    ## 379          0       4    311      NA   NA   NA   NA     NA     NA     NA
    ## 380          0       4    324      NA   NA   NA   NA     NA     NA     NA
    ## 381          0       4    142      NA   NA   NA   NA     NA      4      3
    ## 382          0       4    159      NA   NA   NA   NA     NA     NA     NA
    ## 383          0       4    171      NA   NA   NA   NA     NA     NA     NA
    ## 384          0       3    137      NA   NA   NA   NA     NA     NA     NA
    ## 385          0       3    149      NA   NA   NA   NA     NA     NA     NA
    ## 386          0       3    160      NA   NA   NA   NA     NA     NA     NA
    ## 387          0       4    118      NA   NA   NA   NA     NA     NA     NA
    ## 388          0       4    130      NA   NA   NA   NA     NA     NA     NA
    ## 389          0       4    142      NA   NA   NA   NA     NA     NA     NA
    ## 390          0       2     16      NA   NA   NA   NA     NA     NA     NA
    ## 391          1       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 392         -3       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 393         -7       6     NA      NA   NA   NA   NA     NA     NA     NA
    ## 394         -3       6     NA      NA   NA   NA   NA     NA     NA     NA
    ## 395         -3       6     NA      NA   NA   NA   NA     NA     NA     NA
    ## 396          0       3    213      NA   NA   NA   NA     NA     NA     NA
    ## 397          0       3    225      NA   NA   NA   NA     NA     NA     NA
    ## 398          0       3    237      NA   NA   NA   NA     NA     NA     NA
    ## 399          0       4    245      NA   NA   NA   NA     NA     NA     NA
    ## 400          0       4    258      NA   NA   NA   NA     NA     NA     NA
    ## 401          0       4    270      NA   NA   NA   NA     NA     NA     NA
    ## 402          0       4    259      NA   NA   NA   NA     NA     NA     NA
    ## 403          0       4    266      NA   NA   NA   NA     NA      2      2
    ## 404          0       4    278      NA   -3   -3   NA     NA      3      2
    ## 405          0       4    338      NA   NA   NA   NA     NA     NA     NA
    ## 406          0       4    350      NA   NA   NA   NA     NA     NA     NA
    ## 407          0       4    363      NA   NA   NA   NA     NA     NA     NA
    ## 408          0       4    153      NA   NA   NA   NA     NA     NA     NA
    ## 409         -3       2      1      NA   NA   NA   NA     NA     NA     NA
    ## 410          0       4    126      NA   NA   NA   NA     NA      5      3
    ## 411          0       4    150      NA   -3   -3   NA     NA      5      2
    ## 412         -7       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 413         -3       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 414         -3       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 415          0       2     15      NA   NA   NA   NA     NA     NA     NA
    ## 416          0       4     26      NA   NA   NA   NA     NA     NA     NA
    ## 417          0       4     38      NA   NA   NA   NA     NA     NA     NA
    ## 418          0       4    182      NA   NA   NA   NA     NA     NA     NA
    ## 419          0       4    194      NA   NA   NA   NA     NA     NA     NA
    ## 420          0       4    206      NA   NA   NA   NA     NA     NA     NA
    ## 421          1       6     NA      NA   NA   NA   NA     NA     -3     -3
    ## 422          0       4    227      NA   NA   NA   NA     NA      4      4
    ## 423          1       6     NA      NA   NA   NA   NA     NA     NA     NA
    ## 424         -3       6     NA      NA   NA   NA   NA     NA     NA     NA
    ## 425          1       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 426         -3       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 427         -3       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 428         -7       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 429         -3       2      1      NA   NA   NA   NA     NA     NA     NA
    ## 430          0       4     95      NA   NA   NA   NA     NA     NA     NA
    ## 431          0       4    108      NA   NA   NA   NA     NA     NA     NA
    ## 432          0       4    119      NA   NA   NA   NA     NA     NA     NA
    ## 433          0       3     42      NA   NA   NA   NA     NA     NA     NA
    ## 434          0       3     53      NA   NA   NA   NA     NA     NA     NA
    ## 435          0       3     66      NA   NA   NA   NA     NA     NA     NA
    ## 436          0       3    121      NA   NA   NA   NA     NA      4      4
    ## 437          0       4    285      NA   NA   NA   NA     NA     NA     NA
    ## 438          0       4    291      NA   NA   NA   NA     NA     NA     NA
    ## 439          0       4    303      NA   NA   NA   NA     NA     NA     NA
    ## 440          0       4    315      NA   NA   NA   NA     NA     NA     NA
    ## 441          0       4    174      NA   NA   NA   NA     NA      5      5
    ## 442          0       3    179      NA   NA   NA   NA     NA     NA     NA
    ## 443         -3       1     NA      NA   NA   NA   NA     NA     -3     -3
    ## 444         -3       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 445         -3       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 446          0       3    111      NA   NA   NA   NA     NA     NA     NA
    ## 447          0       3    117      NA   NA   NA   NA     NA      4      4
    ## 448          0       3    135      NA   NA   NA   NA     NA     NA     NA
    ## 449          0       4    235      NA   NA   NA   NA     NA     NA     NA
    ## 450          0       4    248      NA   NA   NA   NA     NA     NA     NA
    ## 451          0       4    258      NA   NA   NA   NA     NA     NA     NA
    ## 452          0       8     14      NA   NA   NA   NA     NA     NA     NA
    ## 453          0       8     28      NA   NA   NA   NA     NA     NA     NA
    ## 454          0       8     38      NA   NA   NA   NA     NA     NA     NA
    ## 455          0       4    275      NA   NA   NA   NA     NA     NA     NA
    ## 456          0       4    287      NA   NA   NA   NA     NA     NA     NA
    ## 457          0       4    299      NA   NA   NA   NA     NA     NA     NA
    ## 458          0       4    105      NA   NA   NA   NA     NA     NA     NA
    ## 459          0       4    117      NA   NA   NA   NA     NA     NA     NA
    ## 460          0       4    129      NA   NA   NA   NA     NA     NA     NA
    ## 461          0       4    163      NA   NA   NA   NA     NA     NA     NA
    ## 462          0       4    175      NA   NA   NA   NA     NA     NA     NA
    ## 463          0       4    188      NA   NA   NA   NA     NA     NA     NA
    ## 464          0       3     92      NA   NA   NA   NA     NA     NA     NA
    ## 465          0       3    105      NA   NA   NA   NA     NA     NA     NA
    ## 466          0       3    117      NA   NA   NA   NA     NA     NA     NA
    ## 467         -7      -7     11      NA   NA   NA   NA     NA     NA     NA
    ## 468          0      -7     18      NA   NA   NA   NA     NA      3      4
    ## 469          0      11    117      NA   NA   NA   NA     NA      4      4
    ## 470          0       8     74      NA   NA   NA   NA     NA     NA     NA
    ## 471          0       8     85      NA   NA   NA   NA     NA     NA     NA
    ## 472          0       8     98      NA   NA   NA   NA     NA     NA     NA
    ## 473          0       4    242      NA   NA   NA   NA     NA     NA     NA
    ## 474          0       4     NA      NA   NA   NA   NA     NA     NA     NA
    ## 475          0       4     NA      NA   -3   -3   NA     NA      2      2
    ## 476          0       4    208      NA   NA   NA   NA     NA     NA     NA
    ## 477          0       4    220      NA   NA   NA   NA     NA     NA     NA
    ## 478          0       4    231      NA   NA   NA   NA     NA     NA     NA
    ## 479          0       2     37      NA   NA   NA   NA     NA     NA     NA
    ## 480          0       2     48      NA   NA   NA   NA     NA     NA     NA
    ## 481          0       2     62      NA   NA   NA   NA     NA     NA     NA
    ## 482          0       3    134      NA   NA   NA   NA     NA     NA     NA
    ## 483          0       3    148      NA   NA   NA   NA     NA     NA     NA
    ## 484          0       3    160      NA   NA   NA   NA     NA     NA     NA
    ## 485          0       4    231      NA   NA   NA   NA     NA     NA     NA
    ## 486          0       4    243      NA   NA   NA   NA     NA     NA     NA
    ## 487          0       4    255      NA   NA   NA   NA     NA     NA     NA
    ## 488          0       4    231      NA   NA   NA   NA     NA     NA     NA
    ## 489          0       4    243      NA   NA   NA   NA     NA     NA     NA
    ## 490          0       4    255      NA   NA   NA   NA     NA     NA     NA
    ## 491         -7       1     NA      NA   NA   NA   NA     NA     NA     NA
    ## 492         -3       1     NA      NA   NA   NA   NA     NA     NA     NA
    ##     pa17i4 pa17i5 pa17i6 pa17i8 pa21i7 pa21i8 pa21i9 pa21i10 pa21i11 pa21i12
    ## 1       NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 2       NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 3       NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 4        2      5      1      5     NA     NA     NA      NA      NA      NA
    ## 5        2      4      1      5      3      1      1       1       1       1
    ## 6       NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 7       NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 8       NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 9       NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 10      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 11      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 12      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 13      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 14      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 15      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 16       2      4      2      4     NA     NA     NA      NA      NA      NA
    ## 17      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 18       2      3      3      5     NA     NA     NA      NA      NA      NA
    ## 19      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 20      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 21      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 22      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 23      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 24      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 25      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 26      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 27      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 28      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 29      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 30      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 31      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 32       3      3      3      4     NA     NA     NA      NA      NA      NA
    ## 33      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 34      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 35      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 36      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 37      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 38      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 39      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 40      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 41      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 42      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 43      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 44       2      4      4      4      1      1      1       3       1       1
    ## 45      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 46      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 47      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 48       3      2      3      3     NA     NA     NA      NA      NA      NA
    ## 49      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 50      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 51      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 52      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 53      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 54      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 55      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 56      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 57      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 58      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 59      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 60      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 61      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 62      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 63      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 64      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 65      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 66      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 67      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 68      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 69       2      3      3      3      2      2      4       2       2       1
    ## 70      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 71      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 72      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 73      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 74      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 75      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 76       3      4      3      3     NA     NA     NA      NA      NA      NA
    ## 77      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 78      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 79      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 80      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 81      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 82      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 83      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 84      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 85      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 86      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 87      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 88      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 89      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 90      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 91      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 92      -3     -3     -3     -3     NA     NA     NA      NA      NA      NA
    ## 93      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 94      -3     -3     -3     -3     -3     -3     -3      -3      -3      -3
    ## 95      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 96      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 97      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 98      NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 99       2      4      2      3      2      2      2       2       2       1
    ## 100     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 101     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 102     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 103     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 104     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 105     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 106     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 107     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 108     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 109      2      4      2      4     NA     NA     NA      NA      NA      NA
    ## 110     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 111     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 112     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 113     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 114     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 115     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 116     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 117     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 118     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 119     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 120     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 121     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 122     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 123     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 124     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 125     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 126     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 127     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 128      4      2      4      1     NA     NA     NA      NA      NA      NA
    ## 129     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 130     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 131     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 132     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 133     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 134     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 135     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 136     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 137     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 138     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 139      3      3      3      2     NA     NA     NA      NA      NA      NA
    ## 140      3      4      2      3     NA     NA     NA      NA      NA      NA
    ## 141      4      2      3      2      4      3      2       1       1       1
    ## 142      2      4      2      2     NA     NA     NA      NA      NA      NA
    ## 143     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 144     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 145     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 146     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 147     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 148     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 149     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 150     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 151     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 152     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 153     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 154     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 155     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 156     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 157     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 158      3      5      3      4     NA     NA     NA      NA      NA      NA
    ## 159      4      3      4      3     NA     NA     NA      NA      NA      NA
    ## 160     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 161     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 162     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 163     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 164     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 165      2      3      2      3     NA     NA     NA      NA      NA      NA
    ## 166      2      3      2      3     NA     NA     NA      NA      NA      NA
    ## 167     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 168     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 169     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 170     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 171     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 172     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 173     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 174     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 175     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 176     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 177     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 178     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 179     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 180     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 181     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 182     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 183     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 184     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 185     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 186     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 187     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 188     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 189     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 190     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 191     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 192     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 193     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 194     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 195     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 196     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 197     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 198     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 199     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 200     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 201     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 202     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 203     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 204     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 205     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 206     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 207     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 208     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 209     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 210     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 211     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 212     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 213     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 214     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 215     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 216     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 217      3      2      3      3     NA     NA     NA      NA      NA      NA
    ## 218     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 219     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 220     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 221     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 222     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 223     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 224     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 225     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 226     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 227     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 228     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 229     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 230     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 231     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 232     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 233     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 234      3      2      3      4     NA     NA     NA      NA      NA      NA
    ## 235     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 236     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 237     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 238     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 239     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 240     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 241     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 242      2      4      2      4      2      2      2       2       2       1
    ## 243     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 244     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 245     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 246     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 247     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 248     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 249     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 250     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 251     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 252     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 253     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 254     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 255     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 256     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 257     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 258     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 259     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 260     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 261     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 262      1      5      2      5      1      1      1       1       1       1
    ## 263     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 264     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 265     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 266     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 267     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 268     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 269     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 270     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 271     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 272     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 273     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 274      2      4      2      3      1      1      2       1       2       1
    ## 275      2      4      2      4     NA     NA     NA      NA      NA      NA
    ## 276     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 277     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 278     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 279     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 280     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 281     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 282      3      2      3      3      1      1      4       3       3       4
    ## 283     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 284      2      4      2      4     NA     NA     NA      NA      NA      NA
    ## 285     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 286     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 287     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 288     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 289     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 290     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 291     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 292      3      4      2      5     NA     NA     NA      NA      NA      NA
    ## 293     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 294     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 295     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 296     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 297     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 298      2      4      2      4     NA     NA     NA      NA      NA      NA
    ## 299     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 300     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 301     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 302     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 303     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 304      2      4      2      3     NA     NA     NA      NA      NA      NA
    ## 305     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 306     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 307     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 308     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 309     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 310     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 311     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 312     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 313     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 314     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 315     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 316     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 317     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 318      4      2      4      3     NA     NA     NA      NA      NA      NA
    ## 319     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 320      3      3      3      3     NA     NA     NA      NA      NA      NA
    ## 321     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 322     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 323     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 324     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 325     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 326     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 327     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 328      2      4      2      3      1      1      1       1       1       1
    ## 329     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 330     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 331     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 332     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 333     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 334      2      4      3      4      3      1      2       1       1       1
    ## 335     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 336     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 337     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 338     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 339     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 340     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 341     -3     -3     -3     -3     NA     NA     NA      NA      NA      NA
    ## 342     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 343     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 344     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 345     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 346     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 347     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 348     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 349     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 350     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 351     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 352     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 353     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 354     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 355     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 356     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 357     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 358     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 359     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 360     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 361     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 362     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 363     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 364     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 365     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 366     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 367     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 368     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 369     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 370     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 371     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 372     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 373     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 374     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 375     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 376     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 377     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 378     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 379     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 380     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 381      4      2      4      4     NA     NA     NA      NA      NA      NA
    ## 382     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 383     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 384     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 385     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 386     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 387     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 388     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 389     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 390     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 391     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 392     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 393     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 394     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 395     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 396     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 397     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 398     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 399     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 400     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 401     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 402     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 403      3      2      3      2     NA     NA     NA      NA      NA      NA
    ## 404      3      2      4      2      3      1      2       4       1       1
    ## 405     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 406     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 407     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 408     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 409     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 410      2      4      3      5     NA     NA     NA      NA      NA      NA
    ## 411      3      2      3      5      5      2      2       3       1       1
    ## 412     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 413     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 414     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 415     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 416     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 417     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 418     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 419     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 420     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 421     -3     -3     -3     -3     NA     NA     NA      NA      NA      NA
    ## 422      2      4      2      4     NA     NA     NA      NA      NA      NA
    ## 423     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 424     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 425     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 426     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 427     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 428     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 429     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 430     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 431     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 432     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 433     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 434     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 435     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 436      2      4      2      3     NA     NA     NA      NA      NA      NA
    ## 437     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 438     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 439     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 440     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 441      3      5      3      4     NA     NA     NA      NA      NA      NA
    ## 442     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 443     -3     -3     -3     -3     NA     NA     NA      NA      NA      NA
    ## 444     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 445     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 446     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 447      3      3      3      4     NA     NA     NA      NA      NA      NA
    ## 448     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 449     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 450     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 451     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 452     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 453     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 454     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 455     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 456     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 457     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 458     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 459     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 460     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 461     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 462     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 463     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 464     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 465     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 466     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 467     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 468      2      4      3      3     NA     NA     NA      NA      NA      NA
    ## 469      2      4      2      4     NA     NA     NA      NA      NA      NA
    ## 470     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 471     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 472     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 473     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 474     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 475      3      1      3      1      4      3      3       2       1       1
    ## 476     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 477     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 478     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 479     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 480     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 481     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 482     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 483     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 484     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 485     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 486     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 487     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 488     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 489     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 490     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 491     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ## 492     NA     NA     NA     NA     NA     NA     NA      NA      NA      NA
    ##     pa21i13 pa22ri1 pa22ri9 pa22ri10 pa22ri11 pa22ri12 pa22ri8 pa18i1 pa18i2
    ## 1        NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 2        NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 3        NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 4        NA       1       1        5        1        2       5      4      1
    ## 5         1       1       1        5        1        2       4     NA     NA
    ## 6        NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 7        NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 8        NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 9        NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 10       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 11       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 12       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 13       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 14       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 15       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 16       NA       1       2        4        2        4       4     NA     NA
    ## 17       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 18       NA       1       3        4        3        3       4      3      1
    ## 19       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 20       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 21       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 22       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 23       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 24       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 25       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 26       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 27       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 28       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 29       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 30       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 31       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 32       NA       2       3        3        2        3       5     NA     NA
    ## 33       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 34       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 35       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 36       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 37       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 38       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 39       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 40       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 41       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 42       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 43       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 44        1       1       1        3        2        3       3     NA     NA
    ## 45       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 46       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 47       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 48       NA       2       2        4        1        2       4     NA     NA
    ## 49       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 50       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 51       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 52       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 53       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 54       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 55       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 56       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 57       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 58       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 59       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 60       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 61       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 62       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 63       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 64       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 65       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 66       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 67       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 68       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 69        2       2       2        3        3        4       3     NA     NA
    ## 70       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 71       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 72       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 73       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 74       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 75       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 76       NA       2       2        4        2        2       4     NA     NA
    ## 77       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 78       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 79       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 80       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 81       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 82       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 83       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 84       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 85       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 86       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 87       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 88       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 89       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 90       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 91       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 92       NA      -3      -3       -3       -3       -3      -3     NA     NA
    ## 93       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 94       -3      -3      -3       -3       -3       -3      -3     NA     NA
    ## 95       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 96       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 97       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 98       NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 99        1       1       2        4        1        3       4     NA     NA
    ## 100      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 101      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 102      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 103      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 104      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 105      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 106      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 107      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 108      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 109      NA       1       2        4        1        2       2     NA     NA
    ## 110      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 111      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 112      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 113      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 114      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 115      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 116      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 117      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 118      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 119      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 120      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 121      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 122      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 123      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 124      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 125      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 126      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 127      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 128      NA       2       2        2        4        4       4      4      2
    ## 129      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 130      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 131      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 132      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 133      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 134      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 135      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 136      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 137      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 138      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 139      NA       1       2        3        2        4       2     NA     NA
    ## 140      NA       2       2        4        2        5       3      4      2
    ## 141       2       1       2        2        2        4       3     NA     NA
    ## 142      NA       1       1        5        1        3       4     NA     NA
    ## 143      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 144      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 145      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 146      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 147      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 148      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 149      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 150      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 151      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 152      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 153      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 154      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 155      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 156      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 157      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 158      NA       2       3        4        2        3       4     NA     NA
    ## 159      NA       3       4        2        2        2       3     NA     NA
    ## 160      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 161      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 162      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 163      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 164      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 165      NA       1       1        4        2        3       4     NA     NA
    ## 166      NA       1       1        4        3        3       4      4      3
    ## 167      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 168      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 169      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 170      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 171      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 172      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 173      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 174      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 175      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 176      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 177      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 178      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 179      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 180      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 181      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 182      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 183      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 184      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 185      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 186      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 187      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 188      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 189      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 190      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 191      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 192      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 193      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 194      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 195      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 196      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 197      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 198      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 199      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 200      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 201      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 202      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 203      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 204      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 205      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 206      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 207      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 208      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 209      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 210      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 211      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 212      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 213      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 214      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 215      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 216      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 217      NA       3       2        3        2        2       3      4      3
    ## 218      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 219      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 220      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 221      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 222      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 223      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 224      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 225      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 226      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 227      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 228      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 229      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 230      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 231      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 232      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 233      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 234      NA       2       3        4        2        1       4     NA     NA
    ## 235      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 236      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 237      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 238      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 239      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 240      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 241      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 242       2       1       3        3        3        3       3     NA     NA
    ## 243      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 244      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 245      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 246      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 247      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 248      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 249      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 250      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 251      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 252      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 253      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 254      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 255      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 256      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 257      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 258      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 259      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 260      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 261      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 262       1       1       1        5        1        2       5     NA     NA
    ## 263      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 264      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 265      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 266      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 267      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 268      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 269      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 270      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 271      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 272      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 273      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 274       2       1       2        4        2        3       4     NA     NA
    ## 275      NA       1       1        5        2        2       4     NA     NA
    ## 276      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 277      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 278      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 279      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 280      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 281      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 282       1       1       4        3        1        3       5     NA     NA
    ## 283      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 284      NA       1       2        4        2        2       5      4      1
    ## 285      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 286      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 287      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 288      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 289      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 290      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 291      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 292      NA       1       2        5        2        2       4     NA     NA
    ## 293      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 294      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 295      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 296      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 297      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 298      NA       1       2        3        2        1       4     NA     NA
    ## 299      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 300      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 301      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 302      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 303      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 304      NA       1       2        4        3        3       4     NA     NA
    ## 305      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 306      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 307      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 308      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 309      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 310      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 311      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 312      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 313      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 314      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 315      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 316      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 317      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 318      NA       1       2        3        3        4       5      3      4
    ## 319      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 320      NA       2       2        4        3        3       4     NA     NA
    ## 321      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 322      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 323      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 324      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 325      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 326      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 327      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 328       1       1       1        4        1        3       3     NA     NA
    ## 329      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 330      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 331      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 332      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 333      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 334       2       1       2        4        2        3       4     NA     NA
    ## 335      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 336      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 337      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 338      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 339      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 340      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 341      NA      -3      -3       -3       -3       -3      -3     NA     NA
    ## 342      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 343      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 344      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 345      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 346      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 347      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 348      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 349      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 350      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 351      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 352      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 353      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 354      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 355      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 356      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 357      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 358      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 359      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 360      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 361      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 362      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 363      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 364      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 365      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 366      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 367      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 368      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 369      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 370      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 371      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 372      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 373      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 374      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 375      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 376      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 377      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 378      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 379      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 380      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 381      NA       2       4        2        3        4       4     NA     NA
    ## 382      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 383      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 384      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 385      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 386      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 387      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 388      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 389      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 390      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 391      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 392      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 393      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 394      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 395      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 396      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 397      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 398      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 399      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 400      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 401      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 402      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 403      NA       2       3        2        3        3       3      2      3
    ## 404       1       3       4        2        2        3       4     NA     NA
    ## 405      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 406      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 407      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 408      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 409      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 410      NA       1       2        3        2        3       4     NA     NA
    ## 411       1       3       4        2        3        3       4     NA     NA
    ## 412      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 413      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 414      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 415      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 416      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 417      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 418      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 419      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 420      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 421      NA      -3      -3       -3       -3       -3      -3     NA     NA
    ## 422      NA       1       1        4        2        2       3     NA     NA
    ## 423      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 424      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 425      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 426      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 427      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 428      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 429      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 430      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 431      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 432      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 433      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 434      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 435      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 436      NA       1       2        4        2        3       3     NA     NA
    ## 437      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 438      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 439      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 440      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 441      NA       2       4        3        2        2       5     NA     NA
    ## 442      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 443      NA      -3      -3       -3       -3       -3      -3     NA     NA
    ## 444      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 445      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 446      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 447      NA       3       3        4        2        3       4      4      2
    ## 448      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 449      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 450      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 451      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 452      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 453      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 454      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 455      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 456      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 457      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 458      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 459      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 460      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 461      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 462      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 463      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 464      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 465      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 466      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 467      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 468      NA       2       2        4        3        4       3      3      2
    ## 469      NA       1       2        4        2        1       4     NA     NA
    ## 470      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 471      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 472      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 473      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 474      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 475       2       2       2        3        2        3       3     NA     NA
    ## 476      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 477      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 478      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 479      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 480      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 481      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 482      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 483      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 484      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 485      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 486      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 487      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 488      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 489      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 490      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 491      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ## 492      NA      NA      NA       NA       NA       NA      NA     NA     NA
    ##     pa18i3 pa18i4 pa18i6 pa18i7 pa18i8 pa18i10 pa18i11 pa18i12 pa18i13 pa18i14
    ## 1       NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 2       NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 3       NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 4        2      1      4      1      1       1       4       2       1       2
    ## 5       NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 6       NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 7       NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 8       NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 9       NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 10      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 11      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 12      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 13      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 14      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 15      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 16      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 17      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 18       2      1      5      1      1       1       3       3       1       1
    ## 19      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 20      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 21      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 22      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 23      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 24      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 25      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 26      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 27      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 28      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 29      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 30      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 31      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 32      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 33      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 34      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 35      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 36      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 37      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 38      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 39      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 40      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 41      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 42      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 43      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 44      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 45      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 46      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 47      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 48      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 49      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 50      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 51      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 52      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 53      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 54      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 55      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 56      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 57      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 58      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 59      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 60      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 61      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 62      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 63      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 64      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 65      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 66      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 67      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 68      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 69      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 70      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 71      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 72      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 73      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 74      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 75      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 76      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 77      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 78      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 79      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 80      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 81      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 82      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 83      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 84      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 85      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 86      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 87      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 88      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 89      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 90      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 91      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 92      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 93      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 94      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 95      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 96      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 97      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 98      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 99      NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 100     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 101     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 102     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 103     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 104     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 105     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 106     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 107     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 108     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 109     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 110     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 111     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 112     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 113     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 114     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 115     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 116     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 117     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 118     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 119     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 120     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 121     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 122     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 123     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 124     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 125     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 126     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 127     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 128      4      2      2     -2      4       3       5       1       4       2
    ## 129     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 130     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 131     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 132     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 133     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 134     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 135     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 136     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 137     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 138     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 139     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 140      1      1      2      2      2       4       3       2       1       1
    ## 141     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 142     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 143     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 144     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 145     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 146     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 147     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 148     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 149     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 150     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 151     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 152     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 153     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 154     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 155     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 156     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 157     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 158     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 159     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 160     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 161     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 162     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 163     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 164     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 165     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 166      2      1      4      2      1       3       3       4       4       1
    ## 167     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 168     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 169     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 170     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 171     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 172     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 173     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 174     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 175     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 176     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 177     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 178     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 179     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 180     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 181     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 182     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 183     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 184     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 185     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 186     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 187     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 188     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 189     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 190     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 191     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 192     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 193     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 194     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 195     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 196     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 197     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 198     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 199     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 200     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 201     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 202     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 203     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 204     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 205     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 206     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 207     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 208     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 209     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 210     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 211     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 212     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 213     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 214     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 215     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 216     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 217      4      1      4      2      3       3       4       3       3       1
    ## 218     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 219     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 220     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 221     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 222     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 223     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 224     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 225     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 226     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 227     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 228     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 229     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 230     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 231     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 232     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 233     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 234     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 235     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 236     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 237     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 238     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 239     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 240     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 241     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 242     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 243     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 244     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 245     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 246     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 247     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 248     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 249     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 250     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 251     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 252     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 253     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 254     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 255     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 256     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 257     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 258     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 259     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 260     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 261     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 262     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 263     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 264     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 265     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 266     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 267     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 268     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 269     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 270     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 271     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 272     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 273     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 274     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 275     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 276     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 277     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 278     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 279     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 280     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 281     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 282     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 283     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 284      2      1      4      1      1       1       3       1       1       2
    ## 285     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 286     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 287     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 288     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 289     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 290     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 291     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 292     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 293     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 294     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 295     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 296     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 297     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 298     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 299     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 300     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 301     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 302     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 303     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 304     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 305     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 306     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 307     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 308     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 309     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 310     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 311     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 312     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 313     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 314     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 315     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 316     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 317     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 318      4      1      2      4      4       4       2       5       4       1
    ## 319     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 320     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 321     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 322     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 323     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 324     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 325     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 326     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 327     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 328     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 329     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 330     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 331     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 332     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 333     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 334     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 335     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 336     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 337     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 338     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 339     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 340     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 341     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 342     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 343     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 344     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 345     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 346     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 347     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 348     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 349     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 350     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 351     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 352     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 353     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 354     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 355     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 356     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 357     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 358     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 359     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 360     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 361     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 362     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 363     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 364     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 365     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 366     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 367     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 368     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 369     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 370     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 371     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 372     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 373     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 374     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 375     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 376     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 377     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 378     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 379     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 380     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 381     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 382     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 383     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 384     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 385     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 386     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 387     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 388     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 389     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 390     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 391     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 392     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 393     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 394     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 395     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 396     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 397     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 398     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 399     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 400     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 401     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 402     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 403      3      2      3      2      4       4       4       4       4       2
    ## 404     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 405     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 406     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 407     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 408     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 409     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 410     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 411     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 412     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 413     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 414     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 415     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 416     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 417     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 418     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 419     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 420     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 421     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 422     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 423     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 424     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 425     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 426     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 427     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 428     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 429     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 430     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 431     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 432     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 433     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 434     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 435     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 436     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 437     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 438     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 439     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 440     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 441     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 442     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 443     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 444     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 445     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 446     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 447      3      1      4      1      1       1       4       1       1       1
    ## 448     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 449     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 450     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 451     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 452     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 453     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 454     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 455     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 456     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 457     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 458     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 459     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 460     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 461     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 462     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 463     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 464     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 465     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 466     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 467     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 468      2      3      3      2      2       2       3       3       2       3
    ## 469     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 470     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 471     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 472     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 473     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 474     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 475     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 476     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 477     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 478     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 479     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 480     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 481     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 482     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 483     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 484     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 485     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 486     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 487     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 488     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 489     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 490     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 491     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ## 492     NA     NA     NA     NA     NA      NA      NA      NA      NA      NA
    ##     pa18i15 pa18i16 pa19i1 pa19i8 pa14i6 pa14i7 pa14i8 pa14i9 pa14i10 pa14i11
    ## 1        NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 2        NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 3        NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 4         2       5      5      5      4      2      3      5       1       3
    ## 5        NA      NA     NA     NA      4      1      3      5       1       3
    ## 6        NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 7        NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 8        NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 9        NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 10       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 11       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 12       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 13       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 14       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 15       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 16       NA      NA     NA     NA      5      3      5      3       4       1
    ## 17       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 18        3       4      5      5      2      3      2      2       4       3
    ## 19       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 20       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 21       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 22       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 23       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 24       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 25       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 26       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 27       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 28       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 29       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 30       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 31       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 32       NA      NA     NA     NA      2      2      2      2       4       5
    ## 33       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 34       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 35       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 36       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 37       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 38       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 39       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 40       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 41       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 42       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 43       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 44       NA      NA     NA     NA     -3     -3     -3     -3      -3      -3
    ## 45       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 46       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 47       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 48       NA      NA     NA     NA      3      4      3      3       2       2
    ## 49       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 50       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 51       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 52       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 53       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 54       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 55       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 56       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 57       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 58       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 59       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 60       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 61       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 62       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 63       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 64       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 65       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 66       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 67       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 68       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 69       NA      NA     NA     NA      3      3      3      6       2       3
    ## 70       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 71       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 72       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 73       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 74       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 75       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 76       NA      NA     NA     NA      3      6      6      6       4       2
    ## 77       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 78       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 79       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 80       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 81       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 82       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 83       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 84       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 85       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 86       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 87       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 88       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 89       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 90       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 91       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 92       NA      NA     NA     NA     -3     -3     -3     -3      -3      -3
    ## 93       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 94       NA      NA     NA     NA     -3     -3     -3     -3      -3      -3
    ## 95       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 96       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 97       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 98       NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 99       NA      NA     NA     NA      3      3      3      4       1       2
    ## 100      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 101      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 102      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 103      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 104      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 105      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 106      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 107      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 108      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 109      NA      NA     NA     NA      1      3      3      3       4       1
    ## 110      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 111      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 112      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 113      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 114      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 115      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 116      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 117      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 118      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 119      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 120      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 121      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 122      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 123      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 124      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 125      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 126      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 127      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 128       1       3      2      1      2      2      2      4       2       2
    ## 129      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 130      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 131      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 132      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 133      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 134      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 135      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 136      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 137      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 138      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 139      NA      NA     NA     NA      4      3      3      4       2       1
    ## 140       3       4      5      3      2      4      3      3       2       2
    ## 141      NA      NA     NA     NA      1      4      3      3       2       2
    ## 142      NA      NA     NA     NA      3      3      3      4       2       3
    ## 143      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 144      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 145      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 146      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 147      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 148      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 149      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 150      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 151      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 152      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 153      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 154      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 155      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 156      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 157      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 158      NA      NA     NA     NA      4     -2      3      3       2       3
    ## 159      NA      NA     NA     NA      2      3      2      1       4       4
    ## 160      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 161      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 162      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 163      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 164      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 165      NA      NA     NA     NA      4      3      3      3       2       3
    ## 166       3       4      5      5      4      3      3      3       2       3
    ## 167      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 168      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 169      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 170      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 171      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 172      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 173      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 174      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 175      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 176      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 177      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 178      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 179      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 180      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 181      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 182      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 183      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 184      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 185      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 186      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 187      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 188      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 189      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 190      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 191      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 192      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 193      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 194      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 195      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 196      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 197      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 198      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 199      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 200      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 201      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 202      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 203      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 204      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 205      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 206      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 207      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 208      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 209      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 210      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 211      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 212      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 213      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 214      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 215      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 216      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 217       2       4      5      5      1      1      1      1       4       3
    ## 218      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 219      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 220      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 221      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 222      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 223      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 224      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 225      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 226      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 227      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 228      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 229      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 230      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 231      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 232      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 233      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 234      NA      NA     NA     NA      2      4      3      3       5       1
    ## 235      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 236      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 237      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 238      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 239      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 240      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 241      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 242      NA      NA     NA     NA      3      2      4      2       2       2
    ## 243      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 244      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 245      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 246      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 247      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 248      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 249      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 250      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 251      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 252      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 253      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 254      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 255      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 256      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 257      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 258      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 259      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 260      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 261      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 262      NA      NA     NA     NA      4      3      6      2       3       3
    ## 263      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 264      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 265      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 266      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 267      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 268      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 269      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 270      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 271      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 272      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 273      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 274      NA      NA     NA     NA      3      2      2      4       2       2
    ## 275      NA      NA     NA     NA      4      4      4      4       2       3
    ## 276      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 277      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 278      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 279      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 280      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 281      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 282      NA      NA     NA     NA      3      4      2      3       4       2
    ## 283      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 284       1       4      5      5      3      4      4      4       2       3
    ## 285      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 286      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 287      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 288      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 289      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 290      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 291      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 292      NA      NA     NA     NA      3      2      2      2       4       2
    ## 293      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 294      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 295      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 296      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 297      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 298      NA      NA     NA     NA      3      3      3      4       2       3
    ## 299      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 300      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 301      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 302      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 303      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 304      NA      NA     NA     NA      4      3      3      3       1       1
    ## 305      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 306      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 307      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 308      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 309      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 310      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 311      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 312      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 313      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 314      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 315      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 316      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 317      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 318       5       2      3      3      2      2      2      1       4       2
    ## 319      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 320      NA      NA     NA     NA      1      4      3      1       4       3
    ## 321      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 322      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 323      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 324      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 325      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 326      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 327      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 328      NA      NA     NA     NA     -3     -3     -3     -3      -3      -3
    ## 329      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 330      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 331      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 332      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 333      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 334      NA      NA     NA     NA      4      3      5      4       2       1
    ## 335      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 336      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 337      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 338      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 339      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 340      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 341      NA      NA     NA     NA     -3     -3     -3     -3      -3      -3
    ## 342      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 343      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 344      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 345      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 346      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 347      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 348      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 349      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 350      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 351      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 352      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 353      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 354      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 355      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 356      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 357      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 358      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 359      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 360      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 361      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 362      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 363      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 364      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 365      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 366      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 367      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 368      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 369      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 370      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 371      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 372      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 373      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 374      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 375      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 376      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 377      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 378      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 379      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 380      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 381      NA      NA     NA     NA      1      2      2      1       4       2
    ## 382      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 383      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 384      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 385      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 386      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 387      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 388      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 389      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 390      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 391      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 392      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 393      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 394      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 395      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 396      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 397      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 398      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 399      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 400      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 401      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 402      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 403       4       1      3      2      4      3      2      1       5       3
    ## 404      NA      NA     NA     NA      4      3      2      2       5       3
    ## 405      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 406      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 407      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 408      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 409      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 410      NA      NA     NA     NA      1      2      1      1       4       1
    ## 411      NA      NA     NA     NA      1      1      1      1       5       1
    ## 412      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 413      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 414      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 415      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 416      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 417      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 418      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 419      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 420      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 421      NA      NA     NA     NA     -3     -3     -3     -3      -3      -3
    ## 422      NA      NA     NA     NA      2      2      1      1       4       4
    ## 423      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 424      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 425      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 426      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 427      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 428      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 429      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 430      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 431      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 432      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 433      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 434      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 435      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 436      NA      NA     NA     NA      2      4      3      3       3       3
    ## 437      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 438      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 439      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 440      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 441      NA      NA     NA     NA      3      2      2      2       5       4
    ## 442      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 443      NA      NA     NA     NA     -3     -3     -3     -3      -3      -3
    ## 444      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 445      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 446      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 447       1       4      5      5      4      3      4      5       2       1
    ## 448      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 449      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 450      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 451      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 452      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 453      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 454      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 455      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 456      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 457      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 458      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 459      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 460      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 461      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 462      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 463      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 464      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 465      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 466      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 467      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 468       4       3      4      3     -3     -3     -3     -3      -3      -3
    ## 469      NA      NA     NA     NA      3      3      3      2       4       3
    ## 470      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 471      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 472      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 473      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 474      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 475      NA      NA     NA     NA      2      2      1      1       3       1
    ## 476      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 477      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 478      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 479      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 480      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 481      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 482      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 483      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 484      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 485      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 486      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 487      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 488      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 489      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 490      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 491      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ## 492      NA      NA     NA     NA     NA     NA     NA     NA      NA      NA
    ##     pa14i12 pa15 sat13 sat14 pa67i1 pa67i2 pa67i3 pa67i4 pa67i5 sd55 sat10
    ## 1        NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 2        NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 3        NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 4         2    3    NA    -3     NA     NA     NA     NA     NA   NA    NA
    ## 5         2    4     8    -3     -3     -3     -3     -3     -3   NA    NA
    ## 6        NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 7        NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 8        NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 9        NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 10       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 11       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 12       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 13       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 14       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 15       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 16        1    2    NA     9     NA     NA     NA     NA     NA   NA    NA
    ## 17       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 18        3    2    NA    -3     NA     NA     NA     NA     NA   NA    NA
    ## 19       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 20       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 21       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 22       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 23       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 24       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 25       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 26       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 27       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 28       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 29       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 30       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 31       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 32        2    3    NA     7     NA     NA     NA     NA     NA   NA    NA
    ## 33       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 34       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 35       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 36       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 37       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 38       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 39       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 40       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 41       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 42       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 43       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 44       -3   -3    -3    -3     -3     -3     -3     -3     -3   NA    NA
    ## 45       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 46       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 47       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 48        2    1    NA    -4     NA     NA     NA     NA     NA   NA    NA
    ## 49       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 50       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 51       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 52       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 53       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 54       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 55       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 56       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 57       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 58       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 59       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 60       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 61       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 62       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 63       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 64       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 65       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 66       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 67       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 68       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 69        4    3    10    -3     -3     -3     -3     -3     -3   NA    NA
    ## 70       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 71       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 72       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 73       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 74       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 75       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 76        2    3    NA    10     NA     NA     NA     NA     NA   NA    NA
    ## 77       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 78       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 79       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 80       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 81       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 82       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 83       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 84       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 85       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 86       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 87       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 88       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 89       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 90       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 91       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 92       -3   -3    NA    -3     NA     NA     NA     NA     NA   NA    NA
    ## 93       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 94       -3   -3    -3    -3     -3     -3     -3     -3     -3   NA    NA
    ## 95       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 96       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 97       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 98       NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 99        4    3     9    -3     -3     -3     -3     -3     -3   NA    NA
    ## 100      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 101      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 102      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 103      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 104      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 105      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 106      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 107      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 108      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 109       3    3    NA    -3     NA     NA     NA     NA     NA   NA    NA
    ## 110      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 111      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 112      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 113      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 114      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 115      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 116      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 117      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 118      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 119      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 120      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 121      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 122      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 123      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 124      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 125      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 126      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 127      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 128       2    2    NA     8     NA     NA     NA     NA     NA   NA    NA
    ## 129      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 130      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 131      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 132      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 133      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 134      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 135      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 136      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 137      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 138      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 139       4    4    NA    10     NA     NA     NA     NA     NA   NA    NA
    ## 140       4    3    NA    10     NA     NA     NA     NA     NA   NA    NA
    ## 141       3    3    10    10      7      2      3      2      3   NA    NA
    ## 142       3    3    NA    -3     NA     NA     NA     NA     NA   NA    NA
    ## 143      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 144      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 145      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 146      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 147      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 148      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 149      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 150      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 151      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 152      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 153      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 154      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 155      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 156      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 157      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 158       4    3    NA     8     NA     NA     NA     NA     NA   NA    NA
    ## 159       2    2    NA     6     NA     NA     NA     NA     NA   NA    NA
    ## 160      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 161      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 162      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 163      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 164      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 165       4    3    NA    -3     NA     NA     NA     NA     NA   NA    NA
    ## 166       4    4    NA    -3     NA     NA     NA     NA     NA   NA    NA
    ## 167      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 168      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 169      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 170      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 171      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 172      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 173      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 174      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 175      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 176      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 177      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 178      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 179      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 180      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 181      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 182      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 183      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 184      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 185      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 186      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 187      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 188      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 189      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 190      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 191      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 192      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 193      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 194      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 195      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 196      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 197      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 198      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 199      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 200      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 201      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 202      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 203      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 204      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 205      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 206      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 207      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 208      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 209      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 210      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 211      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 212      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 213      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 214      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 215      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 216      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 217       3    1    NA     6     NA     NA     NA     NA     NA   NA    NA
    ## 218      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 219      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 220      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 221      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 222      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 223      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 224      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 225      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 226      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 227      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 228      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 229      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 230      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 231      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 232      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 233      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 234       2    2    NA     7     NA     NA     NA     NA     NA   NA    NA
    ## 235      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 236      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 237      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 238      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 239      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 240      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 241      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 242       4    3     7    -3     -3     -3     -3     -3     -3   NA    NA
    ## 243      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 244      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 245      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 246      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 247      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 248      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 249      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 250      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 251      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 252      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 253      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 254      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 255      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 256      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 257      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 258      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 259      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 260      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 261      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 262       3    3    10    -3     -3     -3     -3     -3     -3   NA    NA
    ## 263      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 264      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 265      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 266      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 267      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 268      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 269      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 270      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 271      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 272      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 273      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 274       3    3     8    -3     -3     -3     -3     -3     -3   NA    NA
    ## 275       3    4    NA    -3     NA     NA     NA     NA     NA   NA    NA
    ## 276      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 277      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 278      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 279      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 280      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 281      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 282       1    3    10    -3     -3     -3     -3     -3     -3   NA    NA
    ## 283      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 284       3    3    NA    -3     NA     NA     NA     NA     NA   NA    NA
    ## 285      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 286      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 287      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 288      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 289      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 290      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 291      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 292       3    3    NA     9     NA     NA     NA     NA     NA   NA    NA
    ## 293      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 294      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 295      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 296      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 297      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 298       2    3    NA    -3     NA     NA     NA     NA     NA   NA    NA
    ## 299      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 300      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 301      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 302      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 303      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 304       4    3    NA     8     NA     NA     NA     NA     NA   NA    NA
    ## 305      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 306      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 307      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 308      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 309      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 310      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 311      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 312      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 313      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 314      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 315      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 316      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 317      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 318       1    2    NA     5     NA     NA     NA     NA     NA   NA    NA
    ## 319      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 320       3    4    NA    -3     NA     NA     NA     NA     NA   NA    NA
    ## 321      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 322      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 323      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 324      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 325      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 326      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 327      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 328      -3   -3    -3    -3     -3     -3     -3     -3     -3   NA    NA
    ## 329      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 330      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 331      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 332      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 333      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 334       3    4     7    -3     -3     -3     -3     -3     -3   NA    NA
    ## 335      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 336      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 337      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 338      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 339      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 340      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 341      -3   -3    NA    -3     NA     NA     NA     NA     NA   NA    NA
    ## 342      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 343      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 344      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 345      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 346      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 347      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 348      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 349      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 350      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 351      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 352      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 353      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 354      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 355      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 356      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 357      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 358      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 359      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 360      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 361      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 362      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 363      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 364      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 365      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 366      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 367      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 368      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 369      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 370      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 371      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 372      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 373      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 374      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 375      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 376      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 377      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 378      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 379      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 380      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 381       3    3    NA     7     NA     NA     NA     NA     NA   NA    NA
    ## 382      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 383      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 384      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 385      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 386      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 387      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 388      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 389      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 390      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 391      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 392      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 393      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 394      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 395      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 396      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 397      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 398      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 399      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 400      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 401      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 402      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 403       3    4    NA    -3     NA     NA     NA     NA     NA   NA    NA
    ## 404       3    4     7    -3     -3     -3     -3     -3     -3   NA    NA
    ## 405      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 406      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 407      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 408      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 409      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 410       2    1    NA    -3     NA     NA     NA     NA     NA   NA    NA
    ## 411       3    2     3     9      1      1      3      3      3   NA    NA
    ## 412      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 413      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 414      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 415      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 416      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 417      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 418      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 419      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 420      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 421      -3   -3    NA    -3     NA     NA     NA     NA     NA   NA    NA
    ## 422       2    2    NA     8     NA     NA     NA     NA     NA   NA    NA
    ## 423      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 424      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 425      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 426      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 427      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 428      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 429      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 430      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 431      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 432      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 433      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 434      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 435      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 436       3    3    NA    -3     NA     NA     NA     NA     NA   NA    NA
    ## 437      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 438      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 439      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 440      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 441       3    3    NA     8     NA     NA     NA     NA     NA   NA    NA
    ## 442      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 443      -3   -3    NA    -3     NA     NA     NA     NA     NA   NA    NA
    ## 444      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 445      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 446      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 447       3    2    NA     7     NA     NA     NA     NA     NA   NA    NA
    ## 448      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 449      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 450      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 451      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 452      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 453      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 454      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 455      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 456      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 457      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 458      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 459      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 460      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 461      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 462      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 463      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 464      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 465      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 466      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 467      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 468      -3   -3    NA    -3     NA     NA     NA     NA     NA   NA    NA
    ## 469       3    3    NA    -3     NA     NA     NA     NA     NA   NA    NA
    ## 470      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 471      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 472      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 473      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 474      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 475       1    1     5    -3     -3     -3     -3     -3     -3   NA    NA
    ## 476      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 477      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 478      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 479      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 480      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 481      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 482      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 483      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 484      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 485      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 486      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 487      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 488      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 489      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 490      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 491      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ## 492      NA   NA    NA    NA     NA     NA     NA     NA     NA   NA    NA
    ##     job48 job49 job25 job60 job66 job61i1 job61i2 job61i3 job61i4 job61i5 sdp64
    ## 1      NA    NA     2     1     1       3       4       4       4       4    -3
    ## 2      NA    NA     1     1     1       3       3       4       4       4    -3
    ## 3      NA    NA     4     1     1       4       4       4       4       4    -3
    ## 4      NA    NA    NA    NA     1      NA      NA      NA      NA      NA    -2
    ## 5      NA    NA    NA    NA     1      NA      NA      NA      NA      NA    -3
    ## 6      NA    NA    -3    -3    -3      -3      -3      -3      -3      -3    -3
    ## 7      NA    NA     2     1     1       2       2       3       3       3    -3
    ## 8      NA    NA     2     1     1       1       1       2       1       2    -3
    ## 9      NA    NA     2     1     1       1       1       2       3       2    -3
    ## 10     NA    NA     1     1     1       3       4       4       4       4     1
    ## 11     NA    NA     1     2     1       3       4       4       4       4     1
    ## 12     NA    NA     1     2     1       3       4       3       4       4     1
    ## 13     NA    NA     1     2     1       1       2       3       4       4     1
    ## 14     NA    NA     1    -3     2       3       4       4       4       4     2
    ## 15     NA    NA     1    -3     1       2       3       4       4       4     1
    ## 16     NA    NA    NA    NA     1      NA      NA      NA      NA      NA    -3
    ## 17     NA    NA     1     2     2       2       3       3       4       4     1
    ## 18     NA    NA    NA    NA     1      NA      NA      NA      NA      NA     1
    ## 19     NA    NA     1     2     2       2       3       4       4       4     1
    ## 20     NA    NA     1     1     1       3       2       3       4       3    -3
    ## 21     NA    NA     1     2     1       3       4       4       4       4    -3
    ## 22     NA    NA     1     2     1       3       4       4       4       4     1
    ## 23     NA    NA    -3    -3    -3      -3      -3      -3      -3      -3    -3
    ## 24     NA    NA     1     2     1       1       3       4       2       2    -3
    ## 25     NA    NA     1     1     1       2       3       4       3       3    -3
    ## 26     NA    NA     1     2     1       2       3       3       3       3    -3
    ## 27     NA    NA     2     1     1       1       3       3       3       3    -3
    ## 28     NA    NA     1     1     1       1       2       3       3       3    -3
    ## 29     NA    NA     1     1     1       4       3       4       4       3     1
    ## 30     NA    NA     1     2     1       3       3       4       4       4     1
    ## 31     NA    NA    -3    -3    -3      -3      -3      -3      -3      -3     1
    ## 32     NA    NA    NA    NA     1      NA      NA      NA      NA      NA     1
    ## 33     NA    NA     4     1     2       3       4       4       4       4     2
    ## 34     NA    NA     4     1     1       3       3       4       4       3     1
    ## 35     NA    NA     3     1     1       3       3       4       4       3     1
    ## 36     NA    NA    -3    -3    -3      -3      -3      -3      -3      -3    -3
    ## 37     NA    NA     1     2     2       4       4       4       4       1    -3
    ## 38     NA    NA    -3    -3    -3      -3      -3      -3      -3      -3    -3
    ## 39     NA    NA     4     1     1       2       2       4       4       4    -3
    ## 40     NA    NA     4     1     1       4       4       4       4       4    -3
    ## 41     NA    NA     3     1     1       4       4       4       4       4    -3
    ## 42     NA    NA    -3    -3    -3      -3      -3      -3      -3      -3     2
    ## 43     NA    NA    -3    -3    -3      -3      -3      -3      -3      -3    -3
    ## 44     NA    NA    NA    NA    -3      NA      NA      NA      NA      NA    -3
    ## 45     NA    NA     4     2     1       1       1       4       4       2     1
    ## 46     NA    NA     4     1     1       1       1       2       1       1    -3
    ## 47     NA    NA     4     2     1       3       1       2       2       2    -3
    ## 48     NA    NA    NA    NA     1      NA      NA      NA      NA      NA     1
    ## 49     NA    NA     1     1     1       2       3       4       4       4     1
    ## 50     NA    NA     2     1     1       3       4       4       4       4     1
    ## 51     NA    NA     2     1     1       3       4       4       4       4     1
    ## 52     NA    NA     3     1     1       2       2       4       4       4     1
    ## 53     NA    NA     3     1     1       3       4       4       4       4     1
    ## 54     NA    NA     3     2     1       1       1       4       4       4     1
    ## 55     NA    NA     1     1     1       2       4       4       4       4    -3
    ## 56     NA    NA     1     1     1       2       4       3       4       4    -3
    ## 57     NA    NA     1     1     1       1       4       4       4       4    -3
    ## 58     NA    NA     2     2     1       3       4       4       4       3    -3
    ## 59     NA    NA     1     2     1       3       1       4       4       4     1
    ## 60     NA    NA     1     2     1       3       3       4       4       3     1
    ## 61     NA    NA     3     1     1       1       1       4       4       3     1
    ## 62     NA    NA     3     1     1       2       2       4       4       4     1
    ## 63     NA    NA     3     1     1       1       1       4       4       4     1
    ## 64     NA    NA     3     1     1       3       3       4       3       3     1
    ## 65     NA    NA     3    -3     1       2       2       4       4       4     1
    ## 66     NA    NA     3    -3     1       3       4       4       4       4     1
    ## 67     NA    NA     2     2     2       3       4       3       4       4     2
    ## 68     NA    NA     4     1     1       2       2       4       4       4     1
    ## 69     NA    NA    NA    NA     1      NA      NA      NA      NA      NA     2
    ## 70     NA    NA     4     1     1       3       4       4       2       3     1
    ## 71     NA    NA     4     1     1       3       3       2       3       3     1
    ## 72     NA    NA     3     1     1       4       3       3       4       4     1
    ## 73     NA    NA     2     1     2       3       3       3       3       4     1
    ## 74     NA    NA     2     2     1       1       2       4       4       4     1
    ## 75     NA    NA     2     2     1       2       2       3       4       4     1
    ## 76     NA    NA    NA    NA     1      NA      NA      NA      NA      NA     1
    ## 77     NA    NA     1     1     1       2       3       3       2       4     1
    ## 78     NA    NA     3     1     1       3       1       3       1       3     1
    ## 79     NA    NA     3     1     1       4       4       4       3       4     1
    ## 80     NA    NA     3     1     2       3       3       4       3       4    -3
    ## 81     NA    NA     3     1     1       3       3       4       4       4     2
    ## 82     NA    NA     4     1     1       2       3       4       4       4     1
    ## 83     NA    NA     4     1     1       3       4       4       4       3    -3
    ## 84     NA    NA     4     1     1       3       4       4       4       4    -3
    ## 85     NA    NA     1     1     1       3       4       4       4       4    -3
    ## 86     NA    NA     1     2     1       1       2       4       4       4     1
    ## 87     NA    NA     1     1    -3       1       4       4       4       4    -3
    ## 88     NA    NA     1     2     1       4       4       4       4       4     1
    ## 89     NA    NA     3     1     1       2       4       2       4       1    -3
    ## 90     NA    NA     3     1     2       1       1       4       4       1    -3
    ## 91     NA    NA    -3    -3    -3      -3      -3      -3      -3      -3    -3
    ## 92     NA    NA    NA    NA     1      NA      NA      NA      NA      NA    -3
    ## 93     NA    NA     1     1    -3       1       3       4       4       4    -3
    ## 94     NA    NA    NA    NA     1      NA      NA      NA      NA      NA    -3
    ## 95     NA    NA     3     1     1       4       3       4       4       4     1
    ## 96     NA    NA     3     1     2       2       2       4       3       4     1
    ## 97     NA    NA     1     1     1       4       4       4       4       4     1
    ## 98     NA    NA     1     2     1       4       4       4       4       4     1
    ## 99     NA    NA    NA    NA     1      NA      NA      NA      NA      NA     1
    ## 100    NA    NA     4     1     1       3       4       4       4       3     1
    ## 101    NA    NA     4     1     1       4       4       4       2       2     1
    ## 102    NA    NA     4     1     1       4       2       2       1       1     1
    ## 103    NA    NA     4     1     1       3       3       4       4       4     1
    ## 104    NA    NA     4     1     1       3       4       4       4       4     1
    ## 105    NA    NA     4     1     1       2       3       4       3       4    -3
    ## 106    NA    NA     2     1     1       3       4       4       3       3     1
    ## 107    NA    NA     2     1     1       3       4       4       4       3    -3
    ## 108    NA    NA     2     1     1       3       4       4       4       4    -3
    ## 109    NA    NA    NA    NA     1      NA      NA      NA      NA      NA     1
    ## 110    NA    NA     1    -3     1       3      -2       4       4       3     1
    ## 111    NA    NA     1     1     1       2       4       3       3       4     1
    ## 112    NA    NA     1    -3     1       2       3       3       3       3     1
    ## 113    NA    NA     4     1     1       3       3       2       2       2     2
    ## 114    NA    NA     4     1     1       3       3       3       3       2     1
    ## 115    NA    NA     4     1     1       2       3       3       2       2     1
    ## 116    NA    NA     2     1     1       2       4       4       3       3     1
    ## 117    NA    NA     1     2     1       1       3       3       2       1    -3
    ## 118    NA    NA     1     2     1       2       2       3       1       1     1
    ## 119    NA    NA     1    -3     1       4       4       4       4       4     1
    ## 120    NA    NA     1    -3     1       4       3       4       4       4     1
    ## 121    NA    NA     1    -3     1       4       3       4       4       4     2
    ## 122    NA    NA     3     1     1       1       1       2       1       1     2
    ## 123    NA    NA     3     1     1       4       3       2       4       4     2
    ## 124    NA    NA     2     2     1       4       1       4       4       4     2
    ## 125    NA    NA     1     2     1       3       3       3       3       3     1
    ## 126    NA    NA     1     2     1       1       1       1       1       1    -2
    ## 127    NA    NA     1     1     1       3       3       4       4       4     1
    ## 128    NA    NA    NA    NA     1      NA      NA      NA      NA      NA     1
    ## 129    NA    NA     1     2     1       2       3       2       3       3     1
    ## 130    NA    NA     3     1     1       1       1       4       4       4    -3
    ## 131    NA    NA     3     1     1       1       2       4       4       4    -3
    ## 132    NA    NA     4     1     2       1       3       4       4       4    -3
    ## 133    NA    NA    -3    -3    -3      -3      -3      -3      -3      -3    -3
    ## 134    NA    NA     4     1     1       3       3       4       3       3     1
    ## 135    NA    NA     4     1     1       3       4       4       4       3     1
    ## 136    NA    NA     2     2     1       3       3       4       4       3     1
    ## 137    NA    NA     2     1     1       4       4       4       4       4     1
    ## 138    NA    NA     2     1     1       3       4       4       4       4     1
    ## 139    NA    NA    NA    NA     1      NA      NA      NA      NA      NA     1
    ## 140    NA    NA    NA    NA     1      NA      NA      NA      NA      NA     2
    ## 141    NA    NA    NA    NA     1      NA      NA      NA      NA      NA     1
    ## 142    NA    NA    NA    NA     1      NA      NA      NA      NA      NA     1
    ## 143    NA    NA     2     1     1       1       1       4       3       3     1
    ## 144    NA    NA     2     2     1       1       1       4       3       3     1
    ## 145    NA    NA     4     2     1       1       2       3       3       3     1
    ## 146    NA    NA     1     1     1       1       1       4       3       3     1
    ## 147    NA    NA     1     1     1       1       1       2       2       3     1
    ## 148    NA    NA     1     2     1       3       3       4       3       3     1
    ## 149    NA    NA     4     1     1       1       1       1       1       1    -3
    ## 150    NA    NA     3     1     1       1       1       1      -2      -2     1
    ## 151    NA    NA     3     1     1       2       3       2       2       2    -3
    ## 152    NA    NA     1     2     1       3       3       4       4       4     1
    ## 153    NA    NA     2     2     1       4       4       4       4       4     1
    ## 154    NA    NA     2     1     1       3       3       4       4       4     1
    ## 155    NA    NA     1     2     1       3       3       4       4       4     1
    ## 156    NA    NA     1     2     1       4       4       4       4       4     1
    ## 157    NA    NA     1     2     1       3       4       4       4       4     1
    ## 158    NA    NA    NA    NA     1      NA      NA      NA      NA      NA     1
    ## 159    NA    NA    NA    NA     1      NA      NA      NA      NA      NA     1
    ## 160    NA    NA     2     1    -3       4       4       4       4       4    -3
    ## 161    NA    NA     2     1     1       3       4       4       4       4     1
    ## 162    NA    NA     4     1     1       2       3       3       2       3     1
    ## 163    NA    NA     4     1     1       2       3       3       3       4     1
    ## 164    NA    NA     4     1     1       2       3       3       3       4     1
    ## 165    NA    NA    NA    NA     1      NA      NA      NA      NA      NA     1
    ## 166    NA    NA    NA    NA     1      NA      NA      NA      NA      NA     1
    ## 167    NA    NA     3     1     1       3       3       4       3       4     1
    ## 168    NA    NA     1     1     1       2       2       3       3       3    -1
    ## 169    NA    NA     1     1     1       3       2       4       3       3     1
    ## 170    NA    NA     1     1     1       1       3       3       3       3     1
    ## 171    NA    NA     2     2     1       2       2       4       3       3    -3
    ## 172    NA    NA     1     2     1       2       2       4       2       3    -3
    ## 173    NA    NA     2     1     1       2       4       4       4       4    -3
    ## 174    NA    NA     1     2     2       2       3       4       4       4     1
    ## 175    NA    NA    -3    -3    -3      -3      -3      -3      -3      -3     1
    ## 176    NA    NA     1     1     1       1       3       4       4       4     1
    ## 177    NA    NA     4     1     1       1       4       2       4       2    -3
    ## 178    NA    NA     4     1     1       1       4       3       4       4    -3
    ## 179    NA    NA     4     1     1       1       2       3       4       2    -3
    ## 180    NA    NA     3     1     1       1       3       4       4       4    -3
    ## 181    NA    NA     4     1     1       1       4       4       4       4    -3
    ## 182    NA    NA    -3    -3    -3      -3      -3      -3      -3      -3    -3
    ## 183    NA    NA     3     1     1       4       4       4       4       4     1
    ## 184    NA    NA     3     1     2       3       4       4       4       4     2
    ## 185    NA    NA     3     1     1       3       4       4       4       4     1
    ## 186    NA    NA     4     1     1       4       4       4       4       4     1
    ## 187    NA    NA     3     1     1       4       3       4       4       4     1
    ## 188    NA    NA     3     1     1       2       2       2       2       2     1
    ## 189    NA    NA     2     1     1       3       2       4       4       3     1
    ## 190    NA    NA     2     1     1       3       2       3       3       4     1
    ## 191    NA    NA     2     2     1       3       3       3       3       3     1
    ## 192    NA    NA     2     1     1       3       3       4       4       4    -3
    ## 193    NA    NA     2     2     1       3       4       4       4       4    -3
    ## 194    NA    NA     2     1     1       2       4       4       4       4    -3
    ## 195    NA    NA     1     2     2       2       3       3       4       2     2
    ## 196    NA    NA     1     2     2       3       3       3       3       3     1
    ## 197    NA    NA     1     2     1       2       2       3       3       3    -3
    ## 198    NA    NA     3     1     1       3       3       4       3       4    -3
    ## 199    NA    NA     3     1     1       3       3       4       3       4    -3
    ## 200    NA    NA     3     1     1       2       2       4       3       3     1
    ## 201    NA    NA    -3    -3    -3      -3      -3      -3      -3      -3    -3
    ## 202    NA    NA     4     1     2       2       2       2       4       4    -3
    ## 203    NA    NA     4     1     1       3       4       4       4       4    -3
    ## 204    NA    NA     2     2     1       3       4       4       4       4    -3
    ## 205    NA    NA     2     2     1       3       4       4       4       4    -3
    ## 206    NA    NA     2     2     1       4       4       4       4       4    -3
    ## 207    NA    NA     4     2     2       2       1       3       3       3     1
    ## 208    NA    NA     3     1     1       1       2       3       3       4    -3
    ## 209    NA    NA     2     1     1       2       2       4       3       4    -3
    ## 210    NA    NA     4     1     1       1       1       1       3       3     1
    ## 211    NA    NA     2     1     1       1       2       1       4       4     1
    ## 212    NA    NA     2     1     1       1       2       2       2       3    -3
    ## 213    NA    NA     1     2     1       3       4       4       4       4    -3
    ## 214    NA    NA     2     2     1       3       2       4       4       3    -3
    ## 215    NA    NA     2     2     1       3       3       3       4       4    -3
    ## 216    NA    NA     1     1     2       3       3       4       3       3     1
    ## 217    NA    NA    NA    NA     1      NA      NA      NA      NA      NA     1
    ## 218    NA    NA     1     1     1       2       2       3       3       4     1
    ## 219    NA    NA     3     1     1       3       3       3       3       3     1
    ## 220    NA    NA     3     1     1       3       3       3       3       2     1
    ## 221    NA    NA     3     1     1       4       3       4       3       3     1
    ## 222    NA    NA     4     1     1       2       3       4       4       3     2
    ## 223    NA    NA     1     1     1       3       3       3       3       3     2
    ## 224    NA    NA     4     2     1       1       3       4       4       4     1
    ## 225    NA    NA     3     1     1       2       4       4       4       4    -3
    ## 226    NA    NA     3     1     1       1       3       4       4       4     1
    ## 227    NA    NA     2     2     1       2       2       4       4       4     1
    ## 228    NA    NA    -3    -3    -3      -3      -3      -3      -3      -3    -3
    ## 229    NA    NA    -3    -3    -3      -3      -3      -3      -3      -3    -3
    ## 230    NA    NA    -3    -3    -3      -3      -3      -3      -3      -3    -3
    ## 231    NA    NA     4     1     1       3       2       4       3       3     1
    ## 232    NA    NA     4     1     1       3       3       4       3       4     1
    ## 233    NA    NA     4     1     1       4       2       4       3       4     1
    ## 234    NA    NA    NA    NA     1      NA      NA      NA      NA      NA     1
    ## 235    NA    NA     4     1     1       3       3       4       4       4     1
    ## 236    NA    NA     4     1     1       4       3       4       4       4     1
    ## 237    NA    NA     2     2     1       1       1       3       3       4     1
    ## 238    NA    NA     2     2     1       1       2       3       3       3     1
    ## 239    NA    NA     2     2     1       1       1       3       2       3     1
    ## 240    NA    NA     4     2     1       2       2       4       3       4     1
    ## 241    NA    NA     1     1     1       2       2       4       4       4     1
    ## 242    NA    NA    NA    NA     1      NA      NA      NA      NA      NA     1
    ## 243    NA    NA    -3    -3    -3      -3      -3      -3      -3      -3    -3
    ## 244    NA    NA     4     1     2       2       3       4       3       4    -3
    ## 245    NA    NA     4     1     1       2       2       4       4       4    -3
    ## 246    NA    NA     4     1     1       3       3       4       4       4     1
    ## 247    NA    NA     3     1     1       3       3       4       4       4     1
    ## 248    NA    NA     3     1     1       3       3       4       3       4     1
    ## 249    NA    NA    -3    -3    -3      -3      -3      -3      -3      -3     1
    ## 250    NA    NA    -3    -3    -3      -3      -3      -3      -3      -3     1
    ## 251    NA    NA     4     1     1       4       4       4       4       4     1
    ## 252    NA    NA     2     2     1       3       3       4       4       4     1
    ## 253    NA    NA     2     2     1       3       3       4       4       4     1
    ## 254    NA    NA     2     2     1       3       1       3       3       4     1
    ## 255    NA    NA     3    -3     1       4       4       4       4       3    -3
    ## 256    NA    NA     3    -3     1       4       4       4       4       4    -3
    ## 257    NA    NA     3    -3     1       3       4       4       4       4    -3
    ## 258    NA    NA     1     1     1       1       2      -2      -2       4     1
    ## 259    NA    NA    -3    -3    -3      -3      -3      -3      -3      -3     1
    ## 260    NA    NA     1     2     1       1       3       2       4       3     1
    ## 261    NA    NA     4     1     2       2       2       4       4       4     2
    ## 262    NA    NA    NA    NA     1      NA      NA      NA      NA      NA     1
    ## 263    NA    NA     3     1     1       2       2       3       3       2     1
    ## 264    NA    NA     3     1     1       3       2       3       2       3    -3
    ## 265    NA    NA     3    -3     1       2       3       4       2       3     1
    ## 266    NA    NA     4     1     1       3       4       4       4       4     1
    ## 267    NA    NA     1     2     1       3       4       4       4       4     2
    ## 268    NA    NA     1     1     1       3       3       3       4       4     2
    ## 269    NA    NA     1     1     1       3       4       3       4       4     1
    ## 270    NA    NA     1     1     1       3       4       4       4       4     1
    ## 271    NA    NA    -3    -3    -3      -3      -3      -3      -3      -3     1
    ## 272    NA    NA     1     2     1       3       4       3       4       4     1
    ## 273    NA    NA     1     1     1       2       3       4       4       4     1
    ## 274    NA    NA    NA    NA     1      NA      NA      NA      NA      NA     1
    ## 275    NA    NA    NA    NA     1      NA      NA      NA      NA      NA     1
    ## 276    NA    NA     4     1    -3       1       2       3       4       4    -3
    ## 277    NA    NA     1     1     1       3       4       4       4       3     1
    ## 278    NA    NA     3    -3     1       3       4       4       4       4     1
    ## 279    NA    NA     4     1     1       4       4       4       4       4     1
    ## 280    NA    NA     4     1     1       3       3       4       3       4     1
    ## 281    NA    NA     4     1     1       2       3       4       3       4     1
    ## 282    NA    NA    NA    NA     1      NA      NA      NA      NA      NA     1
    ## 283    NA    NA     1     1     2       2       3       4       4       4     1
    ## 284    NA    NA    NA    NA     1      NA      NA      NA      NA      NA     1
    ## 285    NA    NA     1     1     1       3       4       4       4       4     1
    ## 286    NA    NA     3    -3     1       3       1       3       3       3    -3
    ## 287    NA    NA     3    -3     1       3       2       3       4       3     1
    ## 288    NA    NA     3    -3     1       4       3       4       3       2     1
    ## 289    NA    NA     1     2     1       3       2       4       4       4     1
    ## 290    NA    NA     1     1     1       3       3       4       3       4    -3
    ## 291    NA    NA     4     1     2       4       4       4       4       3    -3
    ## 292    NA    NA    NA    NA     1      NA      NA      NA      NA      NA     1
    ## 293    NA    NA     1     1    -3       4       4       4       4       4    -3
    ## 294    NA    NA     1     2     1       4       4       4       4       4     1
    ## 295    NA    NA     4     1     1       1       2       3       3       3    -3
    ## 296    NA    NA     3     1     1       3       2       4       4       4    -3
    ## 297    NA    NA     3     1     1       2       2       1       4       3    -3
    ## 298    NA    NA    NA    NA     1      NA      NA      NA      NA      NA     2
    ## 299    NA    NA     3     1    -3       1       2       3       4       4    -3
    ## 300    NA    NA     4     2     1       2       3       4       4       4     1
    ## 301    NA    NA     4     1     1       2       2       3       3       3     2
    ## 302    NA    NA     3     1     1       1       1       2       2       3     1
    ## 303    NA    NA     4     1     1       1       1       3       3       3     1
    ## 304    NA    NA    NA    NA     1      NA      NA      NA      NA      NA     1
    ## 305    NA    NA    -3    -3    -3      -3      -3      -3      -3      -3    -3
    ## 306    NA    NA     4     2     2       3       4       4       4       4    -3
    ## 307    NA    NA     4     1     1       3       3       4       4       3    -3
    ## 308    NA    NA    -3    -3    -3      -3      -3      -3      -3      -3     1
    ## 309    NA    NA    -3    -3    -3      -3      -3      -3      -3      -3     1
    ## 310    NA    NA    -3    -3    -3      -3      -3      -3      -3      -3     1
    ## 311    NA    NA     1     2     1       3       4       4       4       3    -3
    ## 312    NA    NA     1     2     1       3       4       4       4       4    -3
    ## 313    NA    NA     2     1     2       3       3       4       4       3    -3
    ## 314    NA    NA     4     1     1       2       3       4       4       4     1
    ## 315    NA    NA     4     1     1       2       4       4       4       4     1
    ## 316    NA    NA     4     1     1       1       3       4       4       4     1
    ## 317    NA    NA     1     2     1       3       1       2       2       2     2
    ## 318    NA    NA    NA    NA     2      NA      NA      NA      NA      NA     1
    ## 319    NA    NA     4     1     1       2       3       3       4       2    -3
    ## 320    NA    NA    NA    NA    -3      NA      NA      NA      NA      NA     1
    ## 321    NA    NA    -3    -3    -3      -3      -3      -3      -3      -3    -3
    ## 322    NA    NA    -3    -3    -3      -3      -3      -3      -3      -3     1
    ## 323    NA    NA     4     1     1       2       2       4       4       4     1
    ## 324    NA    NA     4     1     1       2       3       4       4       4     1
    ## 325    NA    NA    -3    -3    -3      -3      -3      -3      -3      -3     1
    ## 326    NA    NA     4     1     1       3       4       4       4       4    -3
    ## 327    NA    NA     4     1     1       3       4       4       4       4    -3
    ## 328    NA    NA    NA    NA     1      NA      NA      NA      NA      NA    -3
    ## 329    NA    NA     1     2     1       1       3       4       3       4     1
    ## 330    NA    NA     1     2     1       1       2       4       4       4     2
    ## 331    NA    NA     1     1     1       1       1       1       3       1     1
    ## 332    NA    NA     1     2     1       3       2       4       4       4     1
    ## 333    NA    NA     2     2     1       3       3       4       3       4     1
    ## 334    NA    NA    NA    NA     1      NA      NA      NA      NA      NA     1
    ## 335    NA    NA     1     1     1       1       1       4       4       3     1
    ## 336    NA    NA     1     2     1       1       1       3       3       4     1
    ## 337    NA    NA     1     1     1       1       2       2       4       4     1
    ## 338    NA    NA     2     1     1       3       3       3       3       4     1
    ## 339    NA    NA     2     1     2       4       3       4       3       4     1
    ## 340    NA    NA     2     1     1       2       2       4       2       4     1
    ## 341    NA    NA    NA    NA     1      NA      NA      NA      NA      NA    -3
    ## 342    NA    NA     4     1     2       3       4       4       4       3    -3
    ## 343    NA    NA     4    -4     1       3       4       4       4       4    -3
    ## 344    NA    NA     4    -2     1       1       4       4       4       4    -3
    ## 345    NA    NA    -3    -3    -3      -3      -3      -3      -3      -3    -3
    ## 346    NA    NA    -3    -3    -3      -3      -3      -3      -3      -3    -3
    ## 347    NA    NA    -3    -3    -3      -3      -3      -3      -3      -3    -3
    ## 348    NA    NA     1     1     1       2       3       3       3       3     1
    ## 349    NA    NA     4     1     1       2       3       3       3       3     2
    ## 350    NA    NA     1     1     1       2       3       4       4       4     1
    ## 351    NA    NA     2     1     1       3       4       4       4       4     1
    ## 352    NA    NA     1     1     1       2       3       4       4       4    -3
    ## 353    NA    NA    -3    -3    -3      -3      -3      -3      -3      -3    -3
    ## 354    NA    NA     3    -3     2       3       2       3       3       3     1
    ## 355    NA    NA     3    -3     1       2       3       4       3       3     1
    ## 356    NA    NA     3    -3     1       3       2       4       3       3     1
    ## 357    NA    NA     4     1     1       4       3       4       4       4    -3
    ## 358    NA    NA     4     1     1       3       2       4       4       4    -3
    ## 359    NA    NA     4     1     1       4       2       4       4       4    -3
    ## 360    NA    NA     3     1     1       2       3       4       4       3     1
    ## 361    NA    NA     4     1     1       3       4       4       4       4     1
    ## 362    NA    NA     4     1     1       4       4       4       4       4     1
    ## 363    NA    NA     4     1     1       3       3       4       3       3     1
    ## 364    NA    NA     1     1     1       3       3       4       4       3    -3
    ## 365    NA    NA     1     1     1       4       4       4       4       3     1
    ## 366    NA    NA     1     2     1       3       4       4       4       4     1
    ## 367    NA    NA     1     2     1       4       4       4       4       4     1
    ## 368    NA    NA     1     2     1       4       4       4       4       4     1
    ## 369    NA    NA     2     2     1       3       3       4       4       4     1
    ## 370    NA    NA    -3    -3    -3      -3      -3      -3      -3      -3     1
    ## 371    NA    NA     2     2     1       4       4       4       4       4     1
    ## 372    NA    NA     3    -3     1       4       4       4       2       3     1
    ## 373    NA    NA     3    -3     1       3       2       2       2       3     1
    ## 374    NA    NA     1    -3     1       1       2       2       2       2     1
    ## 375    NA    NA     2     2     1       3       4       4       4       3     1
    ## 376    NA    NA    -3    -3    -3      -3      -3      -3      -3      -3    -3
    ## 377    NA    NA     2     2     1       2       2       2       4       4    -3
    ## 378    NA    NA     2     1     1       4       3       4       4       4     1
    ## 379    NA    NA     2     1     1       3       3       4       3       4     1
    ## 380    NA    NA     2     1     1       4       3       4       4       4     1
    ## 381    NA    NA    NA    NA     1      NA      NA      NA      NA      NA     1
    ## 382    NA    NA     2     1    -3       1       2       4       2       3    -3
    ## 383    NA    NA     2     1     1       3       3       4       4       4     1
    ## 384    NA    NA     2     1     1       3       4       4       4       4     1
    ## 385    NA    NA     2     1     1       3       3       3       4       4     1
    ## 386    NA    NA     2     1     1       3       4       4       4       4     2
    ## 387    NA    NA     3     1     1       3       4       4       2       4     1
    ## 388    NA    NA    -3    -3    -3      -3      -3      -3      -3      -3     1
    ## 389    NA    NA     4     1     2       2       1       4       3       4     1
    ## 390    NA    NA     3     1     1       1       3       4       4       4     1
    ## 391    NA    NA     3     1     1       3       4       4       4       3    -3
    ## 392    NA    NA     3     1     1       3       4       4       4       4    -3
    ## 393    NA    NA     4    -3     1       3       3       4       4       3    -3
    ## 394    NA    NA     2    -3     1       2       3       4       3       4    -3
    ## 395    NA    NA    -3    -3    -3      -3      -3      -3      -3      -3    -3
    ## 396    NA    NA     4     1     1       3       4       3       3       4     1
    ## 397    NA    NA     1     1     1       2       3       4       3       4     1
    ## 398    NA    NA     1     1     1       2       3       3       4       4     1
    ## 399    NA    NA     4     1     1       1       4       4       4       4     1
    ## 400    NA    NA     4     1     1       4       4       4       4       4     1
    ## 401    NA    NA    -3    -3    -3      -3      -3      -3      -3      -3     1
    ## 402    NA    NA     4     1     1       2       1       3       4       4     1
    ## 403    NA    NA    NA    NA     1      NA      NA      NA      NA      NA     1
    ## 404    NA    NA    NA    NA     1      NA      NA      NA      NA      NA     1
    ## 405    NA    NA     3     1     1       3       4       4       4       4     1
    ## 406    NA    NA     4     1     1       3       4       4       4       4     1
    ## 407    NA    NA     4     1     1       3       4       4       4       4     1
    ## 408    NA    NA     1     2     1       3       3       3       4       3     1
    ## 409    NA    NA     3     1     1       4       4       4       4       4    -3
    ## 410    NA    NA    NA    NA     1      NA      NA      NA      NA      NA     1
    ## 411    NA    NA    NA    NA     1      NA      NA      NA      NA      NA     2
    ## 412    NA    NA     3     1     1       3       4       4       4       4    -3
    ## 413    NA    NA     3     1     1       2       4       4       4       4    -3
    ## 414    NA    NA     3     1     1       3       4       4       4       4    -3
    ## 415    NA    NA     3     1     1       2       4       4       4       4     1
    ## 416    NA    NA     3     1     2       2       3       4       4       4     1
    ## 417    NA    NA     4     1     1       3       3       2       2       1     1
    ## 418    NA    NA     2     2     1       1       1       3       4       4     1
    ## 419    NA    NA     2     2     1       1       1       4       2       3     1
    ## 420    NA    NA     2     2     1       2       1       4       4       4     1
    ## 421    NA    NA    NA    NA     1      NA      NA      NA      NA      NA    -3
    ## 422    NA    NA    NA    NA     1      NA      NA      NA      NA      NA     1
    ## 423    NA    NA     3     1    -3       3       3       2       2       2    -3
    ## 424    NA    NA     3     1     1       3       3       4       3       2    -3
    ## 425    NA    NA     3     1     1       3       4       3       4       4    -3
    ## 426    NA    NA     4     1     1       1       2       1       3       3    -3
    ## 427    NA    NA     4     1     1       1       4       3       4       3    -3
    ## 428    NA    NA     4     1     1       2       4       4       4       3    -3
    ## 429    NA    NA     4     1     1       2       4       4       4       4    -3
    ## 430    NA    NA     1     1     1       2       3       3       4       4     1
    ## 431    NA    NA     1     1     1       2       2       3       4       4     1
    ## 432    NA    NA     1     2     1       1       2       3       4       4     1
    ## 433    NA    NA     3     1     1       1       2       3       3       3     1
    ## 434    NA    NA     3     1     1       2       3       4       3       4     1
    ## 435    NA    NA     3     1     1       3       4       4       3       3     1
    ## 436    NA    NA    NA    NA     1      NA      NA      NA      NA      NA     1
    ## 437    NA    NA     2     1     1       1       2       4       3       3     1
    ## 438    NA    NA     4     1     1       2       2       3       3       4     1
    ## 439    NA    NA     3     1     1       2       2       4       4       4     1
    ## 440    NA    NA     3     1     1       2       2       4       3       4     1
    ## 441    NA    NA    NA    NA    -3      NA      NA      NA      NA      NA     1
    ## 442    NA    NA     1     1     1       4       4       4       4       4     2
    ## 443    NA    NA    NA    NA     2      NA      NA      NA      NA      NA    -3
    ## 444    NA    NA     2     2    -3       3       4       3       3       4    -3
    ## 445    NA    NA     1     1     1       1       4       3       3       3    -3
    ## 446    NA    NA     3    -3     2       2       1       3       2       2    -3
    ## 447    NA    NA    NA    NA     1      NA      NA      NA      NA      NA     2
    ## 448    NA    NA     3    -3     1       1       1       2       2       2    -3
    ## 449    NA    NA     4     1     1       3       3       4       3       3     1
    ## 450    NA    NA     4     1     1       3       3       3       4       4     1
    ## 451    NA    NA     4     1     1       3       2       3       3       4     1
    ## 452    NA    NA     3     1     1       4       3       4       4       4     2
    ## 453    NA    NA     4     1     1       4       4       4       3       4     1
    ## 454    NA    NA     3     1     1       4       4       4       4       4     1
    ## 455    NA    NA     1     2     1       2       2       3       2       3     1
    ## 456    NA    NA     1     1     1       3       3       3       3       3     1
    ## 457    NA    NA     1     1     1       2       2       2       3       3     1
    ## 458    NA    NA     4     1     1       2       2       4       3       4     1
    ## 459    NA    NA     4     1     1       3       4       4       4       4     1
    ## 460    NA    NA     4     1     1       2       2       4       3       4     1
    ## 461    NA    NA     2     2     1       1       1       4       4       3     1
    ## 462    NA    NA     1     1     1       1       1       3       3       3     1
    ## 463    NA    NA     1     1     2       3       3       4       4       4     1
    ## 464    NA    NA     4     1     1       3       4       4       4       4     1
    ## 465    NA    NA     4     1     1       2       4       4       4       3     1
    ## 466    NA    NA     4     1     1       3       4       4       4       3     1
    ## 467    NA    NA     1     1     1       2       3       3       3       3    -3
    ## 468    NA    NA    NA    NA     1      NA      NA      NA      NA      NA     1
    ## 469    NA    NA    NA    NA    -3      NA      NA      NA      NA      NA     1
    ## 470    NA    NA    -3    -3    -3      -3      -3      -3      -3      -3     1
    ## 471    NA    NA     1     1     1       2       2       2       2       4     1
    ## 472    NA    NA     2     2     1       1       1       2       2       3     1
    ## 473    NA    NA     1     1     1       3       4       4       4       3     1
    ## 474    NA    NA     2     2     1       3       2       3       4       4     1
    ## 475    NA    NA    NA    NA    -2      NA      NA      NA      NA      NA     1
    ## 476    NA    NA     3    -3     1       1       2       4       4       4     1
    ## 477    NA    NA     3    -3     1       1       3       4       4       4     1
    ## 478    NA    NA     3    -3     1       2       4       4       4       4     1
    ## 479    NA    NA     2     1     1       2       3       4       2       3     1
    ## 480    NA    NA     2     1    -3       2       3       4       2       4    -3
    ## 481    NA    NA     1     1     1       2       3       4       3       4    -3
    ## 482    NA    NA     3     1     1       1       2       3       4       2     1
    ## 483    NA    NA     4     1     1       1       2       4       3       2     2
    ## 484    NA    NA     4     1     1       1       2       2       2       2     1
    ## 485    NA    NA     2    -3     1       2       2       4       3       3    -3
    ## 486    NA    NA     2    -3     1       2       1       4       4       4     1
    ## 487    NA    NA     3    -3     1       3       2       4       3       3     1
    ## 488    NA    NA     1    -3     1       1       3       4       4       4     1
    ## 489    NA    NA     2    -3     1       1       1       1       3       4     1
    ## 490    NA    NA     2    -3     1       1       1       3       3       4     1
    ## 491    NA    NA     1     1     1       1       2       4       4       4    -3
    ## 492    NA    NA     1     2     1       1       2       4       4       4    -3
    ##     pjob42 sex30    inc13 hhincnet inc52 sdp42 inc42i1 inc42i2 inc43i1 inc43i2
    ## 1       NA    NA  1700.00  1700.00     5    -3      NA      NA      NA      NA
    ## 2       NA    NA  1700.00  1700.00     5    -3      NA      NA      NA      NA
    ## 3       NA    NA  2200.00  2200.00     4    -3      NA      NA      NA      NA
    ## 4       NA     1   -10.00  3250.00     5    -4      -3      -3      -3      -3
    ## 5       NA     1  3700.00  3700.00     5     1      NA      NA      NA      NA
    ## 6       NA    NA  1200.00  1200.00     1    -3      NA      NA      NA      NA
    ## 7       NA    NA    -1.00    -7.00     5    -3      NA      NA      NA      NA
    ## 8       NA    NA  6000.00  6000.00     5    -3      NA      NA      NA      NA
    ## 9       NA    NA 10000.00 10000.00     5    -3      NA      NA      NA      NA
    ## 10      NA    NA  3200.00  3200.00     2    -3      NA      NA      NA      NA
    ## 11      NA    NA  3200.00  3200.00     2    -3      NA      NA      NA      NA
    ## 12      NA    NA  3500.00  3500.00     2    -3      NA      NA      NA      NA
    ## 13      NA    NA  6000.00  6000.00     5    -3      NA      NA      NA      NA
    ## 14      NA    NA  6000.00  6000.00     3    -3      NA      NA      NA      NA
    ## 15      NA    NA 12000.00 12000.00     6    -3      NA      NA      NA      NA
    ## 16      NA     1  2000.00  2000.00     1    -3      12      -2       0      -2
    ## 17      NA    NA  5000.00  5000.00     6    -3      NA      NA      NA      NA
    ## 18      NA     1  5000.00  5000.00     5    -3      -3      -3      -3      -3
    ## 19      NA    NA  5800.00  5800.00     6    -3      NA      NA      NA      NA
    ## 20      NA    NA  1600.00  1600.00     3    -3      NA      NA      NA      NA
    ## 21      NA    NA  1730.00  1730.00     4    -3      NA      NA      NA      NA
    ## 22      NA    NA  2000.00  2000.00     5    -3      NA      NA      NA      NA
    ## 23      NA    NA   400.00   400.00     5    -3      NA      NA      NA      NA
    ## 24      NA    NA  3500.00  3500.00     5    -3      NA      NA      NA      NA
    ## 25      NA    NA  3500.00  3500.00     6    -3      NA      NA      NA      NA
    ## 26      NA    NA  2200.00  2200.00     4    -3      NA      NA      NA      NA
    ## 27      NA    NA  2300.00  2300.00     4    -3      NA      NA      NA      NA
    ## 28      NA    NA  2500.00  2500.00     5    -3      NA      NA      NA      NA
    ## 29      NA    NA  5500.00  5500.00     5    -3      NA      NA      NA      NA
    ## 30      NA    NA  6000.00  6000.00     6    -3      NA      NA      NA      NA
    ## 31      NA    NA  5000.00  5000.00     5    -3      NA      NA      NA      NA
    ## 32      NA     1   -10.00  4250.00     5    -3      -3      -3      -3      -3
    ## 33      NA    NA  4000.00  4000.00     4    -3      NA      NA      NA      NA
    ## 34      NA    NA  4000.00  4000.00     5    -3      NA      NA      NA      NA
    ## 35      NA    NA    -1.00  3750.00     5    -3      NA      NA      NA      NA
    ## 36      NA    NA  1590.00  1590.00     5    -3      NA      NA      NA      NA
    ## 37      NA    NA  2550.00  2550.00     6    -3      NA      NA      NA      NA
    ## 38      NA    NA  2400.00  2400.00     5     1      NA      NA      NA      NA
    ## 39      NA    NA  7500.00  7500.00     6    -3      NA      NA      NA      NA
    ## 40      NA    NA  9350.00  9350.00     6    -3      NA      NA      NA      NA
    ## 41      NA    NA  8500.00  8500.00     6    -3      NA      NA      NA      NA
    ## 42      NA    NA  2500.00  2500.00     3    -3      NA      NA      NA      NA
    ## 43      NA    NA  1000.00  1000.00     2    -3      NA      NA      NA      NA
    ## 44      NA     2  1200.00  1200.00     3     1      NA      NA      NA      NA
    ## 45      NA    NA  4000.00  4000.00     4    -3      NA      NA      NA      NA
    ## 46      NA    NA  3500.00  3500.00     3    -3      NA      NA      NA      NA
    ## 47      NA    NA  4600.00  4600.00     3    -3      NA      NA      NA      NA
    ## 48      NA     1   -10.00    -7.00     2    -3      -3      -3      -3      -3
    ## 49      NA    NA    -1.00    -7.00     4    -3      NA      NA      NA      NA
    ## 50      NA    NA  4440.00  4440.00     4    -3      NA      NA      NA      NA
    ## 51      NA    NA  4300.00  4300.00     4    -3      NA      NA      NA      NA
    ## 52      NA    NA 17000.00 17000.00     6    -3      NA      NA      NA      NA
    ## 53      NA    NA 17000.00 17000.00     6    -3      NA      NA      NA      NA
    ## 54      NA    NA 16000.00 16000.00     6    -3      NA      NA      NA      NA
    ## 55      NA    NA    -1.00  1125.00     4    -3      NA      NA      NA      NA
    ## 56      NA    NA  1800.00  1800.00     4    -3      NA      NA      NA      NA
    ## 57      NA    NA    -1.00  1875.00     5    -3      NA      NA      NA      NA
    ## 58      NA    NA  5800.00  5800.00     5     1      NA      NA      NA      NA
    ## 59      NA    NA  6000.00  6000.00     6    -3      NA      NA      NA      NA
    ## 60      NA    NA  6500.00  6500.00     5    -3      NA      NA      NA      NA
    ## 61      NA    NA 15000.00 15000.00     6    -3      NA      NA      NA      NA
    ## 62      NA    NA 13500.00 13500.00     6    -3      NA      NA      NA      NA
    ## 63      NA    NA 14000.00 14000.00     6    -3      NA      NA      NA      NA
    ## 64      NA    NA  6000.00  6000.00     6    -3      NA      NA      NA      NA
    ## 65      NA    NA  6000.00  6000.00     6    -3      NA      NA      NA      NA
    ## 66      NA    NA  7500.00  7500.00     6    -3      NA      NA      NA      NA
    ## 67      NA    NA  3800.00  3800.00     5    -3      NA      NA      NA      NA
    ## 68      NA    NA  4900.00  4900.00     5    -3      NA      NA      NA      NA
    ## 69      NA     1  4500.00  4500.00     5    -3      NA      NA      NA      NA
    ## 70      NA    NA    -1.00  5750.00     6    -3      NA      NA      NA      NA
    ## 71      NA    NA    -1.00  6500.00     6    -3      NA      NA      NA      NA
    ## 72      NA    NA    -1.00    -7.00     6    -3      NA      NA      NA      NA
    ## 73      NA    NA  4500.00  4500.00     5    -3      NA      NA      NA      NA
    ## 74      NA    NA  4500.00  4500.00     5    -3      NA      NA      NA      NA
    ## 75      NA    NA  5000.00  5000.00     5    -3      NA      NA      NA      NA
    ## 76      NA     1  4500.00  4500.00     5    -3      -3      -3      -3      -3
    ## 77      NA    NA  8000.00  8000.00     6    -3      NA      NA      NA      NA
    ## 78      NA    NA 10000.00 10000.00     6    -3      NA      NA      NA      NA
    ## 79      NA    NA  9000.00  9000.00     6    -3      NA      NA      NA      NA
    ## 80      NA    NA  9000.00  9000.00     6    -3      NA      NA      NA      NA
    ## 81      NA    NA  8000.00  8000.00     6    -3      NA      NA      NA      NA
    ## 82      NA    NA  8000.00  8000.00     6    -3      NA      NA      NA      NA
    ## 83      NA    NA  1950.00  1950.00     2    -3      NA      NA      NA      NA
    ## 84      NA    NA  2500.00  2500.00     3     1      NA      NA      NA      NA
    ## 85      NA    NA  2600.00  2600.00     2    -3      NA      NA      NA      NA
    ## 86      NA    NA   -10.00  5750.00     5    -3      NA      NA      NA      NA
    ## 87      NA    NA  3800.00  3800.00     5    -3      NA      NA      NA      NA
    ## 88      NA    NA  3500.00  3500.00     5    -3      NA      NA      NA      NA
    ## 89      NA    NA  3400.00  3400.00     6    -3      NA      NA      NA      NA
    ## 90      NA    NA  4500.00  4500.00     6    -3      NA      NA      NA      NA
    ## 91      NA    NA     0.00     0.00     4    -3      NA      NA      NA      NA
    ## 92      NA     2    -1.00  4250.00     2    -3      -3      -3      -3      -3
    ## 93      NA    NA    -2.00  4750.00     3    -3      NA      NA      NA      NA
    ## 94      NA     2    -2.00  5250.00     3    -3      NA      NA      NA      NA
    ## 95      NA    NA  5000.00  5000.00     5    -3      NA      NA      NA      NA
    ## 96      NA    NA  6300.00  6300.00     5    -3      NA      NA      NA      NA
    ## 97      NA    NA 10000.00 10000.00     6    -3      NA      NA      NA      NA
    ## 98      NA    NA 14000.00 14000.00     6    -3      NA      NA      NA      NA
    ## 99      NA     2 12000.00 12000.00     6    -3      NA      NA      NA      NA
    ## 100     NA    NA  5000.00  5000.00     6    -3      NA      NA      NA      NA
    ## 101     NA    NA  5000.00  5000.00     5    -3      NA      NA      NA      NA
    ## 102     NA    NA    -1.00  5750.00     6    -3      NA      NA      NA      NA
    ## 103     NA    NA 13500.00 13500.00     6    -3      NA      NA      NA      NA
    ## 104     NA    NA 13000.00 13000.00     6    -3      NA      NA      NA      NA
    ## 105     NA    NA 13000.00 13000.00     6    -3      NA      NA      NA      NA
    ## 106     NA    NA  2330.00  2330.00     5    -3      NA      NA      NA      NA
    ## 107     NA    NA  2425.75  2425.75     5    -3      NA      NA      NA      NA
    ## 108     NA    NA  2500.00  2500.00     5    -3      NA      NA      NA      NA
    ## 109     NA     1  3500.00  3500.00     4    -3      -3      -3      -3      -3
    ## 110     NA    NA  4700.00  4700.00     5    -3      NA      NA      NA      NA
    ## 111     NA    NA  6000.00  6000.00     6    -3      NA      NA      NA      NA
    ## 112     NA    NA  4000.00  4000.00     4    -3      NA      NA      NA      NA
    ## 113     NA    NA  5000.00  5000.00     2    -3      NA      NA      NA      NA
    ## 114     NA    NA  6800.00  6800.00     4    -3      NA      NA      NA      NA
    ## 115     NA    NA  7000.00  7000.00     4    -3      NA      NA      NA      NA
    ## 116     NA    NA  3600.00  3600.00     2    -3      NA      NA      NA      NA
    ## 117     NA    NA  4400.00  4400.00     2    -3      NA      NA      NA      NA
    ## 118     NA    NA    -1.00  3750.00     4    -3      NA      NA      NA      NA
    ## 119     NA    NA    -2.00    -7.00     6    -3      NA      NA      NA      NA
    ## 120     NA    NA    -2.00    -7.00     6    -3      NA      NA      NA      NA
    ## 121     NA    NA    -2.00    -7.00     5    -3      NA      NA      NA      NA
    ## 122     NA    NA   -10.00  2750.00     6    -3      NA      NA      NA      NA
    ## 123     NA    NA   -10.00  4750.00     4    -3      NA      NA      NA      NA
    ## 124     NA    NA    -1.00    -7.00     4    -3      NA      NA      NA      NA
    ## 125     NA    NA    -1.00    -7.00     1    -3      NA      NA      NA      NA
    ## 126     NA    NA    -1.00    -7.00     3    -3      NA      NA      NA      NA
    ## 127     NA    NA  3500.00  3500.00     4    -3      NA      NA      NA      NA
    ## 128     NA     2  2100.00  2100.00     4    -3      -3      -3      -3      -3
    ## 129     NA    NA  2800.00  2800.00     4    -3      NA      NA      NA      NA
    ## 130     NA    NA  2600.00  2600.00     5    -3      NA      NA      NA      NA
    ## 131     NA    NA  2900.00  2900.00     5    -3      NA      NA      NA      NA
    ## 132     NA    NA  2600.00  2600.00     5    -3      NA      NA      NA      NA
    ## 133     NA    NA  4000.00  4000.00     6    -3      NA      NA      NA      NA
    ## 134     NA    NA  5000.00  5000.00     6    -3      NA      NA      NA      NA
    ## 135     NA    NA  5800.00  5800.00     6    -3      NA      NA      NA      NA
    ## 136     NA    NA 10000.00 10000.00     6    -3      NA      NA      NA      NA
    ## 137     NA    NA 12000.00 12000.00     6    -3      NA      NA      NA      NA
    ## 138     NA    NA  9000.00  9000.00     6    -3      NA      NA      NA      NA
    ## 139     NA     1  7000.00  7000.00     3    -3      -3      -3      -3      -3
    ## 140     NA     1  5000.00  5000.00     2    -3      -3      -3      -3      -3
    ## 141     NA     2  6000.00  6000.00     3    -3      NA      NA      NA      NA
    ## 142     NA     1  6000.00  6000.00     5    -3      -3      -3      -3      -3
    ## 143     NA    NA  4500.00  4500.00     4    -3      NA      NA      NA      NA
    ## 144     NA    NA  4500.00  4500.00     4    -3      NA      NA      NA      NA
    ## 145     NA    NA  5000.00  5000.00     4    -3      NA      NA      NA      NA
    ## 146     NA    NA  3000.00  3000.00     3    -3      NA      NA      NA      NA
    ## 147     NA    NA  3400.00  3400.00     3    -3      NA      NA      NA      NA
    ## 148     NA    NA  4800.00  4800.00     3    -3      NA      NA      NA      NA
    ## 149     NA    NA  3000.00  3000.00     3    -3      NA      NA      NA      NA
    ## 150     NA    NA  3000.00  3000.00    -2    -3      NA      NA      NA      NA
    ## 151     NA    NA  3100.00  3100.00     4    -3      NA      NA      NA      NA
    ## 152     NA    NA  5000.00  5000.00     5    -3      NA      NA      NA      NA
    ## 153     NA    NA  5500.00  5500.00     5    -3      NA      NA      NA      NA
    ## 154     NA    NA    -1.00    -7.00     5    -3      NA      NA      NA      NA
    ## 155     NA    NA  3300.00  3300.00     4    -3      NA      NA      NA      NA
    ## 156     NA    NA  4000.00  4000.00     4    -3      NA      NA      NA      NA
    ## 157     NA    NA  4000.00  4000.00     5    -3      NA      NA      NA      NA
    ## 158     NA     1  5500.00  5500.00     4    -3      -3      -3      -3      -3
    ## 159     NA     1    -2.00    -7.00     4    -3      -3      -3      -3      -3
    ## 160     NA    NA  4400.00  4400.00     4    -3      NA      NA      NA      NA
    ## 161     NA    NA  4600.00  4600.00     4    -3      NA      NA      NA      NA
    ## 162     NA    NA  4800.00  4800.00     5    -3      NA      NA      NA      NA
    ## 163     NA    NA  4650.00  4650.00     5    -3      NA      NA      NA      NA
    ## 164     NA    NA  5800.00  5800.00     5    -3      NA      NA      NA      NA
    ## 165     NA     2  4500.00  4500.00     5    -3      -3      -3      -3      -3
    ## 166     NA     2  4900.00  4900.00     5    -3      -3      -3      -3      -3
    ## 167     NA    NA  6800.00  6800.00     5    -3      NA      NA      NA      NA
    ## 168     NA    NA  4600.00  4600.00     4    -3      NA      NA      NA      NA
    ## 169     NA    NA  6000.00  6000.00     4    -3      NA      NA      NA      NA
    ## 170     NA    NA 13000.00 13000.00     4    -3      NA      NA      NA      NA
    ## 171     NA    NA    -1.00    -7.00     3    -3      NA      NA      NA      NA
    ## 172     NA    NA    -1.00  2750.00     3    -3      NA      NA      NA      NA
    ## 173     NA    NA    -1.00  2250.00     3    -3      NA      NA      NA      NA
    ## 174     NA    NA    -1.00  7500.00     6    -3      NA      NA      NA      NA
    ## 175     NA    NA    -1.00 11000.00     5    -3      NA      NA      NA      NA
    ## 176     NA    NA    -1.00 11000.00     5    -3      NA      NA      NA      NA
    ## 177     NA    NA  1803.00  1803.00     2    -3      NA      NA      NA      NA
    ## 178     NA    NA  1870.00  1870.00     3    -3      NA      NA      NA      NA
    ## 179     NA    NA  1870.50  1870.50     4    -3      NA      NA      NA      NA
    ## 180     NA    NA  5000.00  5000.00     4    -3      NA      NA      NA      NA
    ## 181     NA    NA  3000.00  3000.00     6    -3      NA      NA      NA      NA
    ## 182     NA    NA  8000.00  8000.00     6     1      NA      NA      NA      NA
    ## 183     NA    NA  1500.00  1500.00     4    -3      NA      NA      NA      NA
    ## 184     NA    NA  3000.00  3000.00     5    -3      NA      NA      NA      NA
    ## 185     NA    NA  3500.00  3500.00     5    -3      NA      NA      NA      NA
    ## 186     NA    NA  4100.00  4100.00     4    -3      NA      NA      NA      NA
    ## 187     NA    NA  5000.00  5000.00     4    -3      NA      NA      NA      NA
    ## 188     NA    NA  5500.00  5500.00     3    -3      NA      NA      NA      NA
    ## 189     NA    NA  6300.00  6300.00     5    -3      NA      NA      NA      NA
    ## 190     NA    NA  6700.00  6700.00     5    -3      NA      NA      NA      NA
    ## 191     NA    NA  7100.00  7100.00     5    -3      NA      NA      NA      NA
    ## 192     NA    NA  1763.00  1763.00     4    -3      NA      NA      NA      NA
    ## 193     NA    NA  2155.00  2155.00     5    -3      NA      NA      NA      NA
    ## 194     NA    NA  2167.00  2167.00     6    -3      NA      NA      NA      NA
    ## 195     NA    NA  1800.00  1800.00     1    -3      NA      NA      NA      NA
    ## 196     NA    NA  2100.00  2100.00     4    -3      NA      NA      NA      NA
    ## 197     NA    NA  4000.00  4000.00     3    -3      NA      NA      NA      NA
    ## 198     NA    NA  4200.00  4200.00     5    -3      NA      NA      NA      NA
    ## 199     NA    NA  4200.00  4200.00     4    -3      NA      NA      NA      NA
    ## 200     NA    NA  5000.00  5000.00     4    -3      NA      NA      NA      NA
    ## 201     NA    NA   749.00   749.00     2    -3      NA      NA      NA      NA
    ## 202     NA    NA  1600.00  1600.00     3    -3      NA      NA      NA      NA
    ## 203     NA    NA  1650.00  1650.00     4    -3      NA      NA      NA      NA
    ## 204     NA    NA    -2.00    -7.00    -2    -3      NA      NA      NA      NA
    ## 205     NA    NA    -1.00    -7.00    -2    -3      NA      NA      NA      NA
    ## 206     NA    NA    -2.00    -7.00    -2    -3      NA      NA      NA      NA
    ## 207     NA    NA  5000.00  5000.00     5    -3      NA      NA      NA      NA
    ## 208     NA    NA  5700.00  5700.00     6    -3      NA      NA      NA      NA
    ## 209     NA    NA  3700.00  3700.00     5    -3      NA      NA      NA      NA
    ## 210     NA    NA  5500.00  5500.00     6    -3      NA      NA      NA      NA
    ## 211     NA    NA  5800.00  5800.00     6    -3      NA      NA      NA      NA
    ## 212     NA    NA  5700.00  5700.00     5    -3      NA      NA      NA      NA
    ## 213     NA    NA  3100.00  3100.00     2    -3      NA      NA      NA      NA
    ## 214     NA    NA  2800.00  2800.00     2    -3      NA      NA      NA      NA
    ## 215     NA    NA  2800.00  2800.00     2    -3      NA      NA      NA      NA
    ## 216     NA    NA  3500.00  3500.00     3    -3      NA      NA      NA      NA
    ## 217     NA     1  4800.00  4800.00     3    -3      -3      -3      -3      -3
    ## 218     NA    NA  4200.00  4200.00     4    -3      NA      NA      NA      NA
    ## 219     NA    NA  5100.00  5100.00     3    -3      NA      NA      NA      NA
    ## 220     NA    NA  4300.00  4300.00     4    -3      NA      NA      NA      NA
    ## 221     NA    NA  4160.00  4160.00     4    -3      NA      NA      NA      NA
    ## 222     NA    NA  5000.00  5000.00     5    -3      NA      NA      NA      NA
    ## 223     NA    NA  6000.00  6000.00     4    -3      NA      NA      NA      NA
    ## 224     NA    NA  6200.00  6200.00     4    -3      NA      NA      NA      NA
    ## 225     NA    NA  3400.00  3400.00     5     1      NA      NA      NA      NA
    ## 226     NA    NA  3400.00  3400.00     4    -3      NA      NA      NA      NA
    ## 227     NA    NA  7800.00  7800.00     5    -3      NA      NA      NA      NA
    ## 228     NA    NA   450.00   450.00     1    -3      NA      NA      NA      NA
    ## 229     NA    NA  1286.00  1286.00     2    -3      NA      NA      NA      NA
    ## 230     NA    NA  1344.83  1344.83     1    -3      NA      NA      NA      NA
    ## 231     NA    NA  4200.00  4200.00     5    -3      NA      NA      NA      NA
    ## 232     NA    NA  4700.00  4700.00     6    -3      NA      NA      NA      NA
    ## 233     NA    NA  4300.00  4300.00     6    -3      NA      NA      NA      NA
    ## 234     NA     1  6200.00  6200.00     6    -3      -3      -3      -3      -3
    ## 235     NA    NA   -10.00  7500.00     5    -4      NA      NA      NA      NA
    ## 236     NA    NA   -10.00  6500.00     6    -3      NA      NA      NA      NA
    ## 237     NA    NA    -1.00  3750.00     4    -3      NA      NA      NA      NA
    ## 238     NA    NA    -1.00  4250.00     4    -3      NA      NA      NA      NA
    ## 239     NA    NA    -1.00    -7.00     4    -3      NA      NA      NA      NA
    ## 240     NA    NA  4000.00  4000.00     4    -3      NA      NA      NA      NA
    ## 241     NA    NA  4000.00  4000.00     4    -3      NA      NA      NA      NA
    ## 242     NA     2  4300.00  4300.00     4    -3      NA      NA      NA      NA
    ## 243     NA    NA  2000.00  2000.00     4    -3      NA      NA      NA      NA
    ## 244     NA    NA  1500.00  1500.00     4    -3      NA      NA      NA      NA
    ## 245     NA    NA  3200.00  3200.00     4    -3      NA      NA      NA      NA
    ## 246     NA    NA  3800.00  3800.00     6    -3      NA      NA      NA      NA
    ## 247     NA    NA  3800.00  3800.00     5    -3      NA      NA      NA      NA
    ## 248     NA    NA  4200.00  4200.00     4    -3      NA      NA      NA      NA
    ## 249     NA    NA  5100.00  5100.00     6    -3      NA      NA      NA      NA
    ## 250     NA    NA  6000.00  6000.00     6    -3      NA      NA      NA      NA
    ## 251     NA    NA    -2.00  7500.00     6    -3      NA      NA      NA      NA
    ## 252     NA    NA  5100.00  5100.00     6    -3      NA      NA      NA      NA
    ## 253     NA    NA  4200.00  4200.00     5    -3      NA      NA      NA      NA
    ## 254     NA    NA  5000.00  5000.00     6    -3      NA      NA      NA      NA
    ## 255     NA    NA    -2.00  1875.00     6    -3      NA      NA      NA      NA
    ## 256     NA    NA    -1.00    -7.00     6    -3      NA      NA      NA      NA
    ## 257     NA    NA    -2.00  1375.00     5    -3      NA      NA      NA      NA
    ## 258     NA    NA    -1.00  2250.00     3    -3      NA      NA      NA      NA
    ## 259     NA    NA  2500.00  2500.00     3    -3      NA      NA      NA      NA
    ## 260     NA    NA  3500.00  3500.00     3    -3      NA      NA      NA      NA
    ## 261     NA    NA   -10.00  9000.00     5    -3      NA      NA      NA      NA
    ## 262     NA     1   -10.00 11500.00     6    -3      NA      NA      NA      NA
    ## 263     NA    NA  6000.00  6000.00     5    -3      NA      NA      NA      NA
    ## 264     NA    NA  4850.00  4850.00     5    -3      NA      NA      NA      NA
    ## 265     NA    NA  5200.00  5200.00     5    -3      NA      NA      NA      NA
    ## 266     NA    NA  2800.00  2800.00     4    -3      NA      NA      NA      NA
    ## 267     NA    NA  3500.00  3500.00     4    -3      NA      NA      NA      NA
    ## 268     NA    NA  4000.00  4000.00     4    -3      NA      NA      NA      NA
    ## 269     NA    NA    -1.00  2750.00     5    -3      NA      NA      NA      NA
    ## 270     NA    NA  3500.00  3500.00     4    -3      NA      NA      NA      NA
    ## 271     NA    NA  3000.00  3000.00     4    -3      NA      NA      NA      NA
    ## 272     NA    NA  6000.00  6000.00     5    -3      NA      NA      NA      NA
    ## 273     NA    NA  6000.00  6000.00     5    -3      NA      NA      NA      NA
    ## 274     NA     2  6500.00  6500.00     5    -3      NA      NA      NA      NA
    ## 275     NA     1  2600.00  2600.00     5    -3      -3      -3      -3      -3
    ## 276     NA    NA  3000.00  3000.00     5    -3      NA      NA      NA      NA
    ## 277     NA    NA  3850.00  3850.00     6    -3      NA      NA      NA      NA
    ## 278     NA    NA  4400.00  4400.00     6    -3      NA      NA      NA      NA
    ## 279     NA    NA  4200.00  4200.00     6    -3      NA      NA      NA      NA
    ## 280     NA    NA  9500.00  9500.00     6    -3      NA      NA      NA      NA
    ## 281     NA    NA 10500.00 10500.00     6    -3      NA      NA      NA      NA
    ## 282     NA     1    -2.00    -7.00    -2    -3      NA      NA      NA      NA
    ## 283     NA    NA  3000.00  3000.00     4    -3      NA      NA      NA      NA
    ## 284     NA     1  3500.00  3500.00     3    -3      -3      -3      -3      -3
    ## 285     NA    NA  3500.00  3500.00     4    -3      NA      NA      NA      NA
    ## 286     NA    NA  4000.00  4000.00     6    -3      NA      NA      NA      NA
    ## 287     NA    NA  5000.00  5000.00     5    -3      NA      NA      NA      NA
    ## 288     NA    NA  7000.00  7000.00     5    -3      NA      NA      NA      NA
    ## 289     NA    NA    -1.00    -7.00     4    -3      NA      NA      NA      NA
    ## 290     NA    NA    -1.00    -7.00     5    -3      NA      NA      NA      NA
    ## 291     NA    NA    -1.00    -7.00     5    -3      NA      NA      NA      NA
    ## 292     NA     1   -10.00  3750.00     4    -3      10       4       2      -2
    ## 293     NA    NA  3300.00  3300.00     5    -3      NA      NA      NA      NA
    ## 294     NA    NA  3500.00  3500.00     5    -3      NA      NA      NA      NA
    ## 295     NA    NA  3300.00  3300.00     6    -3      NA      NA      NA      NA
    ## 296     NA    NA  3500.00  3500.00     6    -3      NA      NA      NA      NA
    ## 297     NA    NA    -1.00  4250.00     6    -3      NA      NA      NA      NA
    ## 298     NA     1   -10.00  3750.00     5    -3      -3      -3      -3      -3
    ## 299     NA    NA  6500.00  6500.00     6    -3      NA      NA      NA      NA
    ## 300     NA    NA  6000.00  6000.00     6    -3      NA      NA      NA      NA
    ## 301     NA    NA  4600.00  4600.00     3    -3      NA      NA      NA      NA
    ## 302     NA    NA  5800.00  5800.00     3    -3      NA      NA      NA      NA
    ## 303     NA    NA  6400.00  6400.00     3    -3      NA      NA      NA      NA
    ## 304     NA     1  5109.00  5109.00     6    -3       7       4       7       4
    ## 305     NA    NA  1300.00  1300.00     3    -3      NA      NA      NA      NA
    ## 306     NA    NA  2200.00  2200.00     3    -3      NA      NA      NA      NA
    ## 307     NA    NA  2150.00  2150.00     4    -3      NA      NA      NA      NA
    ## 308     NA    NA    -1.00    -7.00     2    -3      NA      NA      NA      NA
    ## 309     NA    NA    -1.00    -7.00     3    -3      NA      NA      NA      NA
    ## 310     NA    NA    -2.00    -7.00     3    -3      NA      NA      NA      NA
    ## 311     NA    NA    -1.00  4750.00     5    -3      NA      NA      NA      NA
    ## 312     NA    NA  7000.00  7000.00     5    -3      NA      NA      NA      NA
    ## 313     NA    NA  7000.00  7000.00     4    -3      NA      NA      NA      NA
    ## 314     NA    NA    -1.00    -7.00     5    -3      NA      NA      NA      NA
    ## 315     NA    NA    -1.00    -7.00     5    -3      NA      NA      NA      NA
    ## 316     NA    NA    -2.00    -7.00     5    -3      NA      NA      NA      NA
    ## 317     NA    NA    -2.00  3250.00     4    -3      NA      NA      NA      NA
    ## 318     NA     1  3600.00  3600.00     4    -3      -3      -3      -3      -3
    ## 319     NA    NA  2200.00  2200.00     3     1      NA      NA      NA      NA
    ## 320     NA     1   800.00   800.00     4    -3      -3      -3      -3      -3
    ## 321     NA    NA  2800.00  2800.00     3    -3      NA      NA      NA      NA
    ## 322     NA    NA  1800.00  1800.00     4    -3      NA      NA      NA      NA
    ## 323     NA    NA  4500.00  4500.00     6    -3      NA      NA      NA      NA
    ## 324     NA    NA  4000.00  4000.00     6    -3      NA      NA      NA      NA
    ## 325     NA    NA    -2.00    -7.00    -2    -3      NA      NA      NA      NA
    ## 326     NA    NA  3100.00  3100.00     5    -3      NA      NA      NA      NA
    ## 327     NA    NA  3400.00  3400.00     6    -3      NA      NA      NA      NA
    ## 328     NA     2  3400.00  3400.00     5    -3      NA      NA      NA      NA
    ## 329     NA    NA  4500.00  4500.00     3    -3      NA      NA      NA      NA
    ## 330     NA    NA  4500.00  4500.00     4    -3      NA      NA      NA      NA
    ## 331     NA    NA  4600.00  4600.00     3    -3      NA      NA      NA      NA
    ## 332     NA    NA  8000.00  8000.00     4    -3      NA      NA      NA      NA
    ## 333     NA    NA  7500.00  7500.00     4    -3      NA      NA      NA      NA
    ## 334     NA     1  8000.00  8000.00     5    -3      NA      NA      NA      NA
    ## 335     NA    NA  4500.00  4500.00     5    -3      NA      NA      NA      NA
    ## 336     NA    NA  4000.00  4000.00     5    -3      NA      NA      NA      NA
    ## 337     NA    NA  4000.00  4000.00     5    -3      NA      NA      NA      NA
    ## 338     NA    NA  4000.00  4000.00     4    -3      NA      NA      NA      NA
    ## 339     NA    NA  3000.00  3000.00     4    -3      NA      NA      NA      NA
    ## 340     NA    NA  3800.00  3800.00     4    -3      NA      NA      NA      NA
    ## 341     NA     1  1400.00  1400.00     2    -3      -3      -3      -3      -3
    ## 342     NA    NA   827.76   827.76     1    -3      NA      NA      NA      NA
    ## 343     NA    NA  1065.00  1065.00     2    -3      NA      NA      NA      NA
    ## 344     NA    NA  1100.00  1100.00     2    -3      NA      NA      NA      NA
    ## 345     NA    NA    -1.00    -7.00     1    -3      NA      NA      NA      NA
    ## 346     NA    NA    -1.00   125.00     1    -3      NA      NA      NA      NA
    ## 347     NA    NA  1000.00  1000.00     2    -3      NA      NA      NA      NA
    ## 348     NA    NA  4000.00  4000.00     3    -3      NA      NA      NA      NA
    ## 349     NA    NA  4000.00  4000.00     3    -3      NA      NA      NA      NA
    ## 350     NA    NA  5200.00  5200.00     3    -3      NA      NA      NA      NA
    ## 351     NA    NA   -10.00  1875.00     5    -3      NA      NA      NA      NA
    ## 352     NA    NA   -10.00  1875.00     5    -3      NA      NA      NA      NA
    ## 353     NA    NA   -10.00  1125.00     2    -3      NA      NA      NA      NA
    ## 354     NA    NA  6000.00  6000.00     6    -3      NA      NA      NA      NA
    ## 355     NA    NA  7000.00  7000.00     5    -3      NA      NA      NA      NA
    ## 356     NA    NA  6000.00  6000.00     5    -3      NA      NA      NA      NA
    ## 357     NA    NA  5500.00  5500.00     5    -3      NA      NA      NA      NA
    ## 358     NA    NA  5000.00  5000.00     5    -3      NA      NA      NA      NA
    ## 359     NA    NA    -1.00  5750.00     6    -3      NA      NA      NA      NA
    ## 360     NA    NA  7000.00  7000.00     6    -3      NA      NA      NA      NA
    ## 361     NA    NA  6100.00  6100.00     6    -3      NA      NA      NA      NA
    ## 362     NA    NA  6000.00  6000.00     6    -3      NA      NA      NA      NA
    ## 363     NA    NA  3000.00  3000.00     5    -3      NA      NA      NA      NA
    ## 364     NA    NA  2400.00  2400.00     4     1      NA      NA      NA      NA
    ## 365     NA    NA    -1.00  1125.00     3    -3      NA      NA      NA      NA
    ## 366     NA    NA  5000.00  5000.00     6    -3      NA      NA      NA      NA
    ## 367     NA    NA  5500.00  5500.00     5    -3      NA      NA      NA      NA
    ## 368     NA    NA  5500.00  5500.00     5    -3      NA      NA      NA      NA
    ## 369     NA    NA  6500.00  6500.00     5    -3      NA      NA      NA      NA
    ## 370     NA    NA  6000.00  6000.00     5    -3      NA      NA      NA      NA
    ## 371     NA    NA  4000.00  4000.00     5    -3      NA      NA      NA      NA
    ## 372     NA    NA  2000.00  2000.00     3    -3      NA      NA      NA      NA
    ## 373     NA    NA  3000.00  3000.00     3    -3      NA      NA      NA      NA
    ## 374     NA    NA  3500.00  3500.00     3    -3      NA      NA      NA      NA
    ## 375     NA    NA  4400.00  4400.00     6    -3      NA      NA      NA      NA
    ## 376     NA    NA  5000.00  5000.00     6    -3      NA      NA      NA      NA
    ## 377     NA    NA    -1.00  2750.00     6    -3      NA      NA      NA      NA
    ## 378     NA    NA   -10.00  3750.00     3    -3      NA      NA      NA      NA
    ## 379     NA    NA   -10.00  5750.00     3    -3      NA      NA      NA      NA
    ## 380     NA    NA   -10.00  3750.00     5    -3      NA      NA      NA      NA
    ## 381     NA     1    -1.00    -7.00     4    -3      -3      -3      -3      -3
    ## 382     NA    NA    -1.00  1875.00     2    -3      NA      NA      NA      NA
    ## 383     NA    NA    -1.00    -7.00     3    -3      NA      NA      NA      NA
    ## 384     NA    NA  3200.00  3200.00     5    -3      NA      NA      NA      NA
    ## 385     NA    NA  3500.00  3500.00     5    -3      NA      NA      NA      NA
    ## 386     NA    NA  4200.00  4200.00     5    -3      NA      NA      NA      NA
    ## 387     NA    NA  4000.00  4000.00     3    -3      NA      NA      NA      NA
    ## 388     NA    NA    -1.00    -7.00     2    -3      NA      NA      NA      NA
    ## 389     NA    NA  4000.00  4000.00     3    -3      NA      NA      NA      NA
    ## 390     NA    NA  3000.00  3000.00     5    -3      NA      NA      NA      NA
    ## 391     NA    NA  3000.00  3000.00     5    -3      NA      NA      NA      NA
    ## 392     NA    NA  2500.00  2500.00     6    -3      NA      NA      NA      NA
    ## 393     NA    NA  1500.00  1500.00     4    -3      NA      NA      NA      NA
    ## 394     NA    NA  1700.00  1700.00     5    -3      NA      NA      NA      NA
    ## 395     NA    NA  1800.00  1800.00     5    -3      NA      NA      NA      NA
    ## 396     NA    NA  3900.00  3900.00     5    -3      NA      NA      NA      NA
    ## 397     NA    NA  5000.00  5000.00     5    -3      NA      NA      NA      NA
    ## 398     NA    NA    -1.00  5250.00     5    -3      NA      NA      NA      NA
    ## 399     NA    NA  3800.00  3800.00     5    -3      NA      NA      NA      NA
    ## 400     NA    NA  3700.00  3700.00     5    -3      NA      NA      NA      NA
    ## 401     NA    NA  3900.00  3900.00     5    -3      NA      NA      NA      NA
    ## 402     NA    NA  4075.00  4075.00     3    -3      NA      NA      NA      NA
    ## 403     NA     1  4300.00  4300.00     3    -3      -3      -3      -3      -3
    ## 404     NA     2  5000.00  5000.00     4    -3      NA      NA      NA      NA
    ## 405     NA    NA  6000.00  6000.00     5    -3      NA      NA      NA      NA
    ## 406     NA    NA  6000.00  6000.00     5    -3      NA      NA      NA      NA
    ## 407     NA    NA  5500.00  5500.00     6    -3      NA      NA      NA      NA
    ## 408     NA    NA  5800.00  5800.00     5    -3      NA      NA      NA      NA
    ## 409     NA    NA  1000.00  1000.00     4     1      NA      NA      NA      NA
    ## 410     NA     2  4100.00  4100.00     5    -3      -3      -3      -3      -3
    ## 411     NA     2  4500.00  4500.00     3    -3      NA      NA      NA      NA
    ## 412     NA    NA  5000.00  5000.00     6    -3      NA      NA      NA      NA
    ## 413     NA    NA  5000.00  5000.00     6    -3      NA      NA      NA      NA
    ## 414     NA    NA  6000.00  6000.00     6    -3      NA      NA      NA      NA
    ## 415     NA    NA  3400.00  3400.00     5    -3      NA      NA      NA      NA
    ## 416     NA    NA  4500.00  4500.00     5    -3      NA      NA      NA      NA
    ## 417     NA    NA  8000.00  8000.00     6    -3      NA      NA      NA      NA
    ## 418     NA    NA  6000.00  6000.00     5    -3      NA      NA      NA      NA
    ## 419     NA    NA  7000.00  7000.00     5    -3      NA      NA      NA      NA
    ## 420     NA    NA  7000.00  7000.00     5    -3      NA      NA      NA      NA
    ## 421     NA     2  2400.00  2400.00     5    -3      -3      -3      -3      -3
    ## 422     NA     1  5800.00  5800.00     5    -3      -3      -3      -3      -3
    ## 423     NA    NA  5500.00  5500.00     5    -3      NA      NA      NA      NA
    ## 424     NA    NA  3400.00  3400.00     3    -3      NA      NA      NA      NA
    ## 425     NA    NA  2200.00  2200.00     4    -3      NA      NA      NA      NA
    ## 426     NA    NA  2300.00  2300.00     4    -3      NA      NA      NA      NA
    ## 427     NA    NA  2400.00  2400.00     4    -3      NA      NA      NA      NA
    ## 428     NA    NA  2663.00  2663.00     5    -3      NA      NA      NA      NA
    ## 429     NA    NA  3000.00  3000.00     5     2      NA      NA      NA      NA
    ## 430     NA    NA   -10.00  3750.00     2    -3      NA      NA      NA      NA
    ## 431     NA    NA   -10.00  3750.00     3    -3      NA      NA      NA      NA
    ## 432     NA    NA   -10.00  5250.00     1    -3      NA      NA      NA      NA
    ## 433     NA    NA    -1.00    -7.00     5    -3      NA      NA      NA      NA
    ## 434     NA    NA    -1.00    -7.00     4    -3      NA      NA      NA      NA
    ## 435     NA    NA    -1.00    -7.00     4    -3      NA      NA      NA      NA
    ## 436     NA     1  4700.00  4700.00     5    -3      -3      -3      -3      -3
    ## 437     NA    NA   -10.00  2750.00     2    -3      NA      NA      NA      NA
    ## 438     NA    NA  5100.00  5100.00     3    -3      NA      NA      NA      NA
    ## 439     NA    NA  5500.00  5500.00     4    -3      NA      NA      NA      NA
    ## 440     NA    NA  6000.00  6000.00     4    -3      NA      NA      NA      NA
    ## 441     NA     1  2600.00  2600.00     4    -3       2      -2      12      -2
    ## 442     NA    NA    -1.00   625.00     3    -3      NA      NA      NA      NA
    ## 443     NA     2   -10.00  1625.00     2    -3      -3      -3      -3      -3
    ## 444     NA    NA  1712.00  1712.00     1    -3      NA      NA      NA      NA
    ## 445     NA    NA  2210.00  2210.00     2    -3      NA      NA      NA      NA
    ## 446     NA    NA  2600.00  2600.00     2    -3      NA      NA      NA      NA
    ## 447     NA     1  3200.00  3200.00     2    -3      -3      -3      -3      -3
    ## 448     NA    NA  2400.00  2400.00     2    -3      NA      NA      NA      NA
    ## 449     NA    NA  4500.00  4500.00     6    -3      NA      NA      NA      NA
    ## 450     NA    NA  4300.00  4300.00     6    -3      NA      NA      NA      NA
    ## 451     NA    NA  4500.00  4500.00     6    -3      NA      NA      NA      NA
    ## 452     NA    NA    -1.00    -7.00     4    -3      NA      NA      NA      NA
    ## 453     NA    NA    -1.00    -7.00     4    -3      NA      NA      NA      NA
    ## 454     NA    NA    -1.00    -7.00     5    -3      NA      NA      NA      NA
    ## 455     NA    NA  3200.00  3200.00     4    -3      NA      NA      NA      NA
    ## 456     NA    NA  4000.00  4000.00     4    -3      NA      NA      NA      NA
    ## 457     NA    NA  3300.00  3300.00     5    -3      NA      NA      NA      NA
    ## 458     NA    NA  7000.00  7000.00     6    -3      NA      NA      NA      NA
    ## 459     NA    NA  8000.00  8000.00     6    -3      NA      NA      NA      NA
    ## 460     NA    NA  7000.00  7000.00     5    -3      NA      NA      NA      NA
    ## 461     NA    NA  3200.00  3200.00     3    -3      NA      NA      NA      NA
    ## 462     NA    NA  4400.00  4400.00     2    -3      NA      NA      NA      NA
    ## 463     NA    NA    -1.00    -7.00     3    -3      NA      NA      NA      NA
    ## 464     NA    NA  5200.00  5200.00     6    -3      NA      NA      NA      NA
    ## 465     NA    NA  5200.00  5200.00     5    -3      NA      NA      NA      NA
    ## 466     NA    NA  5000.00  5000.00     6    -3      NA      NA      NA      NA
    ## 467     NA    NA  2400.00  2400.00     4     1      NA      NA      NA      NA
    ## 468     NA     1  2500.00  2500.00     4    -3      -3      -3      -3      -3
    ## 469     NA     1    -1.00    -7.00     4    -3      -3      -3      -3      -3
    ## 470     NA    NA  3300.00  3300.00     3    -3      NA      NA      NA      NA
    ## 471     NA    NA  4000.00  4000.00     2    -3      NA      NA      NA      NA
    ## 472     NA    NA  5500.00  5500.00     3    -3      NA      NA      NA      NA
    ## 473     NA    NA   -10.00  4250.00     3    -3      NA      NA      NA      NA
    ## 474     NA    NA   -10.00  4250.00     3    -3      NA      NA      NA      NA
    ## 475     NA     2  4500.00  4500.00     4    -3      NA      NA      NA      NA
    ## 476     NA    NA  3750.00  3750.00     4    -3      NA      NA      NA      NA
    ## 477     NA    NA    -1.00  4250.00     4    -3      NA      NA      NA      NA
    ## 478     NA    NA  2000.00  2000.00     4    -3      NA      NA      NA      NA
    ## 479     NA    NA   -10.00  2750.00     4    -3      NA      NA      NA      NA
    ## 480     NA    NA  3100.00  3100.00     5    -3      NA      NA      NA      NA
    ## 481     NA    NA  3200.00  3200.00     5    -3      NA      NA      NA      NA
    ## 482     NA    NA  5000.00  5000.00     4    -3      NA      NA      NA      NA
    ## 483     NA    NA  5000.00  5000.00     3    -3      NA      NA      NA      NA
    ## 484     NA    NA  6000.00  6000.00     3    -3      NA      NA      NA      NA
    ## 485     NA    NA  4500.00  4500.00     4    -3      NA      NA      NA      NA
    ## 486     NA    NA  6000.00  6000.00     4    -3      NA      NA      NA      NA
    ## 487     NA    NA  5500.00  5500.00     4    -3      NA      NA      NA      NA
    ## 488     NA    NA  4500.00  4500.00     4    -3      NA      NA      NA      NA
    ## 489     NA    NA  6000.00  6000.00     4    -3      NA      NA      NA      NA
    ## 490     NA    NA  5000.00  5000.00     3    -3      NA      NA      NA      NA
    ## 491     NA    NA  2450.00  2450.00     5    -3      NA      NA      NA      NA
    ## 492     NA    NA  2500.00  2500.00     6    -3      NA      NA      NA      NA
    ##     hc13 bhc1 bhc10 crn119 crn123 crn134 crn136m crn125w crn124i1 crn124i2
    ## 1     NA    2     1     NA     NA     NA      NA      NA       NA       NA
    ## 2     NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 3     NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 4     NA    2     1     -3     -3     -3      -3      NA       -3       -3
    ## 5     NA    2     1     -3     -3     NA      -3      NA       -3       -3
    ## 6     NA    2     1     NA     NA     NA      NA      NA       NA       NA
    ## 7     NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 8     NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 9     NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 10    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 11    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 12    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 13    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 14    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 15    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 16    NA    1    -3      1      2     -3      -3      NA       -3       -3
    ## 17    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 18    NA    1    -3     -3     -3     -3      -3      NA       -3       -3
    ## 19    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 20    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 21    NA    2     1     NA     NA     NA      NA      NA       NA       NA
    ## 22    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 23    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 24    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 25    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 26    NA    2     2     NA     NA     NA      NA      NA       NA       NA
    ## 27    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 28    NA    2     1     NA     NA     NA      NA      NA       NA       NA
    ## 29    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 30    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 31    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 32    NA    1    -3      1      1    400      20      NA        0        1
    ## 33    NA    2     2     NA     NA     NA      NA      NA       NA       NA
    ## 34    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 35    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 36    NA    2     1     NA     NA     NA      NA      NA       NA       NA
    ## 37    NA    2     2     NA     NA     NA      NA      NA       NA       NA
    ## 38    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 39    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 40    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 41    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 42    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 43    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 44    NA    1    -3      2      2     NA      -3      NA       -3       -3
    ## 45    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 46    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 47    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 48    NA    1    -3      2      2     -3      -3      NA       -3       -3
    ## 49    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 50    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 51    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 52    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 53    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 54    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 55    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 56    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 57    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 58    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 59    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 60    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 61    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 62    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 63    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 64    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 65    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 66    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 67    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 68    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 69    NA    1    -3     -3     -3     NA      -3      NA       -3       -3
    ## 70    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 71    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 72    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 73    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 74    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 75    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 76    NA    1    -3      2      1    150      20      NA        0        1
    ## 77    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 78    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 79    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 80    NA    2     2     NA     NA     NA      NA      NA       NA       NA
    ## 81    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 82    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 83    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 84    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 85    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 86    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 87    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 88    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 89    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 90    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 91    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 92    NA    1    -3     -3     -3     -3      -3      NA       -3       -3
    ## 93    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 94    NA    1    -3     -3     -3     NA      -3      NA       -3       -3
    ## 95    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 96    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 97    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 98    NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 99    NA    1    -3     -3     -3     NA      -3      NA       -3       -3
    ## 100   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 101   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 102   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 103   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 104   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 105   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 106   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 107   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 108   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 109   NA    1    -3     -3     -3     -3      -3      NA       -3       -3
    ## 110   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 111   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 112   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 113   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 114   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 115   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 116   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 117   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 118   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 119   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 120   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 121   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 122   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 123   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 124   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 125   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 126   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 127   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 128   NA    1    -3      2      1     55      20      NA        0        1
    ## 129   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 130   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 131   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 132   NA    2     2     NA     NA     NA      NA      NA       NA       NA
    ## 133   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 134   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 135   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 136   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 137   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 138   NA    2     1     NA     NA     NA      NA      NA       NA       NA
    ## 139   NA    1    -3      2      2     -3      -3      NA       -3       -3
    ## 140   NA    1    -3      2      2     -3      -3      NA       -3       -3
    ## 141   NA    1    -3      2      2     NA      -3      NA       -3       -3
    ## 142   NA    1    -3     -3     -3     -3      -3      NA       -3       -3
    ## 143   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 144   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 145   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 146   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 147   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 148   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 149   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 150   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 151   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 152   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 153   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 154   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 155   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 156   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 157   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 158   NA    1    -3      1      1     23       5      NA        1        0
    ## 159   NA    1    -3      2      1     35      10      NA        0        0
    ## 160   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 161   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 162   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 163   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 164   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 165   NA    1    -3     -3     -3     -3      -3      NA       -3       -3
    ## 166   NA    1    -3     -3     -3     -3      -3      NA       -3       -3
    ## 167   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 168   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 169   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 170   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 171   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 172   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 173   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 174   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 175   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 176   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 177   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 178   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 179   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 180   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 181   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 182   NA    2     2     NA     NA     NA      NA      NA       NA       NA
    ## 183   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 184   NA    2     1     NA     NA     NA      NA      NA       NA       NA
    ## 185   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 186   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 187   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 188   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 189   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 190   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 191   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 192   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 193   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 194   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 195   NA    2     2     NA     NA     NA      NA      NA       NA       NA
    ## 196   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 197   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 198   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 199   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 200   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 201   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 202   NA    2     2     NA     NA     NA      NA      NA       NA       NA
    ## 203   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 204   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 205   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 206   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 207   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 208   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 209   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 210   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 211   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 212   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 213   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 214   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 215   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 216   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 217   NA    1    -3      1      1    200      20      NA        0        0
    ## 218   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 219   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 220   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 221   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 222   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 223   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 224   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 225   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 226   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 227   NA    2     2     NA     NA     NA      NA      NA       NA       NA
    ## 228   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 229   NA    2     1     NA     NA     NA      NA      NA       NA       NA
    ## 230   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 231   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 232   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 233   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 234   NA    2     2      1      1    180      20      NA        1        0
    ## 235   NA    1    -4     NA     NA     NA      NA      NA       NA       NA
    ## 236   NA    1    -4     NA     NA     NA      NA      NA       NA       NA
    ## 237   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 238   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 239   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 240   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 241   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 242   NA    1    -3     -3     -3     NA      -3      NA       -3       -3
    ## 243   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 244   NA    2     1     NA     NA     NA      NA      NA       NA       NA
    ## 245   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 246   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 247   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 248   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 249   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 250   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 251   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 252   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 253   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 254   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 255   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 256   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 257   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 258   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 259   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 260   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 261   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 262   NA    1    -3     -3     -3     NA      -3      NA       -3       -3
    ## 263   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 264   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 265   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 266   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 267   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 268   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 269   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 270   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 271   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 272   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 273   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 274   NA    1    -3     -3     -3     NA      -3      NA       -3       -3
    ## 275   NA    1    -3     -3     -3     -3      -3      NA       -3       -3
    ## 276   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 277   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 278   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 279   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 280   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 281   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 282   NA   -2    -3     -3     -3     NA      -3      NA       -3       -3
    ## 283   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 284   NA    1    -3     -3     -3     -3      -3      NA       -3       -3
    ## 285   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 286   NA    2     2     NA     NA     NA      NA      NA       NA       NA
    ## 287   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 288   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 289   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 290   NA    2     1     NA     NA     NA      NA      NA       NA       NA
    ## 291   NA    2     1     NA     NA     NA      NA      NA       NA       NA
    ## 292   NA    1    -4      1      2     -3      -3      NA       -3       -3
    ## 293   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 294   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 295   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 296   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 297   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 298   NA    1    -4     -3     -3     -3      -3      NA       -3       -3
    ## 299   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 300   NA    2     1     NA     NA     NA      NA      NA       NA       NA
    ## 301   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 302   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 303   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 304   NA    1    -3      2      2     -3      -3      NA       -3       -3
    ## 305   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 306   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 307   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 308   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 309   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 310   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 311   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 312   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 313   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 314   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 315   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 316   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 317   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 318   NA    1    -3      2      1    125      21      NA        1        0
    ## 319   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 320   NA    1    -3     -3     -3     -3      -3      NA       -3       -3
    ## 321   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 322   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 323   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 324   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 325   NA    2     1     NA     NA     NA      NA      NA       NA       NA
    ## 326   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 327   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 328   NA    1    -3     -3     -3     NA      -3      NA       -3       -3
    ## 329   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 330   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 331   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 332   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 333   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 334   NA    1    -3     -3     -3     NA      -3      NA       -3       -3
    ## 335   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 336   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 337   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 338   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 339   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 340   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 341   NA    1    -3     -3     -3     -3      -3      NA       -3       -3
    ## 342   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 343   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 344   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 345   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 346   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 347   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 348   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 349   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 350   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 351   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 352   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 353   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 354   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 355   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 356   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 357   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 358   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 359   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 360   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 361   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 362   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 363   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 364   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 365   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 366   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 367   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 368   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 369   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 370   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 371   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 372   NA    2     1     NA     NA     NA      NA      NA       NA       NA
    ## 373   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 374   NA    2     1     NA     NA     NA      NA      NA       NA       NA
    ## 375   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 376   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 377   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 378   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 379   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 380   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 381   NA    1    -3      1      2     -3      -3      NA       -3       -3
    ## 382   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 383   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 384   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 385   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 386   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 387   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 388   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 389   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 390   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 391   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 392   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 393   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 394   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 395   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 396   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 397   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 398   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 399   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 400   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 401   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 402   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 403   NA    1    -3     -3     -3     -3      -3      NA       -3       -3
    ## 404   NA    1    -3     -3     -3     NA      -3      NA       -3       -3
    ## 405   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 406   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 407   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 408   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 409   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 410   NA    1    -3     -3     -3     -3      -3      NA       -3       -3
    ## 411   NA    1    -3      1      1     NA      20      NA        0        0
    ## 412   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 413   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 414   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 415   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 416   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 417   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 418   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 419   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 420   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 421   NA    1    -3      2      2     -3      -3      NA       -3       -3
    ## 422   NA    1    -3      1      2     -3      -3      NA       -3       -3
    ## 423   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 424   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 425   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 426   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 427   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 428   NA   -2    -3     NA     NA     NA      NA      NA       NA       NA
    ## 429   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 430   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 431   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 432   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 433   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 434   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 435   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 436   NA    1    -3     -3     -3     -3      -3      NA       -3       -3
    ## 437   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 438   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 439   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 440   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 441   NA    2     1      2      1    180      20      NA        1        1
    ## 442   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 443   NA    2     2     -3     -3     -3      -3      NA       -3       -3
    ## 444   NA    2     2     NA     NA     NA      NA      NA       NA       NA
    ## 445   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 446   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 447   NA    1    -3      2      1    350      20      NA        0        1
    ## 448   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 449   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 450   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 451   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 452   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 453   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 454   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 455   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 456   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 457   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 458   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 459   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 460   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 461   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 462   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 463   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 464   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 465   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 466   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 467   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 468   NA    1    -3     -3     -3     -3      -3      NA       -3       -3
    ## 469   NA    1    -3     -3     -3     -3      -3      NA       -3       -3
    ## 470   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 471   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 472   NA    2     1     NA     NA     NA      NA      NA       NA       NA
    ## 473   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 474   NA    1    -4     NA     NA     NA      NA      NA       NA       NA
    ## 475   NA    1    -3     -3     -3     NA      -3      NA       -3       -3
    ## 476   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 477   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 478   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 479   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 480   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 481   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 482   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 483   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 484   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 485   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 486   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 487   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 488   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 489   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 490   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 491   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ## 492   NA    1    -3     NA     NA     NA      NA      NA       NA       NA
    ##     crn124i3 crn124i4 crn124i5 crn124i6 crn124i7 crn124i8 crn124i9 crn11i7
    ## 1         NA       NA       NA       NA       NA       NA       NA      NA
    ## 2         NA       NA       NA       NA       NA       NA       NA      NA
    ## 3         NA       NA       NA       NA       NA       NA       NA      NA
    ## 4         NA       -3       NA       -3       -3       NA       -3      NA
    ## 5         NA       -3       NA       -3       -3       NA       -3      NA
    ## 6         NA       NA       NA       NA       NA       NA       NA      NA
    ## 7         NA       NA       NA       NA       NA       NA       NA      NA
    ## 8         NA       NA       NA       NA       NA       NA       NA      NA
    ## 9         NA       NA       NA       NA       NA       NA       NA      NA
    ## 10        NA       NA       NA       NA       NA       NA       NA      NA
    ## 11        NA       NA       NA       NA       NA       NA       NA      NA
    ## 12        NA       NA       NA       NA       NA       NA       NA      NA
    ## 13        NA       NA       NA       NA       NA       NA       NA      NA
    ## 14        NA       NA       NA       NA       NA       NA       NA      NA
    ## 15        NA       NA       NA       NA       NA       NA       NA      NA
    ## 16        NA       -3       NA       -3       -3       NA       -3       4
    ## 17        NA       NA       NA       NA       NA       NA       NA      NA
    ## 18        NA       -3       NA       -3       -3       NA       -3      NA
    ## 19        NA       NA       NA       NA       NA       NA       NA      NA
    ## 20        NA       NA       NA       NA       NA       NA       NA      NA
    ## 21        NA       NA       NA       NA       NA       NA       NA      NA
    ## 22        NA       NA       NA       NA       NA       NA       NA      NA
    ## 23        NA       NA       NA       NA       NA       NA       NA      NA
    ## 24        NA       NA       NA       NA       NA       NA       NA      NA
    ## 25        NA       NA       NA       NA       NA       NA       NA      NA
    ## 26        NA       NA       NA       NA       NA       NA       NA      NA
    ## 27        NA       NA       NA       NA       NA       NA       NA      NA
    ## 28        NA       NA       NA       NA       NA       NA       NA      NA
    ## 29        NA       NA       NA       NA       NA       NA       NA      NA
    ## 30        NA       NA       NA       NA       NA       NA       NA      NA
    ## 31        NA       NA       NA       NA       NA       NA       NA      NA
    ## 32        NA        1       NA        0        0       NA        0       4
    ## 33        NA       NA       NA       NA       NA       NA       NA      NA
    ## 34        NA       NA       NA       NA       NA       NA       NA      NA
    ## 35        NA       NA       NA       NA       NA       NA       NA      NA
    ## 36        NA       NA       NA       NA       NA       NA       NA      NA
    ## 37        NA       NA       NA       NA       NA       NA       NA      NA
    ## 38        NA       NA       NA       NA       NA       NA       NA      NA
    ## 39        NA       NA       NA       NA       NA       NA       NA      NA
    ## 40        NA       NA       NA       NA       NA       NA       NA      NA
    ## 41        NA       NA       NA       NA       NA       NA       NA      NA
    ## 42        NA       NA       NA       NA       NA       NA       NA      NA
    ## 43        NA       NA       NA       NA       NA       NA       NA      NA
    ## 44        NA       -3       NA       -3       -3       NA       -3      NA
    ## 45        NA       NA       NA       NA       NA       NA       NA      NA
    ## 46        NA       NA       NA       NA       NA       NA       NA      NA
    ## 47        NA       NA       NA       NA       NA       NA       NA      NA
    ## 48        NA       -3       NA       -3       -3       NA       -3       1
    ## 49        NA       NA       NA       NA       NA       NA       NA      NA
    ## 50        NA       NA       NA       NA       NA       NA       NA      NA
    ## 51        NA       NA       NA       NA       NA       NA       NA      NA
    ## 52        NA       NA       NA       NA       NA       NA       NA      NA
    ## 53        NA       NA       NA       NA       NA       NA       NA      NA
    ## 54        NA       NA       NA       NA       NA       NA       NA      NA
    ## 55        NA       NA       NA       NA       NA       NA       NA      NA
    ## 56        NA       NA       NA       NA       NA       NA       NA      NA
    ## 57        NA       NA       NA       NA       NA       NA       NA      NA
    ## 58        NA       NA       NA       NA       NA       NA       NA      NA
    ## 59        NA       NA       NA       NA       NA       NA       NA      NA
    ## 60        NA       NA       NA       NA       NA       NA       NA      NA
    ## 61        NA       NA       NA       NA       NA       NA       NA      NA
    ## 62        NA       NA       NA       NA       NA       NA       NA      NA
    ## 63        NA       NA       NA       NA       NA       NA       NA      NA
    ## 64        NA       NA       NA       NA       NA       NA       NA      NA
    ## 65        NA       NA       NA       NA       NA       NA       NA      NA
    ## 66        NA       NA       NA       NA       NA       NA       NA      NA
    ## 67        NA       NA       NA       NA       NA       NA       NA      NA
    ## 68        NA       NA       NA       NA       NA       NA       NA      NA
    ## 69        NA       -3       NA       -3       -3       NA       -3      NA
    ## 70        NA       NA       NA       NA       NA       NA       NA      NA
    ## 71        NA       NA       NA       NA       NA       NA       NA      NA
    ## 72        NA       NA       NA       NA       NA       NA       NA      NA
    ## 73        NA       NA       NA       NA       NA       NA       NA      NA
    ## 74        NA       NA       NA       NA       NA       NA       NA      NA
    ## 75        NA       NA       NA       NA       NA       NA       NA      NA
    ## 76        NA        1       NA        0        0       NA        0       3
    ## 77        NA       NA       NA       NA       NA       NA       NA      NA
    ## 78        NA       NA       NA       NA       NA       NA       NA      NA
    ## 79        NA       NA       NA       NA       NA       NA       NA      NA
    ## 80        NA       NA       NA       NA       NA       NA       NA      NA
    ## 81        NA       NA       NA       NA       NA       NA       NA      NA
    ## 82        NA       NA       NA       NA       NA       NA       NA      NA
    ## 83        NA       NA       NA       NA       NA       NA       NA      NA
    ## 84        NA       NA       NA       NA       NA       NA       NA      NA
    ## 85        NA       NA       NA       NA       NA       NA       NA      NA
    ## 86        NA       NA       NA       NA       NA       NA       NA      NA
    ## 87        NA       NA       NA       NA       NA       NA       NA      NA
    ## 88        NA       NA       NA       NA       NA       NA       NA      NA
    ## 89        NA       NA       NA       NA       NA       NA       NA      NA
    ## 90        NA       NA       NA       NA       NA       NA       NA      NA
    ## 91        NA       NA       NA       NA       NA       NA       NA      NA
    ## 92        NA       -3       NA       -3       -3       NA       -3      -3
    ## 93        NA       NA       NA       NA       NA       NA       NA      NA
    ## 94        NA       -3       NA       -3       -3       NA       -3      NA
    ## 95        NA       NA       NA       NA       NA       NA       NA      NA
    ## 96        NA       NA       NA       NA       NA       NA       NA      NA
    ## 97        NA       NA       NA       NA       NA       NA       NA      NA
    ## 98        NA       NA       NA       NA       NA       NA       NA      NA
    ## 99        NA       -3       NA       -3       -3       NA       -3      NA
    ## 100       NA       NA       NA       NA       NA       NA       NA      NA
    ## 101       NA       NA       NA       NA       NA       NA       NA      NA
    ## 102       NA       NA       NA       NA       NA       NA       NA      NA
    ## 103       NA       NA       NA       NA       NA       NA       NA      NA
    ## 104       NA       NA       NA       NA       NA       NA       NA      NA
    ## 105       NA       NA       NA       NA       NA       NA       NA      NA
    ## 106       NA       NA       NA       NA       NA       NA       NA      NA
    ## 107       NA       NA       NA       NA       NA       NA       NA      NA
    ## 108       NA       NA       NA       NA       NA       NA       NA      NA
    ## 109       NA       -3       NA       -3       -3       NA       -3      -3
    ## 110       NA       NA       NA       NA       NA       NA       NA      NA
    ## 111       NA       NA       NA       NA       NA       NA       NA      NA
    ## 112       NA       NA       NA       NA       NA       NA       NA      NA
    ## 113       NA       NA       NA       NA       NA       NA       NA      NA
    ## 114       NA       NA       NA       NA       NA       NA       NA      NA
    ## 115       NA       NA       NA       NA       NA       NA       NA      NA
    ## 116       NA       NA       NA       NA       NA       NA       NA      NA
    ## 117       NA       NA       NA       NA       NA       NA       NA      NA
    ## 118       NA       NA       NA       NA       NA       NA       NA      NA
    ## 119       NA       NA       NA       NA       NA       NA       NA      NA
    ## 120       NA       NA       NA       NA       NA       NA       NA      NA
    ## 121       NA       NA       NA       NA       NA       NA       NA      NA
    ## 122       NA       NA       NA       NA       NA       NA       NA      NA
    ## 123       NA       NA       NA       NA       NA       NA       NA      NA
    ## 124       NA       NA       NA       NA       NA       NA       NA      NA
    ## 125       NA       NA       NA       NA       NA       NA       NA      NA
    ## 126       NA       NA       NA       NA       NA       NA       NA      NA
    ## 127       NA       NA       NA       NA       NA       NA       NA      NA
    ## 128       NA        0       NA        0        0       NA        0      NA
    ## 129       NA       NA       NA       NA       NA       NA       NA      NA
    ## 130       NA       NA       NA       NA       NA       NA       NA      NA
    ## 131       NA       NA       NA       NA       NA       NA       NA      NA
    ## 132       NA       NA       NA       NA       NA       NA       NA      NA
    ## 133       NA       NA       NA       NA       NA       NA       NA      NA
    ## 134       NA       NA       NA       NA       NA       NA       NA      NA
    ## 135       NA       NA       NA       NA       NA       NA       NA      NA
    ## 136       NA       NA       NA       NA       NA       NA       NA      NA
    ## 137       NA       NA       NA       NA       NA       NA       NA      NA
    ## 138       NA       NA       NA       NA       NA       NA       NA      NA
    ## 139       NA       -3       NA       -3       -3       NA       -3       2
    ## 140       NA       -3       NA       -3       -3       NA       -3      NA
    ## 141       NA       -3       NA       -3       -3       NA       -3      NA
    ## 142       NA       -3       NA       -3       -3       NA       -3      -3
    ## 143       NA       NA       NA       NA       NA       NA       NA      NA
    ## 144       NA       NA       NA       NA       NA       NA       NA      NA
    ## 145       NA       NA       NA       NA       NA       NA       NA      NA
    ## 146       NA       NA       NA       NA       NA       NA       NA      NA
    ## 147       NA       NA       NA       NA       NA       NA       NA      NA
    ## 148       NA       NA       NA       NA       NA       NA       NA      NA
    ## 149       NA       NA       NA       NA       NA       NA       NA      NA
    ## 150       NA       NA       NA       NA       NA       NA       NA      NA
    ## 151       NA       NA       NA       NA       NA       NA       NA      NA
    ## 152       NA       NA       NA       NA       NA       NA       NA      NA
    ## 153       NA       NA       NA       NA       NA       NA       NA      NA
    ## 154       NA       NA       NA       NA       NA       NA       NA      NA
    ## 155       NA       NA       NA       NA       NA       NA       NA      NA
    ## 156       NA       NA       NA       NA       NA       NA       NA      NA
    ## 157       NA       NA       NA       NA       NA       NA       NA      NA
    ## 158       NA        0       NA        0        0       NA        0       2
    ## 159       NA        1       NA        0        0       NA        0       1
    ## 160       NA       NA       NA       NA       NA       NA       NA      NA
    ## 161       NA       NA       NA       NA       NA       NA       NA      NA
    ## 162       NA       NA       NA       NA       NA       NA       NA      NA
    ## 163       NA       NA       NA       NA       NA       NA       NA      NA
    ## 164       NA       NA       NA       NA       NA       NA       NA      NA
    ## 165       NA       -3       NA       -3       -3       NA       -3      -3
    ## 166       NA       -3       NA       -3       -3       NA       -3      NA
    ## 167       NA       NA       NA       NA       NA       NA       NA      NA
    ## 168       NA       NA       NA       NA       NA       NA       NA      NA
    ## 169       NA       NA       NA       NA       NA       NA       NA      NA
    ## 170       NA       NA       NA       NA       NA       NA       NA      NA
    ## 171       NA       NA       NA       NA       NA       NA       NA      NA
    ## 172       NA       NA       NA       NA       NA       NA       NA      NA
    ## 173       NA       NA       NA       NA       NA       NA       NA      NA
    ## 174       NA       NA       NA       NA       NA       NA       NA      NA
    ## 175       NA       NA       NA       NA       NA       NA       NA      NA
    ## 176       NA       NA       NA       NA       NA       NA       NA      NA
    ## 177       NA       NA       NA       NA       NA       NA       NA      NA
    ## 178       NA       NA       NA       NA       NA       NA       NA      NA
    ## 179       NA       NA       NA       NA       NA       NA       NA      NA
    ## 180       NA       NA       NA       NA       NA       NA       NA      NA
    ## 181       NA       NA       NA       NA       NA       NA       NA      NA
    ## 182       NA       NA       NA       NA       NA       NA       NA      NA
    ## 183       NA       NA       NA       NA       NA       NA       NA      NA
    ## 184       NA       NA       NA       NA       NA       NA       NA      NA
    ## 185       NA       NA       NA       NA       NA       NA       NA      NA
    ## 186       NA       NA       NA       NA       NA       NA       NA      NA
    ## 187       NA       NA       NA       NA       NA       NA       NA      NA
    ## 188       NA       NA       NA       NA       NA       NA       NA      NA
    ## 189       NA       NA       NA       NA       NA       NA       NA      NA
    ## 190       NA       NA       NA       NA       NA       NA       NA      NA
    ## 191       NA       NA       NA       NA       NA       NA       NA      NA
    ## 192       NA       NA       NA       NA       NA       NA       NA      NA
    ## 193       NA       NA       NA       NA       NA       NA       NA      NA
    ## 194       NA       NA       NA       NA       NA       NA       NA      NA
    ## 195       NA       NA       NA       NA       NA       NA       NA      NA
    ## 196       NA       NA       NA       NA       NA       NA       NA      NA
    ## 197       NA       NA       NA       NA       NA       NA       NA      NA
    ## 198       NA       NA       NA       NA       NA       NA       NA      NA
    ## 199       NA       NA       NA       NA       NA       NA       NA      NA
    ## 200       NA       NA       NA       NA       NA       NA       NA      NA
    ## 201       NA       NA       NA       NA       NA       NA       NA      NA
    ## 202       NA       NA       NA       NA       NA       NA       NA      NA
    ## 203       NA       NA       NA       NA       NA       NA       NA      NA
    ## 204       NA       NA       NA       NA       NA       NA       NA      NA
    ## 205       NA       NA       NA       NA       NA       NA       NA      NA
    ## 206       NA       NA       NA       NA       NA       NA       NA      NA
    ## 207       NA       NA       NA       NA       NA       NA       NA      NA
    ## 208       NA       NA       NA       NA       NA       NA       NA      NA
    ## 209       NA       NA       NA       NA       NA       NA       NA      NA
    ## 210       NA       NA       NA       NA       NA       NA       NA      NA
    ## 211       NA       NA       NA       NA       NA       NA       NA      NA
    ## 212       NA       NA       NA       NA       NA       NA       NA      NA
    ## 213       NA       NA       NA       NA       NA       NA       NA      NA
    ## 214       NA       NA       NA       NA       NA       NA       NA      NA
    ## 215       NA       NA       NA       NA       NA       NA       NA      NA
    ## 216       NA       NA       NA       NA       NA       NA       NA      NA
    ## 217       NA        0       NA        1        0       NA        0      NA
    ## 218       NA       NA       NA       NA       NA       NA       NA      NA
    ## 219       NA       NA       NA       NA       NA       NA       NA      NA
    ## 220       NA       NA       NA       NA       NA       NA       NA      NA
    ## 221       NA       NA       NA       NA       NA       NA       NA      NA
    ## 222       NA       NA       NA       NA       NA       NA       NA      NA
    ## 223       NA       NA       NA       NA       NA       NA       NA      NA
    ## 224       NA       NA       NA       NA       NA       NA       NA      NA
    ## 225       NA       NA       NA       NA       NA       NA       NA      NA
    ## 226       NA       NA       NA       NA       NA       NA       NA      NA
    ## 227       NA       NA       NA       NA       NA       NA       NA      NA
    ## 228       NA       NA       NA       NA       NA       NA       NA      NA
    ## 229       NA       NA       NA       NA       NA       NA       NA      NA
    ## 230       NA       NA       NA       NA       NA       NA       NA      NA
    ## 231       NA       NA       NA       NA       NA       NA       NA      NA
    ## 232       NA       NA       NA       NA       NA       NA       NA      NA
    ## 233       NA       NA       NA       NA       NA       NA       NA      NA
    ## 234       NA        0       NA        0        0       NA        0       3
    ## 235       NA       NA       NA       NA       NA       NA       NA      NA
    ## 236       NA       NA       NA       NA       NA       NA       NA      NA
    ## 237       NA       NA       NA       NA       NA       NA       NA      NA
    ## 238       NA       NA       NA       NA       NA       NA       NA      NA
    ## 239       NA       NA       NA       NA       NA       NA       NA      NA
    ## 240       NA       NA       NA       NA       NA       NA       NA      NA
    ## 241       NA       NA       NA       NA       NA       NA       NA      NA
    ## 242       NA       -3       NA       -3       -3       NA       -3      NA
    ## 243       NA       NA       NA       NA       NA       NA       NA      NA
    ## 244       NA       NA       NA       NA       NA       NA       NA      NA
    ## 245       NA       NA       NA       NA       NA       NA       NA      NA
    ## 246       NA       NA       NA       NA       NA       NA       NA      NA
    ## 247       NA       NA       NA       NA       NA       NA       NA      NA
    ## 248       NA       NA       NA       NA       NA       NA       NA      NA
    ## 249       NA       NA       NA       NA       NA       NA       NA      NA
    ## 250       NA       NA       NA       NA       NA       NA       NA      NA
    ## 251       NA       NA       NA       NA       NA       NA       NA      NA
    ## 252       NA       NA       NA       NA       NA       NA       NA      NA
    ## 253       NA       NA       NA       NA       NA       NA       NA      NA
    ## 254       NA       NA       NA       NA       NA       NA       NA      NA
    ## 255       NA       NA       NA       NA       NA       NA       NA      NA
    ## 256       NA       NA       NA       NA       NA       NA       NA      NA
    ## 257       NA       NA       NA       NA       NA       NA       NA      NA
    ## 258       NA       NA       NA       NA       NA       NA       NA      NA
    ## 259       NA       NA       NA       NA       NA       NA       NA      NA
    ## 260       NA       NA       NA       NA       NA       NA       NA      NA
    ## 261       NA       NA       NA       NA       NA       NA       NA      NA
    ## 262       NA       -3       NA       -3       -3       NA       -3      NA
    ## 263       NA       NA       NA       NA       NA       NA       NA      NA
    ## 264       NA       NA       NA       NA       NA       NA       NA      NA
    ## 265       NA       NA       NA       NA       NA       NA       NA      NA
    ## 266       NA       NA       NA       NA       NA       NA       NA      NA
    ## 267       NA       NA       NA       NA       NA       NA       NA      NA
    ## 268       NA       NA       NA       NA       NA       NA       NA      NA
    ## 269       NA       NA       NA       NA       NA       NA       NA      NA
    ## 270       NA       NA       NA       NA       NA       NA       NA      NA
    ## 271       NA       NA       NA       NA       NA       NA       NA      NA
    ## 272       NA       NA       NA       NA       NA       NA       NA      NA
    ## 273       NA       NA       NA       NA       NA       NA       NA      NA
    ## 274       NA       -3       NA       -3       -3       NA       -3      NA
    ## 275       NA       -3       NA       -3       -3       NA       -3      -3
    ## 276       NA       NA       NA       NA       NA       NA       NA      NA
    ## 277       NA       NA       NA       NA       NA       NA       NA      NA
    ## 278       NA       NA       NA       NA       NA       NA       NA      NA
    ## 279       NA       NA       NA       NA       NA       NA       NA      NA
    ## 280       NA       NA       NA       NA       NA       NA       NA      NA
    ## 281       NA       NA       NA       NA       NA       NA       NA      NA
    ## 282       NA       -3       NA       -3       -3       NA       -3      NA
    ## 283       NA       NA       NA       NA       NA       NA       NA      NA
    ## 284       NA       -3       NA       -3       -3       NA       -3      NA
    ## 285       NA       NA       NA       NA       NA       NA       NA      NA
    ## 286       NA       NA       NA       NA       NA       NA       NA      NA
    ## 287       NA       NA       NA       NA       NA       NA       NA      NA
    ## 288       NA       NA       NA       NA       NA       NA       NA      NA
    ## 289       NA       NA       NA       NA       NA       NA       NA      NA
    ## 290       NA       NA       NA       NA       NA       NA       NA      NA
    ## 291       NA       NA       NA       NA       NA       NA       NA      NA
    ## 292       NA       -3       NA       -3       -3       NA       -3       4
    ## 293       NA       NA       NA       NA       NA       NA       NA      NA
    ## 294       NA       NA       NA       NA       NA       NA       NA      NA
    ## 295       NA       NA       NA       NA       NA       NA       NA      NA
    ## 296       NA       NA       NA       NA       NA       NA       NA      NA
    ## 297       NA       NA       NA       NA       NA       NA       NA      NA
    ## 298       NA       -3       NA       -3       -3       NA       -3      -3
    ## 299       NA       NA       NA       NA       NA       NA       NA      NA
    ## 300       NA       NA       NA       NA       NA       NA       NA      NA
    ## 301       NA       NA       NA       NA       NA       NA       NA      NA
    ## 302       NA       NA       NA       NA       NA       NA       NA      NA
    ## 303       NA       NA       NA       NA       NA       NA       NA      NA
    ## 304       NA       -3       NA       -3       -3       NA       -3       3
    ## 305       NA       NA       NA       NA       NA       NA       NA      NA
    ## 306       NA       NA       NA       NA       NA       NA       NA      NA
    ## 307       NA       NA       NA       NA       NA       NA       NA      NA
    ## 308       NA       NA       NA       NA       NA       NA       NA      NA
    ## 309       NA       NA       NA       NA       NA       NA       NA      NA
    ## 310       NA       NA       NA       NA       NA       NA       NA      NA
    ## 311       NA       NA       NA       NA       NA       NA       NA      NA
    ## 312       NA       NA       NA       NA       NA       NA       NA      NA
    ## 313       NA       NA       NA       NA       NA       NA       NA      NA
    ## 314       NA       NA       NA       NA       NA       NA       NA      NA
    ## 315       NA       NA       NA       NA       NA       NA       NA      NA
    ## 316       NA       NA       NA       NA       NA       NA       NA      NA
    ## 317       NA       NA       NA       NA       NA       NA       NA      NA
    ## 318       NA        0       NA        0        0       NA        0      NA
    ## 319       NA       NA       NA       NA       NA       NA       NA      NA
    ## 320       NA       -3       NA       -3       -3       NA       -3      -3
    ## 321       NA       NA       NA       NA       NA       NA       NA      NA
    ## 322       NA       NA       NA       NA       NA       NA       NA      NA
    ## 323       NA       NA       NA       NA       NA       NA       NA      NA
    ## 324       NA       NA       NA       NA       NA       NA       NA      NA
    ## 325       NA       NA       NA       NA       NA       NA       NA      NA
    ## 326       NA       NA       NA       NA       NA       NA       NA      NA
    ## 327       NA       NA       NA       NA       NA       NA       NA      NA
    ## 328       NA       -3       NA       -3       -3       NA       -3      NA
    ## 329       NA       NA       NA       NA       NA       NA       NA      NA
    ## 330       NA       NA       NA       NA       NA       NA       NA      NA
    ## 331       NA       NA       NA       NA       NA       NA       NA      NA
    ## 332       NA       NA       NA       NA       NA       NA       NA      NA
    ## 333       NA       NA       NA       NA       NA       NA       NA      NA
    ## 334       NA       -3       NA       -3       -3       NA       -3      NA
    ## 335       NA       NA       NA       NA       NA       NA       NA      NA
    ## 336       NA       NA       NA       NA       NA       NA       NA      NA
    ## 337       NA       NA       NA       NA       NA       NA       NA      NA
    ## 338       NA       NA       NA       NA       NA       NA       NA      NA
    ## 339       NA       NA       NA       NA       NA       NA       NA      NA
    ## 340       NA       NA       NA       NA       NA       NA       NA      NA
    ## 341       NA       -3       NA       -3       -3       NA       -3      -3
    ## 342       NA       NA       NA       NA       NA       NA       NA      NA
    ## 343       NA       NA       NA       NA       NA       NA       NA      NA
    ## 344       NA       NA       NA       NA       NA       NA       NA      NA
    ## 345       NA       NA       NA       NA       NA       NA       NA      NA
    ## 346       NA       NA       NA       NA       NA       NA       NA      NA
    ## 347       NA       NA       NA       NA       NA       NA       NA      NA
    ## 348       NA       NA       NA       NA       NA       NA       NA      NA
    ## 349       NA       NA       NA       NA       NA       NA       NA      NA
    ## 350       NA       NA       NA       NA       NA       NA       NA      NA
    ## 351       NA       NA       NA       NA       NA       NA       NA      NA
    ## 352       NA       NA       NA       NA       NA       NA       NA      NA
    ## 353       NA       NA       NA       NA       NA       NA       NA      NA
    ## 354       NA       NA       NA       NA       NA       NA       NA      NA
    ## 355       NA       NA       NA       NA       NA       NA       NA      NA
    ## 356       NA       NA       NA       NA       NA       NA       NA      NA
    ## 357       NA       NA       NA       NA       NA       NA       NA      NA
    ## 358       NA       NA       NA       NA       NA       NA       NA      NA
    ## 359       NA       NA       NA       NA       NA       NA       NA      NA
    ## 360       NA       NA       NA       NA       NA       NA       NA      NA
    ## 361       NA       NA       NA       NA       NA       NA       NA      NA
    ## 362       NA       NA       NA       NA       NA       NA       NA      NA
    ## 363       NA       NA       NA       NA       NA       NA       NA      NA
    ## 364       NA       NA       NA       NA       NA       NA       NA      NA
    ## 365       NA       NA       NA       NA       NA       NA       NA      NA
    ## 366       NA       NA       NA       NA       NA       NA       NA      NA
    ## 367       NA       NA       NA       NA       NA       NA       NA      NA
    ## 368       NA       NA       NA       NA       NA       NA       NA      NA
    ## 369       NA       NA       NA       NA       NA       NA       NA      NA
    ## 370       NA       NA       NA       NA       NA       NA       NA      NA
    ## 371       NA       NA       NA       NA       NA       NA       NA      NA
    ## 372       NA       NA       NA       NA       NA       NA       NA      NA
    ## 373       NA       NA       NA       NA       NA       NA       NA      NA
    ## 374       NA       NA       NA       NA       NA       NA       NA      NA
    ## 375       NA       NA       NA       NA       NA       NA       NA      NA
    ## 376       NA       NA       NA       NA       NA       NA       NA      NA
    ## 377       NA       NA       NA       NA       NA       NA       NA      NA
    ## 378       NA       NA       NA       NA       NA       NA       NA      NA
    ## 379       NA       NA       NA       NA       NA       NA       NA      NA
    ## 380       NA       NA       NA       NA       NA       NA       NA      NA
    ## 381       NA       -3       NA       -3       -3       NA       -3       2
    ## 382       NA       NA       NA       NA       NA       NA       NA      NA
    ## 383       NA       NA       NA       NA       NA       NA       NA      NA
    ## 384       NA       NA       NA       NA       NA       NA       NA      NA
    ## 385       NA       NA       NA       NA       NA       NA       NA      NA
    ## 386       NA       NA       NA       NA       NA       NA       NA      NA
    ## 387       NA       NA       NA       NA       NA       NA       NA      NA
    ## 388       NA       NA       NA       NA       NA       NA       NA      NA
    ## 389       NA       NA       NA       NA       NA       NA       NA      NA
    ## 390       NA       NA       NA       NA       NA       NA       NA      NA
    ## 391       NA       NA       NA       NA       NA       NA       NA      NA
    ## 392       NA       NA       NA       NA       NA       NA       NA      NA
    ## 393       NA       NA       NA       NA       NA       NA       NA      NA
    ## 394       NA       NA       NA       NA       NA       NA       NA      NA
    ## 395       NA       NA       NA       NA       NA       NA       NA      NA
    ## 396       NA       NA       NA       NA       NA       NA       NA      NA
    ## 397       NA       NA       NA       NA       NA       NA       NA      NA
    ## 398       NA       NA       NA       NA       NA       NA       NA      NA
    ## 399       NA       NA       NA       NA       NA       NA       NA      NA
    ## 400       NA       NA       NA       NA       NA       NA       NA      NA
    ## 401       NA       NA       NA       NA       NA       NA       NA      NA
    ## 402       NA       NA       NA       NA       NA       NA       NA      NA
    ## 403       NA       -3       NA       -3       -3       NA       -3      NA
    ## 404       NA       -3       NA       -3       -3       NA       -3      NA
    ## 405       NA       NA       NA       NA       NA       NA       NA      NA
    ## 406       NA       NA       NA       NA       NA       NA       NA      NA
    ## 407       NA       NA       NA       NA       NA       NA       NA      NA
    ## 408       NA       NA       NA       NA       NA       NA       NA      NA
    ## 409       NA       NA       NA       NA       NA       NA       NA      NA
    ## 410       NA       -3       NA       -3       -3       NA       -3      -3
    ## 411       NA        0       NA        1        0       NA        0      NA
    ## 412       NA       NA       NA       NA       NA       NA       NA      NA
    ## 413       NA       NA       NA       NA       NA       NA       NA      NA
    ## 414       NA       NA       NA       NA       NA       NA       NA      NA
    ## 415       NA       NA       NA       NA       NA       NA       NA      NA
    ## 416       NA       NA       NA       NA       NA       NA       NA      NA
    ## 417       NA       NA       NA       NA       NA       NA       NA      NA
    ## 418       NA       NA       NA       NA       NA       NA       NA      NA
    ## 419       NA       NA       NA       NA       NA       NA       NA      NA
    ## 420       NA       NA       NA       NA       NA       NA       NA      NA
    ## 421       NA       -3       NA       -3       -3       NA       -3       3
    ## 422       NA       -3       NA       -3       -3       NA       -3       3
    ## 423       NA       NA       NA       NA       NA       NA       NA      NA
    ## 424       NA       NA       NA       NA       NA       NA       NA      NA
    ## 425       NA       NA       NA       NA       NA       NA       NA      NA
    ## 426       NA       NA       NA       NA       NA       NA       NA      NA
    ## 427       NA       NA       NA       NA       NA       NA       NA      NA
    ## 428       NA       NA       NA       NA       NA       NA       NA      NA
    ## 429       NA       NA       NA       NA       NA       NA       NA      NA
    ## 430       NA       NA       NA       NA       NA       NA       NA      NA
    ## 431       NA       NA       NA       NA       NA       NA       NA      NA
    ## 432       NA       NA       NA       NA       NA       NA       NA      NA
    ## 433       NA       NA       NA       NA       NA       NA       NA      NA
    ## 434       NA       NA       NA       NA       NA       NA       NA      NA
    ## 435       NA       NA       NA       NA       NA       NA       NA      NA
    ## 436       NA       -3       NA       -3       -3       NA       -3      -3
    ## 437       NA       NA       NA       NA       NA       NA       NA      NA
    ## 438       NA       NA       NA       NA       NA       NA       NA      NA
    ## 439       NA       NA       NA       NA       NA       NA       NA      NA
    ## 440       NA       NA       NA       NA       NA       NA       NA      NA
    ## 441       NA        0       NA        0        0       NA        0       2
    ## 442       NA       NA       NA       NA       NA       NA       NA      NA
    ## 443       NA       -3       NA       -3       -3       NA       -3      -3
    ## 444       NA       NA       NA       NA       NA       NA       NA      NA
    ## 445       NA       NA       NA       NA       NA       NA       NA      NA
    ## 446       NA       NA       NA       NA       NA       NA       NA      NA
    ## 447       NA        0       NA        1        0       NA        0      NA
    ## 448       NA       NA       NA       NA       NA       NA       NA      NA
    ## 449       NA       NA       NA       NA       NA       NA       NA      NA
    ## 450       NA       NA       NA       NA       NA       NA       NA      NA
    ## 451       NA       NA       NA       NA       NA       NA       NA      NA
    ## 452       NA       NA       NA       NA       NA       NA       NA      NA
    ## 453       NA       NA       NA       NA       NA       NA       NA      NA
    ## 454       NA       NA       NA       NA       NA       NA       NA      NA
    ## 455       NA       NA       NA       NA       NA       NA       NA      NA
    ## 456       NA       NA       NA       NA       NA       NA       NA      NA
    ## 457       NA       NA       NA       NA       NA       NA       NA      NA
    ## 458       NA       NA       NA       NA       NA       NA       NA      NA
    ## 459       NA       NA       NA       NA       NA       NA       NA      NA
    ## 460       NA       NA       NA       NA       NA       NA       NA      NA
    ## 461       NA       NA       NA       NA       NA       NA       NA      NA
    ## 462       NA       NA       NA       NA       NA       NA       NA      NA
    ## 463       NA       NA       NA       NA       NA       NA       NA      NA
    ## 464       NA       NA       NA       NA       NA       NA       NA      NA
    ## 465       NA       NA       NA       NA       NA       NA       NA      NA
    ## 466       NA       NA       NA       NA       NA       NA       NA      NA
    ## 467       NA       NA       NA       NA       NA       NA       NA      NA
    ## 468       NA       -3       NA       -3       -3       NA       -3      NA
    ## 469       NA       -3       NA       -3       -3       NA       -3      -3
    ## 470       NA       NA       NA       NA       NA       NA       NA      NA
    ## 471       NA       NA       NA       NA       NA       NA       NA      NA
    ## 472       NA       NA       NA       NA       NA       NA       NA      NA
    ## 473       NA       NA       NA       NA       NA       NA       NA      NA
    ## 474       NA       NA       NA       NA       NA       NA       NA      NA
    ## 475       NA       -3       NA       -3       -3       NA       -3      NA
    ## 476       NA       NA       NA       NA       NA       NA       NA      NA
    ## 477       NA       NA       NA       NA       NA       NA       NA      NA
    ## 478       NA       NA       NA       NA       NA       NA       NA      NA
    ## 479       NA       NA       NA       NA       NA       NA       NA      NA
    ## 480       NA       NA       NA       NA       NA       NA       NA      NA
    ## 481       NA       NA       NA       NA       NA       NA       NA      NA
    ## 482       NA       NA       NA       NA       NA       NA       NA      NA
    ## 483       NA       NA       NA       NA       NA       NA       NA      NA
    ## 484       NA       NA       NA       NA       NA       NA       NA      NA
    ## 485       NA       NA       NA       NA       NA       NA       NA      NA
    ## 486       NA       NA       NA       NA       NA       NA       NA      NA
    ## 487       NA       NA       NA       NA       NA       NA       NA      NA
    ## 488       NA       NA       NA       NA       NA       NA       NA      NA
    ## 489       NA       NA       NA       NA       NA       NA       NA      NA
    ## 490       NA       NA       NA       NA       NA       NA       NA      NA
    ## 491       NA       NA       NA       NA       NA       NA       NA      NA
    ## 492       NA       NA       NA       NA       NA       NA       NA      NA
    ##     crn11i10 crn20i1 crn20i2 crn21i1 crn21i2 crn21i3 nkids sdp4g frt69 frt68
    ## 1         NA      NA      NA      NA      NA      NA     3    NA    NA    NA
    ## 2         NA      NA      NA      NA      NA      NA     3    NA    NA    NA
    ## 3         NA      NA      NA      NA      NA      NA     3    NA    NA    NA
    ## 4         NA      NA      NA      NA      NA      NA     0    NA     3    NA
    ## 5         NA      NA      NA      NA      NA      NA     0    NA     3     5
    ## 6         NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 7         NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 8         NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 9         NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 10        NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 11        NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 12        NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 13        NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 14        NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 15        NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 16         1       4       4       1       1       1     1    NA     5    NA
    ## 17        NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 18        NA      NA      NA      NA      NA      NA     1    NA     1    NA
    ## 19        NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 20        NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 21        NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 22        NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 23        NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 24        NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 25        NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 26        NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 27        NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 28        NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 29        NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 30        NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 31        NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 32         3       4       4       3       2       2     2    NA     1    NA
    ## 33        NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 34        NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 35        NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 36        NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 37        NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 38        NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 39        NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 40        NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 41        NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 42        NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 43        NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 44        NA      NA      NA      NA      NA      NA     1    NA     1     1
    ## 45        NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 46        NA      NA      NA      NA      NA      NA     3    NA    NA    NA
    ## 47        NA      NA      NA      NA      NA      NA     3    NA    NA    NA
    ## 48         1       3       4      -4      -4      -4     3    NA     1    NA
    ## 49        NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 50        NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 51        NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 52        NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 53        NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 54        NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 55        NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 56        NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 57        NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 58        NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 59        NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 60        NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 61        NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 62        NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 63        NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 64        NA      NA      NA      NA      NA      NA     3    NA    NA    NA
    ## 65        NA      NA      NA      NA      NA      NA     3    NA    NA    NA
    ## 66        NA      NA      NA      NA      NA      NA     3    NA    NA    NA
    ## 67        NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 68        NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 69        NA      NA      NA      NA      NA      NA     0    NA     1     2
    ## 70        NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 71        NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 72        NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 73        NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 74        NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 75        NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 76         3       3       3       2       2       2     3    NA     2    NA
    ## 77        NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 78        NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 79        NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 80        NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 81        NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 82        NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 83        NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 84        NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 85        NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 86        NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 87        NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 88        NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 89        NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 90        NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 91        NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 92        -3      -3      -3      -3      -3      -3     0    NA     2    NA
    ## 93        NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 94        NA      NA      NA      NA      NA      NA     0    NA     2     4
    ## 95        NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 96        NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 97        NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 98        NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 99        NA      NA      NA      NA      NA      NA     2    NA     1     1
    ## 100       NA      NA      NA      NA      NA      NA     3    NA    NA    NA
    ## 101       NA      NA      NA      NA      NA      NA     3    NA    NA    NA
    ## 102       NA      NA      NA      NA      NA      NA     3    NA    NA    NA
    ## 103       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 104       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 105       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 106       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 107       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 108       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 109       -3      -3      -3      -3      -3      -3     2    NA     1    NA
    ## 110       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 111       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 112       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 113       NA      NA      NA      NA      NA      NA     3    NA    NA    NA
    ## 114       NA      NA      NA      NA      NA      NA     3    NA    NA    NA
    ## 115       NA      NA      NA      NA      NA      NA     3    NA    NA    NA
    ## 116       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 117       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 118       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 119       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 120       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 121       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 122       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 123       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 124       NA      NA      NA      NA      NA      NA     3    NA    NA    NA
    ## 125       NA      NA      NA      NA      NA      NA     3    NA    NA    NA
    ## 126       NA      NA      NA      NA      NA      NA     3    NA    NA    NA
    ## 127       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 128       NA      NA      NA      NA      NA      NA     1    NA     1    NA
    ## 129       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 130       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 131       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 132       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 133       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 134       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 135       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 136       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 137       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 138       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 139        2       4       3       2       2       2     2    NA     1    NA
    ## 140       NA      NA      NA      NA      NA      NA     2    NA     1    NA
    ## 141       NA      NA      NA      NA      NA      NA     2    NA     1     1
    ## 142       -3      -3      -3      -3      -3      -3     0    NA     1    NA
    ## 143       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 144       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 145       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 146       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 147       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 148       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 149       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 150       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 151       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 152       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 153       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 154       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 155       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 156       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 157       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 158        3       4       4       3       2       2     2    NA     1    NA
    ## 159        1       4       4       4       4       3     1    NA     1    NA
    ## 160       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 161       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 162       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 163       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 164       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 165       -3      -3      -3      -3      -3      -3     2    NA     1    NA
    ## 166       NA      NA      NA      NA      NA      NA     2    NA     1    NA
    ## 167       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 168       NA      NA      NA      NA      NA      NA     3    NA    NA    NA
    ## 169       NA      NA      NA      NA      NA      NA     3    NA    NA    NA
    ## 170       NA      NA      NA      NA      NA      NA     3    NA    NA    NA
    ## 171       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 172       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 173       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 174       NA      NA      NA      NA      NA      NA     5    NA    NA    NA
    ## 175       NA      NA      NA      NA      NA      NA     5    NA    NA    NA
    ## 176       NA      NA      NA      NA      NA      NA     5    NA    NA    NA
    ## 177       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 178       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 179       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 180       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 181       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 182       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 183       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 184       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 185       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 186       NA      NA      NA      NA      NA      NA     3    NA    NA    NA
    ## 187       NA      NA      NA      NA      NA      NA     3    NA    NA    NA
    ## 188       NA      NA      NA      NA      NA      NA     3    NA    NA    NA
    ## 189       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 190       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 191       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 192       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 193       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 194       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 195       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 196       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 197       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 198       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 199       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 200       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 201       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 202       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 203       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 204       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 205       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 206       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 207       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 208       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 209       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 210       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 211       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 212       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 213       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 214       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 215       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 216       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 217       NA      NA      NA      NA      NA      NA     1    NA     2    NA
    ## 218       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 219       NA      NA      NA      NA      NA      NA     3    NA    NA    NA
    ## 220       NA      NA      NA      NA      NA      NA     3    NA    NA    NA
    ## 221       NA      NA      NA      NA      NA      NA     3    NA    NA    NA
    ## 222       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 223       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 224       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 225       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 226       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 227       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 228       NA      NA      NA      NA      NA      NA     4    NA    NA    NA
    ## 229       NA      NA      NA      NA      NA      NA     4    NA    NA    NA
    ## 230       NA      NA      NA      NA      NA      NA     4    NA    NA    NA
    ## 231       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 232       NA      NA      NA      NA      NA      NA     5    NA    NA    NA
    ## 233       NA      NA      NA      NA      NA      NA     5    NA    NA    NA
    ## 234        4       4       3       3       3       3     1    NA     4    NA
    ## 235       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 236       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 237       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 238       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 239       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 240       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 241       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 242       NA      NA      NA      NA      NA      NA     2    NA     1     1
    ## 243       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 244       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 245       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 246       NA      NA      NA      NA      NA      NA     3    NA    NA    NA
    ## 247       NA      NA      NA      NA      NA      NA     3    NA    NA    NA
    ## 248       NA      NA      NA      NA      NA      NA     3    NA    NA    NA
    ## 249       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 250       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 251       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 252       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 253       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 254       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 255       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 256       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 257       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 258       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 259       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 260       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 261       NA      NA      NA      NA      NA      NA    NA    NA    NA    NA
    ## 262       NA      NA      NA      NA      NA      NA     0    NA     5     3
    ## 263       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 264       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 265       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 266       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 267       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 268       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 269       NA      NA      NA      NA      NA      NA     4    NA    NA    NA
    ## 270       NA      NA      NA      NA      NA      NA     4    NA    NA    NA
    ## 271       NA      NA      NA      NA      NA      NA     4    NA    NA    NA
    ## 272       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 273       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 274       NA      NA      NA      NA      NA      NA     1    NA     1     1
    ## 275       -3      -3      -3      -3      -3      -3     0    NA     4    NA
    ## 276       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 277       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 278       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 279       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 280       NA      NA      NA      NA      NA      NA     4    NA    NA    NA
    ## 281       NA      NA      NA      NA      NA      NA     4    NA    NA    NA
    ## 282       NA      NA      NA      NA      NA      NA     4    NA     1     5
    ## 283       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 284       NA      NA      NA      NA      NA      NA     0    NA     4    NA
    ## 285       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 286       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 287       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 288       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 289       NA      NA      NA      NA      NA      NA     3    NA    NA    NA
    ## 290       NA      NA      NA      NA      NA      NA     3    NA    NA    NA
    ## 291       NA      NA      NA      NA      NA      NA     3    NA    NA    NA
    ## 292        2       4       4       1       1       1     1    NA     3    NA
    ## 293       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 294       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 295       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 296       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 297       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 298       -3      -3      -3      -3      -3      -3     0    NA     4    NA
    ## 299       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 300       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 301       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 302       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 303       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 304        3       4       4       3       1       1     1    NA     5    NA
    ## 305       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 306       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 307       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 308       NA      NA      NA      NA      NA      NA     4    NA    NA    NA
    ## 309       NA      NA      NA      NA      NA      NA     4    NA    NA    NA
    ## 310       NA      NA      NA      NA      NA      NA     4    NA    NA    NA
    ## 311       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 312       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 313       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 314       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 315       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 316       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 317       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 318       NA      NA      NA      NA      NA      NA     2    NA     4    NA
    ## 319       NA      NA      NA      NA      NA      NA     3    NA    NA    NA
    ## 320       -3      -3      -3      -3      -3      -3     3    NA     1    NA
    ## 321       NA      NA      NA      NA      NA      NA     3    NA    NA    NA
    ## 322       NA      NA      NA      NA      NA      NA     3    NA    NA    NA
    ## 323       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 324       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 325       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 326       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 327       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 328       NA      NA      NA      NA      NA      NA     0    NA     2     4
    ## 329       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 330       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 331       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 332       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 333       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 334       NA      NA      NA      NA      NA      NA     2    NA     1     1
    ## 335       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 336       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 337       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 338       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 339       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 340       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 341       -3      -3      -3      -3      -3      -3     0    NA     3    NA
    ## 342       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 343       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 344       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 345       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 346       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 347       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 348       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 349       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 350       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 351       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 352       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 353       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 354       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 355       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 356       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 357       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 358       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 359       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 360       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 361       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 362       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 363       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 364       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 365       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 366       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 367       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 368       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 369       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 370       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 371       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 372       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 373       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 374       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 375       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 376       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 377       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 378       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 379       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 380       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 381        2       4       2       3       3       2     2    NA     1    NA
    ## 382       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 383       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 384       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 385       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 386       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 387       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 388       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 389       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 390       NA      NA      NA      NA      NA      NA     3    NA    NA    NA
    ## 391       NA      NA      NA      NA      NA      NA     3    NA    NA    NA
    ## 392       NA      NA      NA      NA      NA      NA     3    NA    NA    NA
    ## 393       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 394       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 395       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 396       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 397       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 398       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 399       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 400       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 401       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 402       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 403       NA      NA      NA      NA      NA      NA     1    NA     1    NA
    ## 404       NA      NA      NA      NA      NA      NA     1    NA     1     1
    ## 405       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 406       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 407       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 408       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 409       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 410       -3      -3      -3      -3      -3      -3     0    NA     5    NA
    ## 411       NA      NA      NA      NA      NA      NA     2    NA     1     1
    ## 412       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 413       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 414       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 415       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 416       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 417       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 418       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 419       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 420       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 421        3       5       5      -3      -3      -3     3    NA     1    NA
    ## 422        1       4       4       2       1       1     2    NA     1    NA
    ## 423       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 424       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 425       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 426       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 427       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 428       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 429       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 430       NA      NA      NA      NA      NA      NA     3    NA    NA    NA
    ## 431       NA      NA      NA      NA      NA      NA     3    NA    NA    NA
    ## 432       NA      NA      NA      NA      NA      NA     3    NA    NA    NA
    ## 433       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 434       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 435       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 436       -3      -3      -3      -3      -3      -3     0    NA     3    NA
    ## 437       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 438       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 439       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 440       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 441        2       5       5       3       2       1     2    NA     4    NA
    ## 442       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 443       -3      -3      -3      -3      -3      -3     0    NA     1    NA
    ## 444       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 445       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 446       NA      NA      NA      NA      NA      NA     4    NA    NA    NA
    ## 447       NA      NA      NA      NA      NA      NA     4    NA     1    NA
    ## 448       NA      NA      NA      NA      NA      NA     4    NA    NA    NA
    ## 449       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 450       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 451       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 452       NA      NA      NA      NA      NA      NA     3    NA    NA    NA
    ## 453       NA      NA      NA      NA      NA      NA     3    NA    NA    NA
    ## 454       NA      NA      NA      NA      NA      NA     3    NA    NA    NA
    ## 455       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 456       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 457       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 458       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 459       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 460       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 461       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 462       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 463       NA      NA      NA      NA      NA      NA     1    NA    NA    NA
    ## 464       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 465       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 466       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 467       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 468       NA      NA      NA      NA      NA      NA     0    NA     2    NA
    ## 469       -3      -3      -3      -3      -3      -3     1    NA     1    NA
    ## 470       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 471       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 472       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 473       NA      NA      NA      NA      NA      NA     3    NA    NA    NA
    ## 474       NA      NA      NA      NA      NA      NA     3    NA    NA    NA
    ## 475       NA      NA      NA      NA      NA      NA     3    NA     1     1
    ## 476       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 477       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 478       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 479       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 480       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 481       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 482       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 483       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 484       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 485       NA      NA      NA      NA      NA      NA     4    NA    NA    NA
    ## 486       NA      NA      NA      NA      NA      NA     4    NA    NA    NA
    ## 487       NA      NA      NA      NA      NA      NA     4    NA    NA    NA
    ## 488       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 489       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 490       NA      NA      NA      NA      NA      NA     2    NA    NA    NA
    ## 491       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ## 492       NA      NA      NA      NA      NA      NA     0    NA    NA    NA
    ##     frt70 frt5 frt67 frt43i1 frt43i2 frt43i3 frt43i4 frt43i5 frt43i6 frt43i7
    ## 1      NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 2      NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 3      NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 4       2    2    NA      NA      NA      NA      NA      NA      NA      NA
    ## 5       2    2     2      NA      NA      NA      NA      NA      NA      NA
    ## 6      NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 7      NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 8      NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 9      NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 10     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 11     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 12     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 13     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 14     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 15     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 16      3    3    NA      NA      NA      NA      NA      NA      NA      NA
    ## 17     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 18      1    2    NA      NA      NA      NA      NA      NA      NA      NA
    ## 19     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 20     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 21     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 22     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 23     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 24     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 25     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 26     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 27     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 28     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 29     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 30     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 31     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 32      2    2    NA      NA      NA      NA      NA      NA      NA      NA
    ## 33     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 34     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 35     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 36     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 37     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 38     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 39     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 40     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 41     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 42     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 43     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 44     -3    1     2      NA      NA      NA      NA      NA      NA      NA
    ## 45     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 46     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 47     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 48      3    3    NA      NA      NA      NA      NA      NA      NA      NA
    ## 49     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 50     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 51     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 52     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 53     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 54     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 55     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 56     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 57     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 58     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 59     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 60     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 61     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 62     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 63     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 64     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 65     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 66     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 67     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 68     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 69      0    1     1      NA      NA      NA      NA      NA      NA      NA
    ## 70     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 71     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 72     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 73     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 74     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 75     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 76      3    4    NA      NA      NA      NA      NA      NA      NA      NA
    ## 77     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 78     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 79     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 80     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 81     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 82     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 83     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 84     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 85     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 86     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 87     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 88     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 89     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 90     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 91     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 92      2    3    NA      NA      NA      NA      NA      NA      NA      NA
    ## 93     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 94      2    2     2      NA      NA      NA      NA      NA      NA      NA
    ## 95     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 96     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 97     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 98     NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 99     -3    2     2      NA      NA      NA      NA      NA      NA      NA
    ## 100    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 101    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 102    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 103    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 104    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 105    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 106    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 107    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 108    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 109     0    2    NA      NA      NA      NA      NA      NA      NA      NA
    ## 110    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 111    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 112    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 113    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 114    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 115    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 116    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 117    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 118    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 119    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 120    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 121    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 122    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 123    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 124    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 125    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 126    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 127    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 128     2    3    NA      NA      NA      NA      NA      NA      NA      NA
    ## 129    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 130    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 131    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 132    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 133    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 134    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 135    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 136    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 137    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 138    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 139     2    2    NA      NA      NA      NA      NA      NA      NA      NA
    ## 140     2    2    NA      NA      NA      NA      NA      NA      NA      NA
    ## 141    -3    0     0      NA      NA      NA      NA      NA      NA      NA
    ## 142     2    2    NA      NA      NA      NA      NA      NA      NA      NA
    ## 143    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 144    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 145    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 146    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 147    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 148    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 149    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 150    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 151    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 152    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 153    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 154    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 155    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 156    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 157    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 158     1    2    NA      NA      NA      NA      NA      NA      NA      NA
    ## 159     1    2    NA      NA      NA      NA      NA      NA      NA      NA
    ## 160    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 161    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 162    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 163    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 164    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 165     2    2    NA      NA      NA      NA      NA      NA      NA      NA
    ## 166     2    2    NA      NA      NA      NA      NA      NA      NA      NA
    ## 167    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 168    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 169    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 170    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 171    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 172    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 173    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 174    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 175    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 176    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 177    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 178    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 179    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 180    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 181    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 182    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 183    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 184    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 185    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 186    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 187    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 188    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 189    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 190    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 191    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 192    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 193    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 194    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 195    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 196    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 197    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 198    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 199    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 200    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 201    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 202    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 203    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 204    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 205    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 206    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 207    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 208    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 209    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 210    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 211    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 212    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 213    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 214    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 215    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 216    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 217     1    2    NA      NA      NA      NA      NA      NA      NA      NA
    ## 218    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 219    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 220    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 221    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 222    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 223    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 224    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 225    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 226    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 227    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 228    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 229    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 230    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 231    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 232    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 233    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 234     2    3    NA      NA      NA      NA      NA      NA      NA      NA
    ## 235    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 236    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 237    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 238    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 239    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 240    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 241    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 242    -3    2     2      NA      NA      NA      NA      NA      NA      NA
    ## 243    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 244    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 245    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 246    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 247    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 248    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 249    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 250    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 251    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 252    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 253    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 254    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 255    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 256    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 257    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 258    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 259    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 260    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 261    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 262    -4    2     2      NA      NA      NA      NA      NA      NA      NA
    ## 263    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 264    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 265    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 266    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 267    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 268    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 269    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 270    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 271    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 272    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 273    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 274    -3    1     1      NA      NA      NA      NA      NA      NA      NA
    ## 275     2    2    NA      NA      NA      NA      NA      NA      NA      NA
    ## 276    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 277    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 278    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 279    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 280    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 281    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 282     4    4    -2      NA      NA      NA      NA      NA      NA      NA
    ## 283    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 284     3    3    NA      NA      NA      NA      NA      NA      NA      NA
    ## 285    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 286    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 287    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 288    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 289    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 290    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 291    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 292     2    2    NA      NA      NA      NA      NA      NA      NA      NA
    ## 293    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 294    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 295    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 296    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 297    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 298    -1    2    NA      NA      NA      NA      NA      NA      NA      NA
    ## 299    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 300    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 301    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 302    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 303    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 304     2    2    NA      NA      NA      NA      NA      NA      NA      NA
    ## 305    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 306    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 307    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 308    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 309    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 310    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 311    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 312    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 313    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 314    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 315    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 316    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 317    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 318     2    2    NA      NA      NA      NA      NA      NA      NA      NA
    ## 319    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 320     2    2    NA      NA      NA      NA      NA      NA      NA      NA
    ## 321    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 322    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 323    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 324    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 325    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 326    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 327    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 328     2    2     2      NA      NA      NA      NA      NA      NA      NA
    ## 329    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 330    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 331    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 332    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 333    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 334    -3    3     3      NA      NA      NA      NA      NA      NA      NA
    ## 335    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 336    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 337    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 338    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 339    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 340    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 341     1    1    NA      NA      NA      NA      NA      NA      NA      NA
    ## 342    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 343    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 344    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 345    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 346    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 347    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 348    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 349    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 350    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 351    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 352    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 353    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 354    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 355    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 356    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 357    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 358    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 359    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 360    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 361    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 362    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 363    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 364    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 365    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 366    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 367    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 368    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 369    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 370    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 371    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 372    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 373    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 374    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 375    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 376    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 377    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 378    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 379    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 380    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 381     2    2    NA      NA      NA      NA      NA      NA      NA      NA
    ## 382    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 383    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 384    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 385    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 386    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 387    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 388    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 389    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 390    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 391    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 392    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 393    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 394    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 395    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 396    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 397    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 398    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 399    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 400    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 401    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 402    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 403     1    1    NA      NA      NA      NA      NA      NA      NA      NA
    ## 404    -3    1     2      NA      NA      NA      NA      NA      NA      NA
    ## 405    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 406    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 407    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 408    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 409    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 410     3    3    NA      NA      NA      NA      NA      NA      NA      NA
    ## 411    -3    2     2      NA      NA      NA      NA      NA      NA      NA
    ## 412    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 413    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 414    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 415    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 416    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 417    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 418    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 419    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 420    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 421     3    3    NA      NA      NA      NA      NA      NA      NA      NA
    ## 422     2    2    NA      NA      NA      NA      NA      NA      NA      NA
    ## 423    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 424    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 425    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 426    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 427    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 428    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 429    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 430    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 431    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 432    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 433    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 434    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 435    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 436     2    2    NA      NA      NA      NA      NA      NA      NA      NA
    ## 437    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 438    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 439    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 440    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 441     3    3    NA      NA      NA      NA      NA      NA      NA      NA
    ## 442    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 443    -1    0    NA      NA      NA      NA      NA      NA      NA      NA
    ## 444    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 445    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 446    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 447     4    4    NA      NA      NA      NA      NA      NA      NA      NA
    ## 448    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 449    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 450    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 451    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 452    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 453    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 454    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 455    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 456    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 457    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 458    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 459    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 460    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 461    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 462    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 463    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 464    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 465    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 466    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 467    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 468     0    1    NA      NA      NA      NA      NA      NA      NA      NA
    ## 469     1    2    NA      NA      NA      NA      NA      NA      NA      NA
    ## 470    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 471    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 472    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 473    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 474    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 475    -3    3     1      NA      NA      NA      NA      NA      NA      NA
    ## 476    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 477    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 478    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 479    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 480    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 481    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 482    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 483    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 484    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 485    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 486    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 487    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 488    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 489    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 490    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 491    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ## 492    NA   NA    NA      NA      NA      NA      NA      NA      NA      NA
    ##     frt43i8 frt43i9 frt43i10 frt43i11 frt47i1 frt47i2 frt47i3 frt47i4 frt47i5
    ## 1        NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 2        NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 3        NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 4        NA      NA       NA       NA       0       0       0       0       0
    ## 5        NA      NA       NA       NA       0       0       0       0       0
    ## 6        NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 7        NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 8        NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 9        NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 10       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 11       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 12       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 13       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 14       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 15       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 16       NA      NA       NA       NA       0       0       0       0       0
    ## 17       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 18       NA      NA       NA       NA       0       0       0       0       0
    ## 19       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 20       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 21       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 22       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 23       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 24       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 25       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 26       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 27       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 28       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 29       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 30       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 31       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 32       NA      NA       NA       NA       0       1       0       0       0
    ## 33       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 34       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 35       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 36       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 37       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 38       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 39       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 40       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 41       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 42       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 43       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 44       NA      NA       NA       NA       0       0       0       0       0
    ## 45       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 46       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 47       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 48       NA      NA       NA       NA       0       0       0       0       0
    ## 49       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 50       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 51       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 52       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 53       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 54       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 55       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 56       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 57       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 58       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 59       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 60       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 61       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 62       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 63       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 64       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 65       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 66       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 67       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 68       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 69       NA      NA       NA       NA       0       0       0       0       0
    ## 70       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 71       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 72       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 73       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 74       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 75       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 76       NA      NA       NA       NA       0       0       0       0       0
    ## 77       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 78       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 79       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 80       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 81       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 82       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 83       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 84       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 85       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 86       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 87       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 88       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 89       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 90       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 91       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 92       NA      NA       NA       NA       0       0       0       0       0
    ## 93       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 94       NA      NA       NA       NA       0       0       0       0       0
    ## 95       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 96       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 97       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 98       NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 99       NA      NA       NA       NA       0       0       0       0       0
    ## 100      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 101      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 102      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 103      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 104      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 105      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 106      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 107      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 108      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 109      NA      NA       NA       NA       0       0       0       0       0
    ## 110      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 111      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 112      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 113      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 114      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 115      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 116      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 117      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 118      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 119      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 120      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 121      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 122      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 123      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 124      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 125      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 126      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 127      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 128      NA      NA       NA       NA       0       0       0       0       0
    ## 129      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 130      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 131      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 132      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 133      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 134      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 135      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 136      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 137      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 138      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 139      NA      NA       NA       NA       0       0       0       0       0
    ## 140      NA      NA       NA       NA       0       0       0       0       0
    ## 141      NA      NA       NA       NA       0       0       0       0       0
    ## 142      NA      NA       NA       NA       0       0       0       0       0
    ## 143      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 144      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 145      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 146      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 147      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 148      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 149      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 150      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 151      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 152      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 153      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 154      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 155      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 156      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 157      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 158      NA      NA       NA       NA       0       0       0       0       0
    ## 159      NA      NA       NA       NA       0       0       0       0       0
    ## 160      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 161      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 162      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 163      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 164      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 165      NA      NA       NA       NA       0       0       0       0       0
    ## 166      NA      NA       NA       NA       0       0       0       0       0
    ## 167      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 168      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 169      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 170      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 171      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 172      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 173      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 174      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 175      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 176      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 177      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 178      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 179      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 180      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 181      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 182      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 183      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 184      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 185      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 186      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 187      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 188      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 189      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 190      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 191      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 192      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 193      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 194      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 195      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 196      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 197      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 198      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 199      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 200      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 201      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 202      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 203      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 204      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 205      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 206      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 207      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 208      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 209      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 210      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 211      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 212      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 213      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 214      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 215      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 216      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 217      NA      NA       NA       NA       0       1       1       0       0
    ## 218      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 219      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 220      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 221      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 222      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 223      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 224      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 225      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 226      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 227      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 228      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 229      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 230      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 231      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 232      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 233      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 234      NA      NA       NA       NA       0       0       0       0       0
    ## 235      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 236      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 237      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 238      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 239      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 240      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 241      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 242      NA      NA       NA       NA       0       0       0       0       0
    ## 243      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 244      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 245      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 246      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 247      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 248      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 249      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 250      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 251      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 252      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 253      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 254      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 255      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 256      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 257      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 258      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 259      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 260      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 261      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 262      NA      NA       NA       NA       1       1       0       1       0
    ## 263      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 264      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 265      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 266      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 267      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 268      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 269      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 270      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 271      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 272      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 273      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 274      NA      NA       NA       NA       0       0       0       0       0
    ## 275      NA      NA       NA       NA       0       0       0       0       0
    ## 276      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 277      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 278      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 279      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 280      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 281      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 282      NA      NA       NA       NA       0       0       0       0       0
    ## 283      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 284      NA      NA       NA       NA       0       0       0       0       0
    ## 285      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 286      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 287      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 288      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 289      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 290      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 291      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 292      NA      NA       NA       NA       0       0       0       0       0
    ## 293      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 294      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 295      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 296      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 297      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 298      NA      NA       NA       NA       0       0       0       0       0
    ## 299      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 300      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 301      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 302      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 303      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 304      NA      NA       NA       NA       0       1       0       0       0
    ## 305      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 306      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 307      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 308      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 309      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 310      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 311      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 312      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 313      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 314      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 315      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 316      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 317      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 318      NA      NA       NA       NA       0       0       0       0       0
    ## 319      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 320      NA      NA       NA       NA      -2      -2      -2      -2      -2
    ## 321      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 322      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 323      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 324      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 325      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 326      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 327      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 328      NA      NA       NA       NA       0       0       0       0       0
    ## 329      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 330      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 331      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 332      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 333      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 334      NA      NA       NA       NA       0       0       0       0       0
    ## 335      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 336      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 337      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 338      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 339      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 340      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 341      NA      NA       NA       NA       0       0       0       0       0
    ## 342      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 343      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 344      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 345      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 346      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 347      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 348      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 349      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 350      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 351      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 352      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 353      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 354      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 355      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 356      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 357      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 358      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 359      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 360      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 361      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 362      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 363      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 364      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 365      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 366      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 367      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 368      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 369      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 370      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 371      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 372      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 373      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 374      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 375      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 376      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 377      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 378      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 379      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 380      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 381      NA      NA       NA       NA       0       0       0       0       0
    ## 382      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 383      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 384      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 385      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 386      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 387      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 388      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 389      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 390      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 391      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 392      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 393      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 394      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 395      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 396      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 397      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 398      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 399      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 400      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 401      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 402      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 403      NA      NA       NA       NA       0       0       0       0       0
    ## 404      NA      NA       NA       NA       0       0       0       0       0
    ## 405      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 406      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 407      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 408      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 409      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 410      NA      NA       NA       NA       0       0       0       0       0
    ## 411      NA      NA       NA       NA       0       0       0       0       0
    ## 412      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 413      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 414      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 415      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 416      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 417      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 418      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 419      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 420      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 421      NA      NA       NA       NA       0       0       0       0       0
    ## 422      NA      NA       NA       NA       0       0       0       0       0
    ## 423      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 424      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 425      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 426      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 427      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 428      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 429      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 430      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 431      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 432      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 433      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 434      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 435      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 436      NA      NA       NA       NA       0       0       0       0       0
    ## 437      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 438      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 439      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 440      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 441      NA      NA       NA       NA       0       1       0       0       0
    ## 442      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 443      NA      NA       NA       NA       0       0       0       0       0
    ## 444      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 445      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 446      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 447      NA      NA       NA       NA       0       0       0       0       0
    ## 448      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 449      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 450      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 451      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 452      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 453      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 454      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 455      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 456      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 457      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 458      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 459      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 460      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 461      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 462      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 463      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 464      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 465      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 466      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 467      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 468      NA      NA       NA       NA       0       0       0       0       0
    ## 469      NA      NA       NA       NA       0       0       0       0       0
    ## 470      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 471      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 472      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 473      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 474      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 475      NA      NA       NA       NA       0       0       0       0       0
    ## 476      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 477      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 478      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 479      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 480      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 481      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 482      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 483      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 484      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 485      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 486      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 487      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 488      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 489      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 490      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 491      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ## 492      NA      NA       NA       NA      NA      NA      NA      NA      NA
    ##     frt47i6 frt47i7 frt47i8 frt47i9 frt41 frt42 frt45 frt46 sex32 sex33 sex34
    ## 1        NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 2        NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 3        NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 4         0       0       0       1     4     4    NA     2    -3    -3   -10
    ## 5         0       0       0       1     4     4    NA     2    -3    -3     2
    ## 6        NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 7        NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 8        NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 9        NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 10       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 11       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 12       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 13       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 14       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 15       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 16        0       0       0       1     4     4    NA     1    -3     2    -3
    ## 17       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 18        0       0       0       1     4     4    NA     2    -3     2    -3
    ## 19       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 20       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 21       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 22       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 23       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 24       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 25       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 26       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 27       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 28       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 29       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 30       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 31       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 32        0       0       0       0     4     4    NA     2    -3     2   -10
    ## 33       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 34       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 35       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 36       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 37       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 38       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 39       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 40       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 41       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 42       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 43       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 44        0       0       0       1     2     4    NA     2    -3     2    -3
    ## 45       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 46       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 47       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 48        0       0       0       1     3     1    NA     2    -3    -3     2
    ## 49       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 50       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 51       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 52       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 53       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 54       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 55       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 56       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 57       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 58       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 59       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 60       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 61       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 62       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 63       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 64       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 65       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 66       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 67       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 68       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 69        0       0       0       1     3     3    NA     2    -3    -3     2
    ## 70       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 71       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 72       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 73       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 74       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 75       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 76        0       0       0       1     4     4    NA     2    -3     2    -3
    ## 77       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 78       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 79       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 80       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 81       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 82       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 83       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 84       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 85       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 86       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 87       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 88       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 89       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 90       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 91       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 92        0       0       0       1     4    -3    NA    -3    -3     2    -3
    ## 93       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 94        0       0       0       1     3    -3    NA    -3    -3     2    -3
    ## 95       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 96       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 97       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 98       NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 99        0       0       0       1     3     3    NA     2    -3    -3     2
    ## 100      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 101      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 102      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 103      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 104      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 105      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 106      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 107      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 108      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 109       0       0       0       1     3     3    NA     2    -3     2    -3
    ## 110      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 111      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 112      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 113      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 114      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 115      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 116      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 117      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 118      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 119      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 120      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 121      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 122      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 123      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 124      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 125      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 126      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 127      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 128       0       0       0       1     4     4    NA     2    -3    -3     2
    ## 129      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 130      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 131      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 132      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 133      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 134      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 135      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 136      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 137      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 138      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 139       0       0       0       1     3     1    NA     2    -3    -3     2
    ## 140       0       0       0       1     3     1    NA     2    -3    -3     2
    ## 141       0       0       0       1     3     1    NA     2    -3    -3     2
    ## 142       0       0       0       1     1     4    NA     2    -3    -3     2
    ## 143      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 144      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 145      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 146      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 147      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 148      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 149      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 150      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 151      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 152      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 153      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 154      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 155      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 156      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 157      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 158       0       0       0       1     1     4    NA     2    -3    -3     2
    ## 159       0       0       0       1     2     4    NA     2    -3     2    -3
    ## 160      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 161      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 162      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 163      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 164      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 165       0       0       0       1     3     3    NA     2    -3    -3     2
    ## 166       0       0       0       1     3     4    NA     2    -3    -3     2
    ## 167      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 168      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 169      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 170      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 171      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 172      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 173      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 174      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 175      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 176      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 177      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 178      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 179      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 180      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 181      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 182      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 183      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 184      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 185      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 186      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 187      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 188      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 189      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 190      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 191      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 192      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 193      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 194      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 195      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 196      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 197      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 198      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 199      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 200      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 201      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 202      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 203      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 204      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 205      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 206      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 207      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 208      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 209      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 210      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 211      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 212      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 213      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 214      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 215      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 216      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 217       1       0       0       0     4     2    NA     2    -3     2    -3
    ## 218      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 219      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 220      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 221      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 222      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 223      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 224      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 225      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 226      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 227      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 228      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 229      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 230      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 231      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 232      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 233      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 234       0       0       0       1     4     4    NA     2    -3     2    -3
    ## 235      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 236      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 237      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 238      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 239      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 240      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 241      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 242       0       0       0       1     1     3    NA     2    -3    -3     2
    ## 243      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 244      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 245      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 246      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 247      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 248      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 249      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 250      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 251      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 252      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 253      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 254      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 255      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 256      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 257      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 258      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 259      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 260      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 261      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 262       1       1       1       0     3     3    NA     1    -3     2   -10
    ## 263      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 264      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 265      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 266      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 267      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 268      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 269      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 270      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 271      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 272      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 273      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 274       0       0       0       1     4     4    NA     2    -3    -3     2
    ## 275       0       0       0       1     3     3    NA     2    -3    -3     2
    ## 276      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 277      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 278      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 279      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 280      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 281      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 282       0       0       0       1     4     1    NA     2    -3     2    -3
    ## 283      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 284       0       0       0       1     3     3    NA     2    -3    -3     2
    ## 285      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 286      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 287      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 288      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 289      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 290      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 291      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 292       0       0       0       1     3     4    NA     2    -3     2   -10
    ## 293      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 294      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 295      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 296      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 297      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 298       0       0       0       1     3     3    NA     2    -3     2   -10
    ## 299      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 300      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 301      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 302      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 303      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 304       0       0       0       0     4     4    NA     1    -3    -3     2
    ## 305      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 306      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 307      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 308      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 309      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 310      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 311      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 312      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 313      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 314      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 315      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 316      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 317      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 318       0       0       0       1     4     4    NA     2    -3     2    -3
    ## 319      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 320      -2      -2      -2      -2     4     3    NA     2    -3     2    -3
    ## 321      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 322      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 323      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 324      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 325      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 326      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 327      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 328       0       0       0       1     4     4    NA     2    -3    -3     2
    ## 329      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 330      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 331      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 332      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 333      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 334       0       0       0       1     1     3    NA     2    -3    -3     2
    ## 335      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 336      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 337      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 338      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 339      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 340      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 341       0       0       0       1     3    -3    NA    -3    -3    -3    -3
    ## 342      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 343      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 344      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 345      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 346      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 347      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 348      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 349      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 350      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 351      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 352      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 353      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 354      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 355      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 356      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 357      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 358      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 359      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 360      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 361      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 362      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 363      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 364      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 365      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 366      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 367      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 368      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 369      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 370      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 371      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 372      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 373      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 374      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 375      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 376      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 377      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 378      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 379      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 380      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 381       0       0       0       1     4     4    NA     2    -3     2    -3
    ## 382      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 383      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 384      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 385      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 386      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 387      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 388      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 389      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 390      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 391      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 392      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 393      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 394      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 395      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 396      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 397      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 398      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 399      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 400      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 401      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 402      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 403       0       0       0       1     1     3    NA     2    -3     2    -3
    ## 404       0       0       0       1     1     4    NA     2    -3     2    -3
    ## 405      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 406      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 407      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 408      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 409      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 410       0       0       0       1    -3    -3    NA    -3     1     1    -3
    ## 411       0       0       0       1     4     4    NA     2    -3     2    -3
    ## 412      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 413      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 414      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 415      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 416      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 417      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 418      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 419      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 420      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 421       0       0       0       1     3    -3    NA    -3    -3     2    -3
    ## 422       0       0       0       1     4     4    NA     2    -3     2    -3
    ## 423      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 424      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 425      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 426      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 427      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 428      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 429      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 430      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 431      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 432      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 433      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 434      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 435      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 436       0       0       0       1     4     4    NA     2    -3    -3     2
    ## 437      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 438      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 439      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 440      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 441       0       0       1       0     3     3    NA     2    -3     2    -3
    ## 442      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 443       0       0       0       1     3    -8    NA     2    -3     2   -10
    ## 444      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 445      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 446      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 447       0       0       0       1     4     4    NA     2    -3    -3     2
    ## 448      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 449      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 450      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 451      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 452      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 453      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 454      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 455      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 456      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 457      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 458      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 459      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 460      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 461      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 462      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 463      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 464      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 465      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 466      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 467      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 468       0       0       0       1     3     3    NA     2    -3    -3     2
    ## 469       0       0       0       1     3     1    NA     2    -3     2    -3
    ## 470      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 471      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 472      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 473      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 474      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 475       0       0       0       1     3     2    NA     2    -3     2    -3
    ## 476      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 477      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 478      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 479      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 480      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 481      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 482      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 483      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 484      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 485      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 486      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 487      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 488      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 489      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 490      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 491      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ## 492      NA      NA      NA      NA    NA    NA    NA    NA    NA    NA    NA
    ##     omo19i1 omo19i2 val7i3 per3i7 val1i3 val1i5 val1i11 val1i12 val1i14 val1i15
    ## 1         4       2     NA      4     NA      2      NA      NA       4       1
    ## 2        NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 3        NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 4        NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 5        NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 6         5       5     NA      3     NA      2      NA      NA       4       2
    ## 7         4       2     NA      3     NA      4      NA      NA       4       2
    ## 8        NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 9        NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 10        2       1     NA      2     NA      3      NA      NA       4       3
    ## 11       NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 12       NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 13        6       5     NA      5     NA      1      NA      NA       5       1
    ## 14       NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 15       NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 16       NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 17        4       3     NA      1     NA      3      NA      NA       2       3
    ## 18       NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 19       NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 20        3       2     NA      2     NA      2      NA      NA       5       1
    ## 21       NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 22       NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 23        3       1     NA      4     NA      1      NA      NA       5       1
    ## 24       NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 25       NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 26        3       2     NA      4     NA      2      NA      NA       4       2
    ## 27       NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 28       NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 29        4       2     NA      5     NA      2      NA      NA       4       2
    ## 30       NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 31       NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 32       NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 33        5       4     NA      2     NA      2      NA      NA       4       2
    ## 34       NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 35       NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 36        6       5     NA      3     NA      4      NA      NA       2       3
    ## 37       NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 38       NA      NA     -2     NA     NA     NA      NA      NA      NA      NA
    ## 39        5       4     NA      3     NA      2      NA      NA       5       2
    ## 40       NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 41       NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 42        3       2     NA      4     NA      3      NA      NA       4       3
    ## 43       NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 44       NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 45        4       3     NA      4     NA      1      NA      NA       4       1
    ## 46       NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 47       NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 48       NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 49        6       6     NA      2     NA      2      NA      NA       5       2
    ## 50       NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 51       NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 52        3       1     NA      3     NA      1      NA      NA       5       1
    ## 53       NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 54       NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 55        5       4     NA      4     NA      1      NA      NA       4       1
    ## 56       NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 57       NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 58        6       5     NA      4     NA      1      NA      NA       5       1
    ## 59       NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 60       NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 61        4       3     NA      3     NA      3      NA      NA       4       3
    ## 62       NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 63       NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 64        4       2     NA      5     NA      1      NA      NA       5       1
    ## 65       NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 66       NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 67        6       4     NA      3     NA      1      NA      NA       5       1
    ## 68       NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 69       NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 70        5       4     NA      2     NA      1      NA      NA       5       1
    ## 71       NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 72       NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 73        3       3     NA      4     NA      1      NA      NA       5       1
    ## 74       NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 75       NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 76       NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 77        5       3     NA      4     NA      4      NA      NA       4       2
    ## 78       NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 79       NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 80        5       4     NA      4     NA      1      NA      NA       5       1
    ## 81       NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 82       NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 83        3       2     NA      3     NA      3      NA      NA       4       3
    ## 84       NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 85       NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 86        4       1     NA      3     NA      2      NA      NA       5       2
    ## 87       NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 88       NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 89        4       4     NA      4     NA      2      NA      NA       4       2
    ## 90       NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 91       NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 92       NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 93       NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 94       NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 95        3       2     NA      3     NA      4      NA      NA       4       2
    ## 96       NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 97        5       1     NA      4     NA      2      NA      NA       4       2
    ## 98       NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 99       NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 100       5       4     NA      4     NA      2      NA      NA       5       1
    ## 101      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 102      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 103       3       1     NA      4     NA      1      NA      NA       5       1
    ## 104      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 105      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 106       5       5     NA      2     NA      1      NA      NA       5       1
    ## 107      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 108      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 109      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 110       2       1     NA      3     NA      1      NA      NA       5       1
    ## 111      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 112      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 113       4       4     NA      4     NA      3      NA      NA       4       3
    ## 114      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 115      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 116       5       4     NA      4     NA      2      NA      NA       5       2
    ## 117      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 118      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 119       3       2     NA      4     NA      2      NA      NA       5       2
    ## 120      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 121      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 122       4       2     NA      2     NA      5      NA      NA       2       2
    ## 123      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 124       6       6     NA      5     NA      2      NA      NA       3       1
    ## 125      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 126      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 127       5       4     NA      3     NA      2      NA      NA       5       2
    ## 128      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 129      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 130       6       3     NA      3     NA      2      NA      NA       4       2
    ## 131      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 132      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 133       5       4     NA      4     NA      1      NA      NA       5       1
    ## 134      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 135      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 136       4       3     NA      4     NA      1      NA      NA       5       1
    ## 137      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 138      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 139      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 140      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 141      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 142      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 143       4       3     NA      2     NA      4      NA      NA       4       4
    ## 144      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 145      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 146       3       2     NA      5     NA      2      NA      NA       4       2
    ## 147      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 148      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 149       6       2     NA      5     NA      2      NA      NA       4       2
    ## 150      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 151      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 152       4       3     NA      3     NA      2      NA      NA       4       2
    ## 153      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 154      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 155       5       4     NA      3     NA      4      NA      NA       4       2
    ## 156      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 157      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 158      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 159      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 160      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 161      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 162       5       3     NA      4     NA      1      NA      NA       5       1
    ## 163      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 164      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 165      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 166      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 167      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 168       5       5     NA      4     NA      4      NA      NA       4       4
    ## 169      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 170      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 171       4       3     NA      2     NA      3      NA      NA       5       3
    ## 172      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 173      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 174      -2      -2     NA      5     NA      2      NA      NA       5       2
    ## 175      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 176      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 177       2       2     NA      2     NA      4      NA      NA       4       4
    ## 178      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 179      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 180       6       6     NA      3     NA      5      NA      NA       4       4
    ## 181      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 182      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 183       4       3     NA      4     NA      2      NA      NA       4       2
    ## 184      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 185      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 186       5       5     NA      3     NA      2      NA      NA       4       1
    ## 187      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 188      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 189       4       2     NA      4     NA      4      NA      NA       4       4
    ## 190      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 191      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 192       5       5     NA      4     NA      3      NA      NA       5       3
    ## 193      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 194      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 195       2       1     NA      5     NA      2      NA      NA       5       2
    ## 196      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 197      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 198       4       3     NA      4     NA      1      NA      NA       5       1
    ## 199      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 200      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 201       4       2     NA      3     NA      2      NA      NA       4       2
    ## 202      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 203      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 204       4       3     NA      2     NA      1      NA      NA       5       1
    ## 205      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 206      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 207       5       4     NA      4     NA      1      NA      NA       5       1
    ## 208      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 209      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 210       5       4     NA      4     NA      3      NA      NA       4       2
    ## 211      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 212      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 213       4       3     NA      2     NA      2      NA      NA       4       2
    ## 214      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 215      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 216       4       2     NA      2     NA      2      NA      NA       4       2
    ## 217      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 218      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 219       6       6     NA      5     NA      3      NA      NA       5       3
    ## 220      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 221      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 222       5       4     NA      3     NA      3      NA      NA       4       3
    ## 223      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 224      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 225       4       1     NA      2     NA      1      NA      NA       5       1
    ## 226      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 227      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 228       5       4     NA      4     NA      1      NA      NA       5       1
    ## 229      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 230      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 231       6       4     NA      4     NA      1      NA      NA       5       1
    ## 232      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 233      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 234      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 235      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 236      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 237       5       4     NA      4     NA      1      NA      NA       5       1
    ## 238      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 239      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 240       3       2     NA      4     NA      4      NA      NA       4       2
    ## 241      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 242      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 243       3       2     NA      4     NA      1      NA      NA       5       1
    ## 244      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 245      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 246       4       2     NA      5     NA      1      NA      NA       5       1
    ## 247      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 248      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 249       5       3     NA      3     NA      1      NA      NA       4       1
    ## 250      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 251      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 252       2       1     NA      4     NA      1      NA      NA       5       1
    ## 253      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 254      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 255       4       3     NA      3     NA      3      NA      NA       4       3
    ## 256      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 257      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 258       3       2     NA      5     NA      2      NA      NA       4       2
    ## 259      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 260      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 261      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 262      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 263       6       5     NA      3     NA      4      NA      NA       2       4
    ## 264      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 265      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 266       4       2     NA      3     NA      4      NA      NA       5       4
    ## 267      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 268      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 269       6       5     NA      2     NA      4      NA      NA       2       3
    ## 270      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 271      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 272       4       2     NA      4     NA      2      NA      NA       4       2
    ## 273      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 274      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 275      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 276      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 277       5       3     NA      4     NA      1      NA      NA       5       1
    ## 278      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 279      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 280       5       2     NA      4     NA      2      NA      NA       4       2
    ## 281      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 282      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 283       5       4     NA      3     NA      1      NA      NA       4       1
    ## 284      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 285      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 286       6       5     NA      2     NA      2      NA      NA       4       2
    ## 287      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 288      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 289       5       4     NA      4     NA      1      NA      NA       5       1
    ## 290      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 291      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 292      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 293      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 294      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 295       5       4     NA      5     NA      3      NA      NA       4       3
    ## 296      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 297      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 298      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 299      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 300      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 301       5       5     NA      2     NA      2      NA      NA       5       2
    ## 302      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 303      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 304      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 305       5       4     NA      2     NA      4      NA      NA       4       4
    ## 306      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 307      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 308       6       6     NA      4     NA      5      NA      NA       2       1
    ## 309      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 310      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 311       3       3     NA      2     NA      4      NA      NA       2       2
    ## 312      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 313      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 314       5       2     NA      3     NA      3      NA      NA       3       3
    ## 315      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 316      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 317       6       4     NA      4     NA      1      NA      NA       5       1
    ## 318      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 319      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 320      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 321      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 322      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 323       4       4     NA      5     NA      2      NA      NA       4       2
    ## 324      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 325      NA      NA     -2     NA     NA     NA      NA      NA      NA      NA
    ## 326       6       5     NA      3     NA      4      NA      NA       4       4
    ## 327      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 328      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 329       4       3     NA      2     NA      3      NA      NA       4       3
    ## 330      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 331      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 332       5       4     NA      3     NA      3      NA      NA       5       3
    ## 333      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 334      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 335       5       2     NA      4     NA      3      NA      NA       3       3
    ## 336      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 337      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 338       6       6     NA      3     NA      1      NA      NA       5       1
    ## 339      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 340      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 341      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 342       6       6     NA      1     NA      1      NA      NA       5       1
    ## 343      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 344      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 345       5       3     NA      3     NA      4      NA      NA       2       4
    ## 346      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 347      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 348       3       2     NA      2     NA      1      NA      NA       4       1
    ## 349      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 350      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 351       6       5     NA      3     NA      3      NA      NA       2       3
    ## 352      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 353      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 354       6       4     NA      4     NA      1      NA      NA       5       1
    ## 355      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 356      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 357       5       2     NA      4     NA      4      NA      NA       2       3
    ## 358      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 359      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 360       5       5     NA      4     NA      4      NA      NA       3       4
    ## 361      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 362      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 363       3       2     NA      3     NA      1      NA      NA       5       1
    ## 364      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 365      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 366       4       3     NA      4     NA      2      NA      NA       4       2
    ## 367      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 368      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 369       3       1     NA      4     NA      2      NA      NA       4       2
    ## 370      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 371      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 372       6       3     NA      5     NA      1      NA      NA       5       1
    ## 373      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 374      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 375       6       3     NA      3     NA      1      NA      NA       5       1
    ## 376      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 377      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 378       3       2     NA      4     NA      2      NA      NA       5       2
    ## 379      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 380      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 381      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 382      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 383      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 384       5       5     NA      3     NA      1      NA      NA       5       1
    ## 385      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 386      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 387       3       2     NA      5     NA      2      NA      NA       5       2
    ## 388      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 389      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 390       5       4     NA      4     NA      1      NA      NA       5       1
    ## 391      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 392      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 393       3       3     NA      4     NA      2      NA      NA       4       2
    ## 394      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 395      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 396       5       3     NA      3     NA      3      NA      NA       4       3
    ## 397      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 398      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 399       5       4     NA      4     NA      2      NA      NA       4       2
    ## 400      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 401      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 402       5       4     NA      3     NA      2      NA      NA       4       2
    ## 403      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 404      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 405       3       2     NA      4     NA      2      NA      NA       4       2
    ## 406      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 407      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 408       4       2     NA      4     NA      1      NA      NA       5       1
    ## 409       3       2     NA      2     NA      3      NA      NA       2       3
    ## 410      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 411      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 412      -2      -2     NA      4     NA      1      NA      NA       5       1
    ## 413      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 414      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 415       5       4     NA      3     NA      3      NA      NA       5       3
    ## 416      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 417      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 418       3       2     NA      3     NA      3      NA      NA       4       3
    ## 419      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 420      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 421      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 422      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 423      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 424      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 425       6       5     NA      2     NA      1      NA      NA       4       1
    ## 426      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 427      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 428       4       1     NA      4     NA      3      NA      NA       4       2
    ## 429      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 430       3       2     NA      3     NA      3      NA      NA       5       3
    ## 431      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 432      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 433       3       3     NA      3     NA      2      NA      NA       5       2
    ## 434      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 435      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 436      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 437       6       5     NA      1     NA      1      NA      NA       5       1
    ## 438       4       3     NA      3     NA      2      NA      NA       4       2
    ## 439      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 440      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 441      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 442       4       3     NA      4     NA      3      NA      NA       5       3
    ## 443      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 444      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 445      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 446       5       4     NA      4     NA      1      NA      NA       5       1
    ## 447      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 448      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 449       5       4     NA      3     NA      2      NA      NA       4       2
    ## 450      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 451      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 452       5       3     NA      4     NA      1      NA      NA       5       1
    ## 453      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 454      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 455       6       3     NA      3     NA      1      NA      NA       2       1
    ## 456      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 457      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 458       6       6     NA      4     NA      2      NA      NA       5       2
    ## 459      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 460      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 461       3       3     NA      4     NA      1      NA      NA       4       1
    ## 462      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 463      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 464       4       3     NA      4     NA      2      NA      NA       4       2
    ## 465      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 466      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 467       5       4     NA      2     NA      2      NA      NA       4       2
    ## 468      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 469      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 470       5       4     NA      3     NA      5      NA      NA       4       4
    ## 471      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 472      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 473       5       3     NA      5     NA      2      NA      NA       5       1
    ## 474      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 475      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 476       4       3     NA      4     NA      1      NA      NA       5       1
    ## 477      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 478      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 479       5       5     NA      3     NA      2      NA      NA       4       2
    ## 480      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 481      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 482       2       1     NA      3     NA      3      NA      NA       4       3
    ## 483      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 484      NA      NA      2     NA     NA     NA      NA      NA      NA      NA
    ## 485       5       3     NA      4     NA      3      NA      NA       2       3
    ## 486      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 487      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 488       6       4     NA      4     NA      4      NA      NA       4       4
    ## 489      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ## 490      NA      NA      1     NA     NA     NA      NA      NA      NA      NA
    ## 491       3       2     NA      4     NA      1      NA      NA       5       1
    ## 492      NA      NA     NA     NA     NA     NA      NA      NA      NA      NA
    ##     val1i16 val1i17 val9i1 val9i6 val10i1 val10i2 val10i3 val10i4 val10i5
    ## 1         1       4     NA     NA      NA      NA      NA      NA      NA
    ## 2        NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 3        NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 4        NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 5        NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 6         2       4     NA     NA      NA      NA      NA      NA      NA
    ## 7         5       4     NA     NA      NA      NA      NA      NA      NA
    ## 8        NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 9        NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 10        4       4     NA     NA      NA      NA      NA      NA      NA
    ## 11       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 12       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 13        1       5     NA     NA      NA      NA      NA      NA      NA
    ## 14       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 15       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 16       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 17        3       2     NA     NA      NA      NA      NA      NA      NA
    ## 18       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 19       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 20        2       5     NA     NA      NA      NA      NA      NA      NA
    ## 21       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 22       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 23        2       5     NA     NA      NA      NA      NA      NA      NA
    ## 24       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 25       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 26        2       4     NA     NA      NA      NA      NA      NA      NA
    ## 27       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 28       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 29        1       4     NA     NA      NA      NA      NA      NA      NA
    ## 30       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 31       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 32       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 33        3       4     NA     NA      NA      NA      NA      NA      NA
    ## 34       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 35       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 36        5       3     NA     NA      NA      NA      NA      NA      NA
    ## 37       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 38       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 39        2       5     NA     NA      NA      NA      NA      NA      NA
    ## 40       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 41       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 42        3       4     NA     NA      NA      NA      NA      NA      NA
    ## 43       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 44       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 45        1       4     NA     NA      NA      NA      NA      NA      NA
    ## 46       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 47       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 48       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 49        2       5     NA     NA      NA      NA      NA      NA      NA
    ## 50       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 51       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 52        1       5     NA     NA      NA      NA      NA      NA      NA
    ## 53       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 54       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 55        2       4     NA     NA      NA      NA      NA      NA      NA
    ## 56       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 57       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 58        1       5     NA     NA      NA      NA      NA      NA      NA
    ## 59       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 60       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 61        4       4     NA     NA      NA      NA      NA      NA      NA
    ## 62       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 63       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 64        1       5     NA     NA      NA      NA      NA      NA      NA
    ## 65       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 66       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 67        1       5     NA     NA      NA      NA      NA      NA      NA
    ## 68       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 69       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 70        2       5     NA     NA      NA      NA      NA      NA      NA
    ## 71       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 72       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 73        1       5     NA     NA      NA      NA      NA      NA      NA
    ## 74       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 75       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 76       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 77        4       4     NA     NA      NA      NA      NA      NA      NA
    ## 78       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 79       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 80        2       5     NA     NA      NA      NA      NA      NA      NA
    ## 81       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 82       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 83        3       4     NA     NA      NA      NA      NA      NA      NA
    ## 84       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 85       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 86        2       5     NA     NA      NA      NA      NA      NA      NA
    ## 87       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 88       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 89        3       4     NA     NA      NA      NA      NA      NA      NA
    ## 90       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 91       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 92       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 93       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 94       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 95        4       4     NA     NA      NA      NA      NA      NA      NA
    ## 96       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 97        2       4     NA     NA      NA      NA      NA      NA      NA
    ## 98       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 99       NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 100       2       4     NA     NA      NA      NA      NA      NA      NA
    ## 101      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 102      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 103       1       5     NA     NA      NA      NA      NA      NA      NA
    ## 104      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 105      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 106       1       5     NA     NA      NA      NA      NA      NA      NA
    ## 107      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 108      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 109      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 110       1       5     NA     NA      NA      NA      NA      NA      NA
    ## 111      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 112      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 113       3       4     NA     NA      NA      NA      NA      NA      NA
    ## 114      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 115      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 116       2       5     NA     NA      NA      NA      NA      NA      NA
    ## 117      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 118      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 119       2       5     NA     NA      NA      NA      NA      NA      NA
    ## 120      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 121      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 122       5       5     NA     NA      NA      NA      NA      NA      NA
    ## 123      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 124       2       3     NA     NA      NA      NA      NA      NA      NA
    ## 125      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 126      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 127       2       5     NA     NA      NA      NA      NA      NA      NA
    ## 128      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 129      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 130       2       4     NA     NA      NA      NA      NA      NA      NA
    ## 131      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 132      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 133       1       5     NA     NA      NA      NA      NA      NA      NA
    ## 134      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 135      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 136       1       5     NA     NA      NA      NA      NA      NA      NA
    ## 137      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 138      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 139      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 140      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 141      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 142      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 143       4       4     NA     NA      NA      NA      NA      NA      NA
    ## 144      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 145      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 146       2       4     NA     NA      NA      NA      NA      NA      NA
    ## 147      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 148      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 149       2       4     NA     NA      NA      NA      NA      NA      NA
    ## 150      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 151      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 152       2       4     NA     NA      NA      NA      NA      NA      NA
    ## 153      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 154      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 155       4       4     NA     NA      NA      NA      NA      NA      NA
    ## 156      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 157      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 158      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 159      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 160      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 161      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 162       2       5     NA     NA      NA      NA      NA      NA      NA
    ## 163      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 164      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 165      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 166      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 167      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 168       4       4     NA     NA      NA      NA      NA      NA      NA
    ## 169      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 170      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 171       3       5     NA     NA      NA      NA      NA      NA      NA
    ## 172      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 173      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 174       2       5     NA     NA      NA      NA      NA      NA      NA
    ## 175      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 176      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 177       4       4     NA     NA      NA      NA      NA      NA      NA
    ## 178      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 179      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 180       5       4     NA     NA      NA      NA      NA      NA      NA
    ## 181      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 182      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 183       4       4     NA     NA      NA      NA      NA      NA      NA
    ## 184      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 185      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 186       2       3     NA     NA      NA      NA      NA      NA      NA
    ## 187      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 188      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 189       4       4     NA     NA      NA      NA      NA      NA      NA
    ## 190      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 191      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 192       3       5     NA     NA      NA      NA      NA      NA      NA
    ## 193      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 194      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 195       5       5     NA     NA      NA      NA      NA      NA      NA
    ## 196      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 197      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 198       1       5     NA     NA      NA      NA      NA      NA      NA
    ## 199      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 200      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 201       2       4     NA     NA      NA      NA      NA      NA      NA
    ## 202      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 203      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 204       1       5     NA     NA      NA      NA      NA      NA      NA
    ## 205      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 206      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 207       1       5     NA     NA      NA      NA      NA      NA      NA
    ## 208      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 209      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 210       4       4     NA     NA      NA      NA      NA      NA      NA
    ## 211      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 212      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 213       4       4     NA     NA      NA      NA      NA      NA      NA
    ## 214      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 215      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 216       2       3     NA     NA      NA      NA      NA      NA      NA
    ## 217      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 218      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 219       4       5     NA     NA      NA      NA      NA      NA      NA
    ## 220      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 221      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 222       3       4     NA     NA      NA      NA      NA      NA      NA
    ## 223      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 224      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 225       1       5     NA     NA      NA      NA      NA      NA      NA
    ## 226      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 227      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 228       1       5     NA     NA      NA      NA      NA      NA      NA
    ## 229      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 230      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 231       1       5     NA     NA      NA      NA      NA      NA      NA
    ## 232      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 233      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 234      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 235      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 236      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 237       1       5     NA     NA      NA      NA      NA      NA      NA
    ## 238      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 239      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 240       4       4     NA     NA      NA      NA      NA      NA      NA
    ## 241      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 242      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 243       2       5     NA     NA      NA      NA      NA      NA      NA
    ## 244      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 245      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 246       1       5     NA     NA      NA      NA      NA      NA      NA
    ## 247      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 248      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 249       3       4     NA     NA      NA      NA      NA      NA      NA
    ## 250      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 251      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 252       1       5     NA     NA      NA      NA      NA      NA      NA
    ## 253      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 254      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 255       3       4     NA     NA      NA      NA      NA      NA      NA
    ## 256      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 257      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 258       2       4     NA     NA      NA      NA      NA      NA      NA
    ## 259      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 260      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 261      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 262      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 263       5       2     NA     NA      NA      NA      NA      NA      NA
    ## 264      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 265      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 266       3       5     NA     NA      NA      NA      NA      NA      NA
    ## 267      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 268      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 269       5       3     NA     NA      NA      NA      NA      NA      NA
    ## 270      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 271      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 272       4       4     NA     NA      NA      NA      NA      NA      NA
    ## 273      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 274      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 275      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 276      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 277       1       5     NA     NA      NA      NA      NA      NA      NA
    ## 278      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 279      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 280       2       4     NA     NA      NA      NA      NA      NA      NA
    ## 281      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 282      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 283       2       4     NA     NA      NA      NA      NA      NA      NA
    ## 284      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 285      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 286       2       4     NA     NA      NA      NA      NA      NA      NA
    ## 287      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 288      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 289       1       5     NA     NA      NA      NA      NA      NA      NA
    ## 290      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 291      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 292      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 293      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 294      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 295       3       4     NA     NA      NA      NA      NA      NA      NA
    ## 296      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 297      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 298      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 299      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 300      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 301       3       5     NA     NA      NA      NA      NA      NA      NA
    ## 302      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 303      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 304      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 305       4       4     NA     NA      NA      NA      NA      NA      NA
    ## 306      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 307      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 308       5       5     NA     NA      NA      NA      NA      NA      NA
    ## 309      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 310      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 311       4       4     NA     NA      NA      NA      NA      NA      NA
    ## 312      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 313      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 314       3       3     NA     NA      NA      NA      NA      NA      NA
    ## 315      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 316      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 317       1       5     NA     NA      NA      NA      NA      NA      NA
    ## 318      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 319      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 320      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 321      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 322      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 323       2       4     NA     NA      NA      NA      NA      NA      NA
    ## 324      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 325      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 326       5       4     NA     NA      NA      NA      NA      NA      NA
    ## 327      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 328      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 329       3       4     NA     NA      NA      NA      NA      NA      NA
    ## 330      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 331      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 332       3       5     NA     NA      NA      NA      NA      NA      NA
    ## 333      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 334      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 335       3       4     NA     NA      NA      NA      NA      NA      NA
    ## 336      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 337      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 338       1       5     NA     NA      NA      NA      NA      NA      NA
    ## 339      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 340      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 341      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 342       3       5     NA     NA      NA      NA      NA      NA      NA
    ## 343      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 344      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 345       4       2     NA     NA      NA      NA      NA      NA      NA
    ## 346      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 347      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 348       2       4     NA     NA      NA      NA      NA      NA      NA
    ## 349      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 350      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 351       4       2     NA     NA      NA      NA      NA      NA      NA
    ## 352      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 353      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 354       1       5     NA     NA      NA      NA      NA      NA      NA
    ## 355      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 356      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 357       4       3     NA     NA      NA      NA      NA      NA      NA
    ## 358      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 359      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 360       5       3     NA     NA      NA      NA      NA      NA      NA
    ## 361      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 362      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 363       1       5     NA     NA      NA      NA      NA      NA      NA
    ## 364      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 365      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 366       2       4     NA     NA      NA      NA      NA      NA      NA
    ## 367      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 368      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 369       2       4     NA     NA      NA      NA      NA      NA      NA
    ## 370      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 371      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 372       1       5     NA     NA      NA      NA      NA      NA      NA
    ## 373      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 374      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 375       1       5     NA     NA      NA      NA      NA      NA      NA
    ## 376      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 377      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 378       2       5     NA     NA      NA      NA      NA      NA      NA
    ## 379      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 380      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 381      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 382      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 383      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 384       1       5     NA     NA      NA      NA      NA      NA      NA
    ## 385      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 386      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 387       2       5     NA     NA      NA      NA      NA      NA      NA
    ## 388      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 389      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 390       1       5     NA     NA      NA      NA      NA      NA      NA
    ## 391      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 392      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 393       2       4     NA     NA      NA      NA      NA      NA      NA
    ## 394      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 395      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 396       3       4     NA     NA      NA      NA      NA      NA      NA
    ## 397      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 398      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 399       2       4     NA     NA      NA      NA      NA      NA      NA
    ## 400      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 401      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 402       2       4     NA     NA      NA      NA      NA      NA      NA
    ## 403      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 404      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 405       2       4     NA     NA      NA      NA      NA      NA      NA
    ## 406      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 407      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 408       1       5     NA     NA      NA      NA      NA      NA      NA
    ## 409       4       2     NA     NA      NA      NA      NA      NA      NA
    ## 410      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 411      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 412       1       5     NA     NA      NA      NA      NA      NA      NA
    ## 413      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 414      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 415       4       5     NA     NA      NA      NA      NA      NA      NA
    ## 416      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 417      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 418       4       4     NA     NA      NA      NA      NA      NA      NA
    ## 419      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 420      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 421      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 422      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 423      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 424      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 425       1       4     NA     NA      NA      NA      NA      NA      NA
    ## 426      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 427      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 428       3       4     NA     NA      NA      NA      NA      NA      NA
    ## 429      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 430       3       5     NA     NA      NA      NA      NA      NA      NA
    ## 431      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 432      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 433       2       5     NA     NA      NA      NA      NA      NA      NA
    ## 434      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 435      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 436      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 437       1       5     NA     NA      NA      NA      NA      NA      NA
    ## 438       2       4     NA     NA      NA      NA      NA      NA      NA
    ## 439      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 440      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 441      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 442       3       5     NA     NA      NA      NA      NA      NA      NA
    ## 443      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 444      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 445      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 446       1       5     NA     NA      NA      NA      NA      NA      NA
    ## 447      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 448      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 449       2       3     NA     NA      NA      NA      NA      NA      NA
    ## 450      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 451      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 452       1       5     NA     NA      NA      NA      NA      NA      NA
    ## 453      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 454      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 455       2       2     NA     NA      NA      NA      NA      NA      NA
    ## 456      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 457      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 458       3       5     NA     NA      NA      NA      NA      NA      NA
    ## 459      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 460      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 461       1       4     NA     NA      NA      NA      NA      NA      NA
    ## 462      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 463      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 464       2       4     NA     NA      NA      NA      NA      NA      NA
    ## 465      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 466      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 467       2       4     NA     NA      NA      NA      NA      NA      NA
    ## 468      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 469      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 470       4       4     NA     NA      NA      NA      NA      NA      NA
    ## 471      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 472      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 473       2       5     NA     NA      NA      NA      NA      NA      NA
    ## 474      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 475      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 476       1       5     NA     NA      NA      NA      NA      NA      NA
    ## 477      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 478      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 479       2       4     NA     NA      NA      NA      NA      NA      NA
    ## 480      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 481      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 482       2       4     NA     NA      NA      NA      NA      NA      NA
    ## 483      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 484      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 485       4       2     NA     NA      NA      NA      NA      NA      NA
    ## 486      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 487      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 488       5       4     NA     NA      NA      NA      NA      NA      NA
    ## 489      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 490      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ## 491       1       5     NA     NA      NA      NA      NA      NA      NA
    ## 492      NA      NA     NA     NA      NA      NA      NA      NA      NA
    ##     val11i1 val11i2 val11i3 val11i4 val2i7 val2i8 val2i9 val13i1 val13i2
    ## 1         2    25.0       1      -3     NA     NA     NA      NA      NA
    ## 2         1    -3.0       1      -3     NA     NA     NA       4       4
    ## 3        NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 4        NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 5        NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 6        -2    -3.0      -2      -3     NA     NA     NA      NA      NA
    ## 7         2    15.0       1      -3     NA     NA     NA      NA      NA
    ## 8         2    20.0       1      -3     NA     NA     NA       2       4
    ## 9        NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 10        2    15.0       2      15     NA     NA     NA      NA      NA
    ## 11        2    15.0       2      20     NA     NA     NA       3       3
    ## 12       NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 13        2    25.0       2      25     NA     NA     NA      NA      NA
    ## 14        1    -3.0       1      -3     NA     NA     NA       5       4
    ## 15       NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 16       NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 17        2    25.0       1      -3     NA     NA     NA      NA      NA
    ## 18       NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 19       NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 20        2    30.0       1      -3     NA     NA     NA      NA      NA
    ## 21        2    30.0       1      -3     NA     NA     NA       4       5
    ## 22       NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 23        2    30.0       2      30     NA     NA     NA      NA      NA
    ## 24        2    20.0       2      20     NA     NA     NA       4       2
    ## 25       NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 26        2    25.0       1      -3     NA     NA     NA      NA      NA
    ## 27        2    25.0       1      -3     NA     NA     NA       4       2
    ## 28       NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 29        2    20.0       2      30     NA     NA     NA      NA      NA
    ## 30        3    -3.0       2      30     NA     NA     NA       4       3
    ## 31       NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 32       NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 33        1    -3.0       1      -3     NA     NA     NA      NA      NA
    ## 34        2    32.0       2      32     NA     NA     NA       5       5
    ## 35       NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 36        3    -3.0       1      -3     NA     NA     NA      NA      NA
    ## 37        3    -3.0       2      30     NA     NA     NA       1       1
    ## 38       NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 39        1    -3.0       1      -3     NA     NA     NA      NA      NA
    ## 40        1    -3.0       1      -3     NA     NA     NA       5       5
    ## 41       NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 42        2    15.0       2      20     NA     NA     NA      NA      NA
    ## 43        2    15.0       2      15     NA     NA     NA       2       3
    ## 44       NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 45        2    20.0       1      -3     NA     NA     NA      NA      NA
    ## 46        2    30.0       1      -3     NA     NA     NA       1       1
    ## 47       NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 48       NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 49        2    15.0       1      -3     NA     NA     NA      NA      NA
    ## 50        2    20.0       2      25     NA     NA     NA       4       3
    ## 51       NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 52        2    25.0       2      30     NA     NA     NA      NA      NA
    ## 53        2    32.0       2      32     NA     NA     NA       4       3
    ## 54       NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 55        1    -3.0       1      -3     NA     NA     NA      NA      NA
    ## 56        1    -3.0       1      -3     NA     NA     NA       4       4
    ## 57       NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 58        2    24.0       2      24     NA     NA     NA      NA      NA
    ## 59        2    20.0       2      20     NA     NA     NA       4       1
    ## 60       NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 61        1    -3.0       1      -3     NA     NA     NA      NA      NA
    ## 62        1    -3.0       1      -3     NA     NA     NA       5       4
    ## 63       NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 64        2     8.0       2      33     NA     NA     NA      NA      NA
    ## 65        2     9.0       1      -3     NA     NA     NA       5       2
    ## 66       NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 67        1    -3.0       1      -3     NA     NA     NA      NA      NA
    ## 68        1    -3.0       1      -3     NA     NA     NA       5       5
    ## 69       NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 70        2    20.0       2      20     NA     NA     NA      NA      NA
    ## 71        2    30.0       2      30     NA     NA     NA       2       4
    ## 72       NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 73        1    -3.0       1      -3     NA     NA     NA      NA      NA
    ## 74        1    -3.0       1      -3     NA     NA     NA       5       5
    ## 75       NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 76       NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 77        2    25.0       1      -3     NA     NA     NA      NA      NA
    ## 78        2    20.0       1      -3     NA     NA     NA       2       3
    ## 79       NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 80        2    20.0       1      -3     NA     NA     NA      NA      NA
    ## 81        2    25.0       1      -3     NA     NA     NA       4       4
    ## 82       NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 83        1    -3.0       1      -3     NA     NA     NA      NA      NA
    ## 84        2    30.0       1      -3     NA     NA     NA       4       4
    ## 85       NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 86        2    20.0       2      20     NA     NA     NA      NA      NA
    ## 87        2    20.0       1      -3     NA     NA     NA       5       2
    ## 88       NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 89       -2    -3.0      -2      -3     NA     NA     NA      NA      NA
    ## 90       -2    -3.0      -2      -3     NA     NA     NA       4       4
    ## 91       NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 92       NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 93        2    35.0       1      -3     NA     NA     NA       4       4
    ## 94       NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 95        2    20.0       2      30     NA     NA     NA      NA      NA
    ## 96        2    15.0       1      -3     NA     NA     NA       4       2
    ## 97        1    -3.0       1      -3     NA     NA     NA      NA      NA
    ## 98        1    -3.0       1      -3     NA     NA     NA       5       5
    ## 99       NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 100       2    20.0       2      30     NA     NA     NA      NA      NA
    ## 101       2    20.0       2      20     NA     NA     NA       2       1
    ## 102      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 103       2    30.0       2      30     NA     NA     NA      NA      NA
    ## 104       2    30.0       2      30     NA     NA     NA       4       3
    ## 105      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 106       1    -3.0       1      -3     NA     NA     NA      NA      NA
    ## 107       1    -3.0       1      -3     NA     NA     NA       5       4
    ## 108      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 109      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 110       2    30.0       2      30     NA     NA     NA      NA      NA
    ## 111       2    30.0       2      30     NA     NA     NA       5       5
    ## 112      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 113       2    20.0       2      35     NA     NA     NA      NA      NA
    ## 114       2    25.0       2      30     NA     NA     NA       4       3
    ## 115      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 116      -2    -3.0      -2      -3     NA     NA     NA      NA      NA
    ## 117       2    20.0       2      20     NA     NA     NA       4       2
    ## 118      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 119       2    -2.0       2      -2     NA     NA     NA      NA      NA
    ## 120       2    -2.0       2      -2     NA     NA     NA       4       1
    ## 121      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 122       3    -4.0       1      -3     NA     NA     NA      NA      NA
    ## 123      -2    -4.0       1      -3     NA     NA     NA       1       5
    ## 124       2    16.0       1      -3     NA     NA     NA      NA      NA
    ## 125       3    -3.0       3      -3     NA     NA     NA       1       1
    ## 126      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 127       2    20.0       1      -3     NA     NA     NA      NA      NA
    ## 128      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 129      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 130       1    -3.0       1      -3     NA     NA     NA      NA      NA
    ## 131       2    25.0       2      25     NA     NA     NA       4       2
    ## 132      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 133       1    -3.0       1      -3     NA     NA     NA      NA      NA
    ## 134       1    -3.0       1      -3     NA     NA     NA       5       4
    ## 135      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 136       2    20.0       2      20     NA     NA     NA      NA      NA
    ## 137       2    20.0       2      20     NA     NA     NA       5       3
    ## 138      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 139      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 140      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 141      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 142      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 143       2    20.0       1      -3     NA     NA     NA      NA      NA
    ## 144       3    -3.0       3      -3     NA     NA     NA       1       3
    ## 145      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 146       2    15.0       2      15     NA     NA     NA      NA      NA
    ## 147       2    15.0       2      30     NA     NA     NA       2       2
    ## 148      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 149       2    35.0       2      35     NA     NA     NA      NA      NA
    ## 150       2    35.0       2      35     NA     NA     NA       4       4
    ## 151      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 152       2    30.0       1      -3     NA     NA     NA      NA      NA
    ## 153       2    30.0       1      -3     NA     NA     NA       2       2
    ## 154      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 155       2    20.0       1      -3     NA     NA     NA      NA      NA
    ## 156       2    20.0       1      -3     NA     NA     NA       4       4
    ## 157      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 158      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 159      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 160       2    25.0       2      35     NA     NA     NA       2       2
    ## 161      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 162       2    30.0       2      30     NA     NA     NA      NA      NA
    ## 163       2    30.0       2      30     NA     NA     NA       4       4
    ## 164      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 165      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 166      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 167      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 168       3    -3.0       2      30     NA     NA     NA      NA      NA
    ## 169       2    20.0       1      -3     NA     NA     NA       2       2
    ## 170      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 171       1    -3.0       3      -3     NA     NA     NA      NA      NA
    ## 172       1    -3.0       1      -3     NA     NA     NA       4       4
    ## 173      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 174      -2    -3.0      -2      -3     NA     NA     NA      NA      NA
    ## 175       2    -2.0       2      -2     NA     NA     NA       4       2
    ## 176      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 177       2    30.0       1      -3     NA     NA     NA      NA      NA
    ## 178       3    -3.0       2      28     NA     NA     NA       4       4
    ## 179      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 180       3    -3.0       1      -3     NA     NA     NA      NA      NA
    ## 181       2    20.0       1      -3     NA     NA     NA       5       5
    ## 182      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 183       2    20.0       2      20     NA     NA     NA      NA      NA
    ## 184       2    20.0       2      20     NA     NA     NA       3       4
    ## 185      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 186       2    15.0       1      -3     NA     NA     NA      NA      NA
    ## 187       2    20.0       1      -3     NA     NA     NA       2       2
    ## 188      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 189       2    26.0       1      -3     NA     NA     NA      NA      NA
    ## 190       2    20.0       2      20     NA     NA     NA       4       3
    ## 191      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 192       2    25.0       1      -3     NA     NA     NA      NA      NA
    ## 193       2    25.0       1      -3     NA     NA     NA       5       5
    ## 194      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 195       2    20.0       2      20     NA     NA     NA      NA      NA
    ## 196       3    -3.0       2      20     NA     NA     NA       2       2
    ## 197      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 198       1    -3.0       1      -3     NA     NA     NA      NA      NA
    ## 199       1    -3.0       1      -3     NA     NA     NA       4       3
    ## 200      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 201       1    -3.0       2      20     NA     NA     NA      NA      NA
    ## 202       1    -3.0       2      30     NA     NA     NA       4       4
    ## 203      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 204       2    19.5       1      -3     NA     NA     NA      NA      NA
    ## 205       3    -3.0       1      -3     NA     NA     NA       5       5
    ## 206      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 207       2    30.0       2      30     NA     NA     NA      NA      NA
    ## 208       2    30.0       1      -3     NA     NA     NA       5       5
    ## 209      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 210       2    15.0       1      -3     NA     NA     NA      NA      NA
    ## 211       2    20.0       1      -3     NA     NA     NA       1       2
    ## 212      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 213       2    20.0       2      20     NA     NA     NA      NA      NA
    ## 214       2    25.0       2      25     NA     NA     NA       2       4
    ## 215      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 216       2    25.0       1      -3     NA     NA     NA      NA      NA
    ## 217      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 218      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 219       1    -3.0       1      -3     NA     NA     NA      NA      NA
    ## 220       2    20.0       2      20     NA     NA     NA       4       3
    ## 221      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 222       2    20.0       1      -3     NA     NA     NA      NA      NA
    ## 223       2    30.0       1      -3     NA     NA     NA       4       4
    ## 224      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 225       2    20.0       1      -3     NA     NA     NA      NA      NA
    ## 226       2    25.0       2      30     NA     NA     NA       2       3
    ## 227      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 228       2    25.0       1      -3     NA     NA     NA      NA      NA
    ## 229       1    -3.0       1      -3     NA     NA     NA       5       5
    ## 230      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 231       2    30.0       2      30     NA     NA     NA      NA      NA
    ## 232       2    30.0       2      30     NA     NA     NA       5       3
    ## 233      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 234      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 235       2    30.0       2      30     NA     NA     NA       5       5
    ## 236      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 237       2    15.0       1      -3     NA     NA     NA      NA      NA
    ## 238       2    20.0       1      -3     NA     NA     NA       4       5
    ## 239      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 240       3    -3.0       1      -3     NA     NA     NA      NA      NA
    ## 241       3    -3.0       1      -3     NA     NA     NA       2       4
    ## 242      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 243       1    -3.0       1      -3     NA     NA     NA      NA      NA
    ## 244       2    24.0       1      -3     NA     NA     NA       5       4
    ## 245      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 246       1    -3.0       1      -3     NA     NA     NA      NA      NA
    ## 247       1    -3.0       2      20     NA     NA     NA       5       5
    ## 248      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 249       2    20.0      -2      -3     NA     NA     NA      NA      NA
    ## 250       2    25.0       1      -3     NA     NA     NA       3       3
    ## 251      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 252       2    35.0       2      35     NA     NA     NA      NA      NA
    ## 253       2    35.0       2      35     NA     NA     NA       5       5
    ## 254      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 255       1    -3.0       1      -3     NA     NA     NA      NA      NA
    ## 256       1    -3.0       1      -3     NA     NA     NA       4       5
    ## 257      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 258       2    10.0       1      -3     NA     NA     NA      NA      NA
    ## 259       2     8.0      -2      -3     NA     NA     NA       4       2
    ## 260      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 261       1    -4.0       1      -4     NA     NA     NA       5       3
    ## 262      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 263       2    10.0       1      -3     NA     NA     NA      NA      NA
    ## 264       2    20.0       1      -3     NA     NA     NA       1       1
    ## 265      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 266       2    10.0       1      -3     NA     NA     NA      NA      NA
    ## 267       2    20.0       1      -3     NA     NA     NA       4       5
    ## 268      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 269       3    -3.0       2      35     NA     NA     NA      NA      NA
    ## 270       3    -3.0       2      25     NA     NA     NA       1       1
    ## 271      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 272       2    20.0       1      -3     NA     NA     NA      NA      NA
    ## 273       2    25.0       1      -3     NA     NA     NA       2       2
    ## 274      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 275      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 276       2    20.0       1      -3     NA     NA     NA       4       4
    ## 277      -2    -3.0      -2      -3     NA     NA     NA      NA      NA
    ## 278       2    30.0       2      30     NA     NA     NA       1       1
    ## 279      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 280       2    10.0       2      30     NA     NA     NA      NA      NA
    ## 281       2    16.0       2      30     NA     NA     NA       2       2
    ## 282      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 283       2    20.0       2      20     NA     NA     NA      NA      NA
    ## 284      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 285      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 286       1    -3.0       1      -3     NA     NA     NA      NA      NA
    ## 287       2    20.0       2      20     NA     NA     NA       1       2
    ## 288      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 289      -2    -3.0      -2      -3     NA     NA     NA      NA      NA
    ## 290       2    20.0       2      20     NA     NA     NA       5       3
    ## 291      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 292      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 293       3    -3.0       2      35     NA     NA     NA       2       1
    ## 294      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 295       2    20.0       1      -3     NA     NA     NA      NA      NA
    ## 296       2    25.0       1      -3     NA     NA     NA       5       4
    ## 297      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 298      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 299       2    30.0       2      30     NA     NA     NA       2       4
    ## 300      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 301       2    25.0       1      -3     NA     NA     NA      NA      NA
    ## 302       2    30.0       2      30     NA     NA     NA       3       4
    ## 303      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 304      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 305       2    20.0       2      20     NA     NA     NA      NA      NA
    ## 306       2    20.0       1      -3     NA     NA     NA       2       4
    ## 307      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 308       3    -3.0       1      -3     NA     NA     NA      NA      NA
    ## 309       3    -3.0       1      -3     NA     NA     NA       1       2
    ## 310      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 311       2    20.0       1      -3     NA     NA     NA      NA      NA
    ## 312       2    20.0       1      -3     NA     NA     NA       2       2
    ## 313      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 314       1    -3.0       1      -3     NA     NA     NA      NA      NA
    ## 315       2    20.0       2      20     NA     NA     NA      -2      -2
    ## 316      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 317       2    30.0       2      35     NA     NA     NA      NA      NA
    ## 318      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 319      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 320      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 321       2    20.0       1      -3     NA     NA     NA       3       4
    ## 322      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 323       1    -3.0       1      -3     NA     NA     NA      NA      NA
    ## 324       2    30.0       2      30     NA     NA     NA       4       5
    ## 325      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 326       3    -3.0       2      25     NA     NA     NA      NA      NA
    ## 327       3    -3.0       2      20     NA     NA     NA       2       1
    ## 328      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 329       2    25.0       2      30     NA     NA     NA      NA      NA
    ## 330       2    20.0       2      30     NA     NA     NA       4       4
    ## 331      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 332       1    -3.0       1      -3     NA     NA     NA      NA      NA
    ## 333       2    15.0       1      -3     NA     NA     NA       5       3
    ## 334      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 335       2    25.0       1      -3     NA     NA     NA      NA      NA
    ## 336       2    22.0       2      22     NA     NA     NA       3       2
    ## 337      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 338       2    20.0       1      -3     NA     NA     NA      NA      NA
    ## 339       2    15.0       1      -3     NA     NA     NA       3       3
    ## 340      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 341      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 342       1    -3.0       2      20     NA     NA     NA      NA      NA
    ## 343       1    -3.0       2      20     NA     NA     NA       4       5
    ## 344      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 345       2    30.0       2      30     NA     NA     NA      NA      NA
    ## 346       2    30.0       2      30     NA     NA     NA       3       4
    ## 347      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 348       1    -3.0       2      20     NA     NA     NA      NA      NA
    ## 349       2    20.0       2      35     NA     NA     NA       4       3
    ## 350      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 351       2    20.0       1      -3     NA     NA     NA      NA      NA
    ## 352       2    15.0       1      -3     NA     NA     NA       2       2
    ## 353      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 354       2    15.0       1      -3     NA     NA     NA      NA      NA
    ## 355       2    16.0       1      -3     NA     NA     NA       2       2
    ## 356      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 357       3    -3.0       1      -3     NA     NA     NA      NA      NA
    ## 358       3    -3.0       1      -3     NA     NA     NA       2       2
    ## 359      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 360       3    -3.0       2      25     NA     NA     NA      NA      NA
    ## 361       3    -3.0       2      28     NA     NA     NA       1       1
    ## 362      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 363       2    25.0       1      -3     NA     NA     NA      NA      NA
    ## 364       2    20.0       1      -3     NA     NA     NA       2       3
    ## 365      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 366       2    30.0       1      -3     NA     NA     NA      NA      NA
    ## 367       2    25.0       1      -3     NA     NA     NA       5       4
    ## 368      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 369       2    25.0       1      -3     NA     NA     NA      NA      NA
    ## 370       2    20.0       2      30     NA     NA     NA       4       2
    ## 371      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 372       1    -3.0       1      -3     NA     NA     NA      NA      NA
    ## 373       1    -3.0       1      -3     NA     NA     NA       2       2
    ## 374      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 375       2    20.0       1      -3     NA     NA     NA      NA      NA
    ## 376       2    20.0       1      -3     NA     NA     NA       5       3
    ## 377      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 378       1    -3.0       1      -3     NA     NA     NA      NA      NA
    ## 379       1    -3.0       1      -3     NA     NA     NA      -2       5
    ## 380      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 381      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 382       2    20.0       1      -3     NA     NA     NA       4       4
    ## 383      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 384       2    30.0       1      -3     NA     NA     NA      NA      NA
    ## 385       2    25.0       1      -3     NA     NA     NA       5       2
    ## 386      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 387       2    30.0       1      -3     NA     NA     NA      NA      NA
    ## 388       2    30.0       1      -3     NA     NA     NA       3       2
    ## 389      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 390       1    -3.0       1      -3     NA     NA     NA      NA      NA
    ## 391       2    25.0       1      -3     NA     NA     NA       5       3
    ## 392      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 393       2    20.0       2      20     NA     NA     NA      NA      NA
    ## 394       2    25.0       2      25     NA     NA     NA       2       2
    ## 395      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 396       2    20.0       2      20     NA     NA     NA      NA      NA
    ## 397       2    30.0       2      30     NA     NA     NA       2       2
    ## 398      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 399       2    20.0       1      -3     NA     NA     NA      NA      NA
    ## 400       3    -3.0       1      -3     NA     NA     NA       1       1
    ## 401      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 402       2    30.0       2      35     NA     NA     NA      NA      NA
    ## 403      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 404      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 405       2    10.0       1      -3     NA     NA     NA      NA      NA
    ## 406       2    15.0       2      30     NA     NA     NA       2       1
    ## 407      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 408       2    30.0       1      -3     NA     NA     NA      NA      NA
    ## 409       2    15.0       1      -3     NA     NA     NA      NA      NA
    ## 410      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 411      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 412       1    -3.0       1      -3     NA     NA     NA      NA      NA
    ## 413      -2    -3.0      -2      -3     NA     NA     NA       5       3
    ## 414      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 415       3    -3.0       3      -3     NA     NA     NA      NA      NA
    ## 416       2    10.0       1      -3     NA     NA     NA       4       2
    ## 417      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 418       2    30.0       2      30     NA     NA     NA      NA      NA
    ## 419       2    35.0       2      35     NA     NA     NA       3       4
    ## 420      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 421      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 422      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 423       2    20.0       1      -3     NA     NA     NA       4       2
    ## 424      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 425       3    -3.0       2      20     NA     NA     NA      NA      NA
    ## 426       2    20.0       2      20     NA     NA     NA       4       4
    ## 427      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 428       2    20.0       1      -3     NA     NA     NA      NA      NA
    ## 429       3    -3.0       1      -3     NA     NA     NA       4       2
    ## 430       2    20.0       2      20     NA     NA     NA      NA      NA
    ## 431       2    25.0       1      -4     NA     NA     NA       5       4
    ## 432      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 433       1    -3.0       1      -3     NA     NA     NA      NA      NA
    ## 434       1    -3.0       1      -3     NA     NA     NA       5       4
    ## 435      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 436      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 437       2    20.0       1      -3     NA     NA     NA      NA      NA
    ## 438       2    30.0       2      30     NA     NA     NA      NA      NA
    ## 439       2    20.0       2      30     NA     NA     NA       2       2
    ## 440      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 441      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 442       2    30.0       2      30     NA     NA     NA      NA      NA
    ## 443      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 444       1    -3.0       1      -3     NA     NA     NA       5       4
    ## 445      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 446       2    30.0       2      30     NA     NA     NA      NA      NA
    ## 447      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 448      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 449       2    15.0       1      -3     NA     NA     NA      NA      NA
    ## 450       2    15.0       1      -3     NA     NA     NA       2       1
    ## 451      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 452       2    20.0       2      20     NA     NA     NA      NA      NA
    ## 453       2    25.0       2      25     NA     NA     NA       5       4
    ## 454      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 455       2    25.0       2      30     NA     NA     NA      NA      NA
    ## 456       2    25.0       1      -3     NA     NA     NA       4       2
    ## 457      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 458       3    -3.0       1      -3     NA     NA     NA      NA      NA
    ## 459       2    21.0       2      21     NA     NA     NA       5       3
    ## 460      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 461       1    -3.0       1      -3     NA     NA     NA      NA      NA
    ## 462       2    20.0       1      -3     NA     NA     NA       2       4
    ## 463      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 464       2    20.0       1      -3     NA     NA     NA      NA      NA
    ## 465       2    20.0       1      -3     NA     NA     NA       2       2
    ## 466      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 467       2    25.0       2      25     NA     NA     NA      NA      NA
    ## 468      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 469      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 470       2    20.0       1      -3     NA     NA     NA      NA      NA
    ## 471       2    20.0       1      -3     NA     NA     NA       4       4
    ## 472      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 473       2    12.0       1      -3     NA     NA     NA      NA      NA
    ## 474       2    -2.0       1      -3     NA     NA     NA       4       4
    ## 475      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 476       2    30.0       2      30     NA     NA     NA      NA      NA
    ## 477       2    25.0       2      25     NA     NA     NA       4       3
    ## 478      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 479       2    20.0       1      -3     NA     NA     NA      NA      NA
    ## 480       2    20.0       1      -3     NA     NA     NA       3       3
    ## 481      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 482       2    20.0       2      20     NA     NA     NA      NA      NA
    ## 483       2    20.0       2      20     NA     NA     NA       4       3
    ## 484      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 485       3    -3.0       3      -3     NA     NA     NA      NA      NA
    ## 486       2    20.0       2      20     NA     NA     NA       3       3
    ## 487      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 488       2    15.0       1      -3     NA     NA     NA      NA      NA
    ## 489       2    25.0       1      -3     NA     NA     NA       5       5
    ## 490      NA      NA      NA      NA     NA     NA     NA      NA      NA
    ## 491       2    25.0       2      25     NA     NA     NA      NA      NA
    ## 492       2    30.0       2      30     NA     NA     NA       4       5
    ##     val13i3 val13i4 val13i5 val13i6 val13i7 val13i8 val13i9 omo41i1 omo41i2
    ## 1        NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 2         2       2       4       2       2       4       2       3       4
    ## 3        NA      NA      NA      NA      NA      NA      NA       3       3
    ## 4        NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 5        NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 6        NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 7        NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 8         4       4       2       5       4       4       5       2       4
    ## 9        NA      NA      NA      NA      NA      NA      NA       1       4
    ## 10       NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 11        3       3       3       2       2       3       4       3       3
    ## 12       NA      NA      NA      NA      NA      NA      NA       3       3
    ## 13       NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 14        2       1       4       1       1       5       5       4       5
    ## 15       NA      NA      NA      NA      NA      NA      NA       3       4
    ## 16       NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 17       NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 18       NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 19       NA      NA      NA      NA      NA      NA      NA       1       4
    ## 20       NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 21        1       2       5       2       1       4       5       3       4
    ## 22       NA      NA      NA      NA      NA      NA      NA       3       4
    ## 23       NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 24        2       1       4       5       1       2       5       3       4
    ## 25       NA      NA      NA      NA      NA      NA      NA       1       3
    ## 26       NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 27        3       2       4       2       2       4       4       3       4
    ## 28       NA      NA      NA      NA      NA      NA      NA       2       4
    ## 29       NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 30        2       1       4       4       1       4       4       2       2
    ## 31       NA      NA      NA      NA      NA      NA      NA       2       3
    ## 32       NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 33       NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 34        1       1       4       3       1       2       5       4       4
    ## 35       NA      NA      NA      NA      NA      NA      NA       4       4
    ## 36       NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 37        4       3       1       2       1       3       4       3       4
    ## 38       NA      NA      NA      NA      NA      NA      NA       3       4
    ## 39       NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 40        1       1       5       1       1       5       5       1       5
    ## 41       NA      NA      NA      NA      NA      NA      NA       1       5
    ## 42       NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 43        4       3       3       3       3       3       3       1       3
    ## 44       NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 45       NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 46        4       4       3       3       1       1       5       1       2
    ## 47       NA      NA      NA      NA      NA      NA      NA       1       3
    ## 48       NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 49       NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 50        2       2       2       2       2       4       4       2       3
    ## 51       NA      NA      NA      NA      NA      NA      NA       3       4
    ## 52       NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 53        2       1       4       2       1       4       5       3       4
    ## 54       NA      NA      NA      NA      NA      NA      NA       1       4
    ## 55       NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 56        2       1       5       1       1       5       4       2       5
    ## 57       NA      NA      NA      NA      NA      NA      NA       3       3
    ## 58       NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 59        4       1       5       5       1       3       5       5       4
    ## 60       NA      NA      NA      NA      NA      NA      NA       4       5
    ## 61       NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 62        1       1       5       3       1       4       5       4       4
    ## 63       NA      NA      NA      NA      NA      NA      NA       4       5
    ## 64       NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 65        2       2       5       2       1       5       5       5       5
    ## 66       NA      NA      NA      NA      NA      NA      NA       5       5
    ## 67       NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 68        1       1       5       1       2       5       4       1       4
    ## 69       NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 70       NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 71        2       1       5       2       2       4       5       3       3
    ## 72       NA      NA      NA      NA      NA      NA      NA       2       4
    ## 73       NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 74        1       1       5       1       1       5       5       1       3
    ## 75       NA      NA      NA      NA      NA      NA      NA       2       3
    ## 76       NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 77       NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 78        1       4       5       1       1       5       4       3       3
    ## 79       NA      NA      NA      NA      NA      NA      NA       2       3
    ## 80       NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 81        3       1       3       3       1       4       4       3       3
    ## 82       NA      NA      NA      NA      NA      NA      NA       3       3
    ## 83       NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 84        2       1       4       2       1       5       5       1       3
    ## 85       NA      NA      NA      NA      NA      NA      NA       1       3
    ## 86       NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 87        1       1       1       1       1       5       5       3       5
    ## 88       NA      NA      NA      NA      NA      NA      NA       3       4
    ## 89       NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 90        2       1       4       3       2       4       4       3       4
    ## 91       NA      NA      NA      NA      NA      NA      NA       3       4
    ## 92       NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 93        2       1       4       2       1       4       5       1       4
    ## 94       NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 95       NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 96        4       3       4       5       4       2       5       2       4
    ## 97       NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 98        1       1       5       2       1       5       5       4       5
    ## 99       NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 100      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 101       4       1       3       4       1       2       5       4       5
    ## 102      NA      NA      NA      NA      NA      NA      NA       4       5
    ## 103      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 104       2       1       3       2       1       4       5       5       5
    ## 105      NA      NA      NA      NA      NA      NA      NA       5       5
    ## 106      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 107       1       1       5       1       1       5       5       3       4
    ## 108      NA      NA      NA      NA      NA      NA      NA       3       4
    ## 109      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 110      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 111       1       1       4       2       1       4       4       3       3
    ## 112      NA      NA      NA      NA      NA      NA      NA       3       4
    ## 113      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 114       3       2       3       5       1       2       4       3       4
    ## 115      NA      NA      NA      NA      NA      NA      NA       2       4
    ## 116      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 117       2       1       4       4       1       4       5       4       3
    ## 118      NA      NA      NA      NA      NA      NA      NA       4       4
    ## 119      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 120       1       1       4       1       1       4       5       2       4
    ## 121      NA      NA      NA      NA      NA      NA      NA       1       4
    ## 122      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 123       2       1       1       1       1       1       5       1       5
    ## 124      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 125       4       5       1       2       4       5       5       1       1
    ## 126      NA      NA      NA      NA      NA      NA      NA       1       1
    ## 127      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 128      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 129      NA      NA      NA      NA      NA      NA      NA       1       4
    ## 130      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 131       1       1       4       2       1       4       5       2       1
    ## 132      NA      NA      NA      NA      NA      NA      NA       2       2
    ## 133      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 134       1       1       5       1       1       5       5       4       4
    ## 135      NA      NA      NA      NA      NA      NA      NA       4       5
    ## 136      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 137       1       1       3       3       1       5       5       4       3
    ## 138      NA      NA      NA      NA      NA      NA      NA       4       3
    ## 139      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 140      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 141      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 142      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 143      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 144       5       3       3       5       3       1       5       3       5
    ## 145      NA      NA      NA      NA      NA      NA      NA       3       4
    ## 146      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 147       4       1       3       5       1       2       5       3       4
    ## 148      NA      NA      NA      NA      NA      NA      NA       3       5
    ## 149      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 150       2       1       4       2       1       4       5       3       5
    ## 151      NA      NA      NA      NA      NA      NA      NA       4       4
    ## 152      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 153       2       1       4       2       2       5       5       3       4
    ## 154      NA      NA      NA      NA      NA      NA      NA       3       4
    ## 155      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 156       2       2       4       2       3       4       4       2       3
    ## 157      NA      NA      NA      NA      NA      NA      NA       2       3
    ## 158      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 159      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 160       4       1       3       4       1       2       5       3       3
    ## 161      NA      NA      NA      NA      NA      NA      NA       3       4
    ## 162      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 163       3       1       5       5       1       2       5       5       4
    ## 164      NA      NA      NA      NA      NA      NA      NA       5       4
    ## 165      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 166      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 167      NA      NA      NA      NA      NA      NA      NA       4       4
    ## 168      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 169       4       2       2       4       2       2       4       2       4
    ## 170      NA      NA      NA      NA      NA      NA      NA       1       3
    ## 171      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 172       2       3       4       2       1       4       4       2       3
    ## 173      NA      NA      NA      NA      NA      NA      NA       2       3
    ## 174      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 175       2       1       1       4       1       4       5       2       3
    ## 176      NA      NA      NA      NA      NA      NA      NA       2       3
    ## 177      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 178       4       4       4       4       3       4       4       1       3
    ## 179      NA      NA      NA      NA      NA      NA      NA       1       2
    ## 180      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 181       1       3       4       2       3       2       5       1       3
    ## 182      NA      NA      NA      NA      NA      NA      NA       1       2
    ## 183      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 184       1       1       4       5       1       2       5       2       3
    ## 185      NA      NA      NA      NA      NA      NA      NA       3       4
    ## 186      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 187       3       2       4       4       3       2       4       1       4
    ## 188      NA      NA      NA      NA      NA      NA      NA       1       2
    ## 189      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 190       2       1       3       2       1       4       5       4       5
    ## 191      NA      NA      NA      NA      NA      NA      NA       2       5
    ## 192      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 193       1       1       4       1       1       5       4       1       2
    ## 194      NA      NA      NA      NA      NA      NA      NA       1       3
    ## 195      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 196       3       2       3       4       1       2       5       3       4
    ## 197      NA      NA      NA      NA      NA      NA      NA       2       4
    ## 198      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 199       1       1       4       3       1       4       5       4       3
    ## 200      NA      NA      NA      NA      NA      NA      NA       4       2
    ## 201      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 202       2       2       2       4       2       2       5       3       3
    ## 203      NA      NA      NA      NA      NA      NA      NA       3       4
    ## 204      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 205       1       3       3       3       3       5       5       3       3
    ## 206      NA      NA      NA      NA      NA      NA      NA       4       5
    ## 207      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 208       2       1       5       2       1       4       5       2       4
    ## 209      NA      NA      NA      NA      NA      NA      NA       2       4
    ## 210      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 211       4       4       1       4       4       1       4       1       3
    ## 212      NA      NA      NA      NA      NA      NA      NA       2       4
    ## 213      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 214       2       1       4       3       1       3       5       2       2
    ## 215      NA      NA      NA      NA      NA      NA      NA       2       4
    ## 216      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 217      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 218      NA      NA      NA      NA      NA      NA      NA       2       4
    ## 219      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 220       2       2       3       4       2       3       5       3       4
    ## 221      NA      NA      NA      NA      NA      NA      NA       2       4
    ## 222      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 223       3       2       3       2       2       3       4       3       4
    ## 224      NA      NA      NA      NA      NA      NA      NA       3       4
    ## 225      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 226       1       5       5       4       1       2       1       3       3
    ## 227      NA      NA      NA      NA      NA      NA      NA       3       3
    ## 228      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 229       1       1       4       1       1       5       5       3       5
    ## 230      NA      NA      NA      NA      NA      NA      NA       2       4
    ## 231      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 232       1       1       5       1       1       5       5       3       4
    ## 233      NA      NA      NA      NA      NA      NA      NA       3       5
    ## 234      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 235       1       1       5       1       3       5       3       3       4
    ## 236      NA      NA      NA      NA      NA      NA      NA       3       4
    ## 237      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 238       1       1       5       2       1       4       5       4       5
    ## 239      NA      NA      NA      NA      NA      NA      NA       4       5
    ## 240      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 241       4       2       3       4       2       4       4       2       4
    ## 242      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 243      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 244       1       1       3       1       1       5       5       4       3
    ## 245      NA      NA      NA      NA      NA      NA      NA       2       5
    ## 246      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 247       1       1       5       2       1       5       5       4       4
    ## 248      NA      NA      NA      NA      NA      NA      NA       4       4
    ## 249      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 250       1       1       2       3       3       2       5       3       4
    ## 251      NA      NA      NA      NA      NA      NA      NA       3       4
    ## 252      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 253       1       2       4       1       1       5       5       3       4
    ## 254      NA      NA      NA      NA      NA      NA      NA       2       4
    ## 255      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 256       1       1       4       2       1       4       5       3       3
    ## 257      NA      NA      NA      NA      NA      NA      NA       3       3
    ## 258      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 259       2       1       4       2       1       4       5       3       3
    ## 260      NA      NA      NA      NA      NA      NA      NA       3       3
    ## 261       1       1       4       1       1       5       5       4       3
    ## 262      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 263      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 264       5       4       2       5       4       1       3       2       3
    ## 265      NA      NA      NA      NA      NA      NA      NA       1       2
    ## 266      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 267       1       4       5       1       2       4       4       2       3
    ## 268      NA      NA      NA      NA      NA      NA      NA       1       3
    ## 269      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 270       5       3       3       5       2       2       4       3       3
    ## 271      NA      NA      NA      NA      NA      NA      NA       3       3
    ## 272      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 273       4       2       3       3       2       4       4       4       4
    ## 274      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 275      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 276       2       2       2       2       2       4       5       4       2
    ## 277      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 278       1       1       5       2       1       1       5       4       4
    ## 279      NA      NA      NA      NA      NA      NA      NA       4       3
    ## 280      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 281       3       1       5       2       1       4       5       1       2
    ## 282      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 283      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 284      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 285      NA      NA      NA      NA      NA      NA      NA       3       3
    ## 286      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 287       3       3       4       3       3       3       5       3       3
    ## 288      NA      NA      NA      NA      NA      NA      NA       2       4
    ## 289      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 290       1       1       4       3       1       5       5       4       4
    ## 291      NA      NA      NA      NA      NA      NA      NA       5       5
    ## 292      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 293       4       3       1       1       1       2       5       2       3
    ## 294      NA      NA      NA      NA      NA      NA      NA       2       4
    ## 295      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 296       2       2       3       2       2       4       4       3       3
    ## 297      NA      NA      NA      NA      NA      NA      NA       2       3
    ## 298      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 299       2       1       4       1       1       4       5       4       4
    ## 300      NA      NA      NA      NA      NA      NA      NA       5       5
    ## 301      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 302       3       2       4       2       1       4       4       2       3
    ## 303      NA      NA      NA      NA      NA      NA      NA       1       4
    ## 304      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 305      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 306       3       2       4       2       2       2       5       3       3
    ## 307      NA      NA      NA      NA      NA      NA      NA       2       3
    ## 308      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 309       5       5       1       3       3       2       4       3       3
    ## 310      NA      NA      NA      NA      NA      NA      NA       1       3
    ## 311      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 312       4       4       4       3       2       2       4       2       3
    ## 313      NA      NA      NA      NA      NA      NA      NA       2       4
    ## 314      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 315      -2       3       3       3       3       3       3       3       1
    ## 316      NA      NA      NA      NA      NA      NA      NA       1       1
    ## 317      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 318      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 319      NA      NA      NA      NA      NA      NA      NA       4       4
    ## 320      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 321       3       2       4       4       2       4       5       1       3
    ## 322      NA      NA      NA      NA      NA      NA      NA       1       3
    ## 323      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 324       4       1       4       4       1       2       5       4       3
    ## 325      NA      NA      NA      NA      NA      NA      NA      -2      -2
    ## 326      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 327       4       1       4       5       1       2       5       3       4
    ## 328      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 329      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 330       2       2       4       2       2       4       4       2       3
    ## 331      NA      NA      NA      NA      NA      NA      NA       2       3
    ## 332      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 333       2       1       3       2       1       4       5       3       3
    ## 334      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 335      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 336       3       4       3       4       3       2       5       3       4
    ## 337      NA      NA      NA      NA      NA      NA      NA       3       5
    ## 338      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 339       4       3       5       2       3       5       4       3       3
    ## 340      NA      NA      NA      NA      NA      NA      NA       2       2
    ## 341      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 342      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 343       1       1       5       2       1       4       5       1       4
    ## 344      NA      NA      NA      NA      NA      NA      NA       1       4
    ## 345      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 346       3       3       3       3       1       3       3       2       3
    ## 347      NA      NA      NA      NA      NA      NA      NA       3       3
    ## 348      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 349       2       2       4       2       2       3       4       3       4
    ## 350      NA      NA      NA      NA      NA      NA      NA       3       4
    ## 351      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 352       4       4       2       2       1       2       5       2       3
    ## 353      NA      NA      NA      NA      NA      NA      NA       2       3
    ## 354      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 355       2       3       4       2       1       2       5       4       4
    ## 356      NA      NA      NA      NA      NA      NA      NA       4       4
    ## 357      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 358       4       3       3       3       2       2       4       3       4
    ## 359      NA      NA      NA      NA      NA      NA      NA       2       4
    ## 360      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 361       5       4       3       4       4       1       4       3       3
    ## 362      NA      NA      NA      NA      NA      NA      NA       4       4
    ## 363      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 364       1       1       5       3       1       4       5       1       4
    ## 365      NA      NA      NA      NA      NA      NA      NA       2       2
    ## 366      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 367       1       1       4       2       1       4       5       4       4
    ## 368      NA      NA      NA      NA      NA      NA      NA       3       3
    ## 369      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 370       2       2       2       3       3       4       5       4       5
    ## 371      NA      NA      NA      NA      NA      NA      NA       3       5
    ## 372      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 373       2       2       4       4       2       2       5       2       2
    ## 374      NA      NA      NA      NA      NA      NA      NA       4       4
    ## 375      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 376       1       1       4       1       1       5       5       2       4
    ## 377      NA      NA      NA      NA      NA      NA      NA       3       4
    ## 378      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 379       4       1       5       1       1       5       5       1       3
    ## 380      NA      NA      NA      NA      NA      NA      NA       1       3
    ## 381      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 382       2       1       4       2       2       2       4       3       3
    ## 383      NA      NA      NA      NA      NA      NA      NA       3       3
    ## 384      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 385       2       3       5       2       3       5       5       2       4
    ## 386      NA      NA      NA      NA      NA      NA      NA       2       4
    ## 387      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 388       1       2       4       2       1       5       5       1       4
    ## 389      NA      NA      NA      NA      NA      NA      NA       1       4
    ## 390      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 391       1       1       5       1       3       5       5       1       4
    ## 392      NA      NA      NA      NA      NA      NA      NA       1       4
    ## 393      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 394       4       1       4       4      -2       2       4       3       3
    ## 395      NA      NA      NA      NA      NA      NA      NA       4       3
    ## 396      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 397       3       2       2       4       2       2       4       3       3
    ## 398      NA      NA      NA      NA      NA      NA      NA       3       3
    ## 399      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 400       4       3       3       4       3       1       4       3       4
    ## 401      NA      NA      NA      NA      NA      NA      NA       3       4
    ## 402      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 403      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 404      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 405      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 406       3       3       4       2       3       4       5       4       5
    ## 407      NA      NA      NA      NA      NA      NA      NA       4       5
    ## 408      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 409      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 410      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 411      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 412      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 413       1       1       3       1       1       5       5       5       4
    ## 414      NA      NA      NA      NA      NA      NA      NA       4       3
    ## 415      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 416       3       1       4       2       1       4       5       4       4
    ## 417      NA      NA      NA      NA      NA      NA      NA       4       4
    ## 418      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 419       2       1       4       1       1       4       5       4       4
    ## 420      NA      NA      NA      NA      NA      NA      NA       5       5
    ## 421      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 422      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 423       1       2       3       4       3       3       5       3       4
    ## 424      NA      NA      NA      NA      NA      NA      NA       3       4
    ## 425      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 426       1       3       2       2       1       4       5       4       5
    ## 427      NA      NA      NA      NA      NA      NA      NA       4       4
    ## 428      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 429       2       1       3       2       1       2       5       4       4
    ## 430      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 431       3       1       3       2       1       4       4       3       4
    ## 432      NA      NA      NA      NA      NA      NA      NA       2       4
    ## 433      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 434       1       2       4       2       1       5       5       2       2
    ## 435      NA      NA      NA      NA      NA      NA      NA       2       2
    ## 436      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 437      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 438      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 439       4       1       2       5       1       2       5       3       3
    ## 440      NA      NA      NA      NA      NA      NA      NA       3       3
    ## 441      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 442      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 443      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 444       1       1       5       2       1       5       5       2       3
    ## 445      NA      NA      NA      NA      NA      NA      NA       1       4
    ## 446      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 447      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 448      NA      NA      NA      NA      NA      NA      NA       2       4
    ## 449      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 450       3       3       3       3       4       2       5       3       4
    ## 451      NA      NA      NA      NA      NA      NA      NA       4       5
    ## 452      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 453       1       1       5       1       1       4       5       4       4
    ## 454      NA      NA      NA      NA      NA      NA      NA       3       4
    ## 455      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 456       2       3       3       5       2       1       4       4       4
    ## 457      NA      NA      NA      NA      NA      NA      NA       4       4
    ## 458      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 459       3       2       3       1       1       5       5       3       4
    ## 460      NA      NA      NA      NA      NA      NA      NA       4       5
    ## 461      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 462       2       2       4       2       1       5       4       2       2
    ## 463      NA      NA      NA      NA      NA      NA      NA       3       3
    ## 464      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 465       2       1       2       3       1       2       5       2       4
    ## 466      NA      NA      NA      NA      NA      NA      NA       2       4
    ## 467      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 468      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 469      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 470      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 471       5       3       1       5       4       5       5       1       3
    ## 472      NA      NA      NA      NA      NA      NA      NA       1       3
    ## 473      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 474       2       2       3       2       1       4       4       2       3
    ## 475      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 476      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 477       1       1       5       4       1       2       5       2       3
    ## 478      NA      NA      NA      NA      NA      NA      NA       2       3
    ## 479      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 480       3       3       2       4       2       2       4       2       4
    ## 481      NA      NA      NA      NA      NA      NA      NA       2       4
    ## 482      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 483       2       1       3       4       1       3       5       2       2
    ## 484      NA      NA      NA      NA      NA      NA      NA       3       2
    ## 485      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 486       3       1       3       3       1       2       5       4       4
    ## 487      NA      NA      NA      NA      NA      NA      NA       4       4
    ## 488      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 489       2       4       4       1       4       4       5       3       4
    ## 490      NA      NA      NA      NA      NA      NA      NA       1       5
    ## 491      NA      NA      NA      NA      NA      NA      NA      NA      NA
    ## 492       2       2       4       3       1       4       5       3       4
    ##     omo41i3 omo41i4 omo41i5 omo41i6 sex doby age east isced11 sd57 mig10 hw10
    ## 1        NA      NA      NA      NA   2 1971  51    1       3   NA    NA   NA
    ## 2         4       4       3       3   2 1971  52    1       3   NA    NA   NA
    ## 3         3       3       2       3   2 1971  53    1       3   NA    NA   NA
    ## 4        NA      NA      NA      NA   1 1992  30    1       4   NA    NA   NA
    ## 5        NA      NA      NA      NA   1 1992  31    1       4   NA    NA   NA
    ## 6        NA      NA      NA      NA   2 1981  41    0       2   NA    NA   NA
    ## 7        NA      NA      NA      NA   1 1983  38    0       6   NA    NA   NA
    ## 8         4       4       2       1   1 1983  39    0       6   NA    NA   NA
    ## 9         3       4       2       2   1 1983  40    0       6   NA    NA   NA
    ## 10       NA      NA      NA      NA   2 1983  39    0       3   NA    NA   NA
    ## 11        3       3       2       3   2 1983  40    0       3   NA    NA   NA
    ## 12        2       3       2       3   2 1983  41    0       3   NA    NA   NA
    ## 13       NA      NA      NA      NA   2 1991  31    0       8   NA    NA   NA
    ## 14        3       3       4       4   2 1991  32    0       8   NA    NA   NA
    ## 15        4       3       4       3   2 1991  33    0       8   NA    NA   NA
    ## 16       NA      NA      NA      NA   2 1991  31    0       6   NA    NA   NA
    ## 17       NA      NA      NA      NA   2 1973  49    0       4   NA    NA   NA
    ## 18       NA      NA      NA      NA   2 1973  49    0       4   NA    NA   NA
    ## 19        3       3       3       3   2 1973  51    0       4   NA    NA   NA
    ## 20       NA      NA      NA      NA   2 1993  28    1       0   NA    NA   NA
    ## 21        4       4       3       3   2 1993  29    1       3   NA    NA   NA
    ## 22        4       3       3       3   2 1993  30    1       3   NA    NA   NA
    ## 23       NA      NA      NA      NA   2 1991  31    0       6   NA    NA   NA
    ## 24        4       3       2       3   2 1991  32    0       6   NA    NA   NA
    ## 25        3       3       2       4   2 1991  33    0       6   NA    NA   NA
    ## 26       NA      NA      NA      NA   2 1991  31    0       3   NA    NA   NA
    ## 27        4       3       4       3   2 1991  32    0       3   NA    NA   NA
    ## 28        5       3       3       2   2 1991  33    0       3   NA    NA   NA
    ## 29       NA      NA      NA      NA   2 1981  41    0       6   NA    NA   NA
    ## 30        3       3       2       2   2 1981  42    1       6   NA    NA   NA
    ## 31        3       3       3       3   2 1981  43    1       6   NA    NA   NA
    ## 32       NA      NA      NA      NA   2 1982  40    0       3   NA    NA   NA
    ## 33       NA      NA      NA      NA   2 1993  28    0       7   NA    NA   NA
    ## 34        4       3       4       4   2 1993  29    0       7   NA    NA   NA
    ## 35        4       4       4       4   2 1993  30    0       7   NA    NA   NA
    ## 36       NA      NA      NA      NA   2 1973  49    0       3   NA    NA   NA
    ## 37        2       3       4       3   2 1973  50    0       3   NA    NA   NA
    ## 38        3       2       4       3   2 1973  51    0       3   NA    NA   NA
    ## 39       NA      NA      NA      NA   2 1971  51    0       6   NA    NA   NA
    ## 40        4       4       3       2   2 1971  52    0       6   NA    NA   NA
    ## 41        4       4       3       4   2 1971  53    0       6   NA    NA   NA
    ## 42       NA      NA      NA      NA   2 1981  41    0       2   NA    NA   NA
    ## 43        3       3       2       1   2 1981  42    0       2   NA    NA   NA
    ## 44       NA      NA      NA      NA   2 1981  42    0       2   NA    NA   NA
    ## 45       NA      NA      NA      NA   1 1983  39    1       3   NA    NA   NA
    ## 46        2       3       1       1   1 1983  40    1       3   NA    NA   NA
    ## 47        1       3       1       1   1 1983  41    1       6   NA    NA   NA
    ## 48       NA      NA      NA      NA   1 1971  51    0       6   NA    NA   NA
    ## 49       NA      NA      NA      NA   2 1982  40    0       3   NA    NA   NA
    ## 50        3       4       2       2   2 1982  40    0       3   NA    NA   NA
    ## 51        3       4       2       3   2 1982  42    0       3   NA    NA   NA
    ## 52       NA      NA      NA      NA   1 1982  40    0       8   NA    NA   NA
    ## 53        3       2       5       3   1 1982  41    0       8   NA    NA   NA
    ## 54        3       3       5       3   1 1982  42    0       8   NA    NA   NA
    ## 55       NA      NA      NA      NA   2 1991  31    1       3   NA    NA   NA
    ## 56        3       3       3       3   2 1991  32    1       3   NA    NA   NA
    ## 57        3       3       3       3   2 1991  33    1       3   NA    NA   NA
    ## 58       NA      NA      NA      NA   1 1991  31    0       6   NA    NA   NA
    ## 59        4       4       2       4   1 1991  32    0       6   NA    NA   NA
    ## 60        3       3       1       4   1 1991  33    0       6   NA    NA   NA
    ## 61       NA      NA      NA      NA   1 1982  40    0       6   NA    NA   NA
    ## 62        3       3       4       4   1 1982  41    0       6   NA    NA   NA
    ## 63        4       3       4       3   1 1982  42    0       6   NA    NA   NA
    ## 64       NA      NA      NA      NA   2 1972  50    0       6   NA    NA   NA
    ## 65        4       4       4       5   2 1972  51    0       6   NA    NA   NA
    ## 66        4       5       5       5   2 1972  52    0       6   NA    NA   NA
    ## 67       NA      NA      NA      NA   1 1991  31    1       6   NA    NA   NA
    ## 68        3       2       4       2   1 1991  32    1       6   NA    NA   NA
    ## 69       NA      NA      NA      NA   1 1991  33    1       6   NA    NA   NA
    ## 70       NA      NA      NA      NA   2 1982  40    0       6   NA    NA   NA
    ## 71        2      -2       5       2   2 1982  41    0       6   NA    NA   NA
    ## 72        2       3       2       3   2 1982  42    0       6   NA    NA   NA
    ## 73       NA      NA      NA      NA   2 1971  51    1       6   NA    NA   NA
    ## 74        3       2       1       1   2 1971  52    1       6   NA    NA   NA
    ## 75        3       2       3       2   2 1971  53    1       6   NA    NA   NA
    ## 76       NA      NA      NA      NA   2 1981  40    0       6   NA    NA   NA
    ## 77       NA      NA      NA      NA   2 1972  50    0       6   NA    NA   NA
    ## 78        2       2       3       2   2 1972  51    0       6   NA    NA   NA
    ## 79        2       1       4       4   2 1972  52    0       6   NA    NA   NA
    ## 80       NA      NA      NA      NA   2 1992  30    0       6   NA    NA   NA
    ## 81        3       3       3       3   2 1992  31    0       6   NA    NA   NA
    ## 82        3       3       4       3   2 1992  32    0       6   NA    NA   NA
    ## 83       NA      NA      NA      NA   2 1972  50    1       4   NA    NA   NA
    ## 84        2       1       1       1   2 1972  51    1       4   NA    NA   NA
    ## 85        3       3       1       1   2 1972  52    1       4   NA    NA   NA
    ## 86       NA      NA      NA      NA   2 1991  31    0       6   NA    NA   NA
    ## 87        5       5       4       4   2 1991  32    0       6   NA    NA   NA
    ## 88        3       4       4       4   2 1991  33    0       6   NA    NA   NA
    ## 89       NA      NA      NA      NA   1 1971  50    0       6   NA    NA   NA
    ## 90        4       4       4       4   1 1971  51    0       6   NA    NA   NA
    ## 91        4       4       4       4   1 1971  53    0       6   NA    NA   NA
    ## 92       NA      NA      NA      NA   2 1993  28    0       3   NA    NA   NA
    ## 93        3       3       4       3   2 1993  29    0       3   NA    NA   NA
    ## 94       NA      NA      NA      NA   2 1993  30    0       3   NA    NA   NA
    ## 95       NA      NA      NA      NA   1 1981  41    0       6   NA    NA   NA
    ## 96        4       4       3       2   1 1981  42    0       6   NA    NA   NA
    ## 97       NA      NA      NA      NA   1 1973  49    1       8   NA    NA   NA
    ## 98        5       5       5       4   1 1973  49    1       8   NA    NA   NA
    ## 99       NA      NA      NA      NA   1 1973  50    1       8   NA    NA   NA
    ## 100      NA      NA      NA      NA   2 1981  41    0       6   NA    NA   NA
    ## 101       3       4       3       3   2 1981  41    0       6   NA    NA   NA
    ## 102       4       5       3       4   2 1981  42    0       6   NA    NA   NA
    ## 103      NA      NA      NA      NA   2 1973  49    0       8   NA    NA   NA
    ## 104       5       5       4       4   2 1973  50    0       8   NA    NA   NA
    ## 105       4       5       3       4   2 1973  51    0       8   NA    NA   NA
    ## 106      NA      NA      NA      NA   2 1972  49    1       6   NA    NA   NA
    ## 107       4       4       2       3   2 1972  50    1       6   NA    NA   NA
    ## 108       3       3       3       3   2 1972  52    1       6   NA    NA   NA
    ## 109      NA      NA      NA      NA   2 1971  51    0       2   NA    NA   NA
    ## 110      NA      NA      NA      NA   1 1992  30    0       6   NA    NA   NA
    ## 111       3       3       3       3   1 1992  31    0       6   NA    NA   NA
    ## 112       3       3       4       3   1 1992  32    0       6   NA    NA   NA
    ## 113      NA      NA      NA      NA   1 1981  41    0       6   NA    NA   NA
    ## 114       3       4       4       3   1 1981  42    0       6   NA    NA   NA
    ## 115       4       4       4       3   1 1981  43    0       6   NA    NA   NA
    ## 116      NA      NA      NA      NA   2 1973  49    0       6   NA    NA   NA
    ## 117       2       3       4       4   2 1973  50    0       6   NA    NA   NA
    ## 118       3       4       3       3   2 1973  51    0       6   NA    NA   NA
    ## 119      NA      NA      NA      NA   2 1981  41    0       8   NA    NA   NA
    ## 120       2       3       3       2   2 1981  42    0       8   NA    NA   NA
    ## 121       4       4       4       3   2 1981  43    0       8   NA    NA   NA
    ## 122      NA      NA      NA      NA   1 1973  49    0       3   NA    NA   NA
    ## 123       1       3       1       2   1 1973  50    0       3   NA    NA   NA
    ## 124      NA      NA      NA      NA   2 1972  50    0       6   NA    NA   NA
    ## 125       1       1       1       1   2 1972  51    0       6   NA    NA   NA
    ## 126       1       1       1       1   2 1972  52    0       6   NA    NA   NA
    ## 127      NA      NA      NA      NA   1 1991  31    0       3   NA    NA   NA
    ## 128      NA      NA      NA      NA   1 1991  32    0       3   NA    NA   NA
    ## 129       3       2       3       2   1 1991  33    0       3   NA    NA   NA
    ## 130      NA      NA      NA      NA   1 1983  39    0       3   NA    NA   NA
    ## 131       3       2       4       2   1 1983  40    0       3   NA    NA   NA
    ## 132       1       3       4       2   1 1983  41    0       3   NA    NA   NA
    ## 133      NA      NA      NA      NA   1 1983  39    1       8   NA    NA   NA
    ## 134       4       4       4       4   1 1983  40    1       8   NA    NA   NA
    ## 135       5       4       4       4   1 1983  41    1       8   NA    NA   NA
    ## 136      NA      NA      NA      NA   1 1991  31    1       6   NA    NA   NA
    ## 137       5       3       5       4   1 1991  32    1       6   NA    NA   NA
    ## 138       5       4       5       4   1 1991  33    1       6   NA    NA   NA
    ## 139      NA      NA      NA      NA   1 1982  40    0       4   NA    NA   NA
    ## 140      NA      NA      NA      NA   1 1982  41    0       4   NA    NA   NA
    ## 141      NA      NA      NA      NA   1 1982  42    0       4   NA    NA   NA
    ## 142      NA      NA      NA      NA   1 1971  50    0       6   NA    NA   NA
    ## 143      NA      NA      NA      NA   1 1972  50    0       4   NA    NA   NA
    ## 144       4       2       3       3   1 1972  51    0       4   NA    NA   NA
    ## 145       4       2       3       3   1 1972  52    0       4   NA    NA   NA
    ## 146      NA      NA      NA      NA   2 1982  40    1       6   NA    NA   NA
    ## 147       4       4       5       5   2 1982  41    1       6   NA    NA   NA
    ## 148       5       5       5       4   2 1982  42    1       6   NA    NA   NA
    ## 149      NA      NA      NA      NA   2 1993  29    1       6   NA    NA   NA
    ## 150       4       2       4       4   2 1993  30    1       6   NA    NA   NA
    ## 151       3       1       4       5   2 1993  31    1       6   NA    NA   NA
    ## 152      NA      NA      NA      NA   1 1971  51    1       6   NA    NA   NA
    ## 153       4       4       3       3   1 1971  52    1       6   NA    NA   NA
    ## 154       4       3       3       2   1 1971  53    1       6   NA    NA   NA
    ## 155      NA      NA      NA      NA   1 1982  40    0       3   NA    NA   NA
    ## 156       3       3       2       2   1 1982  41    0       3   NA    NA   NA
    ## 157       2       2       2       2   1 1982  42    0       3   NA    NA   NA
    ## 158      NA      NA      NA      NA   1 1981  40    0       6   NA    NA   NA
    ## 159      NA      NA      NA      NA   2 1971  50    0       4   NA    NA   NA
    ## 160       4       3       4       4   2 1971  52    0       4   NA    NA   NA
    ## 161       4       4       4       4   2 1971  53    0       4   NA    NA   NA
    ## 162      NA      NA      NA      NA   2 1992  30    0       6   NA    NA   NA
    ## 163       2       3       3       5   2 1992  31    0       6   NA    NA   NA
    ## 164       3       3       4       5   2 1992  32    0       6   NA    NA   NA
    ## 165      NA      NA      NA      NA   1 1972  49    0       3   NA    NA   NA
    ## 166      NA      NA      NA      NA   1 1972  50    0       3   NA    NA   NA
    ## 167       3       3       4       4   1 1972  52    0       3   NA    NA   NA
    ## 168      NA      NA      NA      NA   2 1983  39    0       3   NA    NA   NA
    ## 169       2       4       1       2   2 1983  40    0       3   NA    NA   NA
    ## 170       1       3       2       2   2 1983  41    0       3   NA    NA   NA
    ## 171      NA      NA      NA      NA   1 1991  31    0       3   NA    NA   NA
    ## 172       3       3       3       3   1 1991  32    0       3   NA    NA   NA
    ## 173       3       3       3       2   1 1991  33    0       3   NA    NA   NA
    ## 174      NA      NA      NA      NA   2 1972  50    0       6   NA    NA   NA
    ## 175       3       3       1       2   2 1972  51    0       6   NA    NA   NA
    ## 176       4       4       2       2   2 1972  52    0       6   NA    NA   NA
    ## 177      NA      NA      NA      NA   1 1991  31    0       3   NA    NA   NA
    ## 178       3       2       1       1   1 1991  32    0       3   NA    NA   NA
    ## 179       3       2       1       1   1 1991  33    0       3   NA    NA   NA
    ## 180      NA      NA      NA      NA   1 1992  30    0       6   NA    NA   NA
    ## 181       5       3       1       2   1 1992  31    0       6   NA    NA   NA
    ## 182       4       3       1       2   1 1992  32    0       6   NA    NA   NA
    ## 183      NA      NA      NA      NA   2 1993  28    0       6   NA    NA   NA
    ## 184       3       3       4       2   2 1993  29    0       6   NA    NA   NA
    ## 185       4       4       5       4   2 1993  30    0       6   NA    NA   NA
    ## 186      NA      NA      NA      NA   2 1981  41    0       4   NA    NA   NA
    ## 187       2       3       2       3   2 1981  42    0       4   NA    NA   NA
    ## 188       2       2       2       3   2 1981  43    0       4   NA    NA   NA
    ## 189      NA      NA      NA      NA   1 1982  40    0       6   NA    NA   NA
    ## 190       4       4       3       4   1 1982  41    0       6   NA    NA   NA
    ## 191       5       4       3       4   1 1982  42    0       6   NA    NA   NA
    ## 192      NA      NA      NA      NA   2 1971  51    0       2   NA    NA   NA
    ## 193       3       3       3       3   2 1971  52    0       2   NA    NA   NA
    ## 194       3       3       3       3   2 1971  53    0       2   NA    NA   NA
    ## 195      NA      NA      NA      NA   1 1992  30    0       7   NA    NA   NA
    ## 196       4       3       4       2   1 1992  31    0       7   NA    NA   NA
    ## 197       4       3       4       3   1 1992  31    0       7   NA    NA   NA
    ## 198      NA      NA      NA      NA   1 1993  29    0       6   NA    NA   NA
    ## 199       3       5       4       3   1 1993  30    0       6   NA    NA   NA
    ## 200       3       4       4       4   1 1993  31    0       6   NA    NA   NA
    ## 201      NA      NA      NA      NA   1 1991  31    0       3   NA    NA   NA
    ## 202       3       3       4       3   1 1991  32    0       3   NA    NA   NA
    ## 203       4       4       4       4   1 1991  33    1       3   NA    NA   NA
    ## 204      NA      NA      NA      NA   1 1982  39    0       4   NA    NA   NA
    ## 205       3       3       3       3   1 1982  41    0       4   NA    NA   NA
    ## 206       5       5       3       4   1 1982  41    0       4   NA    NA   NA
    ## 207      NA      NA      NA      NA   1 1992  29    0       6   NA    NA   NA
    ## 208       4       4       4       2   1 1992  30    0       6   NA    NA   NA
    ## 209       4       4       4       3   1 1992  31    0       6   NA    NA   NA
    ## 210      NA      NA      NA      NA   1 1993  29    0       6   NA    NA   NA
    ## 211       4       3       1       2   1 1993  30    0       6   NA    NA   NA
    ## 212       4       3       2       2   1 1993  31    0       6   NA    NA   NA
    ## 213      NA      NA      NA      NA   1 1971  51    0       3   NA    NA   NA
    ## 214       3       3       2       1   1 1971  52    0       3   NA    NA   NA
    ## 215       2       3       2       2   1 1971  53    0       3   NA    NA   NA
    ## 216      NA      NA      NA      NA   2 1991  31    0       4   NA    NA   NA
    ## 217      NA      NA      NA      NA   2 1991  32    0       4   NA    NA   NA
    ## 218       3       3       3       3   2 1991  33    0       4   NA    NA   NA
    ## 219      NA      NA      NA      NA   1 1973  49    0       6   NA    NA   NA
    ## 220       3       3       4       4   1 1973  50    0       6   NA    NA   NA
    ## 221       3       3       4       3   1 1973  51    0       6   NA    NA   NA
    ## 222      NA      NA      NA      NA   1 1972  50    0       6   NA    NA   NA
    ## 223       3       4       4       3   1 1972  51    0       6   NA    NA   NA
    ## 224       3       4       4       4   1 1972  52    0       6   NA    NA   NA
    ## 225      NA      NA      NA      NA   2 1991  31    0       3   NA    NA   NA
    ## 226       2       2       4       3   2 1991  32    0       3   NA    NA   NA
    ## 227       2       2       4       4   2 1991  33    0       3   NA    NA   NA
    ## 228      NA      NA      NA      NA   1 1973  49    1       6   NA    NA   NA
    ## 229       4       2       3       2   1 1973  50    1       6   NA    NA   NA
    ## 230       3       2       3       3   1 1973  51    1       6   NA    NA   NA
    ## 231      NA      NA      NA      NA   2 1981  41    0       6   NA    NA   NA
    ## 232       4       4       4       3   2 1981  42    0       6   NA    NA   NA
    ## 233       4       4       4       3   2 1981  43    0       6   NA    NA   NA
    ## 234      NA      NA      NA      NA   2 1991  30    0       6   NA    NA   NA
    ## 235       4       4       3       3   2 1991  32    0       6   NA    NA   NA
    ## 236       4       4       3       2   2 1991  33    0       6   NA    NA   NA
    ## 237      NA      NA      NA      NA   2 1973  49    0       3   NA    NA   NA
    ## 238       2       3       4       2   2 1973  50    0       3   NA    NA   NA
    ## 239       3       2       4       3   2 1973  51    0       3   NA    NA   NA
    ## 240      NA      NA      NA      NA   1 1973  49    0       6   NA    NA   NA
    ## 241       3       3       2       2   1 1973  50    0       6   NA    NA   NA
    ## 242      NA      NA      NA      NA   1 1973  51    0       6   NA    NA   NA
    ## 243      NA      NA      NA      NA   1 1981  41    0       6   NA    NA   NA
    ## 244       3       4       4       4   1 1981  42    0       6   NA    NA   NA
    ## 245       4       5       5       5   1 1981  43    0       6   NA    NA   NA
    ## 246      NA      NA      NA      NA   2 1971  50    1       3   NA    NA   NA
    ## 247       4       4       4       4   2 1971  52    1       3   NA    NA   NA
    ## 248       4       4       4       4   2 1971  53    1       3   NA    NA   NA
    ## 249      NA      NA      NA      NA   2 1971  51    0       4   NA    NA   NA
    ## 250       3       3       4       3   2 1971  52    0       4   NA    NA   NA
    ## 251       3       3       4       3   2 1971  53    0       4   NA    NA   NA
    ## 252      NA      NA      NA      NA   2 1991  31    1       4   NA    NA   NA
    ## 253       4       3       3       4   2 1991  32    1       4   NA    NA   NA
    ## 254       4       3       2       3   2 1991  33    1       4   NA    NA   NA
    ## 255      NA      NA      NA      NA   2 1981  41    0       3   NA    NA   NA
    ## 256       3       2       3       2   2 1981  42    0       3   NA    NA   NA
    ## 257       2       1       2       2   2 1981  43    0       3   NA    NA   NA
    ## 258      NA      NA      NA      NA   2 1993  29    0       6   NA    NA   NA
    ## 259       2       2       1       2   2 1993  30    0       6   NA    NA   NA
    ## 260       2       3       2       3   2 1993  31    0       6   NA    NA   NA
    ## 261       3       3       4       4   2 1991  31    0       6   NA    NA   NA
    ## 262      NA      NA      NA      NA   2 1991  32    0       6   NA    NA   NA
    ## 263      NA      NA      NA      NA   1 1981  41    0       6   NA    NA   NA
    ## 264       4       2       2       2   1 1981  42    0       6   NA    NA   NA
    ## 265       3       2       1       3   1 1981  43    0       6   NA    NA   NA
    ## 266      NA      NA      NA      NA   1 1991  31    0       3   NA    NA   NA
    ## 267       3       4       2       1   1 1991  32    0       3   NA    NA   NA
    ## 268       3       3       2       3   1 1991  33    0       3   NA    NA   NA
    ## 269      NA      NA      NA      NA   2 1983  39    0       6   NA    NA   NA
    ## 270       3       2       2       3   2 1983  40    0       6   NA    NA   NA
    ## 271       3       3       3       3   2 1983  41    0       6   NA    NA   NA
    ## 272      NA      NA      NA      NA   1 1971  51    0       6   NA    NA   NA
    ## 273       4       4       4       4   1 1971  52    0       6   NA    NA   NA
    ## 274      NA      NA      NA      NA   1 1971  52    0       6   NA    NA   NA
    ## 275      NA      NA      NA      NA   1 1993  28    0       3   NA    NA   NA
    ## 276       4       4       4       4   1 1993  29    0       0   NA    NA   NA
    ## 277      NA      NA      NA      NA   2 1993  29    0       6   NA    NA   NA
    ## 278       5       4       5       4   2 1993  30    0       6   NA    NA   NA
    ## 279       4       3       4       4   2 1993  31    0       6   NA    NA   NA
    ## 280      NA      NA      NA      NA   2 1973  49    0       6   NA    NA   NA
    ## 281       1       4       1       1   2 1973  50    0       6   NA    NA   NA
    ## 282      NA      NA      NA      NA   2 1973  51    0       6   NA    NA   NA
    ## 283      NA      NA      NA      NA   1 1991  31    0       6   NA    NA   NA
    ## 284      NA      NA      NA      NA   1 1991  32    0       6   NA    NA   NA
    ## 285       4       4       4       4   1 1991  33    0       6   NA    NA   NA
    ## 286      NA      NA      NA      NA   1 1982  40    1       3   NA    NA   NA
    ## 287       3       3       2       2   1 1982  41    1       3   NA    NA   NA
    ## 288       2       2       1       2   1 1982  42    1       3   NA    NA   NA
    ## 289      NA      NA      NA      NA   2 1983  38    0       6   NA    NA   NA
    ## 290       4       3       4       4   2 1983  39    0       6   NA    NA   NA
    ## 291       3       3       5       5   2 1983  40    0       6   NA    NA   NA
    ## 292      NA      NA      NA      NA   2 1993  28    0       3   NA    NA   NA
    ## 293       3       3       1       2   2 1993  30    0       3   NA    NA   NA
    ## 294       4       2       2       1   2 1993  31    0       3   NA    NA   NA
    ## 295      NA      NA      NA      NA   1 1993  29    0       6   NA    NA   NA
    ## 296       3       3       2       4   1 1993  30    0       6   NA    NA   NA
    ## 297       2       3       2       4   1 1993  31    0       6   NA    NA   NA
    ## 298      NA      NA      NA      NA   2 1993  28    0       6   NA    NA   NA
    ## 299       3       5       5       5   2 1993  30    0       6   NA    NA   NA
    ## 300       4       5       5       4   2 1993  31    0       6   NA    NA   NA
    ## 301      NA      NA      NA      NA   2 1992  30    0       6   NA    NA   NA
    ## 302       3       2       2       2   2 1992  31    0       6   NA    NA   NA
    ## 303       2       3       4       3   2 1992  32    0       6   NA    NA   NA
    ## 304      NA      NA      NA      NA   1 1981  40    0       6   NA    NA   NA
    ## 305      NA      NA      NA      NA   1 1992  30    0       6   NA    NA   NA
    ## 306       3       4       4       3   1 1992  31    0       6   NA    NA   NA
    ## 307       4       4       4       3   1 1992  32    0       6   NA    NA   NA
    ## 308      NA      NA      NA      NA   2 1982  40    0       6   NA    NA   NA
    ## 309       3       3       1       3   2 1982  41    0       6   NA    NA   NA
    ## 310       3       3       1       1   2 1982  42    0       6   NA    NA   NA
    ## 311      NA      NA      NA      NA   2 1993  29    0       4   NA    NA   NA
    ## 312       3       3       2       3   2 1993  30    0       4   NA    NA   NA
    ## 313       3       2       2       3   2 1993  31    0       4   NA    NA   NA
    ## 314      NA      NA      NA      NA   1 1973  49    0       6   NA    NA   NA
    ## 315       2       4       2       2   1 1973  50    0       6   NA    NA   NA
    ## 316       3       4       2       1   1 1973  51    0       6   NA    NA   NA
    ## 317      NA      NA      NA      NA   2 1991  30    0       6   NA    NA   NA
    ## 318      NA      NA      NA      NA   2 1991  31    0       6   NA    NA   NA
    ## 319       3       4       4       4   2 1991  32    0       6   NA    NA   NA
    ## 320      NA      NA      NA      NA   2 1973  48    0       3   NA    NA   NA
    ## 321       3       2       2       2   2 1973  50    0       3   NA    NA   NA
    ## 322       3       3       3       1   2 1973  51    0       3   NA    NA   NA
    ## 323      NA      NA      NA      NA   2 1991  31    0       6   NA    NA   NA
    ## 324       4       5       4       4   2 1991  32    1       6   NA    NA   NA
    ## 325      -2      -2      -2      -2   2 1991  33    1       6   NA    NA   NA
    ## 326      NA      NA      NA      NA   1 1992  30    0       6   NA    NA   NA
    ## 327       4       4       3       3   1 1992  31    0       6   NA    NA   NA
    ## 328      NA      NA      NA      NA   1 1992  31    0       6   NA    NA   NA
    ## 329      NA      NA      NA      NA   2 1993  29    0       6   NA    NA   NA
    ## 330       2      -2       3       2   2 1993  30    0       6   NA    NA   NA
    ## 331       3       3       2       3   2 1993  31    0       6   NA    NA   NA
    ## 332      NA      NA      NA      NA   1 1971  50    0       6   NA    NA   NA
    ## 333       4       4       4       4   1 1971  51    0       6   NA    NA   NA
    ## 334      NA      NA      NA      NA   1 1971  52    0       6   NA    NA   NA
    ## 335      NA      NA      NA      NA   1 1991  31    0       3   NA    NA   NA
    ## 336       4       3       2       3   1 1991  32    0       3   NA    NA   NA
    ## 337       3       4       2       4   1 1991  33    0       3   NA    NA   NA
    ## 338      NA      NA      NA      NA   2 1981  41    0       3   NA    NA   NA
    ## 339       3       3       4       3   2 1981  42    0       3   NA    NA   NA
    ## 340       2       2       3       2   2 1981  43    0       3   NA    NA   NA
    ## 341      NA      NA      NA      NA   1 1983  38    0       6   NA    NA   NA
    ## 342      NA      NA      NA      NA   2 1991  31    0       3   NA    NA   NA
    ## 343       2       4       2       3   2 1991  32    0       3   NA    NA   NA
    ## 344       2       3       1       1   2 1991  33    0       3   NA    NA   NA
    ## 345      NA      NA      NA      NA   2 1992  30    1       0   NA    NA   NA
    ## 346       2       2       2       2   2 1992  31    1       0   NA    NA   NA
    ## 347       3       4       2       3   2 1992  32    1       0   NA    NA   NA
    ## 348      NA      NA      NA      NA   2 1993  29    0       6   NA    NA   NA
    ## 349       4       3       2       3   2 1993  30    0       6   NA    NA   NA
    ## 350       3       3       4       4   2 1993  31    0       6   NA    NA   NA
    ## 351      NA      NA      NA      NA   1 1971  51    0       3   NA    NA   NA
    ## 352       2       3       4       2   1 1971  52    0       3   NA    NA   NA
    ## 353       3       2       4       2   1 1971  53    0       3   NA    NA   NA
    ## 354      NA      NA      NA      NA   2 1981  41    0       3   NA    NA   NA
    ## 355       3       4       4       4   2 1981  42    0       3   NA    NA   NA
    ## 356       2       3       4       4   2 1981  43    0       3   NA    NA   NA
    ## 357      NA      NA      NA      NA   1 1982  39    0       6   NA    NA   NA
    ## 358       3       3       4       3   1 1982  40    0       6   NA    NA   NA
    ## 359       3       3       3       2   1 1982  41    0       6   NA    NA   NA
    ## 360      NA      NA      NA      NA   1 1971  50    0       6   NA    NA   NA
    ## 361       3       4       2       4   1 1971  51    0       6   NA    NA   NA
    ## 362       4       4       2       4   1 1971  52    0       6   NA    NA   NA
    ## 363      NA      NA      NA      NA   2 1992  29    0       3   NA    NA   NA
    ## 364       3       3       3       4   2 1992  30    0       3   NA    NA   NA
    ## 365       2       3       4       3   2 1992  32    0       3   NA    NA   NA
    ## 366      NA      NA      NA      NA   1 1982  40    0       3   NA    NA   NA
    ## 367       4       4       4       4   1 1982  41    0       3   NA    NA   NA
    ## 368       4       4       3       3   1 1982  42    0       3   NA    NA   NA
    ## 369      NA      NA      NA      NA   2 1991  31    0       6   NA    NA   NA
    ## 370       3       3       5       3   2 1991  32    0       6   NA    NA   NA
    ## 371       4       4       5       4   2 1991  33    0       6   NA    NA   NA
    ## 372      NA      NA      NA      NA   1 1993  29    0       6   NA    NA   NA
    ## 373       2       2       1       3   1 1993  30    0       6   NA    NA   NA
    ## 374       3       3       4       5   1 1993  31    0       6   NA    NA   NA
    ## 375      NA      NA      NA      NA   2 1992  30    0       4   NA    NA   NA
    ## 376       2       2       5       3   2 1992  31    0       4   NA    NA   NA
    ## 377       2       3       2       3   2 1992  32    0       4   NA    NA   NA
    ## 378      NA      NA      NA      NA   1 1973  49    1       3   NA    NA   NA
    ## 379       2       2       1       1   1 1973  50    1       3   NA    NA   NA
    ## 380       3       3       1       1   1 1973  51    1       3   NA    NA   NA
    ## 381      NA      NA      NA      NA   2 1981  40    0       3   NA    NA   NA
    ## 382       3       3       3       3   2 1981  42    0       3   NA    NA   NA
    ## 383       3       3       2       3   2 1981  43    0       3   NA    NA   NA
    ## 384      NA      NA      NA      NA   2 1981  40    0       4   NA    NA   NA
    ## 385       3      -2       3       2   2 1981  41    0       4   NA    NA   NA
    ## 386       4       3       4       2   2 1981  42    0       4   NA    NA   NA
    ## 387      NA      NA      NA      NA   2 1993  29    0       6   NA    NA   NA
    ## 388       3       3       1       2   2 1993  30    0       6   NA    NA   NA
    ## 389       2       3       1       3   2 1993  31    0       6   NA    NA   NA
    ## 390      NA      NA      NA      NA   2 1982  40    1       3   NA    NA   NA
    ## 391       3       5       3       1   2 1982  41    1       3   NA    NA   NA
    ## 392       2       4       3       3   2 1982  42    1       3   NA    NA   NA
    ## 393      NA      NA      NA      NA   2 1973  49    1       8   NA    NA   NA
    ## 394       4       4       3       3   2 1973  50    1       8   NA    NA   NA
    ## 395       5       3       3       4   2 1973  51    1       8   NA    NA   NA
    ## 396      NA      NA      NA      NA   1 1983  39    0       6   NA    NA   NA
    ## 397       3       4       4       4   1 1983  40    0       6   NA    NA   NA
    ## 398       3       4       4       3   1 1983  41    0       6   NA    NA   NA
    ## 399      NA      NA      NA      NA   2 1982  40    0       6   NA    NA   NA
    ## 400       4       2       4       4   2 1982  41    0       6   NA    NA   NA
    ## 401       4       3       4       3   2 1982  42    0       6   NA    NA   NA
    ## 402      NA      NA      NA      NA   2 1981  41    1       6   NA    NA   NA
    ## 403      NA      NA      NA      NA   2 1981  41    1       6   NA    NA   NA
    ## 404      NA      NA      NA      NA   2 1981  42    1       6   NA    NA   NA
    ## 405      NA      NA      NA      NA   1 1971  51    0       6   NA    NA   NA
    ## 406       3       3       3       4   1 1971  52    0       6   NA    NA   NA
    ## 407       3       4       4       4   1 1971  53    0       6   NA    NA   NA
    ## 408      NA      NA      NA      NA   2 1982  40    0       3   NA    NA   NA
    ## 409      NA      NA      NA      NA   1 1992  30    0       0   NA    NA   NA
    ## 410      NA      NA      NA      NA   2 1993  29    0       6   NA    NA   NA
    ## 411      NA      NA      NA      NA   2 1993  31    0       6   NA    NA   NA
    ## 412      NA      NA      NA      NA   1 1972  50    0       8   NA    NA   NA
    ## 413       4       4       1       4   1 1972  50    0       8   NA    NA   NA
    ## 414       3       4       2       3   1 1972  51    0       8   NA    NA   NA
    ## 415      NA      NA      NA      NA   1 1992  30    0       6   NA    NA   NA
    ## 416       4       3       4       4   1 1992  31    0       6   NA    NA   NA
    ## 417       3       3       4       4   1 1992  32    0       6   NA    NA   NA
    ## 418      NA      NA      NA      NA   2 1983  39    1       6   NA    NA   NA
    ## 419       3       3       4       4   2 1983  40    1       6   NA    NA   NA
    ## 420       3       3       4       5   2 1983  41    1       6   NA    NA   NA
    ## 421      NA      NA      NA      NA   2 1972  49    1       3   NA    NA   NA
    ## 422      NA      NA      NA      NA   2 1981  40    0       3   NA    NA   NA
    ## 423       4       5       4       3   2 1981  42    0       3   NA    NA   NA
    ## 424       3       4       4       3   2 1981  43    0       3   NA    NA   NA
    ## 425      NA      NA      NA      NA   1 1993  29    0       6   NA    NA   NA
    ## 426       3       4       4       4   1 1993  30    0       6   NA    NA   NA
    ## 427       4       4       5       4   1 1993  31    0       6   NA    NA   NA
    ## 428      NA      NA      NA      NA   1 1972  50    0       6   NA    NA   NA
    ## 429       4       4       5       4   1 1972  51    0       6   NA    NA   NA
    ## 430      NA      NA      NA      NA   2 1971  51    0       3   NA    NA   NA
    ## 431       4       4       3       2   2 1971  52    0       3   NA    NA   NA
    ## 432       4       4       4       4   2 1971  53    0       3   NA    NA   NA
    ## 433      NA      NA      NA      NA   1 1983  39    0      -7   NA    NA   NA
    ## 434       4       4       3       2   1 1983  40    0      -7   NA    NA   NA
    ## 435       4       2       4       2   1 1983  41    0      -7   NA    NA   NA
    ## 436      NA      NA      NA      NA   1 1993  29    0       6   NA    NA   NA
    ## 437      NA      NA      NA      NA   2 1973  48    0       3   NA    NA   NA
    ## 438      NA      NA      NA      NA   1 1971  51    0       6   NA    NA   NA
    ## 439       2       3       4       2   1 1971  52    0       6   NA    NA   NA
    ## 440       2       2       3       2   1 1971  53    0       6   NA    NA   NA
    ## 441      NA      NA      NA      NA   2 1992  29    1       6   NA    NA   NA
    ## 442      NA      NA      NA      NA   2 1982  40    1       3   NA    NA   NA
    ## 443      NA      NA      NA      NA   2 1993  29    0       4   NA    NA   NA
    ## 444       4       3       2       2   2 1993  30    0       4   NA    NA   NA
    ## 445       4       3       2       3   2 1993  31    0       4   NA    NA   NA
    ## 446      NA      NA      NA      NA   1 1993  29    1       8   NA    NA   NA
    ## 447      NA      NA      NA      NA   1 1993  29    1       8   NA    NA   NA
    ## 448       3       4       2       3   1 1993  31    1       8   NA    NA   NA
    ## 449      NA      NA      NA      NA   1 1981  41    0       6   NA    NA   NA
    ## 450       3       3       4       3   1 1981  42    0       6   NA    NA   NA
    ## 451       5       3       4       5   1 1981  43    0       6   NA    NA   NA
    ## 452      NA      NA      NA      NA   1 1973  49    0       6   NA    NA   NA
    ## 453       4       4       4       3   1 1973  50    0       6   NA    NA   NA
    ## 454       4       3       4       3   1 1973  51    0       6   NA    NA   NA
    ## 455      NA      NA      NA      NA   1 1972  50    0       6   NA    NA   NA
    ## 456       5       4       3       5   1 1972  51    0       6   NA    NA   NA
    ## 457       5       4       4       5   1 1972  52    0       6   NA    NA   NA
    ## 458      NA      NA      NA      NA   1 1971  51    0       3   NA    NA   NA
    ## 459       3       4       3       2   1 1971  52    0       3   NA    NA   NA
    ## 460       3       4       2       2   1 1971  53    0       3   NA    NA   NA
    ## 461      NA      NA      NA      NA   2 1983  38    0       3   NA    NA   NA
    ## 462       3       3       3       4   2 1983  39    0       3   NA    NA   NA
    ## 463       3       3       3       4   2 1983  40    0       3   NA    NA   NA
    ## 464      NA      NA      NA      NA   1 1981  41    0       6   NA    NA   NA
    ## 465       4       4       2       2   1 1981  42    0       6   NA    NA   NA
    ## 466       3       4       3       2   1 1981  43    0       6   NA    NA   NA
    ## 467      NA      NA      NA      NA   1 1983  39    0       6   NA    NA   NA
    ## 468      NA      NA      NA      NA   1 1983  39    0       6   NA    NA   NA
    ## 469      NA      NA      NA      NA   2 1971  50    0       6   NA    NA   NA
    ## 470      NA      NA      NA      NA   1 1983  38    0       3   NA    NA   NA
    ## 471       2       3       1       1   1 1983  39    0       3   NA    NA   NA
    ## 472       3       3       1       1   1 1983  41    0       3   NA    NA   NA
    ## 473      NA      NA      NA      NA   2 1971  51    0       3   NA    NA   NA
    ## 474       3       2      -2       3   2 1971  52    0       3   NA    NA   NA
    ## 475      NA      NA      NA      NA   2 1971  52    0       3   NA    NA   NA
    ## 476      NA      NA      NA      NA   2 1982  39    0       6   NA    NA   NA
    ## 477       2       4       2       3   2 1982  40    0       6   NA    NA   NA
    ## 478       2       4       1       3   2 1982  41    0       6   NA    NA   NA
    ## 479      NA      NA      NA      NA   2 1982  40    0       6   NA    NA   NA
    ## 480       2       3       3       2   2 1982  41    0       6   NA    NA   NA
    ## 481       4       4       4       2   2 1982  42    0       6   NA    NA   NA
    ## 482      NA      NA      NA      NA   2 1993  28    0       6   NA    NA   NA
    ## 483       2       2       3       3   2 1993  30    0       6   NA    NA   NA
    ## 484       3       2       4       3   2 1993  31    0       6   NA    NA   NA
    ## 485      NA      NA      NA      NA   1 1972  49    0       6   NA    NA   NA
    ## 486       3       2       4       3   1 1972  50    0       6   NA    NA   NA
    ## 487       4       4       4       4   1 1972  51    0       6   NA    NA   NA
    ## 488      NA      NA      NA      NA   1 1971  51    0       3   NA    NA   NA
    ## 489       4       3       4       5   1 1971  52    0       3   NA    NA   NA
    ## 490       4       3       3       3   1 1971  53    0       3   NA    NA   NA
    ## 491      NA      NA      NA      NA   2 1991  31    0       6   NA    NA   NA
    ## 492       3       3       3       3   2 1991  32    0       6   NA    NA   NA
    ##     hw11w hw11m sd47i1
    ## 1      NA    NA    -10
    ## 2      NA    NA    -10
    ## 3      NA    NA    -10
    ## 4      NA    NA      1
    ## 5      NA    NA    -10
    ## 6      NA    NA    -10
    ## 7      NA    NA    -10
    ## 8      NA    NA    -10
    ## 9      NA    NA    -10
    ## 10     NA    NA    -10
    ## 11     NA    NA    -10
    ## 12     NA    NA    -10
    ## 13     NA    NA    -10
    ## 14     NA    NA    -10
    ## 15     NA    NA    -10
    ## 16     NA    NA    -10
    ## 17     NA    NA    -10
    ## 18     NA    NA    -10
    ## 19     NA    NA    -10
    ## 20     NA    NA    -10
    ## 21     NA    NA    -10
    ## 22     NA    NA    -10
    ## 23     NA    NA    -10
    ## 24     NA    NA    -10
    ## 25     NA    NA    -10
    ## 26     NA    NA    -10
    ## 27     NA    NA    -10
    ## 28     NA    NA    -10
    ## 29     NA    NA    -10
    ## 30     NA    NA    -10
    ## 31     NA    NA    -10
    ## 32     NA    NA      0
    ## 33     NA    NA    -10
    ## 34     NA    NA    -10
    ## 35     NA    NA    -10
    ## 36     NA    NA    -10
    ## 37     NA    NA    -10
    ## 38     NA    NA    -10
    ## 39     NA    NA    -10
    ## 40     NA    NA    -10
    ## 41     NA    NA    -10
    ## 42     NA    NA    -10
    ## 43     NA    NA    -10
    ## 44     NA    NA    -10
    ## 45     NA    NA    -10
    ## 46     NA    NA    -10
    ## 47     NA    NA    -10
    ## 48     NA    NA      0
    ## 49     NA    NA    -10
    ## 50     NA    NA    -10
    ## 51     NA    NA    -10
    ## 52     NA    NA    -10
    ## 53     NA    NA    -10
    ## 54     NA    NA    -10
    ## 55     NA    NA    -10
    ## 56     NA    NA    -10
    ## 57     NA    NA    -10
    ## 58     NA    NA    -10
    ## 59     NA    NA    -10
    ## 60     NA    NA    -10
    ## 61     NA    NA    -10
    ## 62     NA    NA    -10
    ## 63     NA    NA    -10
    ## 64     NA    NA    -10
    ## 65     NA    NA    -10
    ## 66     NA    NA    -10
    ## 67     NA    NA    -10
    ## 68     NA    NA    -10
    ## 69     NA    NA    -10
    ## 70     NA    NA    -10
    ## 71     NA    NA    -10
    ## 72     NA    NA    -10
    ## 73     NA    NA    -10
    ## 74     NA    NA    -10
    ## 75     NA    NA    -10
    ## 76     NA    NA    -10
    ## 77     NA    NA    -10
    ## 78     NA    NA    -10
    ## 79     NA    NA    -10
    ## 80     NA    NA    -10
    ## 81     NA    NA    -10
    ## 82     NA    NA    -10
    ## 83     NA    NA    -10
    ## 84     NA    NA    -10
    ## 85     NA    NA    -10
    ## 86     NA    NA      1
    ## 87     NA    NA    -10
    ## 88     NA    NA    -10
    ## 89     NA    NA    -10
    ## 90     NA    NA    -10
    ## 91     NA    NA    -10
    ## 92     NA    NA    -10
    ## 93     NA    NA    -10
    ## 94     NA    NA    -10
    ## 95     NA    NA    -10
    ## 96     NA    NA    -10
    ## 97     NA    NA    -10
    ## 98     NA    NA    -10
    ## 99     NA    NA    -10
    ## 100    NA    NA    -10
    ## 101    NA    NA    -10
    ## 102    NA    NA    -10
    ## 103    NA    NA    -10
    ## 104    NA    NA    -10
    ## 105    NA    NA    -10
    ## 106    NA    NA    -10
    ## 107    NA    NA    -10
    ## 108    NA    NA    -10
    ## 109    NA    NA    -10
    ## 110    NA    NA    -10
    ## 111    NA    NA    -10
    ## 112    NA    NA    -10
    ## 113    NA    NA    -10
    ## 114    NA    NA    -10
    ## 115    NA    NA    -10
    ## 116    NA    NA    -10
    ## 117    NA    NA    -10
    ## 118    NA    NA    -10
    ## 119    NA    NA    -10
    ## 120    NA    NA    -10
    ## 121    NA    NA    -10
    ## 122    NA    NA      0
    ## 123    NA    NA      0
    ## 124    NA    NA    -10
    ## 125    NA    NA    -10
    ## 126    NA    NA    -10
    ## 127    NA    NA    -10
    ## 128    NA    NA    -10
    ## 129    NA    NA    -10
    ## 130    NA    NA    -10
    ## 131    NA    NA    -10
    ## 132    NA    NA    -10
    ## 133    NA    NA    -10
    ## 134    NA    NA    -10
    ## 135    NA    NA    -10
    ## 136    NA    NA    -10
    ## 137    NA    NA    -10
    ## 138    NA    NA    -10
    ## 139    NA    NA    -10
    ## 140    NA    NA    -10
    ## 141    NA    NA    -10
    ## 142    NA    NA    -10
    ## 143    NA    NA    -10
    ## 144    NA    NA    -10
    ## 145    NA    NA    -10
    ## 146    NA    NA    -10
    ## 147    NA    NA    -10
    ## 148    NA    NA    -10
    ## 149    NA    NA    -10
    ## 150    NA    NA    -10
    ## 151    NA    NA    -10
    ## 152    NA    NA    -10
    ## 153    NA    NA    -10
    ## 154    NA    NA    -10
    ## 155    NA    NA    -10
    ## 156    NA    NA    -10
    ## 157    NA    NA    -10
    ## 158    NA    NA    -10
    ## 159    NA    NA    -10
    ## 160    NA    NA    -10
    ## 161    NA    NA    -10
    ## 162    NA    NA    -10
    ## 163    NA    NA    -10
    ## 164    NA    NA    -10
    ## 165    NA    NA    -10
    ## 166    NA    NA    -10
    ## 167    NA    NA    -10
    ## 168    NA    NA    -10
    ## 169    NA    NA    -10
    ## 170    NA    NA    -10
    ## 171    NA    NA    -10
    ## 172    NA    NA    -10
    ## 173    NA    NA    -10
    ## 174    NA    NA    -10
    ## 175    NA    NA    -10
    ## 176    NA    NA    -10
    ## 177    NA    NA    -10
    ## 178    NA    NA    -10
    ## 179    NA    NA    -10
    ## 180    NA    NA    -10
    ## 181    NA    NA    -10
    ## 182    NA    NA    -10
    ## 183    NA    NA    -10
    ## 184    NA    NA    -10
    ## 185    NA    NA    -10
    ## 186    NA    NA    -10
    ## 187    NA    NA    -10
    ## 188    NA    NA    -10
    ## 189    NA    NA    -10
    ## 190    NA    NA    -10
    ## 191    NA    NA    -10
    ## 192    NA    NA    -10
    ## 193    NA    NA    -10
    ## 194    NA    NA    -10
    ## 195    NA    NA    -10
    ## 196    NA    NA    -10
    ## 197    NA    NA    -10
    ## 198    NA    NA    -10
    ## 199    NA    NA    -10
    ## 200    NA    NA    -10
    ## 201    NA    NA    -10
    ## 202    NA    NA    -10
    ## 203    NA    NA    -10
    ## 204    NA    NA    -10
    ## 205    NA    NA    -10
    ## 206    NA    NA    -10
    ## 207    NA    NA    -10
    ## 208    NA    NA    -10
    ## 209    NA    NA    -10
    ## 210    NA    NA    -10
    ## 211    NA    NA    -10
    ## 212    NA    NA    -10
    ## 213    NA    NA    -10
    ## 214    NA    NA    -10
    ## 215    NA    NA    -10
    ## 216    NA    NA    -10
    ## 217    NA    NA    -10
    ## 218    NA    NA    -10
    ## 219    NA    NA    -10
    ## 220    NA    NA    -10
    ## 221    NA    NA    -10
    ## 222    NA    NA    -10
    ## 223    NA    NA    -10
    ## 224    NA    NA    -10
    ## 225    NA    NA    -10
    ## 226    NA    NA    -10
    ## 227    NA    NA    -10
    ## 228    NA    NA    -10
    ## 229    NA    NA    -10
    ## 230    NA    NA    -10
    ## 231    NA    NA    -10
    ## 232    NA    NA    -10
    ## 233    NA    NA    -10
    ## 234    NA    NA    -10
    ## 235    NA    NA      0
    ## 236    NA    NA      0
    ## 237    NA    NA    -10
    ## 238    NA    NA    -10
    ## 239    NA    NA    -10
    ## 240    NA    NA    -10
    ## 241    NA    NA    -10
    ## 242    NA    NA    -10
    ## 243    NA    NA    -10
    ## 244    NA    NA    -10
    ## 245    NA    NA    -10
    ## 246    NA    NA    -10
    ## 247    NA    NA    -10
    ## 248    NA    NA    -10
    ## 249    NA    NA    -10
    ## 250    NA    NA    -10
    ## 251    NA    NA    -10
    ## 252    NA    NA    -10
    ## 253    NA    NA    -10
    ## 254    NA    NA    -10
    ## 255    NA    NA    -10
    ## 256    NA    NA    -10
    ## 257    NA    NA    -10
    ## 258    NA    NA    -10
    ## 259    NA    NA    -10
    ## 260    NA    NA    -10
    ## 261    NA    NA     -2
    ## 262    NA    NA      1
    ## 263    NA    NA    -10
    ## 264    NA    NA    -10
    ## 265    NA    NA    -10
    ## 266    NA    NA    -10
    ## 267    NA    NA    -10
    ## 268    NA    NA    -10
    ## 269    NA    NA    -10
    ## 270    NA    NA    -10
    ## 271    NA    NA    -10
    ## 272    NA    NA    -10
    ## 273    NA    NA    -10
    ## 274    NA    NA    -10
    ## 275    NA    NA    -10
    ## 276    NA    NA    -10
    ## 277    NA    NA    -10
    ## 278    NA    NA    -10
    ## 279    NA    NA    -10
    ## 280    NA    NA    -10
    ## 281    NA    NA    -10
    ## 282    NA    NA    -10
    ## 283    NA    NA    -10
    ## 284    NA    NA    -10
    ## 285    NA    NA    -10
    ## 286    NA    NA    -10
    ## 287    NA    NA    -10
    ## 288    NA    NA    -10
    ## 289    NA    NA    -10
    ## 290    NA    NA    -10
    ## 291    NA    NA    -10
    ## 292    NA    NA      0
    ## 293    NA    NA    -10
    ## 294    NA    NA    -10
    ## 295    NA    NA    -10
    ## 296    NA    NA    -10
    ## 297    NA    NA    -10
    ## 298    NA    NA      1
    ## 299    NA    NA    -10
    ## 300    NA    NA    -10
    ## 301    NA    NA    -10
    ## 302    NA    NA    -10
    ## 303    NA    NA    -10
    ## 304    NA    NA    -10
    ## 305    NA    NA    -10
    ## 306    NA    NA    -10
    ## 307    NA    NA    -10
    ## 308    NA    NA    -10
    ## 309    NA    NA    -10
    ## 310    NA    NA    -10
    ## 311    NA    NA    -10
    ## 312    NA    NA    -10
    ## 313    NA    NA    -10
    ## 314    NA    NA    -10
    ## 315    NA    NA    -10
    ## 316    NA    NA    -10
    ## 317    NA    NA    -10
    ## 318    NA    NA    -10
    ## 319    NA    NA    -10
    ## 320    NA    NA    -10
    ## 321    NA    NA    -10
    ## 322    NA    NA    -10
    ## 323    NA    NA    -10
    ## 324    NA    NA    -10
    ## 325    NA    NA    -10
    ## 326    NA    NA    -10
    ## 327    NA    NA    -10
    ## 328    NA    NA    -10
    ## 329    NA    NA    -10
    ## 330    NA    NA    -10
    ## 331    NA    NA    -10
    ## 332    NA    NA    -10
    ## 333    NA    NA    -10
    ## 334    NA    NA    -10
    ## 335    NA    NA    -10
    ## 336    NA    NA    -10
    ## 337    NA    NA    -10
    ## 338    NA    NA    -10
    ## 339    NA    NA    -10
    ## 340    NA    NA    -10
    ## 341    NA    NA    -10
    ## 342    NA    NA    -10
    ## 343    NA    NA    -10
    ## 344    NA    NA    -10
    ## 345    NA    NA    -10
    ## 346    NA    NA    -10
    ## 347    NA    NA    -10
    ## 348    NA    NA    -10
    ## 349    NA    NA    -10
    ## 350    NA    NA    -10
    ## 351    NA    NA      1
    ## 352    NA    NA      1
    ## 353    NA    NA      1
    ## 354    NA    NA    -10
    ## 355    NA    NA    -10
    ## 356    NA    NA    -10
    ## 357    NA    NA    -10
    ## 358    NA    NA    -10
    ## 359    NA    NA    -10
    ## 360    NA    NA    -10
    ## 361    NA    NA    -10
    ## 362    NA    NA    -10
    ## 363    NA    NA    -10
    ## 364    NA    NA    -10
    ## 365    NA    NA    -10
    ## 366    NA    NA    -10
    ## 367    NA    NA    -10
    ## 368    NA    NA    -10
    ## 369    NA    NA    -10
    ## 370    NA    NA    -10
    ## 371    NA    NA    -10
    ## 372    NA    NA    -10
    ## 373    NA    NA    -10
    ## 374    NA    NA    -10
    ## 375    NA    NA    -10
    ## 376    NA    NA    -10
    ## 377    NA    NA    -10
    ## 378    NA    NA      0
    ## 379    NA    NA      0
    ## 380    NA    NA      0
    ## 381    NA    NA    -10
    ## 382    NA    NA    -10
    ## 383    NA    NA    -10
    ## 384    NA    NA    -10
    ## 385    NA    NA    -10
    ## 386    NA    NA    -10
    ## 387    NA    NA    -10
    ## 388    NA    NA    -10
    ## 389    NA    NA    -10
    ## 390    NA    NA    -10
    ## 391    NA    NA    -10
    ## 392    NA    NA    -10
    ## 393    NA    NA    -10
    ## 394    NA    NA    -10
    ## 395    NA    NA    -10
    ## 396    NA    NA    -10
    ## 397    NA    NA    -10
    ## 398    NA    NA    -10
    ## 399    NA    NA    -10
    ## 400    NA    NA    -10
    ## 401    NA    NA    -10
    ## 402    NA    NA    -10
    ## 403    NA    NA    -10
    ## 404    NA    NA    -10
    ## 405    NA    NA    -10
    ## 406    NA    NA    -10
    ## 407    NA    NA    -10
    ## 408    NA    NA    -10
    ## 409    NA    NA    -10
    ## 410    NA    NA    -10
    ## 411    NA    NA    -10
    ## 412    NA    NA    -10
    ## 413    NA    NA    -10
    ## 414    NA    NA    -10
    ## 415    NA    NA    -10
    ## 416    NA    NA    -10
    ## 417    NA    NA    -10
    ## 418    NA    NA    -10
    ## 419    NA    NA    -10
    ## 420    NA    NA    -10
    ## 421    NA    NA    -10
    ## 422    NA    NA    -10
    ## 423    NA    NA    -10
    ## 424    NA    NA    -10
    ## 425    NA    NA    -10
    ## 426    NA    NA    -10
    ## 427    NA    NA    -10
    ## 428    NA    NA    -10
    ## 429    NA    NA    -10
    ## 430    NA    NA      0
    ## 431    NA    NA      0
    ## 432    NA    NA      0
    ## 433    NA    NA    -10
    ## 434    NA    NA    -10
    ## 435    NA    NA    -10
    ## 436    NA    NA    -10
    ## 437    NA    NA      0
    ## 438    NA    NA    -10
    ## 439    NA    NA    -10
    ## 440    NA    NA    -10
    ## 441    NA    NA    -10
    ## 442    NA    NA    -10
    ## 443    NA    NA      1
    ## 444    NA    NA    -10
    ## 445    NA    NA    -10
    ## 446    NA    NA    -10
    ## 447    NA    NA    -10
    ## 448    NA    NA    -10
    ## 449    NA    NA    -10
    ## 450    NA    NA    -10
    ## 451    NA    NA    -10
    ## 452    NA    NA    -10
    ## 453    NA    NA    -10
    ## 454    NA    NA    -10
    ## 455    NA    NA    -10
    ## 456    NA    NA    -10
    ## 457    NA    NA    -10
    ## 458    NA    NA    -10
    ## 459    NA    NA    -10
    ## 460    NA    NA    -10
    ## 461    NA    NA    -10
    ## 462    NA    NA    -10
    ## 463    NA    NA    -10
    ## 464    NA    NA    -10
    ## 465    NA    NA    -10
    ## 466    NA    NA    -10
    ## 467    NA    NA    -10
    ## 468    NA    NA    -10
    ## 469    NA    NA    -10
    ## 470    NA    NA    -10
    ## 471    NA    NA    -10
    ## 472    NA    NA    -10
    ## 473    NA    NA      0
    ## 474    NA    NA      0
    ## 475    NA    NA    -10
    ## 476    NA    NA    -10
    ## 477    NA    NA    -10
    ## 478    NA    NA    -10
    ## 479    NA    NA      1
    ## 480    NA    NA    -10
    ## 481    NA    NA    -10
    ## 482    NA    NA    -10
    ## 483    NA    NA    -10
    ## 484    NA    NA    -10
    ## 485    NA    NA    -10
    ## 486    NA    NA    -10
    ## 487    NA    NA    -10
    ## 488    NA    NA    -10
    ## 489    NA    NA    -10
    ## 490    NA    NA    -10
    ## 491    NA    NA    -10
    ## 492    NA    NA    -10
    ##  [ reached 'max' / getOption("max.print") -- omitted 107429 rows ]

    #ggplot(data, aes(x = sat3, y = frt69, fill = percentages)) +
     #geom_tile() + 
      #scale_fill_gradient(low = "white", high = "blue") +
     #theme_minimal()

    #1.3
    #I think that is due to happy couples not wanting to change any of their current situation since they are allready fulfilled. Maybe the unhappier families simply are unhapy because they want ti have children but do not have any yet and will be happier as soon as they have children. 

    #1.4
    hist(data$sat3)

![](Jannis-DW_files/figure-markdown_strict/FertilityRateAnalysis-1.png)

    #We have the statistical problem that most people see themselves as very happy or do not want to answer the question. This leads to a very skewed distribution of the data and makes it hard to find a correlation between the two variables.

    #1.5
    #corellation between sat3 and frt69 with controll of age
    vars <- c("sat3", "frt69", "age")

    #data %>%
     # mutate(
      #  age = 2026 - data$age
      #) %>%
      #mutate(
       # across(c(sat3, frt69, age), ~replace(NA, .x, .x<0,))
      #)
      #drop_na(data, any_of(vars))

    # pcor.test(data$sat3, data$frt69, (2026 - data$age), method = "pearson")

    #1.6
