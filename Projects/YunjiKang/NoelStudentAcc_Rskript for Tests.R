

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

crimedata2 <- data.table::fread("Projects/YunjiKang/Crime_data_for_Task2.gz")
incomedata <- data.table::fread("Projects/YunjiKang/Income of households.gz")
povertydata <- data.table::fread("Projects/YunjiKang/At-risk-of-poverty rate.gz")
names(crimedata2)
names(incomedata)
names(povertydata)

#df1 <- data.frame(x=c(1,2,3), y=c(2,3,4), a=c(7,6,7))
#df2 <- data.frame(x=c(3,2,3), z=c(2,3,4), b=c(8,8,9))
#df3 <- data.frame(x=c(3,2,3), z=c(2,3,4), b=c(8,8,9))
#df <- bind_rows(select(df1, x,y), select(df2,x,z), select(df2,x,z))

data <- bind_rows(
  select(rename(crimedata2, crime = OBS_VALUE), geo, TIME_PERIOD, crime), 
  select(rename(incomedata, income = OBS_VALUE), geo, TIME_PERIOD, income),
  select(rename(povertydata, poverty = OBS_VALUE), geo, TIME_PERIOD, poverty)
  ) |> arrange(geo)

rm(crimedata2) & rm(incomedata) & rm(povertydata)

data |> ggplot(aes(x=income, y=crime, size=poverty, color=geo)) +
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





