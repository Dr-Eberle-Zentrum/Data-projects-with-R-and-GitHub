

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

crime_task2 <- crimedata2 |> 
  select(c("geo", "TIME_PERIOD", "OBS_VALUE")) |> 
  mutate(Type = "Crime")

income_task2 <- incomedata |> 
  select(c("geo", "TIME_PERIOD", "OBS_VALUE")) |> 
  mutate(Type = "Income")

poverty_task2 <- povertydata |> 
  select(c("geo", "TIME_PERIOD", "OBS_VALUE")) |> 
  mutate(Type = "Poverty")

datatask2 <- merge(crime_task2, income_task2, by = "Type")

ggplot(aes(x=gdpPercap, y=lifeExp, size=pop, color=continent)) +
  geom_point(alpha=0.5) +
  scale_size(range = c(.1, 24), name="Population (M)")



# The dataset is provided in the gapminder library
library(gapminder)
data <- gapminder %>% filter(year=="2007") %>% dplyr::select(-year)

# Most basic bubble plot
data %>%
  arrange(desc(pop)) %>%
  mutate(country = factor(country, country)) %>%
  ggplot(aes(x=gdpPercap, y=lifeExp, size=pop, color=continent)) +
  geom_point(alpha=0.5) +
  scale_size(range = c(.1, 24), name="Population (M)")



## Tests -----------------------------------------------------------------------

library(maps)
UK <- map_data("world") %>% filter(region=="UK")
data <- world.cities %>% filter(country.etc=="UK")
ggplot() +
  geom_polygon(data = UK, aes(x=long, y = lat, group = group), fill="grey", alpha=0.3) +
  geom_point( data=data, aes(x=long, y=lat)) +
  theme_void() + ylim(50,59) + coord_map() 





