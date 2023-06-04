## Initial Solution for Danilo's project

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
typeof(data$Artistas)


#spliting the strings of Artistas and saving as new variable

data$SingleArtist <- strsplit(data$Artistas, split = ", ")

unlist(data$SingleArtist)

#done so far: merging dataset, creating a subset df, splitting the artists

# to do: create a new df with each artist appearing only once --> New Artist Variable