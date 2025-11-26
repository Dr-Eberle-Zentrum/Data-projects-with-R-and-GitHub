# Solution of UFC Statistics from Gabriel

library(tidyverse)
library(ggplot2)

######### Data import ######################

ufcevents <- readr::read_csv("./Projects/TobiTuTuebingen/UFCdata/events.csv")
View(ufcevents)
ufcfightersstat <- readr::read_csv("./Projects/TobiTuTuebingen/UFCdata/Fighters Stats.csv")
View(ufcfightersstat)
ufcfighters <- readr::read_csv("./Projects/TobiTuTuebingen/UFCdata/fighters.csv")
View(ufcfighters)
ufcfights <- readr::read_csv("./Projects/TobiTuTuebingen/UFCdata/Fights.csv")
View(ufcfights)

######### Data manipulation ################

# Firt Graph: 
# hier haben wir das wlratio berechnet
ufcfigtherswl <- ufcfightersstat %>%
  mutate(wlratio = W / (W + L) ) %>%
  group_by(Weight_Class) %>%
  summarise(mean_wlratio = mean(wlratio, na.rm = TRUE))
# hier haben wir den jeweils stärksten rausgefiltert:
ufc_top_per_class <- ufcfightersstat %>%
  mutate(wlratio = W / (W + L)) %>%
  group_by(Weight_Class) %>%
  slice_max(wlratio, n = 1, with_ties = FALSE)
# Zusammenführen der Tabellen:
ufc_combined <- ufc_top_per_class %>%
  select(Weight_Class, Fighter = `Full Name`, fighter_wlratio = wlratio) %>%
  left_join(ufcfigtherswl, by = "Weight_Class") %>%
  filter(!Weight_Class%in% c("Women's Bantamweight",
                             "Women's Featherweight",
                             "Women's Flyweight",
                             "Women's Strawweight"))
# Daten in long format:
plotdata <- ufc_combined %>%
  pivot_longer(cols = c(fighter_wlratio, mean_wlratio),
               names_to = "Type",
               values_to = "Value") %>%
  mutate(Type = recode(Type,
                       "fighter_wlratio" = "Top Fighter",
                       "mean_wlratio" = "Class Mean"))

ggplot(plotdata, aes(x = Weight_Class, y = Value, fill = Type))+
  geom_col(position = position_dodge())+
  labs(
    title = "W/L Ratio: Top Fighter vs. Class Mean",
    x = "Weight Class",
    y = "W/L Ratio",
  fill = ""
  )+
  theme_minimal()+
  theme(axis.text = element_text(angle = 45, hjust = 1))

View(ufcfigtherswl)
View(ufc_top_per_class)

# Second Graph: 
ufcfigthershtoreach <- ufcfighters %>%
  mutate(
    heighttoreach = Ht. / Reach, na.rm = TRUE
  ) %>%
  mutate(
    wlratio = W / (W+L)
  )
  
View(ufcfigthershtoreach)
# Third Graph:

ufccountry <- ufcevents %>%
  separate(Location,
           into = c("City", "State", "Country"),
           sep = ",\\s*",
           fill = "left",
           extra = "merge")
View(ufccountry)

ufccountrygroups <- ufccountry %>%
  group_by(Country) %>%
  summarise(n = n()) %>%
  arrange(desc(n)) 

# 4th Visualization:
ufcmethod <- ufcfights %>%
  group_by(Method) %>%
  summarise(n = n()) %>%
  arrange(desc(n))

# 5th Visualization:
ufcyearlydata <- ufcevents %>%
  mutate(year = year(Date)) %>%
  group_by(year) %>%
  summarise(n = n()) %>%
  arrange(desc(n))
View(ufcyearlydata)
######### Data visualization goals #########

# W / L ratio for top 10 per weight class: 
# Datenverarbeitung klappt gerade nicht




# 2nd Long arms help figthers?

ggplot(ufcfigthershtoreach,aes(x = heighttoreach, y = wlratio))+
  geom_point()+
  geom_smooth()+
  labs(
    title = "Longer arms don't necessarily help figthers to win",
    caption = "Ploting by Tobias Tuchel. Data from UFC",
    x = "Win / Loose Ratio",
    y = "Height to reach Ratio"
  )

# 3rd Visualization: 
install.packages("maps")
library(maps)

# Geometriedaten:
world <- map_data("world")
# Joining:
events_world_map <- world %>%
  left_join(ufccountrygroups, by = c("region" = "Country"))
# Plotten:
ggplot(events_world_map, aes(x= long, y = lat, group = group, fill = n))+
  geom_polygon(color = "black", outline_width= 0.1)+
  scale_fill_continuous(name = "Number of Events", na.value = "white")+
  theme_minimal()+
  labs(title = "Most UFC events in US")

# 4th Visualization
View(ufcmethod)
graph <- ufcmethod %>%
  filter(Method %in% c("KO/TKO Punch", "KO/TKO Punches", "Submission",
                       "Doctor Stoppage", "Decision", "Draw", "Disqualification")) %>%
  ggplot(aes(x = reorder(Method, n), y = n)) +
  geom_col(fill = "blue") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))+
  labs(x = "Method",
       y = "Number",
       title = "Most Knock-outs in UFC through ")
# -> Problem: Spaltennamen sind nicht vergeben, aus den Abkürzungen werde ich nicht
# schlau, Feedback ist gegeben.

# 5th visualization: Expansion of the sport

ggplot(ufcyearlydata, aes(x = year, y = n))+
  geom_line(color = "blue")+
  labs(x = "Number of events",
       y = "year",
       title = "Sharp increase in UFC events till Pandemic")+
  theme_minimal()