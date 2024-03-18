# clear workspace
rm(list = ls())

##################################### Importing Packages #####################################

# Check if packages have been installed before; if not, install them
if (!require("tidyverse")) install.packages("tidyverse")
if (!require("gdata")) install.packages("gdata")
if (!require("readxl")) install.packages("readxl")
if (!require("haven")) install.packages("haven")
if (!require("foreign")) install.packages("foreign")
if (!require("data.table")) install.packages("data.table")

# Load packages
library("tidyverse")
library("gdata")
library("readxl")
library("haven")
library("foreign")
library("data.table")
library("data.table") #To read csv with fread

##################################### Setting Working Directory #####################################

# set YOUR working directory here:
setwd("C:/Users/mauri/Desktop/Uni/1_MSc_Data_Science_in_Business_and_Economics/1_Semester_1/DS400_DSPM/6_Exam_Prep/")
# see whether the working directory is now set correctly
getwd()

# Replace 'url_to_csv' with the actual raw URL of the CSV file on GitHub
url_to_csv <- "https://dr-eberle-zentrum.github.io/Data-projects-with-R-and-GitHub/Projects/Deeznis/Housing_prices.csv"

data <- read.csv(url_to_csv, sep =";")

# Now 'data' contains the contents of the CSV file and you can work with it in RStudio.
