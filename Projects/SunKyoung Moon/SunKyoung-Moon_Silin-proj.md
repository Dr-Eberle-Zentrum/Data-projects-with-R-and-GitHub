library(ggplot2) library(dplyr) library(tidyr) library(readr)
library(scales)

# Load the data

data &lt;- read\_csv(“C:/R2\_data/lang\_known.csv.gz”)

## Inspect the data structure

head(data)

## Checking Unique data of each cols.

unique(data*a**g**e*)*u**n**i**q**u**e*(*d**a**t**a*geo)  
unique(data*T**I**M**E*<sub>*P*</sub>*E**R**I**O**D*)*u**n**i**q**u**e*(*d**a**t**a*n\_lang)

# Data Manipulation

filtered\_data &lt;- data %&gt;% filter( TIME\_PERIOD == 2022, \# year
filtering age == “From 18 to 69 years”, \# age filtering geo %in%
c(“Germany”, “France”, “Sweden”, “Austria”, “European Union - 27
countries (from 2020)”), \# country filtering !is.na(OBS\_VALUE) \#
remove NA ) %&gt;% rename( Country = geo, \#change column name
Number\_of\_Languages = n\_lang,  
Percentage = OBS\_VALUE  
) %&gt;% mutate( \# organize num. of languages Number\_of\_Languages =
case\_when( Number\_of\_Languages == “No languages” ~ “0”,
Number\_of\_Languages == “1 language” ~ “1”, Number\_of\_Languages == “2
languages” ~ “2”, Number\_of\_Languages == “3 languages or more” ~ “3+”,
TRUE ~ Number\_of\_Languages ) )

# Extract EU average for comparison

eu\_data &lt;- filtered\_data %&gt;% filter(Country == “European Union -
27 countries (from 2020)”) %&gt;% select(Number\_of\_Languages,
Percentage) %&gt;% rename(EU\_Percentage = Percentage)

# Calculate mean difference

country\_data\_summary &lt;- country\_data %&gt;% group\_by(Country,
Number\_of\_Languages) %&gt;% summarize( Difference = mean(Difference,
na.rm = TRUE), .groups = “drop” )

\#checking head(country\_data) summary(country\_data)

\#Visualization part! ggplot(country\_data\_summary, aes(x =
Number\_of\_Languages, y = Difference, fill = Difference &gt; 0)) +
geom\_bar(stat = “identity”, aes(alpha = abs(Difference)), show.legend =
FALSE) + geom\_text(aes(label = round(Difference, 1)), vjust =
ifelse(country\_data\_summary$Difference &gt; 0, -0.5, 1.5), size =
1.5) + scale\_fill\_manual(values = c(“TRUE” = “red”, “FALSE” =
“blue”)) + scale\_alpha(range = c(0.4, 1)) + geom\_hline(yintercept = 0,
linetype = “dashed”) + facet\_wrap(~ Country, ncol = 2, scales =
“free\_y”) + labs( title = “Foreign Language Proficiency by Country:
Comparison with EU Average”, x = “Number of Foreign Languages”, y =
“Difference in Percentage”, caption = “Source:
[Eurostat](https://ec.europa.eu/eurostat/databrowser/view/edat_aes_l23/default/table?lang=en&category=educ.educ_lang.educ_lang_00.edat_aes_l2)”
) + theme\_minimal() + theme( plot.title = element\_text(face = “bold”,
hjust = 0.5), strip.text = element\_text(face = “bold”), plot.caption =
element\_text(hjust = 0, face = “italic”) )
