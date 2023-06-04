library(tidyverse)
#food0 <- read_delim('Food_data_0.txt')
#food1 <- read_delim('Food_data_1.txt')
#food2 <- read_delim('Food_data_2.txt')
#food3 <- read_delim('Food_data_3.txt')
#food4 <- read_delim('Food_data_4.txt')


#directory_path <- "C:/Users/Pleasant Pillai/Desktop/Advanced-data-processing-with-R/Projects/DanielaKemp"
#filename <- "Food_data_0.txt"
#file_path <- file.path(directory_path, filename)

#product_data <- read.table(file_path, header=TRUE, sep="\t")

# Create a subset data frame excluding products from Nestle and containing palm oil
#excluded_companies <- c("Nestle")
#excluded_ingredients <- c("palm oil")
#subset_data <- subset(product_data, !(Company %in% excluded_companies) & !(Ingredient %in% excluded_ingredients))

library(tidyr)
library(dplyr)
library(ggplot2)

# Set the directory path
setwd("C:/Users/Pleasant Pillai/Desktop/R Programming/R2/Advanced-data-processing-with-R/Projects/DanielaKemp")

# Read the data file
data <- readLines("Food_data_0.txt")

# Modify the data to exclude products from a specific company and containing a specific ingredient
data <- grep("^(?!Nestle)", data, perl = TRUE, value = TRUE)
data <- grep("^(?!.*Palm Oil)", data, perl = TRUE, value = TRUE)

# Print the modified data
#cat(data, sep = "\n")

#tidy_data <- data %>%
#     gather(column_name, column_value)
   
#print out each unique column
#unique_cols <- unique(tidy_data$column_name)
#for (col in unique_cols) {
#     print(paste(col, ": ", paste(tidy_data$column_value[tidy_data$column_name == col], collapse = ", ")))
#  }

df <- data.frame(data)

# Use tidyr to split the data frame into columns
df <- tidyr::separate(df, col = data, into = paste0("col", 1:max(str_count(df$data, "\t"))), sep = "\t")

# Use dplyr to print each unique column and its contents
#dplyr::glimpse(df)

#write.table(df, "output.txt")

nutri_freq <- as.data.frame(table(df$nutriscore_score))
ggplot(nutri_freq, aes(x = nutriscore_score, y = Freq)) + 
  geom_col(fill = "blue", alpha = 0.7) + 
  ggtitle("Nutriscore Frequency Plot") + 
  xlab("Nutriscore") + 
  ylab("Frequency")


# library(tidyr)
# library(dplyr)
# 
# setwd("C:/Users/Pleasant Pillai/Desktop/Advanced-data-processing-with-R/Projects/DanielaKemp")
# 
# # read in the .txt file
# data <- read.table("Food_data_0.txt", header = TRUE, sep = "\t")
# 
# # tidy up the data using tidyr
# tidy_data <- data %>%
#   gather(column_name, column_value)
# 
# # print out each unique column
# unique_cols <- unique(tidy_data$column_name)
# for (col in unique_cols) {
#   print(paste(col, ": ", paste(tidy_data$column_value[tidy_data$column_name == col], collapse = ", ")))
# }
