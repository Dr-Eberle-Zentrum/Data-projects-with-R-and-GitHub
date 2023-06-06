## Initial Solution for Danilo's project
library(tidyverse)
# Load Dataset
library(readxl)
PG_BD_INVITACIONES_SM05_20_2021 <- read_excel("Projects/danilopenagos/PG_BD_INVITACIONES_SM05-20-2021.xlsx")
View(PG_BD_INVITACIONES_SM05_20_2021)

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
