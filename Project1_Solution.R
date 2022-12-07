#Project of Jan/ HIV Data
#Eric Offermann
library(tidyverse)
library(ggplot2)
library(dplyr)

wd = setwd("D:/Eric/Documents/Uni_Tuebingen_Kurse/5. Semester/Kurs R2/Aufgabe_1/Advanced-data-processing-with-R/Projects/jan-boethling")

csv_jan = read.csv("Data_Project_Jan.csv")


#Umbenennen der Variablen
names(csv_jan)[8] <- "Country"
names(csv_jan)[10] <- "Year"
names(csv_jan)[24] <- "Cases"
#Löschen der nicht benutzten Spalten
#Hier über Index
#Dafür muss allerdings jedes Mal die Tabelle geöffnet werden und geschaut werden an welcher Stelle die Column ist

df = csv_jan[-c(1:7,9,11:23,25:34)]

#aggregate(df$Cases, by=list(Year=df$Year), FUN = sum)

#DPLYR: 
df1 <- df %>%
        group_by(Year)%>%
        summarise(Cases = sum(Cases), na.rm = T)

df1
View(df1)
