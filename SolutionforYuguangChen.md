    data <- read_csv("atp_matches_qual_chall_2024.csv", show_col_types = FALSE)

    #Step 1: Pick up only useful columns for the task, which are "winner_name", "winner_rank", "loser_rank" "tourney_date", "w_1stIn", "w_1stWon", "l_1stIn", "l_1stWon", "surface"
    #Step 2: Select only top 50 players in 2024. One player could have perhaps multiple ranks, so i will select the last rank by "tourney_date" of a player, no matter he won or lost, then we will get players, whose rank eventually in top 50 in 2024. 
      
    top50 <-  
      data %>% select(name = winner_name, rank = winner_rank, winner_name, winner_rank, loser_rank, tourney_date, w_1stIn, w_1stWon, l_1stIn, l_1stWon, surface) %>%
      bind_rows(data %>% #creating a single dataset that includes all players (as either winners or losers) along with relevant match information. This allows for analyzing the players regardless of their match outcomes.
          select(name = loser_name, rank = loser_rank, winner_name, winner_rank, loser_rank, tourney_date, w_1stIn, w_1stWon, l_1stIn, l_1stWon, surface)) %>%
      group_by(name) %>%
      arrange(desc(tourney_date)) %>% 
      filter(rank <= 50)  #choosing players within top50 based on rank

    #Step 3: And then select all matches of these players, no matter if they were alawys top 50 in these matches. Use this formula w_1stWon/w_1stIn to calculate their first won point of these matches as a winner or loser.

    data %>%  filter(winner_name %in% top50$name | loser_name %in% top50$name) %>%
      mutate(winner_first_point = w_1stWon / w_1stIn,  
        loser_first_point = l_1stWon / l_1stIn) %>% 
      
    #Step 4: Categorize these matches into two groups: hard and clay, so we get the rate attribute on two surface. Then calculate the average first won point rate on two surface.

        group_by(surface) %>% 
      mutate(avg_winner_first_point = mean(winner_first_point, na.rm = TRUE)) %>% 

    #Step 5: Rank players by their final rank in 2024 from high to low to visualize the rate distribution 
      
      ggplot(aes(x = reorder(winner_name, winner_rank), #making sure that names are displayed in rank order (from best to worst) on the plot
           y = winner_first_point, color = surface, shape = surface)) +
      geom_point(size= 5)  +
      scale_shape_manual(values = c(15, 17)) +
      scale_color_manual(values = c("lightgreen", "orange")) +
      labs(title = "First Point Win Rate of Top 50 Players", x = "Player Name", y = "First Point Win Rate") +
     theme(axis.text.x = element_text(angle = 90, hjust = 1))

    ## Warning: Removed 3 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

![](SolutionforYuguangChen_files/figure-markdown_strict/unnamed-chunk-2-1.png)
