# Load the ggplot2 library
library(ggplot2)
library(dplyr)
library(lubridate)
library(gridExtra)

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
write.csv(data, "new_soccer_referee_data.csv", row.names = FALSE)

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
print(paste("Player with the most wins:", player_most_victories))
print(paste("Player with the most goals:", player_most_goals))
print(paste("Player with the most red cards:", player_most_red_cards))
print("")
print(paste("Position with the most wins:", newposition_most_victories))
print(paste("Position with the most goals:", newposition_most_goals))
print(paste("Position with the most red cards:", newposition_most_red_cards))
print("")
print(paste("League with the most wins:", leagueCountry_most_victories))
print(paste("League with the most goals:", leagueCountry_most_goals))
print(paste("League with the most red cards:", leagueCountry_most_red_cards))
print("")
print(paste("Club with the most wins:", club_most_victories))

# Create a bar plot of points per club, grouped by leagueCountry
plot1 <- ggplot(data, aes(x = club, y = points, fill = leagueCountry)) +
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
plot2 <- ggplot(data, aes(x = age, fill = leagueCountry)) +
  geom_histogram(binwidth = 1, color = "black") +
  labs(x = "Age", y = "Count") +
  ggtitle("Distribution of Player Ages per League") +
  theme_minimal() +
  facet_grid(. ~ leagueCountry)

# # Calculate the total ratio of red cards to yellow cards per league
# data_summary <- data %>%
#   group_by(leagueCountry) %>%
#   summarise(total_redCards = sum(redCards, na.rm = TRUE),
#             total_yellowCards = sum(yellowCards, na.rm = TRUE)) %>%
#   mutate(ratio = total_redCards / total_yellowCards)
# 
# # Remove rows with missing or infinite values
# data_summary <- data_summary[complete.cases(data_summary) & is.finite(data_summary$ratio), ]
# 
# # Create a scatter plot of the total ratio by league
# plot3 <- ggplot(data_summary, aes(x = leagueCountry, y = ratio)) +
#   geom_point(size = 3, color = "darkblue") +
#   labs(x = "League", y = "Ratio (Red Cards / Yellow Cards)") +
#   ggtitle("Total Ratio of Red Cards to Yellow Cards by League") +
#   theme_minimal()

# Arrange plots vertically
grid.arrange(plot1, plot2, ncol = 1)