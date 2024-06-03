library(tidyverse)
library(readr)

path<- #put here your current path
setwd(path)

#This function reads a subset of the dataset with just the relevant columns
df <- read_tsv("en.openfoodfacts.org.products.csv.gz",
               col_select = c("product_name", "countries_en", "nutriscore_grade",
                              "ecoscore_grade", "pnns_groups_1","pnns_groups_2"))

#now we filter for just the products sold in Germany
dat<- df%>%
  filter(countries_en == "germany"|countries_en == "Germany")

# save the dataset to make it more easily accessible
write.csv(dat, "data_openfood.csv")
