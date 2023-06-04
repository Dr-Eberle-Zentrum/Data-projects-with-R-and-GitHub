library(tidyverse)
library(ggplot2)

# Set the directory path
setwd("C:/Users/Pleasant Pillai/Desktop/R Programming/R2/Advanced-data-processing-with-R/Projects/DanielaKemp")

# Initialize an empty list to store nutriscore values
nutriscore_values <- list()

# Iterate over each file
for (i in 0:4) {
  # Read the text file
  data <- readLines(paste0("Food_data_", i, ".txt"))
  
  # Loop through each line in the text file
  for (line in data) {
    # Split the line into key-value pairs
    pair <- strsplit(line, ":")[[1]]
    
    # Check if the line contains "nutriscore" and a numeric value
    if (grepl("nutriscore", pair[1]) && is.numeric(pair[2])) {
      # Extract the nutriscore value
      nutriscore <- as.numeric(pair[2])
      
      # Check if the value is within the desired range and exclude Nestle products and products with palm oil
      if (nutriscore >= -15 && nutriscore <= 40 && !grepl("Nestle", line) && !grepl("palm oil", line)) {
        # Add the value to the list
        nutriscore_values <- c(nutriscore_values, nutriscore)
      }
    }
  }
}

# Check if there are valid nutriscore values
if (length(nutriscore_values) > 0) {
  # Calculate the frequencies of nutriscore values
  freq_table <- table(nutriscore_values)
  
  # Plot Nutriscore vs. Frequency
  plot(names(freq_table), freq_table, type = "bar", xlab = "Nutriscore", ylab = "Frequency", main = "Nutriscore vs. Frequency (Excluding Nestle and Palm Oil)")
} else {
  # Display a message if no valid nutriscore values were found
  cat("No valid nutriscore values found after applying the filtering conditions.")
}