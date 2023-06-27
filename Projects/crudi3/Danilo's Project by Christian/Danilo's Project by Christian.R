## Initial Solution for Danilo's project
library(tidyverse)
# Load Dataset

# Merging the Excel Sheets into one dataset, excepting the last two
library(rio)
library(readxl)
df <- read_excel(path = path)

path <- "Projects/danilopenagos/PG_BD_INVITACIONES_SM05-20-2021.xlsx"
df <- import_list(path, rbind = TRUE)
names(df)


# Create a subset dataset using the variables: "Nombre / Galeria / Espacio", "Artistas", 
data <- subset(df, select = c("Nombre / Galeria / Espacio", "Artistas"))

# splitting the strings of Artistas and saving as new variable
data1<-data |> separate_rows(Artistas, sep = ", ")
data1

# removing all the cases with NA
data2<-data1[complete.cases(data1), ]
data2

# grouping der Künstler nach Anzahl der Einladungen
length(data2$Artistas)

n<-data2|>
  group_by(Artistas, `Nombre / Galeria / Espacio`) |>
  count(Artistas)
n # Variable, die die Anzahl der Künstler mit ihrem Name zählt
length(n$n)


# Eliminieren der Duplikate --> n und unique(data2) haben dieselbe länge
artgal<-merge(n,unique(data2))
view(artgal)
rm(n,data,data1,data2)

# Artgal als Arbeitsdatensatz, mit der Gallerie, dem Künstler und der Anzahl der Einladungen, die der Künstler zu dieser Galerie erhalten hat