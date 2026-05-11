library(tidyverse)
library(dplyr)

set

Martins_Project <- "C:/Lehre/Data-projects-with-R-and-GitHub/Projects/martin-raden/PV"

view(Martins_Project)

zip_data <- list.files(Martins_Project, pattern = "zip", full.names = TRUE)

Voltaik_Data <- lapply(zip_data, function(zip_data) {
  read.csv(unz(x
              , "voltaik_data.csv"))
})

view(zip_data) # No data available

# no Data there. 

#####################
#try another way:
# read the csv files

view(zip_1)

zip_datei_1 <- read.csv(unz("C:/Lehre/Data-projects-with-R-and-GitHub/Projects/martin-raden/PV/2024-12-31_2025-01-31_127120425.zip")
# (zip_datei_1 not really a zip datei) 
zip_datei_2 <- read.csv(unz("https://github.com/Dr-Eberle-Zentrum/Data-projects-with-R-and-GitHub/blob/main/Projects/martin-raden/PV/2025-01-28_2025-02-28_127120425.zip")                    
zip_datei_3 <- read.csv(unz("https://github.com/Dr-Eberle-Zentrum/Data-projects-with-R-and-GitHub/blob/main/Projects/martin-raden/PV/2025-03-03_2025-03-31_127120425.zip")
zip_datei_4 <- read.csv(unz("https://github.com/Dr-Eberle-Zentrum/Data-projects-with-R-and-GitHub/blob/main/Projects/martin-raden/PV/2025-03-30_2025-04-30_127120425.zip")
zip_datei_5 <- read.csv(unz("https://github.com/Dr-Eberle-Zentrum/Data-projects-with-R-and-GitHub/blob/main/Projects/martin-raden/PV/2025-05-01_2025-05-31_127120425.zip")                 
zip_datei_6 <- read.csv(unz("https://github.com/Dr-Eberle-Zentrum/Data-projects-with-R-and-GitHub/blob/main/Projects/martin-raden/PV/2025-05-01_2025-05-31_127120425.zip")                       
zip_datei_7 <- read.csv(unz("https://github.com/Dr-Eberle-Zentrum/Data-projects-with-R-and-GitHub/blob/main/Projects/martin-raden/PV/2025-05-30_2025-06-30_127120425.zip")    
zip_datei_8 <- read_csv(unz("https://github.com/Dr-Eberle-Zentrum/Data-projects-with-R-and-GitHub/blob/main/Projects/martin-raden/PV/2025-07-01_2025-07-31_127120425.zip")    
zip_datei_9 <- read.csv(unz("https://github.com/Dr-Eberle-Zentrum/Data-projects-with-R-and-GitHub/blob/main/Projects/martin-raden/PV/2025-07-31_2025-08-31_127120425.zip")
                        
view(zip_datei_2) # not found 
view(zip_datei_3) # not found

##################
# Try another method:
                       

folder_path <- "C:/Lehre/Data-projects-with-R-and-GitHub/Projects/martin-raden/PV"
          zip_files <- list.files(folder_path, pattern = "\\.zip$", full.names = TRUE)    
big_data <- data.frame() # create an empty data frame to store the combined data
                        
for (zip_file in zip_files) {
  # Unzip the file to a temporary directory
  temp_dir <- tempdir()
  unzip(zip_file, exdir = temp_dir)
  
  # Read the CSV file from the temporary directory
  csv_file <- list.files(temp_dir, pattern = "\\.csv$", full.names = TRUE)
  data <- read.csv(csv_file)
  
  # Append the data to the big_data data frame
  big_data <- rbind(big_data, data)
  
  # Clean up the temporary directory
  unlink(temp_dir, recursive = TRUE)
  
  view(big_data)
  
  # make a graph with big data
  
  ggplot(big_data, aes(x = Datum, y = `PV Ertrag [kwh]`)) +
    geom_line() +
    labs(title = "PV Ertrag über die Zeit",
         x = "Datum",
         y = "PV Ertrag [kwh]") +
    theme_minimal()
  
  # No graph is shown. Maybe because of the date format?
   colnames(big_data) = c("Datum", "PV Ertrag [kwh]", "Netzeinspeisung [kwh]", "Netzbezug [kwh]", "Speicherladung [kwh]", "Einspeisevergütung [€]", "Stromkosten [€]")
  
   big_data <- big_data %>% 
     group_by(Datum) %>%
     arrange(`PV Ertrag [kwh]`) %>%
     slice(1) %>%
     arrange(Datum) %>%
     mutate("Eigenverbrauch [kwh]" = `PV Ertrag [kwh]` - `Netzeinspeisung [kwh]` - `Speicherladung [kwh]`,
            "Gesamtverbrauch [kwh]" = `Eigenverbrauch [kwh]` + `Netzbezug [kwh]`,
            "Eigenverbrauchsanteil [%]" = `Eigenverbrauch [kwh]` / `Gesamtverbrauch [kwh]` * 100) %>%
     mutate("Monat" = Datum)
   
   # SEEMS TO WORK!
   
   table <- big_data %>% 
     group_by(Monat) %>%
     summarise(`Einspeisevergütung [€]` = sum(`Einspeisevergütung [€]`),
               `Stromkosten [€]` = sum(`Stromkosten [€]`))

  table[8:11] <- round(table[8:11], 2)
  table$Monat <- as.numeric(table$Monat)
  table$Monat <- factor(table$Monat,
                        levels = 1:12,
                        labels = c("Januar",
                                   "Februar", 
                                   "März",
                                   "April",
                                   "Mai",
                                   "Juni", 
                                   "Juli",
                                   "August",
                                   "September",
                                   "Oktober",
                                   "November", 
                                   "Dezember"))
  
  table$`Stromkosten [€]` <- table$`Stromkosten [€]` * -1
  table_long <- table %>% 
    pivot_longer(cols = c(`Einspeisevergütung [€]`, `Stromkosten [€]`), names_to = "Kategorie", values_to = "Betrag")
  
  
  table_line <- table_long
  
  library(ggplot2)
  library(ggplot2)
  
  ggplot(table_line, aes(x = Monat, y = Betrag, group = Kategorie, color = Kategorie)) +
    geom_line() +
    geom_point() +
    labs(title = "Einspeisevergütung und Stromkosten pro Monat",
         x = "Monat",
         y = "Betrag") +
    scale_color_manual(values = c("Einspeisevergütung [€]" = "blue", "Stromkosten [€]" = "red")) +
    theme_minimal(
  
      # Nothing is shown, nice. but maybe because of the date format?
      
      #change data format into something R can understand
      
      big_data$Monat <- as.numeric(big_data$Monat)
      
      # now create a graph
      ggplot(big_data, aes(x = Monat, y = `PV Ertrag [kwh]`)) +
        geom_line() +
        labs(title = "PV Ertrag über die Zeit",
             x = "Monat",
             y = "PV Ertrag [kwh]") +
        theme_minimal()
      
      # problem with geomline. PV Ertrag not found. 
      
view(big_data) # Oh, there is "no data available". 

# I give up. I have no idea how to read the data in. Tried different methods. 
# Didn`t work. Maybe I unzip wrong? I don`t know.
      
  





  #################################
  #################################
  
# Just some random code
  
 # do a pipe
Voltaik_Data %>% 
  spec()

Voltaik_Data$`PV Ertrag [kwh]` <-
  Voltaik_Data$`PV Ertrag [kwh]` %>% 
  str_remove_all(";") %>%
  str_replace(",", ".") 

# check if the conversion to numeric works

Voltaik_Data$`PV Ertrag [kwh]` <- as.numeric(Voltaik_Data$`PV Ertrag [kwh]`) 

Voltaik_Data %>% 
  mutate(`PV Ertrag [kwh]`= `PV Ertrag[kwh] %>% 
           str_remove(";") %>%
           str_replace(",", ".") %>%
           as.numeric())

# remove all years < 2025

filter(str_detect(Datum, "25$") %>% 
  view()

Voltaik_Data$Datum <- Voltaik_Data$Datum %>% 
  as.Date(format = "%d.%m.%Y")

