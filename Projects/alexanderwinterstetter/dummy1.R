# Load the ggplot2 library
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

# Save the updated data frame to a new CSV file
#write.csv(data, "new_soccer_referee_data.csv", row.names = FALSE)

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

# Print the results
# print(paste("Player with the most wins:", player_most_victories))
# print(paste("Player with the most goals:", player_most_goals))
# print(paste("Player with the most red cards:", player_most_red_cards))
# print("")
# print(paste("Position with the most wins:", newposition_most_victories))
# print(paste("Position with the most goals:", newposition_most_goals))
# print(paste("Position with the most red cards:", newposition_most_red_cards))
# print("")
# print(paste("League with the most wins:", leagueCountry_most_victories))
# print(paste("League with the most goals:", leagueCountry_most_goals))
# print(paste("League with the most red cards:", leagueCountry_most_red_cards))
# print("")
# print(paste("Club with the most wins:", club_most_victories))

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

# Create the plot
plot1 <- ggplot() +
  geom_text(data = label_data, aes(x, y, label = label), size = 5) +
  xlim(0.5, 1.5) +
  ylim(0.5, 13.5) +
  theme_void()


# Create a bar plot of points per club, grouped by leagueCountry
plot2 <- ggplot(data, aes(x = club, y = points, fill = leagueCountry)) +
  geom_bar(stat = "identity", position = position_dodge(width = 2)) +
  labs(x = "Club", y = "Points", fill = "League") +
  ggtitle("Points per Club by League") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 55, hjust = 1))

# Convert the "birthday" column to a Date format
data$birthday <- as.Date(data$birthday, format = "%d.%m.%Y")

# Calculate the age of the players based on the "birthday" column
data$age <- floor(time_length(interval(data$birthday, Sys.Date()), "years"))

# Create a histogram of player ages by league with different colors
plot3 <- ggplot(data, aes(x = age, fill = leagueCountry)) +
  geom_histogram(binwidth = 1, color = "black") +
  labs(x = "Age", y = "Count") +
  ggtitle("Distribution of Player Ages per League") +
  theme_minimal() +
  facet_grid(. ~ leagueCountry)

# Calculate the ratio of red cards to yellow cards per league
ratio_data <- aggregate(cbind(redCards, yellowCards) ~ leagueCountry, data, sum)
ratio_data$red_yellow_ratio <- ratio_data$redCards / ratio_data$yellowCards

# Create a scatter plot
plot4 <- ggplot(ratio_data, aes(x = leagueCountry, y = red_yellow_ratio)) +
  geom_point(size = 3, color = "blue") +
  labs(x = "League", y = "Red/Yellow Card Ratio") +
  ggtitle("Ratio of Red Cards to Yellow Cards per League") +
  theme_minimal()

# Arrange plots vertically
#grid.arrange(plot1, plot2, plot3, plot4, ncol = 1)

# Arrange the plots in a grid layout
grid_arrange <- plot_grid(plot1, plot2, plot3, plot4, ncol = 2)

# Print the grid layout
print(grid_arrange)