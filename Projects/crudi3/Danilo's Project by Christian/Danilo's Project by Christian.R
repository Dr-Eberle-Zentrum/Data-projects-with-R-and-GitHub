## Initial Solution for Danilo's project
library(tidyverse)
# Load Dataset
library(readxl)
PG_BD_INVITACIONES_SM05_20_2021 <- read_excel("Projects/danilopenagos/PG_BD_INVITACIONES_SM05-20-2021.xlsx")

path <- "Projects/danilopenagos/PG_BD_INVITACIONES_SM05-20-2021.xlsx"


# Merging the Excel Sheets into one dataset, excepting the last two
install.packages("rio")
library(rio)

df <- import_list(path, rbind = TRUE)

names(df)


# Create a subset dataset using the variables: "Nombre / Galeria / Espacio", "Artistas", 
data <- subset(df, select = c("Nombre / Galeria / Espacio", "Artistas"))

# splitting the strings of Artistas and saving as new variable
data1<-data |> separate_rows(Artistas, sep = ", ")
data1

# removing all the cases with NA
artgal<-data1[complete.cases(data1), ]
artgal

# for-schleife erstellen, die zählt wie oft ein Künstler in einer einzigartigen Gallerie vertreten war
length(artgal$Artistas)
artgal$AnzahlAusstellungen <- 0
x=0
for (i in artgal$Artistas) {
  x=x+1
  artgal$AnzahlAusstellungen[x]<- sum(str_count(artgal$Artistas, pattern=i))
  
}
# Problem: for schleife bricht frühzeitig ab bei dem Wert "Confabularios ( : ..." --> Vermutlich wegen der Klammer, ohne diese funktiuniert der Befehl
sum(str_count(artgal$Artistas, pattern="Confabularios"))

# to do: push die Project Lösung in den Ordner von Danilo aber mein Branch benutzen
#      - pull request erstellen (in Github)
                

# grouping befehl group_by()

#data.frame(
#A = 1:4,
#B = c(1,1,2,2)
#) |> 
#  group_by(B) |>
#  # count()
#  summarize( anzahl = n() )