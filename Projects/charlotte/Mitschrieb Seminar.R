#########################################
#### Data Projects with R and GitHub ####
#########################################
## install if needed (do this exactly once):
#install.packages("usethis")
library(usethis)

use_git_config(user.name = "janaelodie", user.email = "charlotterigot1502@gmail.com")


#Str + Shift + C --> zum raus/ reinmachen von codereihen
#### Session 1 #####

### to do bis nächste woche
# - eigenen Account auf GitHub machen (ist nicht von der uni verfügbar)
# - username an ihn schicken, sonst kann man nicht am project teilnehmen
# - copilot in r aktivieren
#--------------------------------------------------------
# - ÜBUNG 1 - #
#--------------------------------------------------------
library(tidyverse)
# data set
view(starwars)
#' We are interested in the lightest characters of each
#' homeworld that are blue or yellow eyed. What are the
#' starships these characters have piloted?
#' We want a sorted list with star ships and respective pilots.
#'
#' Write a single pipe to generate the table of interest.
#' You should and might want to use the following functions:
#' - group_by, rowwise and ungroup
#' - filter with %in%
#' - slice...
#' - select
#' - unnest
#' - arrange
#---------------------------------------------------------
starwars %>% 
  group_by(homeworld) %>% 
  filter(eye_color %in% c("blue", "yellow")) %>% 
  drop_na(mass) %>%
  arrange (mass) %>% 
  slice_tail () %>% 
  ungroup() %>%
  unnest(starships) %>% # keep_empty macht, dass auch Reihen mit NA drin bleiben
  select(starships, name) %>%
  arrange(name, starships)
#---------------------------------------------------------

#### Hausaufgaben: Markdown und Github ####
# --> noch machen <---

#### Session 2: 23.10.2024 ####
# wenn man projekt von github nimmt immer erst pull
# wenn man fertig ist mit bearbeiten immer erst pull und dann push
# immer auf commit drücken und eine beschreibung von dem dalassen was man gemacht hat

# ---
# Aufgabe
# ---

# Search the internet to find different ways to get the path to the
# current source file location, to be used for setting the working directory.
# What are the pros and cons of the different approaches?
# 1)
#getwd()
#setwd("C:\\Users\\charl\\Documents\\Uni\\5. Semester\\Data Projects with R and GitHub\\script")
# --> problem: absoluter part, nicht gut für geteilte projekte

#2
#library("rstudioapi")
rstudioapi::getSourceEditorContext()$path %>% 
  dirname() %>% 
  setwd()
# --> nur für rstudio
# --> favorite von Raden

#3
#library("here")
#here::i_am()

#4
#library("this.path")
#setwd(dirname(this.path()))



#### Hausaufgabe: RMarkdown ####

# R Markdown
##################

library(readxl)
library(tidyr)
library(dplyr)

# Lade die Excel-Datei und ignoriere die erste Zeile (Kopfzeile)
data_raw <- read_excel("C:/Users/charl/Documents/Uni/5. Semester/Seminar_R und GitHub/Data_Hausaufgabe.xlsx", col_names = FALSE) %>%
  slice(-1)  # Entferne die erste Zeile, die die Kopfzeile ist

# Trenne die Daten in einzelne Spalten basierend auf den Kommata
data_clean <- data_raw %>%
  separate(...1, 
           into = c("Common name", "Species name", "Number of mammal populations included", 
                    "Start year", "End year", "Average relative change in abundance"), 
           sep = ",") %>%
  # Entferne das Prozentzeichen und konvertiere die Spalte in numerische Werte
  mutate(`Average relative change in abundance` = as.numeric(gsub("%", "", `Average relative change in abundance`)),
         across(c("Number of mammal populations included", "Start year", "End year"), as.numeric))

# Überprüfe die bereinigte Tabelle
print(data_clean)

###################

library(ggplot2)
library(dplyr)

# Daten sortieren nach "Average relative change in abundance"
data_sorted <- data_clean %>%
  arrange(desc(`Average relative change in abundance`))

# Erstellen der Textlabels mit "Common name", "Start year" und "End year"
data_sorted <- data_sorted %>%
  mutate(label = paste(`Common name`, "-", `Start year`, "to", `End year`))

# Plot erstellen
ggplot(data_sorted, aes(x = 0, 
                        xend = `Average relative change in abundance`,
                        y = reorder(label, `Average relative change in abundance`),
                        yend = reorder(label, `Average relative change in abundance`))) +
  geom_segment(arrow = arrow(length = unit(0.3, "cm")), color = "grey") +  # Pfeile von links nach rechts
  geom_point(aes(x = `Average relative change in abundance`), size = 3, color = "darkslateblue") +  # Punkte hinzufügen
  geom_text(aes(x = `Average relative change in abundance`, 
                label = `Average relative change in abundance`), 
            hjust = -0.5, size = 3.5, color = "darkslateblue") +  # Werte hinzufügen
  theme_minimal() +
  labs(x = "Average Relative Change in Animal Population", y = NULL) +  # Entfernt den Plot-Titel
  xlim(0, max(data_sorted$`Average relative change in abundance`) + 0.1) +  # Anpassen der x-Achse
  theme(axis.text.y = element_text(size = 10, face = "bold", hjust = 1),  # Schriftart fett für Common name
        panel.grid = element_blank(),  # Entfernt das graue Gitter
        panel.background = element_rect(fill = "white"))  # Weißer Hintergrund


####### Session 2 ######
#Aufgabe .........
#' Let's practice our ggplot plotting skills. To this end, we use the
#' "ToothGrowth" data set directly available within R (check help).
#' We want to plot for the different dose levels (X) the respective
#' tooth length. The dose levels should be represented as follows:
#' - 0.5 = non-filled circle in a dark green
#' - 1 = orange filled triangles
#' - 2 = filled circles in a light bluedos
#' Use jittering to avoid overplotting of data points.
#' We don't want to have any background decorations etc. and useful
#' labels for axes and legend.
#' Ensure there is only ONE legend (showing both color and shape).
# ..............
library(ggplot2)
library(dplyr)

ToothGrowth %>% 
  mutate(dose =as.factor(dose)) %>% # dose als kategoriale variable, sonst graduelle farbe, abstand unregelmäßig
  ggplot(mapping = aes(x = dose, y = len, shape = dose, color = dose, fill = dose)) +
  geom_jitter (width = 0.2, height= 0, size = 5) +
  scale_shape_manual(values = c(1, 24, 21)) +  # bzw. c("circle open", "triangle filled", "circle filled") --> https://ggplot2.tidyverse.org/articles/ggplot2-specs.html
  scale_color_manual(values = c("darkgreen", "orange", "lightblue")) +
  scale_fill_manual(values = c(NA, "orange", "lightblue")) +   # Fill colors (NA for non-filled)
  # theme(
  #   panel.background = element_blank(),        
  #   axis.line = element_line(color = "black")  
  # ) +
  theme_classic()+
  labs(x = "Dose", y = "Tooth Length", shape = "Dose", color = "Dose", fill = "Dose")



