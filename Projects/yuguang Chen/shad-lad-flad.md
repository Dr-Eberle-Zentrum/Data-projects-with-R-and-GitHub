    library(tidyverse)

    ## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ## ✔ dplyr     1.1.4     ✔ readr     2.1.5
    ## ✔ forcats   1.0.0     ✔ stringr   1.5.1
    ## ✔ ggplot2   3.4.4     ✔ tibble    3.2.1
    ## ✔ lubridate 1.9.3     ✔ tidyr     1.3.0
    ## ✔ purrr     1.0.2     
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()
    ## ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

    url = 'https://raw.githubusercontent.com/Dr-Eberle-Zentrum/Data-projects-with-R-and-GitHub/main/Projects/yuguang%20Chen/atp_matches_qual_chall_2024.csv'

    tennis_data <- read.csv(url)

    #collecting all the names of the top 50 players by the end of the most recent tournament
    #and putting them into a new dataframe

    tennis_data_top50 <- tennis_data %>%
      select(winner_name, winner_rank, loser_rank,loser_name, tourney_date, w_1stIn,w_1stWon, l_1stIn,l_1stWon, surface) %>%
      group_by(winner_name) %>%
      arrange(winner_name) %>%
      filter(winner_rank <= 50 ) %>%
      arrange(desc(tourney_date)) %>%
      distinct(winner_name, .keep_all = TRUE) 

    #using the new dataframe to find all the games of the mentioned players
    tennis_data %>%
      select(winner_name, winner_rank, loser_rank,loser_name, tourney_date, w_1stIn,w_1stWon, l_1stIn,l_1stWon, surface) %>%
      filter(winner_name %in% tennis_data_top50$winner_name ) %>%
      na.omit() %>%                                                                  
      arrange(winner_name) %>%
      arrange(desc(tourney_date)) %>%
      mutate(rate_as_win = w_1stWon/w_1stIn) %>% 
      
      # calculation of the average win rate using the rates from each match
      group_by(winner_name, surface) %>%
      mutate(avg_rate_as_win = mean(rate_as_win, na.rm = TRUE)) %>%
      arrange(winner_name) %>% 
      
      #visualization of the data
      ggplot(aes(x = reorder(winner_name, -avg_rate_as_win), y = avg_rate_as_win, color = surface, shape = surface)) +
      geom_point(size= 4) +
      theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
      labs(title = "First Point Win Rate of Top 50 Players", x = "Player Name", y = "First Point Win Rate") +
      scale_shape_manual(values = c(15, 17)) +
      scale_color_manual(values = c("red", "blue"))

![](tennis_mdfile_files/figure-markdown_strict/unnamed-chunk-1-1.png)
