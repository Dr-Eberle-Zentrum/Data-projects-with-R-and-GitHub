

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

# data
crimedata2 <- data.table::fread("Projects/YunjiKang/Crime_data_for_Task2.gz")
incomedata <- data.table::fread("Projects/YunjiKang/Income of households.gz")
povertydata <- data.table::fread("Projects/YunjiKang/At-risk-of-poverty rate.gz")

# reshape crimedata2 because of unit and value
crimedata2_reshaped <- crimedata2 |> 
  select(c(unit, OBS_VALUE, geo, TIME_PERIOD, iccs)) |> 
  mutate(counter = ave(seq_along(unit), unit, FUN = seq_along)) |> 
  reshape(idvar = "counter", timevar = "unit", direction = "wide") |> 
  rename(crime_phthab = OBS_VALUE.P_HTHAB, 
         crime_nr = OBS_VALUE.NR,
         geo = geo.NR,
         TIME_PERIOD = TIME_PERIOD.NR,
         iccs = iccs.NR) |> 
  select(c( geo, crime_phthab, crime_nr, TIME_PERIOD, iccs))

data <- merge(merge(crimedata2_reshaped, 
  select(rename(incomedata, income = OBS_VALUE), geo, TIME_PERIOD, income), 
  by = c("geo", "TIME_PERIOD")), 
  select(rename(povertydata, poverty = OBS_VALUE), geo, TIME_PERIOD, poverty),
  by = c("geo", "TIME_PERIOD"))

str(data)
rm(crimedata2) & rm(incomedata) & rm(povertydata) & rm(crimedata2_reshaped)


# Bubble Chart without animation

data |> ggplot(aes(x = income, y = crime_phthab, size = crime_nr, 
                   color = as.factor(poverty))) +
  geom_point(alpha = 0.7) +
  scale_size_continuous(range = c(3, 15)) + 
  # facet_wrap(~iccs) +
  labs(title = "Police-recorded Offence vs. Income vs. At Risk of Poverty Rate",
       x = "Income of Households (Euro per inhabitant)",
       y = "Police-recorded Offence (Per hundred thousand inhabitants)",
       size = "Police-recorded Offence (Number)",
       color = "At Risk of Poverty Rate") +
  theme_minimal() +
  guides(size = "none", color = "none")

# Bubble Chart with animation

library(gganimate)

# Make a ggplot, but add frame=year: one image per year
#data |> ggplot(aes(x = income, y = crime_phthab, size = crime_nr, 
#                   color = as.factor(poverty))) +
#  geom_point() +
#  scale_x_log10() +
#  theme_bw() +
#  # gganimate specific bits:
#  labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'life expectancy') +
#  transition_time(TIME_PERIOD) +
#  ease_aes('linear')

# Save at gif:
#anim_save("271-ggplot2-animated-gif-chart-with-gganimate1.gif")

# Error: The animation object does not specify a save_animation method
# This is a Error cause of package version (?)


## Tests -----------------------------------------------------------------------

## Task 1

library(maps)
UK <- map_data("world") %>% filter(region=="UK")
data <- world.cities %>% filter(country.etc=="UK")
ggplot() +
  geom_polygon(data = UK, aes(x=long, y = lat, group = group), fill="grey", alpha=0.3) +
  geom_point( data=data, aes(x=long, y=lat)) +
  theme_void() + ylim(50,59) + coord_map() 


## Task 2

# Convert the 'year' column to a factor for animation
crime_data$year <- as.factor(crime_data$year)

# Mapping country codes to country names
country_mapping <- data.frame(code = c("AT", "BE", "BG", "CY", "CZ", "DE", "DK", "EE", "ES", "FI", "FR", "GR", "HR", "HU", "IE", "IT", "LT", "LU", "LV", "MT", "NL", "PL", "PT", "RO", "SE", "SI", "SK"),
                              country = c("Austria", "Belgium", "Bulgaria", "Cyprus", "Czech Republic", "Germany", "Denmark", "Estonia", "Spain", "Finland", "France", "Greece", "Croatia", "Hungary", "Ireland", "Italy", "Lithuania", "Luxembourg", "Latvia", "Malta", "Netherlands", "Poland", "Portugal", "Romania", "Sweden", "Slovenia", "Slovakia"))

# Merge data with country names
crime_data <- merge(crime_data, country_mapping, by.x = "country_code", by.y = "code")

# Create a bubble chart using ggplot2
p <- ggplot(crime_data, aes(x = income_per_inhabitant, y = police_recorded_offence_per_100k, size = police_recorded_offence_number, color = at_risk_of_poverty_rate)) +
  geom_point(alpha = 0.7) +
  scale_size_continuous(range = c(3, 15)) +
  scale_color_viridis_c() +  # You can choose any color scale you prefer
  facet_wrap(~crime_type) +
  labs(title = "Police-recorded Offence vs. Income vs. At Risk of Poverty Rate",
       x = "Income of Households (Euro per inhabitant)",
       y = "Police-recorded Offence (Per hundred thousand inhabitants)",
       size = "Police-recorded Offence (Number)",
       color = "At Risk of Poverty Rate") +
  theme_minimal()

# Animate the chart over the 'year' variable
animation <- p + transition_states(year, transition_length = 2, state_length = 1) +
  enter_fade() +
  exit_fade()

# Save the animation as a gif or view it interactively
anim_save("crime_animation.gif", animation, renderer = gifski_renderer())



