

#install.packages("data.table")
#install.packages("R.utils")
library(maps)

crimedata1 <- data.table::fread("Projects/YunjiKang/Crime_data_for_Task1.gz")
crimedata2 <- data.table::fread("Projects/YunjiKang/Crime_data_for_Task2.gz")
incomedata <- data.table::fread("Projects/YunjiKang/Income of households.gz")
povertydata <- data.table::fread("Projects/YunjiKang/At-risk-of-poverty rate.gz")

### Task 1 ---------------------------------------------------------------------

#' Plot a bubble map of Crime data for Task1 with ggplot 2 to visualize the 
#' number of Police-recorded offence in Germany. Use facet_wrap() to visualize 
#' all of the different crimes ( Intentional homicide, Assault, Robbery... Theft)

Germany <- map_data("world", region = "Germany")

ggplot() +
  geom_polygon(data = Germany, aes(x=long, y = lat, group = group), fill="grey", alpha=0.3) +
  geom_point( data=data, aes(x=long, y=lat)) +
  theme_void() + ylim(50,59) + coord_map() 


### Task 2 ---------------------------------------------------------------------


## Tests -----------------------------------------------------------------------

library(maps)
UK <- map_data("world") %>% filter(region=="UK")
data <- world.cities %>% filter(country.etc=="UK")
ggplot() +
  geom_polygon(data = UK, aes(x=long, y = lat, group = group), fill="grey", alpha=0.3) +
  geom_point( data=data, aes(x=long, y=lat)) +
  theme_void() + ylim(50,59) + coord_map() 





