library(tidyr) library(haven) library(dplyr) library(ggplot2)

# Set working directory

setwd(“C:/Users/Admin/Downloads”)

# Load PISA data

load(“data\_PISA.Rdata”)

# Ensure ‘data\_PISA’ is a dataframe

if (!is.data.frame(data)) { data &lt;- as.data.frame(data) }

# Select the relevant columns for parent’s education and expected education qualification

data &lt;- data %&gt;% select(ST005Q01JA, ST007Q01JA, ST327Q01JA,
ST327Q02JA, ST327Q03JA, ST327Q04JA, ST327Q05JA, ST327Q06JA, ST327Q07JA,
ST327Q08JA, CNT, CNTSTUID) %&gt;% drop\_na()

# Double check that NAs are removed

any\_na &lt;- any(is.na(data)) print(any\_na)

# Compute the mean score for the parents’ education levels for each person

data &lt;- data %&gt;% mutate(parents\_education\_mean =
rowMeans(select(data, ST005Q01JA, ST007Q01JA), na.rm = TRUE))

# Define the columns of interest

education\_columns &lt;- c(“ST327Q01JA”, “ST327Q02JA”, “ST327Q03JA”,
“ST327Q04JA”, “ST327Q05JA”, “ST327Q06JA”, “ST327Q07JA”, “ST327Q08JA”)

# Function to find the highest level of education expected to be finished

find\_highest\_education &lt;- function(row) { levels &lt;- which(row
== 1) if(length(levels) == 0) { return(NA) } else { return(max(levels))
} }

# Apply the function to each row of the specified columns and create a new column

data &lt;- data %&gt;% mutate(highest\_expected\_education =
apply(select(., all\_of(education\_columns)), 1,
find\_highest\_education))

# Aggregate the data to count the number of students for each combination of parents\_education\_mean and highest\_expected\_education

aggregated\_data &lt;- data %&gt;% group\_by(CNT,
parents\_education\_mean, highest\_expected\_education) %&gt;%
summarise(count = n()) %&gt;% ungroup()

# Create and display plots for each country

countries &lt;- unique(aggregated\_data$CNT)

for (country in countries) { country\_data &lt;-
filter(aggregated\_data, CNT == country)

plot &lt;- ggplot(country\_data, aes(x = parents\_education\_mean, y =
highest\_expected\_education, size = count)) + geom\_point(alpha =
0.7) + scale\_size\_area(max\_size = 10) + labs(title =
paste(“Country:”, country), x = “Parent’s Highest Level of Education
(Mean)”, y = “Highest Expected Education Level”, size = “Number of
Students”) + theme\_minimal()

print(plot) }

# Create a combined plot with subplots for each country

combined\_plot &lt;- ggplot(aggregated\_data, aes(x =
parents\_education\_mean, y = highest\_expected\_education, size =
count)) + geom\_point(alpha = 0.7) + scale\_size\_area(max\_size = 10) +
labs(title = “Parent’s Education vs. Student’s Expected Education by
Country”, x = “Parent’s Highest Level of Education (Mean)”, y = “Highest
Expected Education Level”, size = “Number of Students”) +
theme\_minimal() + facet\_wrap(~ CNT)

# Display the combined plot

print(combined\_plot)
