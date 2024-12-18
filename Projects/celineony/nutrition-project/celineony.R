
# clean environemnt 
rm(list = ls())
cat("\014")

# packages
library(tidyverse)
#install.packages("openxlsx")
library(openxlsx)




# read data 
data <- read.xlsx("https://naehrwertdaten.ch/wp-content/uploads/2023/08/Swiss_food_composition_database.xlsx",
                  startRow = 3,
                  colNames = T)


# task 
# extract and process some nutrient data from a provided table
# Based on some predefined foods that were hypothetically consumed this project aims to answer
# i)  to which extent ones energy demand is saturated
#   -> pie plot 
# ii) how much each macronutrient (i.e., carbs, lipids, proteins) contributes to ones daily energy uptake
#   -> pie plot 
# iii) to which extent ones mineral (i.e., Calcium, Phosphorus, Sodium) and vitamin (i.e., B1, B2, B6) demand is saturated
#  -> histogram


# Calculate total uptake (in mg or g) of macronutrients, minerals & vitamins by approx. amount of all foods consumed
# + compute daily energy demand (of fictive person) and the relative contribution of each macronutrient
# + sum mineral and vitamine uptake 


# create subset of relevant columns
dat <- data %>%
  select("ID","Name", "Category",
         "Calcium.(Ca).(mg)", "Phosphorus.(P).(mg)", "Sodium.(Na).(mg)",
         "Vitamin.B1.(thiamine).(mg)","Vitamin.B2.(riboflavin).(mg)","Vitamin.B6.(pyridoxine).(mg)",
         "Carbohydrates,.available.(g)","Protein.(g)","Fat,.total.(g)" )

# filter food for diet plans
dat <- dat[grep("Apple|Bread|Chicken|Broccoli|Oil|Almond|Yogurt|Rice|Banana|Salmon|Sunflower Oil|spinach|Walnut|Soya drink", 
                dat$Name, ignore.case = T),]

dat[grep("Apple|Bread|Chicken|Broccoli|Oil|Almond|Yogurt|Rice|Banana|Salmon|Sunflower Oil|spinach|Walnut|Soya drink", 
         dat$Name, ignore.case = TRUE), "Name"]

# View(dat[grep("Apple|Bread|Chicken|Broccoli|Oil|Almond|Yogurt|Rice|Banana|Salmon|spinach|Sunflower Oil|Walnut|Soya drink", 
#               dat$Name, ignore.case = T),])

# dim(dat[grep("Apple|Bread|Chicken|Broccoli|Oil|Almond|Yogurt|Rice|Banana|Salmon|spinach|Sunflower Oil|Walnut|Soya drink", 
#             dat$Name, ignore.case = T),])


# Diet plans 

energy_density <- c(Carbs = 17, Lipids = 37, Proteins = 17)

# Day 1:
# -Wholegrain Bread: 100g
#     - "Wholewheat bread" in data 
# # -Apple: 150g
#     - "Apple, fresh"
# # -Chicken Breast, cooked: 120g
# # -Broccoli, steamed: 100g
# # -Olive Oil: 10g
# # -Almonds: 30g
#       - "Almond"    
# # -Low-fat Yogurt: 150g
#     - "Yogurt, low fat" 

### df for day 1
d1 <- dat[c(1, 10, 38, 47, 84, 175, 187 ), ]
# almond, apple, broccoli, chicken, olive oil, bread, yogurt 

# Day 2:
#   -Rice, cooked: 150g
#     - "Rice parboiled, cooked in salted water (uniodised)"   
# -Banana: 120g
# -Salmon, smoked: 150g
# -Spinach, steamed: 100g
# -Sunflower Oil: 10g
# -Walnuts: 20g
# -Soy Milk: 200ml

### df for day 2
d2 <- dat[c(17, 104, 122, 151, 157, 159, 168),]
# banana, rice, salmon, soya drink, spinach, sunflower oil, walnut

# prepare df 
summary(d1)
str(d1)
summary(d2)
str(d2)

# function to convert data type 
convert_numeric <- function(df, col_to_convert) {
  
  # col to numeric 
  convert <- function(col) {
    # convert to character first in case of factors being converted into numeric
    return(as.numeric(as.character(col)))
  }
  
  df[col_to_convert] = lapply(df[col_to_convert], convert)
  return(df)
}

data.frame(Index = seq_along(d1), Name = names(d1))
data.frame(Index = seq_along(d2), Name = names(d2))

d1 <- convert_numeric(d1, 4:12)
d2 <- convert_numeric(d2, 4:12)

# daily average of person x
## BMR (Basal Metabolic Rate) = 4.2 kj * body weight * hours a day
## DEM (Daily Energy Demand) = BMR * PAL
personX <- data.frame(
  body_weight = 70,
  PAL = 1.65,
  BMR = (4.2 * 70 * 24)
)
personX$DEM <- (personX$BMR * personX$PAL)

d1 <- d1 %>% 
  mutate(
    BMR = personX$BMR,
    DEM = personX$DEM,
    energy_carbs = d1$`Carbohydrates,.available.(g)` * energy_density["Carbs"],
    energy_proteins = `Protein.(g)` * energy_density["Proteins"],
    energy_lipids = `Fat,.total.(g)` * energy_density["Lipids"],
    total_energy = energy_carbs + energy_proteins + energy_lipids,
    percent_carbs = (energy_carbs / total_energy) * 100,
    percent_proteins = (energy_proteins / total_energy) * 100,
    percent_lipids = (energy_lipids / total_energy) * 100,
    recommended_carbs_percent = 55,
    recommended_proteins_percent = 15,
    recommended_lipids_percent  = 30,
    
  )

d2 <- d2 %>% 
  mutate(
    BMR = personX$BMR,
    DEM = personX$DEM,
    energy_carbs = d1$`Carbohydrates,.available.(g)` * energy_density["Carbs"],
    energy_proteins = `Protein.(g)` * energy_density["Proteins"],
    energy_lipids = `Fat,.total.(g)` * energy_density["Lipids"],
    total_energy = energy_carbs + energy_proteins + energy_lipids,
    percent_carbs = (energy_carbs / total_energy) * 100,
    percent_proteins = (energy_proteins / total_energy) * 100,
    percent_lipids = (energy_lipids / total_energy) * 100,
    recommended_carbs_percent = 55,
    recommended_proteins_percent = 15,
    recommended_lipids_percent  = 30,
    
  )

# Visualization 

## pie chart day 1

ggplot(d1 %>%
         # compute energ
         summarise(
           energy_carbs = sum(energy_carbs),
           energy_proteins = sum(energy_proteins),
           energy_lipids = sum(energy_lipids),
           total_energy = sum(total_energy)
           
         ) %>%
         
         mutate(
           percent_carbs = (energy_carbs / total_energy) * 100,
           percent_proteins = (energy_proteins / total_energy) * 100,
           percent_lipids = (energy_lipids / total_energy) * 100
           
         ) %>%
         # reshape into long format for plotting
         pivot_longer(cols = starts_with("percent"),
                      names_to = "Nutrient",
                      values_to = "Actual_Percentage") %>%
         
         mutate(
           Nutrient = recode(Nutrient, 
                             "percent_carbs" = "Carbohydrates",
                             "percent_proteins" = "Proteins",
                             "percent_lipids" = "Lipids"),
           Recommended_Percentage = case_when(
             Nutrient == "Carbohydrates" ~ 55,
             Nutrient == "Proteins" ~ 15,
             Nutrient == "Lipids" ~ 30)
           
         ) %>%
         
         pivot_longer(cols = c(Actual_Percentage, Recommended_Percentage),
                      names_to = "Type",
                      values_to = "Percentage"),
        aes(x = " ", y = Percentage, fill = Nutrient)) +
  geom_bar(stat = "identity", position = "stack", width = 1) +
  coord_polar(theta = "y") +
  facet_wrap(~Type, labeller = as_labeller(c(
    "Actual_Percentage" = "Actual",
    "Recommended_Percentage" = "Recommended"
  ))) +
  
  theme_bw() +
  labs(title = "Macronutrient Contributions: Actual vs Recommended") +
  theme(legend.position = "bottom") +
  scale_fill_manual(values = c("Carbohydrates" = "#A2CD5A", "Lipids" = "#EEAD0E", "Proteins" = "#79CDCD")) +
  geom_text(aes(label = paste0(round(Percentage, 1), "%")), 
            position = position_stack(vjust = 0.5))
         
 
  
## pie chart day 2
ggplot(d2 %>%
         # compute energ
         summarise(
           energy_carbs = sum(energy_carbs),
           energy_proteins = sum(energy_proteins),
           energy_lipids = sum(energy_lipids),
           total_energy = sum(total_energy)
           
         ) %>%
         
         mutate(
           percent_carbs = (energy_carbs / total_energy) * 100,
           percent_proteins = (energy_proteins / total_energy) * 100,
           percent_lipids = (energy_lipids / total_energy) * 100
           
         ) %>%
         # reshape into long format for plotting
         pivot_longer(cols = starts_with("percent"),
                      names_to = "Nutrient",
                      values_to = "Actual_Percentage") %>%
         
         mutate(
           Nutrient = recode(Nutrient, 
                             "percent_carbs" = "Carbohydrates",
                             "percent_proteins" = "Proteins",
                             "percent_lipids" = "Lipids"),
           Recommended_Percentage = case_when(
             Nutrient == "Carbohydrates" ~ 55,
             Nutrient == "Proteins" ~ 15,
             Nutrient == "Lipids" ~ 30)
           
         ) %>%
         
         pivot_longer(cols = c(Actual_Percentage, Recommended_Percentage),
                      names_to = "Type",
                      values_to = "Percentage"),
       aes(x = " ", y = Percentage, fill = Nutrient)) +
  geom_bar(stat = "identity", position = "stack", width = 1) +
  coord_polar(theta = "y") +
  facet_wrap(~Type, labeller = as_labeller(c(
    "Actual_Percentage" = "Actual",
    "Recommended_Percentage" = "Recommended"
  ))) +
  
  theme_bw() +
  labs(title = "Macronutrient Contributions: Actual vs Recommended") +
  theme(legend.position = "bottom") +
  scale_fill_manual(values = c("Carbohydrates" = "#A2CD5A", "Lipids" = "#EEAD0E", "Proteins" = "#79CDCD")) +
  geom_text(aes(label = paste0(round(Percentage, 1), "%")), 
            position = position_stack(vjust = 0.5))
  


