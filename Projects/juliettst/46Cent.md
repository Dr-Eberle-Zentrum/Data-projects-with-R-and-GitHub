## Reading in the data

    subjects <- list()

    for (id in list.files("Week4 Homework- Sleep synthetic project", pattern = "^subject_.*\\.csv$")){
      subjects[[id]]<- read.csv(paste0("Week4 Homework- Sleep synthetic project/",id))
    }

    all_subjects <- bind_rows(subjects)

    PANAS <- read.csv("Week4 Homework- Sleep synthetic project/PANAS_scores.csv")
    BDI<- read.csv("Week4 Homework- Sleep synthetic project/BDI_scores.csv")

## Cleaning and validating the data

    # Formatting the Date
    all_subjects <- all_subjects %>% 
      mutate(
        von = ymd_hms(von),
        bis = ymd_hms(bis)
      )

    #Removing Duplicates
    all_subjects <- all_subjects %>% arrange(von, bis, participant, desc(Dauer.des.Schlafs..s.)) %>% 
      distinct(von, bis, participant, .keep_all = TRUE)

Are there really this many duplicates ? I can’t believe it.

    only_dupes <- all_subjects %>% 
     filter(duplicated(across(c(participant, von, bis)))) %>%
      arrange(von, bis, participant, desc(Dauer.des.Schlafs..s.))

I guess there are…

    # Checking for NA's
    all_subjects %>% count(is.na(all_subjects)) # 0 Missing values (not including night.events)

    ##   is.na(all_subjects).participant is.na(all_subjects).von
    ## 1                           FALSE                   FALSE
    ##   is.na(all_subjects).bis is.na(all_subjects).leicht..s.
    ## 1                   FALSE                          FALSE
    ##   is.na(all_subjects).tief..s. is.na(all_subjects).rem..s.
    ## 1                        FALSE                       FALSE
    ##   is.na(all_subjects).wach..s. is.na(all_subjects).Aufwachen
    ## 1                        FALSE                         FALSE
    ##   is.na(all_subjects).Dauer.des.Schlafs..s.
    ## 1                                     FALSE
    ##   is.na(all_subjects).Dauer.bis.zum.Wachwerden..s.
    ## 1                                            FALSE
    ##   is.na(all_subjects).Schnarchen..s. is.na(all_subjects).Schnarchepisoden
    ## 1                              FALSE                                FALSE
    ##   is.na(all_subjects).Durchschnittliche.Herzfrequenz
    ## 1                                              FALSE
    ##   is.na(all_subjects).Herzfrequenz..min. is.na(all_subjects).Herzfrequenz..max.
    ## 1                                  FALSE                                  FALSE
    ##   is.na(all_subjects).Night.events   n
    ## 1                             TRUE 585

    # Looking for implausible values
    all_subjects <- all_subjects %>% 
      mutate(
        unplausible =
          ifelse(Dauer.des.Schlafs..s. > 57600 | Herzfrequenz..min. < 30 | Herzfrequenz..max. > 200, 1, 0) # no implausible values
      )

## Data Validation Checks

    # Verify sleep duration:
    all_subjects <- all_subjects %>% 
      mutate(
        sleep_sum = `leicht..s.` + `tief..s.` + `rem..s.` + `wach..s.`,
        diff_secs = `Dauer.des.Schlafs..s.` - sleep_sum,
        sleep_ok  = abs(diff_secs) <= 600   # Toleranz 10 Minuten
      )

    # Confirm timestamps logical (bis > von):
    all_subjects <- all_subjects %>% 
      mutate(
        timestamp_ok = bis > von
      )

    # Check sleep period duration matches timestamp difference:
    all_subjects <- all_subjects %>% 
      mutate(
        duration_secs_calc = as.numeric(bis - von, units = "secs"),
        duration_check = abs(duration_secs_calc - `Dauer.des.Schlafs..s.`) <= 60*5 #5 Minutes Tolerance
      )


    # Identify outliers: sleep duration < 3 hours or > 12 hours:
    all_subjects <- all_subjects %>% 
      mutate(
        sleepduration.over.12 = ifelse(Dauer.des.Schlafs..s. > 12*60*60, 1, 0),
        sleepduration.under.3 = ifelse(Dauer.des.Schlafs..s. < 3*60*60, 1, 0)
      )

    # Flag sequences with >3 consecutive missing days:
    #'* Considering over 75% of the entries were deleted because they are duplicates this seems rather useless. Also unsure how to properly do*

    # Physiological plausibility:
    all_subjects <- all_subjects %>% 
      mutate(
        physiologically.plausible = ifelse(Herzfrequenz..min. > 40 & Herzfrequenz..max. < 100, 1, 0)
      )

## Visualization Goals

    # Sleep Architecture Over Time:
    all_subjects %>% 
      ggplot(
        aes(x = day(von), color = participant)
      )+
      geom_ribbon(aes(ymin = von, ymax = bis ))

![](46Cent_files/figure-markdown_strict/unnamed-chunk-6-1.png)

    all_subjects %>% 
      ggplot(
        aes(x = day(von), fill = participant)
      )+
      geom_area(aes(y = Dauer.des.Schlafs..s./60/60))+
      geom_smooth(aes(y = Dauer.des.Schlafs..s./60/60), method = "loess")

    ## `geom_smooth()` using formula = 'y ~ x'

![](46Cent_files/figure-markdown_strict/unnamed-chunk-6-2.png)

    # Sleep Duration Distribution:
    df <- all_subjects %>%
      mutate(
        date       = as_date(von),
        duration_h = `Dauer.des.Schlafs..s.` / 3600,
        week       = floor_date(date, unit = "week")  # "week" is enough
      )

    # sanity check: do these columns exist?
    str(df[, c("duration_h", "week")])

    ## 'data.frame':    585 obs. of  2 variables:
    ##  $ duration_h: num  6.21 4.09 9.95 7.42 8.75 ...
    ##  $ week      : Date, format: "2023-02-05" "2023-02-12" ...

    ggplot(df, aes(
      x = duration_h,
      y = factor(week),
      fill = factor(week)
    )) +
      geom_density_ridges(
        alpha = 0.8,
        color = "white",
        scale = 1.2,
        rel_min_height = 0.01
      ) +
      labs(
        title = "Sleep Duration Distribution by Week",
        x = "Sleep Duration (hours)",
        y = "Week",
        fill = "Block Start"
      ) +
      theme_minimal(base_size = 14) +
      theme(
        plot.title = element_text(face = "bold"),
        legend.position = "none"
      )

    ## Picking joint bandwidth of 1.32

![](46Cent_files/figure-markdown_strict/unnamed-chunk-6-3.png)

    # Overview of BDI Scores
    BDI <- BDI %>%
      mutate(date = ymd(date))

    BDI %>% 
      ggplot(
        aes(
          x = date,
          y = BDI_score
        )
      )+
      geom_violin(
        aes(
          fill = participant),
        alpha = 0.3
        )+
      facet_wrap(~ participant, scales = "free_x")

![](46Cent_files/figure-markdown_strict/unnamed-chunk-6-4.png)

    #' Circadian Pattern Visualization *by GPT*

    ggplot(
      all_subjects,
      aes(x = hour(von))
    ) +
      stat_summary_bin(
        aes(y = Dauer.des.Schlafs..s., fill = after_stat(y)),
        fun = sum,
        binwidth = 1,
        geom = "col",
        color = "white",
        alpha = 0.9
      ) +
      coord_polar(start = -pi/2) +
      scale_x_continuous(
        breaks = seq(0, 21, 3),
        limits = c(0, 24),
        minor_breaks = NULL,
        labels = function(x) sprintf("%02d:00", x)
      ) +
      scale_fill_viridis_c(option = "C", name = "Total sleep (h)") +
      facet_wrap(~ floor_date(von, "month")) +
      labs(
        title = "Circadian Pattern of Sleep Onset",
        x = "Sleep onset time (hour of day)",
        y = "Total sleep duration (hours, per bin)"
      ) +
      theme_minimal(base_size = 13) +
      theme(
        axis.title.y  = element_blank(),
        panel.grid.minor = element_blank(),
        plot.title = element_text(face = "bold", hjust = 0.5)
      )

    ## Warning: Removed 15 rows containing missing values or values outside the scale range
    ## (`geom_col()`).

![](46Cent_files/figure-markdown_strict/unnamed-chunk-6-5.png)

    # Summary Statistics Table (also made with ChatGPT):
    df <- all_subjects %>%
      mutate(
        date       = as_date(von),
        duration_h = `Dauer.des.Schlafs..s.` / 3600,
        week2_idx  = floor((yday(date) - 1) / 14),
        block2     = as.Date(floor_date(date, "year")) + weeks(2 * week2_idx)
      )
    summary_blocks <- df %>%
      group_by(block2) %>%
      summarise(
        n = n(),
        mean_duration_h = mean(duration_h, na.rm = TRUE),
        sd_duration_h   = sd(duration_h, na.rm = TRUE),
        mean_light_h    = mean(`leicht..s.` / 3600, na.rm = TRUE),
        mean_deep_h     = mean(`tief..s.` / 3600, na.rm = TRUE),
        mean_rem_h      = mean(`rem..s.` / 3600, na.rm = TRUE)
      )

    kable(summary_blocks, digits = 2, caption = "Sleep Summary by 2-Week Block")

<table>
<caption>Sleep Summary by 2-Week Block</caption>
<colgroup>
<col style="width: 13%" />
<col style="width: 3%" />
<col style="width: 20%" />
<col style="width: 17%" />
<col style="width: 16%" />
<col style="width: 15%" />
<col style="width: 13%" />
</colgroup>
<thead>
<tr>
<th style="text-align: left;">block2</th>
<th style="text-align: right;">n</th>
<th style="text-align: right;">mean_duration_h</th>
<th style="text-align: right;">sd_duration_h</th>
<th style="text-align: right;">mean_light_h</th>
<th style="text-align: right;">mean_deep_h</th>
<th style="text-align: right;">mean_rem_h</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">2023-01-29</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">6.21</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">4.43</td>
<td style="text-align: right;">0.62</td>
<td style="text-align: right;">0.00</td>
</tr>
<tr>
<td style="text-align: left;">2023-02-12</td>
<td style="text-align: right;">7</td>
<td style="text-align: right;">6.83</td>
<td style="text-align: right;">2.82</td>
<td style="text-align: right;">3.18</td>
<td style="text-align: right;">2.99</td>
<td style="text-align: right;">0.00</td>
</tr>
<tr>
<td style="text-align: left;">2023-02-26</td>
<td style="text-align: right;">7</td>
<td style="text-align: right;">5.80</td>
<td style="text-align: right;">3.23</td>
<td style="text-align: right;">3.06</td>
<td style="text-align: right;">2.55</td>
<td style="text-align: right;">0.01</td>
</tr>
<tr>
<td style="text-align: left;">2023-03-12</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">6.48</td>
<td style="text-align: right;">2.96</td>
<td style="text-align: right;">2.04</td>
<td style="text-align: right;">3.94</td>
<td style="text-align: right;">0.10</td>
</tr>
<tr>
<td style="text-align: left;">2023-03-26</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">6.51</td>
<td style="text-align: right;">3.70</td>
<td style="text-align: right;">3.29</td>
<td style="text-align: right;">2.44</td>
<td style="text-align: right;">0.04</td>
</tr>
<tr>
<td style="text-align: left;">2023-04-09</td>
<td style="text-align: right;">13</td>
<td style="text-align: right;">5.18</td>
<td style="text-align: right;">2.80</td>
<td style="text-align: right;">2.69</td>
<td style="text-align: right;">2.03</td>
<td style="text-align: right;">0.06</td>
</tr>
<tr>
<td style="text-align: left;">2023-04-23</td>
<td style="text-align: right;">24</td>
<td style="text-align: right;">5.77</td>
<td style="text-align: right;">3.06</td>
<td style="text-align: right;">2.81</td>
<td style="text-align: right;">2.47</td>
<td style="text-align: right;">0.01</td>
</tr>
<tr>
<td style="text-align: left;">2023-05-07</td>
<td style="text-align: right;">23</td>
<td style="text-align: right;">4.74</td>
<td style="text-align: right;">2.89</td>
<td style="text-align: right;">2.07</td>
<td style="text-align: right;">2.31</td>
<td style="text-align: right;">0.09</td>
</tr>
<tr>
<td style="text-align: left;">2023-05-21</td>
<td style="text-align: right;">29</td>
<td style="text-align: right;">5.67</td>
<td style="text-align: right;">2.72</td>
<td style="text-align: right;">2.90</td>
<td style="text-align: right;">2.39</td>
<td style="text-align: right;">0.01</td>
</tr>
<tr>
<td style="text-align: left;">2023-06-04</td>
<td style="text-align: right;">31</td>
<td style="text-align: right;">5.56</td>
<td style="text-align: right;">2.48</td>
<td style="text-align: right;">2.79</td>
<td style="text-align: right;">2.25</td>
<td style="text-align: right;">0.06</td>
</tr>
<tr>
<td style="text-align: left;">2023-06-18</td>
<td style="text-align: right;">27</td>
<td style="text-align: right;">5.68</td>
<td style="text-align: right;">2.54</td>
<td style="text-align: right;">2.63</td>
<td style="text-align: right;">2.52</td>
<td style="text-align: right;">0.01</td>
</tr>
<tr>
<td style="text-align: left;">2023-07-02</td>
<td style="text-align: right;">24</td>
<td style="text-align: right;">6.13</td>
<td style="text-align: right;">2.28</td>
<td style="text-align: right;">2.80</td>
<td style="text-align: right;">2.95</td>
<td style="text-align: right;">0.01</td>
</tr>
<tr>
<td style="text-align: left;">2023-07-16</td>
<td style="text-align: right;">31</td>
<td style="text-align: right;">5.90</td>
<td style="text-align: right;">2.77</td>
<td style="text-align: right;">2.81</td>
<td style="text-align: right;">2.52</td>
<td style="text-align: right;">0.04</td>
</tr>
<tr>
<td style="text-align: left;">2023-07-30</td>
<td style="text-align: right;">24</td>
<td style="text-align: right;">5.32</td>
<td style="text-align: right;">3.11</td>
<td style="text-align: right;">2.36</td>
<td style="text-align: right;">2.46</td>
<td style="text-align: right;">0.05</td>
</tr>
<tr>
<td style="text-align: left;">2023-08-13</td>
<td style="text-align: right;">18</td>
<td style="text-align: right;">6.85</td>
<td style="text-align: right;">2.17</td>
<td style="text-align: right;">3.38</td>
<td style="text-align: right;">3.01</td>
<td style="text-align: right;">0.00</td>
</tr>
<tr>
<td style="text-align: left;">2023-08-27</td>
<td style="text-align: right;">17</td>
<td style="text-align: right;">5.55</td>
<td style="text-align: right;">2.81</td>
<td style="text-align: right;">2.74</td>
<td style="text-align: right;">2.48</td>
<td style="text-align: right;">0.05</td>
</tr>
<tr>
<td style="text-align: left;">2023-09-10</td>
<td style="text-align: right;">21</td>
<td style="text-align: right;">5.47</td>
<td style="text-align: right;">2.79</td>
<td style="text-align: right;">2.51</td>
<td style="text-align: right;">2.50</td>
<td style="text-align: right;">0.02</td>
</tr>
<tr>
<td style="text-align: left;">2023-09-24</td>
<td style="text-align: right;">10</td>
<td style="text-align: right;">6.63</td>
<td style="text-align: right;">2.34</td>
<td style="text-align: right;">3.66</td>
<td style="text-align: right;">2.35</td>
<td style="text-align: right;">0.07</td>
</tr>
<tr>
<td style="text-align: left;">2023-10-08</td>
<td style="text-align: right;">17</td>
<td style="text-align: right;">6.42</td>
<td style="text-align: right;">1.51</td>
<td style="text-align: right;">2.69</td>
<td style="text-align: right;">3.35</td>
<td style="text-align: right;">0.00</td>
</tr>
<tr>
<td style="text-align: left;">2023-10-22</td>
<td style="text-align: right;">15</td>
<td style="text-align: right;">5.65</td>
<td style="text-align: right;">2.56</td>
<td style="text-align: right;">3.07</td>
<td style="text-align: right;">2.28</td>
<td style="text-align: right;">0.01</td>
</tr>
<tr>
<td style="text-align: left;">2023-11-05</td>
<td style="text-align: right;">13</td>
<td style="text-align: right;">5.69</td>
<td style="text-align: right;">3.05</td>
<td style="text-align: right;">2.70</td>
<td style="text-align: right;">2.50</td>
<td style="text-align: right;">0.01</td>
</tr>
<tr>
<td style="text-align: left;">2023-11-19</td>
<td style="text-align: right;">25</td>
<td style="text-align: right;">5.02</td>
<td style="text-align: right;">3.22</td>
<td style="text-align: right;">2.41</td>
<td style="text-align: right;">2.24</td>
<td style="text-align: right;">0.02</td>
</tr>
<tr>
<td style="text-align: left;">2023-12-03</td>
<td style="text-align: right;">12</td>
<td style="text-align: right;">5.84</td>
<td style="text-align: right;">2.77</td>
<td style="text-align: right;">3.00</td>
<td style="text-align: right;">2.64</td>
<td style="text-align: right;">0.01</td>
</tr>
<tr>
<td style="text-align: left;">2023-12-17</td>
<td style="text-align: right;">25</td>
<td style="text-align: right;">5.50</td>
<td style="text-align: right;">2.92</td>
<td style="text-align: right;">2.69</td>
<td style="text-align: right;">2.30</td>
<td style="text-align: right;">0.06</td>
</tr>
<tr>
<td style="text-align: left;">2023-12-31</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">6.98</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">2.98</td>
<td style="text-align: right;">4.00</td>
<td style="text-align: right;">0.00</td>
</tr>
<tr>
<td style="text-align: left;">2024-01-01</td>
<td style="text-align: right;">24</td>
<td style="text-align: right;">6.33</td>
<td style="text-align: right;">2.64</td>
<td style="text-align: right;">3.15</td>
<td style="text-align: right;">2.64</td>
<td style="text-align: right;">0.03</td>
</tr>
<tr>
<td style="text-align: left;">2024-01-15</td>
<td style="text-align: right;">19</td>
<td style="text-align: right;">6.38</td>
<td style="text-align: right;">2.76</td>
<td style="text-align: right;">3.32</td>
<td style="text-align: right;">2.41</td>
<td style="text-align: right;">0.04</td>
</tr>
<tr>
<td style="text-align: left;">2024-01-29</td>
<td style="text-align: right;">29</td>
<td style="text-align: right;">5.90</td>
<td style="text-align: right;">2.95</td>
<td style="text-align: right;">2.74</td>
<td style="text-align: right;">2.61</td>
<td style="text-align: right;">0.03</td>
</tr>
<tr>
<td style="text-align: left;">2024-02-12</td>
<td style="text-align: right;">23</td>
<td style="text-align: right;">5.86</td>
<td style="text-align: right;">2.80</td>
<td style="text-align: right;">2.43</td>
<td style="text-align: right;">3.09</td>
<td style="text-align: right;">0.01</td>
</tr>
<tr>
<td style="text-align: left;">2024-02-26</td>
<td style="text-align: right;">21</td>
<td style="text-align: right;">6.02</td>
<td style="text-align: right;">2.30</td>
<td style="text-align: right;">2.83</td>
<td style="text-align: right;">2.68</td>
<td style="text-align: right;">0.00</td>
</tr>
<tr>
<td style="text-align: left;">2024-03-11</td>
<td style="text-align: right;">23</td>
<td style="text-align: right;">5.82</td>
<td style="text-align: right;">2.78</td>
<td style="text-align: right;">3.11</td>
<td style="text-align: right;">2.09</td>
<td style="text-align: right;">0.01</td>
</tr>
<tr>
<td style="text-align: left;">2024-03-25</td>
<td style="text-align: right;">13</td>
<td style="text-align: right;">4.90</td>
<td style="text-align: right;">2.88</td>
<td style="text-align: right;">2.77</td>
<td style="text-align: right;">1.94</td>
<td style="text-align: right;">0.01</td>
</tr>
<tr>
<td style="text-align: left;">2024-04-08</td>
<td style="text-align: right;">10</td>
<td style="text-align: right;">4.96</td>
<td style="text-align: right;">2.97</td>
<td style="text-align: right;">2.14</td>
<td style="text-align: right;">2.29</td>
<td style="text-align: right;">0.01</td>
</tr>
</tbody>
</table>
