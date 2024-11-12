#______________________________________#
#### Hausaufgabe für den 06.11.2024 ####
#______________________________________#

#### PAKETE LADEN ####
#____________________#
install.packages("ggrepel")
library(dplyr)
library(ggplot2)
library(scales)
library(grid)
library(png)
library(ggarrow) # eventuell kann hiermit noch die pfeilspitze angepasst werden, hab ich jedoch zeitlich nicht mehr geschafft
library(ggrepel)

#### DATENSATZ ERSTELLEN ####
#___________________________#

data_clean <- read.csv("https://ourworldindata.org/uploads/2022/09/Mammal-comeback-in-Europe-data-OWID-download.csv") %>% 
  mutate(`Average.relative.change.in.abundance` = as.numeric(gsub("%", "", `Average.relative.change.in.abundance`)))

# besser: read_csv aus readr packet

is.numeric(data_clean$Average.relative.change.in.abundance)

#### BÄRENSYMBOL LADEN ####
#_________________________#

bear <- "https://dr-eberle-zentrum.github.io/Data-projects-with-R-and-GitHub/Projects/martin-raden/icons8-bear-67.png" %>%
  {download.file(., destfile = "bear_icon.png", mode = "wb"); "bear_icon.png"} %>%
  readPNG() %>%
  rasterGrob(interpolate = TRUE, width = unit(1, "cm"))

#### PLOT ERSTELLEN ####
#______________________#

data_clean %>%
  mutate (`log.Average.relative.change.in.abundance` = log(`Average.relative.change.in.abundance`)) %>% 
  arrange(desc(`log.Average.relative.change.in.abundance`)) %>%
  ggplot(aes(x = 0, 
             xend = `log.Average.relative.change.in.abundance`,
             y = reorder(`Common.name.of.species`, `log.Average.relative.change.in.abundance`))
  ) +
  
  # PFEILE HINZUFÜGEN
  geom_segment(arrow = arrow(
    length = unit(0.3, "cm"),  # Länge der Pfeilköpfe
    type = "closed",           # Geschlossene Pfeilköpfe
    ends = "last",             # wo endet der Pfeil
    angle = 20),               # winkel der Pfeilspitze
    color = "grey"             # Pfeilfarbe
  ) +
  
  # PUNKTE AM ANFANG DER PFEILE
  geom_point(aes(x = 0),        # wo liegen die Punkte
             size = 3.5,        # Größe
             color = "grey25"   # Farbe
  ) + 
  
  # PUNKTE: RELATIVE CHANGE IN ABUNDANCE
  geom_point(aes(x = `log.Average.relative.change.in.abundance`),# wo liegen die Punkte (hier log!)
             shape = 21,                                         # Form
             size = 3.5,                                         # Größe
             color = "grey25",                                   # Farbe der Umrandung
             stroke = 0.5,                                       # Dicke der Umrandung
             fill = "cadetblue4"                                   # Farbe der Füllung
  ) +                               
  
  # ZAHLEN: RELATIVE CHANGE IN ABUNDANCE 
  geom_text(aes(x = `log.Average.relative.change.in.abundance`,               # wo liegen die zahlen (hier log!)
                label = paste0(comma(`Average.relative.change.in.abundance`), "%")), # Prozentzeichen und Kommata hinzufügen
            hjust = -0.5,                                                     # Ausrichtung
            size = 3.5,                                                       # Größe
            color = "cadetblue4",                                               # Farbe
            fontface = "bold"                                                 # fett
  ) +                                              
  
  # JAHRESZAHLEN
  geom_label(aes(x = 0,                                          # label weil bei text kann man hintergrund nicht ändern
                 label = paste(`Start.year`, "to", `End.year`)), # was soll da stehen
             hjust = -0.15,                                      # Ausrichtung
             size = 3,                                           # Größe
             color = "grey25",                                   # Farbe Text
             fill = "white",                                     # Farbe Hintergrund
             label.size = 0                                      # Umrandung weg
  ) +             
  
  # X-ACHSE MANUELL LABELN
  scale_x_continuous(
    breaks = log(c(1, 10, 100, 1000, 10000)),                    # Manuelle Breakpoints auf log-Skala
    labels = function(x) paste0(comma(exp(x)), "%")
  ) +
  
  # Den WEI?EN RAHMEN UM DEN PLOT RUM WEGMACHEN
coord_cartesian(clip = "off")+
  
  # BILD VOR BROWN BEAR --> funktioniert noch nicht (symbol nicht an der richtigen stelle)
  annotation_custom(bear,
                    xmin= -2.55,
                    xmax= -2.55,
                     ymin = 4,
                    ymax = 4
                    ) +
  
  # DIE TEXTKOMMENTARE (KLAPPT NOCH NICHT)
  # geom_text_repel(subset(data_clean, `Common.name.of.species` == "Brown bear"), 
  #                 aes(label = "Between 1960 and 2016, population\n of brown bears increased by an average of 44%", 
  #                     x = `Common.name.of.species`, 
  #                     y = `Average.relative.change.in.abundance`),
  #                 nudge_y = 0.8,
  #                 nudge_x = 0.5,
  #                 size = 2,
  #                 color = "#6699CC",
  #                 arrow = arrow(length = unit(0.1, "inches")))+
  
  # THEMES
  theme(
    panel.background = element_blank(), # weißer Hintergrund
    axis.text.y = element_text(
      face = "bold",                    # y-Achse fett
      size = 10,                        # y-Achse Größe
      color = "grey25"),                # y-Achse Farbe
    axis.ticks = element_blank()       # Achsenstriche entfehrnen
  ) +
  
  # ACHSENBESCHRIFTUNG
  labs(x = expression(bold ("Average relative change in the size of population") ~ "(logarithmic scale)"), # x-Achse Beschriftung
       y = NULL,                                                                                           # y-Achse Beschriftung
       title = NULL)                                                                                       # Titelbeschriftung


# Was noch angepasst/ hinzugefügt werden muss

# 1) Format des Plots anpassen (alle Zahlen sollen im Bild sein)
#    --> coord_fixed(ratio = 0.8) --> nicht das erwünschte ergebnis
#    --> plot.margin = margin(t = 10, r = 10, b = 10, l = 10) --> nicht das gewünschte ergebnis

# 2) Pfeilspitzen
#    --> richtige Form finden (innen soll auch noch ein kleines Dreieck sein)
#    --> Pfeile sollen etwas vor den Punkten enden

# 3) Einfügen
#    --> Bärensymbol bei Brown bear (https://dr-eberle-zentrum.github.io/Data-projects-with-R-and-GitHub/Projects/martin-raden/icons8-bear-67.png)
#    --> Stern bei Loggerhead turtle
#    --> Textfelder (teilweise mit Pfeilen): 
#        - Start and end year
#        - Average relatibe change in animal populations
#        - Between .... (an zwei stellen)
