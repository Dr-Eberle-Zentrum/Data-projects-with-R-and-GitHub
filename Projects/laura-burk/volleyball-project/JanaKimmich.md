# Solution for the volleyball project

Unfortunately the circular bar plot does not contain much information,
since I could not figure out how to join the tables (see the issue).

# Code for solving the project

I tried to do it with piping but after spending much time on it, I
thought maybe it would be better having an ugly solution than no one…

    library(tidyverse)

    ## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ## ✔ dplyr     1.1.3     ✔ readr     2.1.4
    ## ✔ forcats   1.0.0     ✔ stringr   1.5.0
    ## ✔ ggplot2   3.4.4     ✔ tibble    3.2.1
    ## ✔ lubridate 1.9.3     ✔ tidyr     1.3.0
    ## ✔ purrr     1.0.2     
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()
    ## ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

    ########## load, adjust, join tables ##########
    # original tables
    roster <-
      read.csv("team-rosters/roster_BERLIN_RECYCLING_Volleys.csv", sep = ";",encoding="latin-1")
    topscorer_intermediate_bottom <- read.csv("topscorers/topscorer_vbl_intermediate_season2223_bottom_teams.txt", sep = "\t",encoding="UTF-8")
    topscorer_intermediate_top <- read.csv("topscorers/topscorer_vbl_intermediate_season2223_top_teams.txt", sep = "\t",encoding="UTF-8")
    topscorer_playoffs <- read.csv("topscorers/topscorer_vbl_playoffs_season2223_allteams.txt", sep = "\t",encoding="UTF-8")
    topscorer_regular <- read.csv("topscorers/topscorer_vbl_regular_season2223_allteams.txt", sep = "\t",encoding="UTF-8")
    games_playoff <- read.csv("games/Spielplan_1._Bundesliga_Männer_Playoff.csv", sep = ";",encoding="UTF-8")
    games_regular <- read.csv("games/Spielplan_1._Bundesliga_Männer_Playoff.csv", sep = ";",encoding="UTF-8")
    games_zwr14 <- read.csv("games/Spielplan_1._Bundesliga_Männer_Playoff.csv", sep = ";",encoding="UTF-8")
    games_zwr59 <- read.csv("games/Spielplan_1._Bundesliga_Männer_Playoff.csv", sep = ";",encoding="UTF-8")

    # new tables
    new_roster <- roster
    # add new column errors_per_set to all topscorer files
    new_topscorer_intermediate_bottom <- topscorer_intermediate_bottom %>%mutate(errors_per_set = Errors.overall / Sets.played)
    new_topscorer_intermediate_top <- topscorer_intermediate_top %>%mutate(errors_per_set = Errors.overall / Sets.played)
    new_topscorer_playoffs <- topscorer_playoffs %>%mutate(errors_per_set = Errors.overall / Sets.played)
    new_topscorer_regular <- topscorer_regular %>%mutate(errors_per_set = Errors.overall / Sets.played)

    # adjust gender encoding
    new_roster$Gender <- str_replace(new_roster$Gender,pattern="^f.*|^F.*|2",replacement="female")
    new_roster$Gender <-  str_replace(new_roster$Gender,"^m.*|^M.*|1","male")
      #{gsub("^\\f.*|^\\F.*|2","female",useBytes = TRUE,.)} %>%
      #{gsub("^\\m.*|^\\M.*|1","male",roster$Gender,useBytes = TRUE,.)}


    # adjust position
    new_roster$Position <- str_replace(new_roster$Position,"^Au.*","outside hitter")
    new_roster$Position <- str_replace(new_roster$Position,"^D.*|^d.*","opposite hitter")
    new_roster$Position <- str_replace(new_roster$Position,"^Z.*|^z.*","setter")
    new_roster$Position <- str_replace(new_roster$Position,"^M.*|^m.*","middle blocker")
    new_roster$Position <- str_replace(new_roster$Position,"^Libero","libero")
    new_roster$Position <- str_replace(new_roster$Position,"^Chef.*","head coach")

    # deleting staff except of head coach
    new_roster <- subset(new_roster, new_roster$Position=="opposite hitter"| new_roster$Position=="setter"|new_roster$Position=="libero"|new_roster$Position=="middle blocker"|new_roster$Position=="head coach"|new_roster$Position=="outside hitter")

    # adjust height
    new_roster$Height <- as.numeric(new_roster$Height)
    new_roster$Height <- new_roster$Height/100

    # join tables 
    new_roster <- new_roster %>% rename("Name"="Last.Name.First.Name")
    joined_topscorer_intermediate_bottom <- full_join(new_topscorer_intermediate_bottom,new_roster,"Name")
    joined_topscorer_intermediate_top <- full_join(new_topscorer_intermediate_top,new_roster,"Name")
    joined_topscorer_playoffs <- full_join(new_topscorer_playoffs,new_roster,"Name")
    joined_topscorer_regular <- full_join(new_topscorer_regular,new_roster,"Name")

    ########### compute values for bar plot ##########

    ##### results 
    # number of overall played games
    num_all_games <- games_playoff%>%
      filter(Mannschaft.1=="BERLIN RECYCLING Volleys"|Mannschaft.2=="BERLIN RECYCLING Volleys") %>%
      nrow()
    num_all_games <- num_all_games + games_regular%>%
      filter(Mannschaft.1=="BERLIN RECYCLING Volleys"|Mannschaft.2=="BERLIN RECYCLING Volleys") %>%
      nrow()
    num_all_games <- num_all_games + games_zwr14%>%
      filter(Mannschaft.1=="BERLIN RECYCLING Volleys"|Mannschaft.2=="BERLIN RECYCLING Volleys") %>%
      nrow()
    num_all_games <- num_all_games + games_zwr59%>%
      filter(Mannschaft.1=="BERLIN RECYCLING Volleys"|Mannschaft.2=="BERLIN RECYCLING Volleys") %>%
      nrow()

    ##### attacking

    ##### stadium
    # number of home games
    num_home_games <- games_playoff%>%
      filter(Mannschaft.1=="BERLIN RECYCLING Volleys") %>%
      nrow()
    num_home_games <- num_home_games + games_regular%>%
      filter(Mannschaft.1=="BERLIN RECYCLING Volleys") %>%
      nrow()
    num_home_games <- num_home_games + games_zwr14%>%
      filter(Mannschaft.1=="BERLIN RECYCLING Volleys") %>%
      nrow()
    num_home_games <- num_home_games + games_zwr59%>%
      filter(Mannschaft.1=="BERLIN RECYCLING Volleys") %>%
      nrow()
    # number of away games
    num_away_games <- games_playoff%>%
      filter(Mannschaft.2=="BERLIN RECYCLING Volleys") %>%
      nrow()
    num_away_games <- num_away_games + games_regular%>%
      filter(Mannschaft.2=="BERLIN RECYCLING Volleys") %>%
      nrow()
    num_away_games <- num_away_games + games_zwr14%>%
      filter(Mannschaft.2=="BERLIN RECYCLING Volleys") %>%
      nrow()
    num_away_games <- num_away_games + games_zwr59%>%
      filter(Mannschaft.2=="BERLIN RECYCLING Volleys") %>%
      nrow()
    # average attendance in home stadium
    num_attendance <- games_playoff%>%
      filter(Mannschaft.1=="BERLIN RECYCLING Volleys") %>%
      select(Zuschauerzahl)%>%
      colSums()
    num_attendance <- num_attendance + games_regular%>%
      filter(Mannschaft.1=="BERLIN RECYCLING Volleys") %>%
      select(Zuschauerzahl)%>%
      colSums()
    num_attendance <- num_attendance + games_zwr14%>%
      filter(Mannschaft.1=="BERLIN RECYCLING Volleys") %>%
      select(Zuschauerzahl)%>%
      colSums()
    num_attendance <- num_attendance + games_zwr59%>%
      select(Zuschauerzahl)%>%
      colSums()
    avg_attendance <- num_attendance/num_home_games

    ##### top scorer

    ##### errors

    # to test better
    avg_attendance <- 49
    ########## circular bar plot, not done yet #########
    stadium <- as.data.frame(cbind(c(num_all_games,num_home_games,num_away_games,avg_attendance),c("all games","home games", "away games", "avg attendance"),c("results","stadium","stadium","stadium")))
    colnames(stadium) = c("amount","name","group")

    # ----- This section prepare a dataframe for labels ---- #
    # Get the name and the y position of each label
    label_data <- stadium
    # calculate the ANGLE of the labels
    number_of_bar <- nrow(label_data)
    angle <-  90 - 360 * (as.numeric(label_data$amount)-0.5) /number_of_bar     
    # substract 0.5 because the letter must have the angle of the center of the bars. Not extreme right(1) or extreme left (0)
    # calculate the alignment of labels: right or left
    # If on the left part of the plot, labels have currently an angle < -90
    label_data$hjust<-ifelse(angle < -90, 1, 0)
    # flip angle BY to make them readable
    label_data$angle<-ifelse(angle < -90, angle+180, angle)
    # ----- ------------------------------------------- ---- #

    p <- ggplot(stadium,aes(x=name,y=as.numeric(amount),fill=group)) +  
    # Note that id is a factor. If x is numeric, there is some space between the first bar
    # This add the bars with a blue color
    geom_bar(stat="identity",alpha=0.3 ) +
    # Limits of the plot = very important. The negative value controls the size of the inner circle, the positive one is useful to add size over each bar
    ylim(-10,75) +
    # Custom the theme: no axis title and no cartesian grid
    theme_minimal() +
    theme(axis.text = element_blank(),
      axis.title = element_blank(),
      panel.grid = element_blank())+
      #plot.margin = unit(rep(-2,4), "cm")+     
      # This remove unnecessary margin around plot
      #)+
    # This makes the coordinate polar instead of cartesian.
    coord_polar(start = 0)+
    geom_text(data=label_data, aes(x=name, y=as.numeric(amount)+10, label=name, hjust=hjust), color="black", fontface="bold",alpha=0.6, size=2.5, angle= label_data$angle, inherit.aes = FALSE ) 
     
    p

![](JanaKimmich_files/figure-markdown_strict/setup-1.png)
