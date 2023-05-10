# Winterstetter - Advanced Data Processing with R

## Analyzing Soccer Data

The dataset will be attached ([CSV](soccer_referee_data.csv)). The
dataset contains information on soccer-referee pairings during a soccer
season. One row has a player-referee pairing (if a player encountered 32
different referees in the saison, then he has 32 rows). I obtained the
dataset from another university course. For me it would now be
interesting to draw insights from these pairings (soccer player &
referee) regarding the success of clubs or the player or how the leagues
differ from one another.

General ideas for exercises

Data Cleaning

-   Create a new variable, which contains information on whether the
    player is “Goalkeeper”, “Defense”, “Midfielder” or “Offense” (4
    possible values the variables can take on)
-   calculate a variable “points” per club: each win means 3 points,
    draw 1 point, lose 0 points (I will have to further look into it
    whether it is possible - it may be rather tricky)
-   otherwise I lack right now the creativity for Data Cleaning tasks
    (maybe I should make the dataset more ugly beforehand)

Data Manipulation

-   Derive players/position/league with the most wins, most goals, most
    redCards etc.
-   derive which club has the most wins

Data Visulaization

-   visualize per league how many points a club gets
-   visualize a distribution of the age of the players per league (maybe
    with facet\_grid from ggplot2)#
-   visualize the ratio in the league: redcards // yellow cards
