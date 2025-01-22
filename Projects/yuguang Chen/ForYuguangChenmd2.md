<hr>

**Getting Top50 players: **

Step 1: Pick up only useful columns for the task, which are
“winner\_name”, “winner\_rank”, “loser\_rank” “tourney\_date”,
“w\_1stIn”, “w\_1stWon”, “l\_1stIn”, “l\_1stWon”, “surface”. <br> Step
2: Select only top 50 players in 2024. One player could have perhaps
multiple ranks, so i will select the last rank by “tourney\_date” of a
player, no matter he won or lost, then we will get players, whose rank
eventually in top 50 in 2024.\* <br>

    library(readr)
    library(dplyr)
    library(ggplot2)

    data <- read_csv("atp_matches_qual_chall_2024.csv", show_col_types = FALSE)
      
    top50 <-  
      data %>% select(name = winner_name, rank = winner_rank, winner_name, winner_rank, loser_rank, tourney_date, w_1stIn, w_1stWon, l_1stIn, l_1stWon, surface) %>%
      bind_rows(data %>% #creating a single dataset that includes all players (as either winners or losers) along with relevant match information. This allows for analyzing the players regardless of their match outcomes.
          select(name = loser_name, rank = loser_rank, winner_name, winner_rank, loser_rank, tourney_date, w_1stIn, w_1stWon, l_1stIn, l_1stWon, surface)) %>%
      group_by(name) %>%
      arrange(desc(tourney_date)) %>% 
      filter(rank <= 50)  #choosing players within top50 based on rank
    top50

    ## # A tibble: 44 × 11
    ## # Groups:   name [13]
    ##    name   rank loser_rank tourney_date w_1stIn w_1stWon l_1stIn l_1stWon surface
    ##    <chr> <dbl>      <dbl>        <dbl>   <dbl>    <dbl>   <dbl>    <dbl> <chr>  
    ##  1 Seba…    45        272     20240520      31       25      40       22 Clay   
    ##  2 Seba…    45       1402     20240520      28       21      46       28 Clay   
    ##  3 Arth…    34         51     20240513      39       29      45       24 Clay   
    ##  4 Arth…    34        115     20240513      31       24      44       22 Clay   
    ##  5 Arth…    34         94     20240513      51       37      37       23 Clay   
    ##  6 Arth…    34        112     20240513      36       21      48       29 Clay   
    ##  7 Lore…    29        132     20240513      32       28      34       20 Clay   
    ##  8 Lore…    47        101     20240513      40       29      26       21 Clay   
    ##  9 Lore…    29        114     20240513      44       31      25       16 Clay   
    ## 10 Matt…    37         92     20240513      25       17      44       33 Clay   
    ## # ℹ 34 more rows
    ## # ℹ 2 more variables: winner_name <chr>, winner_rank <dbl>

Visualization of the players by their final rank in 2024:

Step 3: And then select all matches of these players, no matter if they
were alawys top 50 in these matches. Use this formula w\_1stWon/w\_1stIn
to calculate their first won point of these matches as a winner or
loser. <br> Step 4: Categorize these matches into two groups: hard and
clay, so we get the rate attribute on two surface. Then calculate the
average first won point rate on two surface. <br> Step 5: Rank players
by their final rank in 2024 from high to low to visualize the rate
distribution. <br>

    data %>%  filter(winner_name %in% top50$name | loser_name %in% top50$name) %>%
      mutate(winner_first_point = w_1stWon / w_1stIn,  
        loser_first_point = l_1stWon / l_1stIn) %>% 
        group_by(surface) %>%  #Step4 starts here 
      mutate(avg_winner_first_point = mean(winner_first_point, na.rm = TRUE)) %>% 
     ggplot(aes(x = reorder(winner_name, winner_rank), 
                     y = winner_first_point, 
                     color = surface, 
                     shape = surface, 
                     fill = surface)) +  
      geom_point(size = 5, stroke = 1.2, color="black") +  
      scale_shape_manual(values = c(21, 24)) +  
      scale_fill_manual(values = c("darkgreen", "darkorange")) +  
      labs(title = "First Point Win Rate of Top 50 Players", 
           x = "Player Name", 
           y = "First Point Win Rate") +
      theme(axis.text.x = element_text(angle = 45, hjust = 1))

![](ForYuguangChenmd2_files/figure-markdown_strict/unnamed-chunk-2-1.png)
