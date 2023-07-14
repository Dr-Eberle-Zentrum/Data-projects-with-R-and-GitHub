library(ggplot2)
library(dplyr)
library(lubridate)
library(gridExtra)
library(cowplot)

# Set the working directory to the directory where your CSV file is located
setwd("C:/Users/Pleasant Pillai/Desktop/R Programming/R2/Advanced-data-processing-with-R/Projects/alexanderwinterstetter")

# Read the CSV file
data <- read.csv("soccer_referee_data.csv")

# Create a new variable "newposition"
data$newposition <- ifelse(data$position == "Goalkeeper", "Goalkeeper",
                           ifelse(data$position == "NA", "NA",
                                  ifelse(data$position %in% c("Center Back", "Left Fullback", "Right Fullback"), "Defense",
                                         ifelse(data$position %in% c("Center Midfielder", "Defensive Midfielder", "Left Midfielder", "Right Midfielder"), "Midfielder", "Offense"))))

# Create a new variable "points" based on victories, ties, and defeats
data$points <- (data$victories * 3) + (data$ties * 1) + (data$defeats * 0)

# Find the player with the most victories
player_most_victories <- data$player[which.max(data$victories)]

# Find the player with the most goals
player_most_goals <- data$player[which.max(data$goals)]

# Find the player with the most red cards
player_most_red_cards <- data$player[which.max(data$redCards)]

# Find the newposition with the most victories
newposition_most_victories <- data$newposition[which.max(data$victories)]

# Find the newposition with the most goals
newposition_most_goals <- data$newposition[which.max(data$goals)]

# Find the newposition with the most red cards
newposition_most_red_cards <- data$newposition[which.max(data$redCards)]

# Find the leagueCountry with the most victories
leagueCountry_most_victories <- data$leagueCountry[which.max(data$victories)]

# Find the leagueCountry with the most goals
leagueCountry_most_goals <- data$leagueCountry[which.max(data$goals)]

# Find the leagueCountry with the most red cards
leagueCountry_most_red_cards <- data$leagueCountry[which.max(data$redCards)]

# Find the club with the most victories
club_most_victories <- data$club[which.max(data$victories)]

# Create a data frame for the labels
label_data <- data.frame(
  label = c(
    paste("Player with the most wins:", player_most_victories),
    paste("Player with the most goals:", player_most_goals),
    paste("Player with the most red cards:", player_most_red_cards),
    "",
    paste("Position with the most wins:", newposition_most_victories),
    paste("Position with the most goals:", newposition_most_goals),
    paste("Position with the most red cards:", newposition_most_red_cards),
    "",
    paste("League with the most wins:", leagueCountry_most_victories),
    paste("League with the most goals:", leagueCountry_most_goals),
    paste("League with the most red cards:", leagueCountry_most_red_cards),
    "",
    paste("Club with the most wins:", club_most_victories)
  ),
  x = rep(1, 13),
  y = 13:1
)

# Create the plot with labels
plot_labels <- ggplot() +
  geom_text(data = label_data, aes(x, y, label = label), size = 5) +
  xlim(0.5, 1.5) +
  ylim(0.5, 13.5) +
  theme_void()

# Create a bar plot of points per club, grouped by leagueCountry
plot_points <- ggplot(data, aes(x = reorder(club, -points), y = points, fill = leagueCountry)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.8)) +
  labs(x = "Club", y = "Points", fill = "League") +
  ggtitle("Points per Club by League") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Convert the "birthday" column to a Date format
data$birthday <- dmy(data$birthday)

# Calculate the age of the players based on the "birthday" column
data$age <- floor(time_length(interval(data$birthday, Sys.Date()), "years"))

# Create a density plot of player ages by league
plot_age_density <- ggplot(data, aes(x = age, fill = leagueCountry)) +
  geom_density(geom = "polygon", position = "identity", alpha = 0.5) +
  labs(x = "Age", y = "Density") +
  ggtitle("Density Distribution of Player Ages per League") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  facet_wrap(~ leagueCountry, ncol = 1)

# Calculate the ratio of red cards to yellow cards per league
ratio_data <- data %>%
  group_by(leagueCountry) %>%
  summarise(red_yellow_ratio = sum(redCards) / sum(yellowCards))

# Create a scatter plot of red/yellow card ratio by league
plot_red_yellow_ratio <- ggplot(ratio_data, aes(x = leagueCountry, y = red_yellow_ratio)) +
  geom_point(size = 3, color = "blue") +
  labs(x = "League", y = "Red/Yellow Card Ratio") +
  ggtitle("Ratio of Red Cards to Yellow Cards per League") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Arrange the plots vertically
plot_arranged <- plot_grid(plot_labels, plot_points, plot_age_density, plot_red_yellow_ratio, ncol = 1)

# Display the arranged plots
plot_arranged
