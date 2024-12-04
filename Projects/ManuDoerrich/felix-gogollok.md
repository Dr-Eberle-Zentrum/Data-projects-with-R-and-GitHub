# My solution for the nutritional data project

## First, I checked the structure of the data to get an overview of the variables and their types. Then, I looked at the first few rows of the data to see the actual values. I also checked the summary statistics of the data to get an overview of the distribution of the variables:

    # Load the data
    nutritional_data <- read.csv("Schweizer_Nahrwertdatenbank.csv")

    # Check the structure of the data
    str(nutritional_data)

    # Check the first few rows of the data
    head(nutritional_data)

    # Check the summary statistics of the data
    summary(nutritional_data)

## Next, I checked for missing values and duplicates in the data. I removed the duplicates and created a subset of the data for fruits and vegetables. I then checked the summary statistics of the subset and created a boxplot of the energy content of fruits and vegetables. Finally, I saved the boxplot as a PNG file:


    # Check for missing values
    colSums(is.na(nutritional_data))

    # Check for duplicates
    duplicated_rows <- nutritional_data[duplicated(nutritional_data), ]

    # Remove duplicates
    nutritional_data <- nutritional_data[!duplicated(nutritional_data), ]

    # Check the unique values of the food group column
    unique(nutritional_data$food_group)

## Now I began to create a pi chart and a histogram side by side under the joint heading “Der Energiegehalt eines typisch russischen Mittagsgerichtes”. The pie chart contains


    # Create a subset of the data for fruits and vegetables
    fruits_vegetables <- nutritional_data[nutritional_data$food_group %in% c("Fruits", "Vegetables"), ]

    # Check the summary statistics of the subset
    summary(fruits_vegetables)

    # Create a boxplot of the energy content of fruits and vegetables
    boxplot(fruits_vegetables$energy_kcal, main = "Energy Content of Fruits and Vegetables", ylab = "Energy (kcal)")

    # Save the boxplot as a PNG file
    png("energy_content_fruits_vegetables.png")
