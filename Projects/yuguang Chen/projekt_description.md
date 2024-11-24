# [Data-projects-with-R-and-GitHub](https://dr-eberle-zentrum.github.io/Data-projects-with-R-and-GitHub/)

# Load the dataset (this is the link to the dataset: <https://dr-eberle-zentrum.github.io/Data-projects-with-R-and-GitHub/> )

## Topic of the task

Summarize and visualize the basic information of 2024 tennis tournaments.

## Topic Description

[Dataset about tennis](https://github.com/JeffSackmann/tennis_atp/blob/master/atp_matches_qual_chall_2024.csv)  
This dataset contains too many columns, making it difficult to visualize all aspects in one chart. Therefore. I intend to select only a few columns and analyze the first point won rate of the top 50 players on hard and clay surfaces. The reason why i only pick top 50 players is that they have more chance to participate in tennis Masters tournaments. First point won rate is an important factor reflecting an athlete's competitive performance. The higher this statistic, the more stable the athlete's performance, indicating an advantage in serving, which can help their teams improve techniques.

## Data Manipulation Goals

- **Step 1**: Pick up only useful columns for the task, which are "winner_name", "winner_rank", "loser_rank" "tourney_date", "w_1stIn", "w_1stWon", "l_1stIn", "l_1stWon", "surface"
- **Step 2**: Select only top 50 players in 2024. One player could have perhaps multiple ranks, so i will select the last rank by "tourney_date" of a player, no matter he won or lost, then we will get players, whose rank eventually in top 50 in 2024.
- **Step 3**: And then select all matches of these players, no matter if they were alawys top 50 in these matches. Use this formula w_1stWon/w_1stIn to calculate their first won point of these matches as a winner or loser. 
- **Step 4**: Categorize these matches into two groups: hard and clay, so we get the rate attribute on two surface. Then calculate the average first won point rate on two surface.
- **Step 5**: Rank players by their final rank in 2024 from high to low to visualize the rate distribution  

## Visualization Goals

The top 50 players need to be ranked to observe the distribution of the first point won rate with respect to their rankings.  
![Visualization Goals](visualization.jpg)