In the end I loaded the your prepared data ..

    load("data_PISA.Rdata")

    dataPerId <-
      data |>
      # slice_head(n=10) |>
      # select relevant columns
      select( CNT, ST005Q01JA, ST007Q01JA, matches("ST327Q0[1-8]JA") ) |>
      # number observations
      mutate( id = 1:n()) |>
      # best education of parents
      rowwise() |>
      mutate( minEduParents = ifelse(is.na(ST005Q01JA)&is.na(ST007Q01JA),
                                     NA,
                                     min(ST005Q01JA, ST007Q01JA, na.rm=TRUE)) ) |>
      ungroup() |>
      select(-c(ST005Q01JA, ST007Q01JA)) |>
      
      # drop missing data
      filter( minEduParents %in% 1:8) |> 
      # grouped parental education 
      mutate( eduParentGroup =
                case_when(
                  minEduParents %in% 1:2 ~ "1-2",
                  minEduParents %in% 3:4 ~ "3-4",
                  minEduParents %in% 5:6 ~ "5-6",
                  minEduParents %in% 7:8 ~ "7-8"
                )
              ) |> 

      # education goal
      # reformat goal columns into rows
      pivot_longer( cols = matches("ST327Q0[1-8]JA"), 
                    names_to = "goal", 
                    values_to = "goalReached" ) |>
      # process goal labels and check if reached
      mutate(goalReached = goalReached == 2,
             goal = str_remove(goal, "ST327Q0") |> str_remove("JA") |> as.numeric()) |>
      # data to keep
      group_by(id,CNT,minEduParents) |>
      # get last goal assumed reachable
      summarize( educationGoal = ifelse(sum(goalReached,na.rm=T)==0,
                              # no goal reachable
                              0,
                              # highest goal that was assumed reachable
                              max(goal*as.integer(goalReached), na.rm=T)),
               .groups ="drop") |>
      # filter for people with goals
      filter(educationGoal > 0) 

As you can see below, I used:

-   the minimal parental education score,
-   created groups “1-2” etc. for these, and
-   dropped all data where no parental education score was available.

Furthermore I

-   identified for each row the highest education goal assumed
    reachable.

With this I did a first visualization showing the distribution for each
combination.

    dataPerId |>
      ggplot( aes(x=minEduParents,y=educationGoal) ) +
      geom_count() +
      geom_smooth(method = "lm") +
      facet_wrap(~CNT)

    ## `geom_smooth()` using formula = 'y ~ x'

![](martin_files/figure-markdown_strict/first.glimpse-1.png) What comes
to mind from the plot

-   no parental education levels 2 and 4 in Germany
-   nothing higher than 5 (or 3 in Japan)

So are the education levels comparable or only their relation?

Following your suggestion, I visualized mean values per level. I also
added error bars to visualize the standard deviation for each mean
value.

    dataPerId |>
      group_by(CNT, minEduParents) |>
      summarize( educationGoalMean = mean(educationGoal, na.rm=TRUE),
                 educationGoalSd = sd(educationGoal, na.rm=TRUE),
                 groupSize = n(),
                 .groups="drop") |>
      ggplot(aes(x=minEduParents, y=educationGoalMean)) +
      # y ticks at 1:8
      scale_y_continuous(breaks=1:8, limits = c(1,10)) +
      # draw per country
      facet_wrap(~CNT) +
      # mean value of all countries
      geom_hline( yintercept = mean(dataPerId$educationGoal),
                  linetype="dashed", col="darkgray", linewidth=2)+
      # mean values per country
      geom_point(aes(size=groupSize), fill="darkgray") +
      # respective sd interval
      geom_errorbar(aes( ymin=educationGoalMean-educationGoalSd,
                         ymax=educationGoalMean+educationGoalSd),
                    width=0.2 )

![](martin_files/figure-markdown_strict/mean.viz-1.png) Now it would be
time to beautify, which I will drop for now ..
