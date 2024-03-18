rm(list = ls()) #Clears the workspace to avoid any conflicts when first running the code
options(scipen=999) #Disable scientific notation

##################################### Importing Packages #####################################

if (!require(magrittr)) install.packages(magrittr)
if (!require(dplyr)) install.packages(dplyr)
if (!require(ggplot2)) install.packages(ggplot)
if (!require(tidyr)) install.packages(tidyr)

library(magrittr) #Used for piping
library(dplyr) #Used for adding new column  
library(ggplot2) #Used for visualizations
library(tidyr) #Pivot data

##################################### Setting Working Directory #####################################

#I get the data directly from the GitHub site
url_to_csv <- "https://dr-eberle-zentrum.github.io/Data-projects-with-R-and-GitHub/Projects/Deeznis/Housing_prices.csv"

#I use ; as seperator.
housing_prices <- read.csv(url_to_csv, sep =";")

##################################### Data Manipulation Goals #####################################

#I first replace the . in the names of the columns with a _
#This makes it easier to read
colnames(housing_prices) <- gsub("\\.", "_", colnames(housing_prices))

#I remove any excess _ at the end of the column names.
remove_excess_ <- function(data) {
  names(data) <- gsub("_+$", "", names(data))
  return(data)
}

housing_prices <- remove_excess_(housing_prices)

#I change the values of the below columns so that:

# - Percentage Columns are shown as Decimal
# - Infrastructure Investment values are actually in million. 

housing_prices <- housing_prices %>%
  mutate(Percentage_of_Workforce_Working_Remotely = Percentage_of_Workforce_Working_Remotely / 100) %>%
  mutate(Urban_Population_Growth_Rate = Urban_Population_Growth_Rate / 100) %>%
  mutate(Rural_Population_Growth_Rate = Rural_Population_Growth_Rate / 100) %>%
  mutate(Public_Transport_Ridership_Change = Public_Transport_Ridership_Change / 100) %>%
  mutate(Internet_Infrastructure_Investment__Million_USD = Internet_Infrastructure_Investment__Million_USD * 1000000)

#I reorder the data by Country and Year in preparation of calculating the home price growth
housing_prices <- housing_prices %>%
  arrange(Country, Year)

#For Germany the row for the year 2018 exists twice. I remove any duplicate values for the columns Year and Country
housing_prices$duplicate_finder <- paste(housing_prices$Year, housing_prices$Country, sep = "-")
housing_prices <- housing_prices[!duplicated(housing_prices$duplicate_finder), ]
housing_prices$duplicate_finder <- NULL #Remove column after it isn't needed anymore

#I calculate the home price growth as the current index divided by the lagged index - 1 for each country.
#I do this by grouping the operation by the Country column.
housing_prices <- housing_prices %>% 
  group_by(Country) %>% 
  mutate(Home_Price_Growth = (Average_Urban_Housing_Price_Index / lag(Average_Urban_Housing_Price_Index)) - 1) %>%
  mutate(Remote_Workforce_Growth = (Percentage_of_Workforce_Working_Remotely / lag(Percentage_of_Workforce_Working_Remotely)) - 1)

#Prints for rows of table
head(housing_prices)

#Now I transpose the data to make it easier to use for the visualization goals.
housing_Prices_long <- pivot_longer(housing_prices, 
                                    cols = c(Home_Price_Growth, Remote_Workforce_Growth), 
                                    names_to = "Variable",
                                    values_to = "Value")

#I only keep the relevant columns & drop missing values
housing_Prices_long <- na.omit(housing_Prices_long[, c("Year", "Country", "Variable", "Value")])

head(housing_Prices_long)
##################################### Visualization Goals #####################################

##################################### (1) Scatterplot #####################################

#Work in progress

##################################### (2) Comparison of Remote Work & Home Pricing #####################################

# Still working on the scale on y-axis. -> Check Values! 

housing_Prices_long %>%
  ggplot(aes(x = Year, y = Value, color=Variable)) + #Color = Variables distinguishes between the two variables that are plotted
  
  geom_point() + #Creates scatterplot
  geom_line() + #Adds lines between single dots of the scatterlot
  
  theme_minimal() + #Minimal theme looks good!
  
  labs(
    title = "Comparison of Remote Work & Home Pricing",
    subtitle = "Red Verticale Line indicates beginning of Covid-19 pandemic",
    x = "Year",
    y = "Growth",
  ) +
  
  facet_wrap(~Country, ncol = 1) + #Split the graph into 3 graphs by country but formats the plot as 1 column & 3 rows.
  
  theme(
    legend.position = "bottom", #Repositons the legend at the bottom
    #panel.grid.major = element_blank(), #Removes the grid from the background
    #panel.grid.minor = element_blank(), #Removes the grid from the background
  ) + 
  
  scale_y_continuous(labels = scales::percent_format(scale = 1)) + #Formats the values on the y-axis as percentage.
  scale_x_continuous(breaks = unique(housing_Prices_long$Year)) +  #Shows each year on the x-axis. 
  geom_vline(xintercept = 2019, linetype="dashed", color="red", size=1) # Highlighting the year of the Covid-19 pandemic.




