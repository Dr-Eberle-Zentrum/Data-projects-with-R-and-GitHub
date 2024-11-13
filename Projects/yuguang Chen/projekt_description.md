#Topic of the task

Summarize and visualize the basic information of 2024 tennis tournaments. 

##Topic description

[dataset about tennis](https://github.com/JeffSackmann/tennis_atp/blob/master/atp_matches_qual_chall_2024.csv) This data set contains too many column, which makes it difficult to visualize all things in one chart. So before the visualization, first the data set needs to be cleaned. Filter all NA out and pick up the useful columns for the visualization. I intend to analyse the first point won rate of top 50 players in hard and clay surface. The first point won rate can reflect the consistency of players on different surface, which can help their team to improve their technique.

##data manipulation goals

Step 1: Clean all NA
Step 2: pick up only 50 matches, in which contain at least one top 50 players
Step 3: Categorize these matches in two group, hard and clay
Step 4: Calculate the first point won rate in both groups, and calculate the average rate.
Step 5: rank the top 50 players from high to low.

##visualization goals
The top 50 players need to be ranked, so that we can observe the distribution of first point won rate with the ranking. 
[Visualization goals](Projects/yuguang Chen/visualization.jpg)
