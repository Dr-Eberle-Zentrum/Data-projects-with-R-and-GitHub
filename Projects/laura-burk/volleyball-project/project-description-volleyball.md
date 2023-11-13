# Laura’s Volleyball Project

------------------------------------------------------------------------

I have a passion for Volleyball! 🏐 Yay! 🎉

Before I deep-dive into the ongoing 2023/24 indoor season and fangirl
about my favourite club 🍊 🖤 , I would love to recap the 2022/23
season. This is where I need your support! 💪

## Background Knowlegde

The ‘Volleyball Bundesliga’ (short: VBL) is the highest Volleyball
league in Germany. Compared to Eastern or Southern European leagues, the
VBL has a lower level, but we are getting there. 🆙

You have absolutely no clue about Volleyball and its rules, but are
eager to find out more? I recommend [this](insert%20video%20link) short
video or the [Wikipedia page](https://en.wikipedia.org/wiki/Volleyball).

### What you might want to google at some point

-   You might find it helpful to look into the different
    [Positions](https://en.wikipedia.org/wiki/Volleyball#Player_specialization)
    at some point in this project.
-   game mode: best of five sets (first to three sets wins)
-   first to 25 (two points gap) wins the set
-   tie-break: fifth set is first to 15 (two points gap)

------------------------------------------------------------------------

## The Data

The data was downloaded from the official VBL website [1] and is free to
use for private purposes. Surprisingly, it went from tidy to somewhat
chaotic… 👻

### Folder **team-rosters**

These files each contain a(n) (in)complete list of a teams’ roster and
staff, including relevant information about the team members:

-   correct (!) name
-   height in cm
-   gender
-   date of birth
-   jersey number
-   nationality
-   position

Unfortunately, not all information is in the desired format yet.

-   I would love to have height measured in meters, instead of
    centimetres.
-   The column on gender should only contain *male* or *female*. If
    there is a number, `1 = male` and `2 = female`.
-   I would love to have international country codes instead of country
    names as nationality.
-   Additionally, the German position names are annoying me, please
    change them into English. You can use the Wikipedia page linked
    above as a guide, but I prefer *middle blocker*, *outside hitter*
    and *opposite hitter* over the suggestions from Wikipedia.
-   Considering the staff, we only need data on the head coach. Please
    delete the other staffs’ entries and thank them silently for their
    contribution to this wonderful, wonderful sport.

If a teams’ roster happens to be incomplete, please include the missing
player with all the available information and update the .csv-file in
the *team-rosters*-folder.

------------------------------------------------------------------------

### Folder **games**

The four files in this folder contain the results of all games played in
different parts of the season.

1.  regular season: Each team plays each of the other teams twice - once
    at home and once away.
2.  intermediate round (*Zwischenrunde*): The league table is split into
    two groups - the top teams (4 teams) and the bottom teams (5 teams).
    Within these groups, each team plays each of the other teams twice -
    once at home and once away. (It’s basically like regular season in
    two groups with fewer teams each.) Note: after the intermediate
    round, VCO Berlin was on 5th place in the bottom group and ended its
    season (as had been announced within the VBL before). Eight teams
    entered the play-off’s.
3.  Play-off’s: Based on the team ranking achieved in the intermediate
    round, the first-ranked team from the top group faces the
    eighth-ranked team of the bottom group in the quarter-finals and so
    on. The game mode is noted in column *Spielgruppe* in the Play-off’s
    .csv-file, that should help in understanding.

#### Folder **topscorers**

As you learned about the different parts of the season above, the four
provided files should be named straightforward to you. The top scorer
files are not based on overlapping time periods! ⚠️

#### Folder **team-logos**

Here I provide you with the team logos, needed for a visualization goal.

------------------------------------------------------------------------

### Visualization Goals

Compare the attackers: Which attacker contributes how much?

Categories: position, but only attackers, i.e. middle blockers, outside
hitters and opposite hitters. In category: based on the topscorer lists
across all parts of the season, how much did the players contribute? The
goal is to visualize which attacking position contributed the most to
the team result. In case you are into volleyball: yes I know that this
visualization over-simplifies the game, but there are no free stats
available on the VBL, that are both detailed and R-readable.

<https://r-graph-gallery.com/237-interactive-treemap.html>

Country Icons and Player Gallery:
<https://www.volleyball-bundesliga.de/cms/home/1_bundesliga_maenner/archiv/statistikrankings/saison_2022_23.xhtml>

per Team create a circular Bar Plot
<https://r-graph-gallery.com/297-circular-barplot-with-groups.html>

different stats grouped by topic

[1] Source:
<https://www.volleyball-bundesliga.de/cms/home/1_bundesliga_maenner/archiv/ergebnisse.xhtml>
