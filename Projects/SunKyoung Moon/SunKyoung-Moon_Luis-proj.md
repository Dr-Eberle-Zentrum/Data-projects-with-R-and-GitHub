library(ggplot2) library(dplyr) library(tidyr)

\#Loading Data url &lt;-
“<https://raw.githubusercontent.com/Dr-Eberle-Zentrum/Data-projects-with-R-and-GitHub/refs/heads/main/Projects/SunKyoung%20Moon/kaggle_dataset.csv>”

data &lt;- read.csv(url) head(data)

# Convert app usage time from minutes/day to hours/day

data &lt;- data %&gt;% mutate(AppUsageHours = `App.Usage.Time..min.day.`
/ 60)

# Compute median app usage time and sum users for each device model

device\_summary &lt;- data %&gt;% group\_by(`Device.Model`, Gender)
%&gt;% summarize( MedianAppUsage = median(AppUsageHours, na.rm = TRUE),
UserCount = n() ) %&gt;% ungroup()

# Summarize age groups for scatter plot

data &lt;- data %&gt;% mutate(AgeGroup = case\_when( Age &gt;= 20 & Age
&lt;= 29 ~ “20-29”, Age &gt;= 30 & Age &lt;= 39 ~ “30-39”, Age &gt;= 40
& Age &lt;= 49 ~ “40-49”, Age &gt;= 50 & Age &lt;= 59 ~ “50-59”, TRUE ~
“Others” ))

\#Visualization part! ggplot(data, aes(x = Device.Model, y =
AppUsageHours, fill = Gender)) + geom\_violin(alpha = 0.7, scale =
“width”) + geom\_point(aes(color = AgeGroup), position =
position\_jitter(width = 0.2, height = 0), alpha = 0.5) +
scale\_fill\_manual(values = c(“Male” = “blue”, “Female” = “red”)) +
scale\_color\_manual(values = c( “20-29” = “gray”, “30-39” = “green”,
“40-49” = “pink”, “50-59” = “purple” )) + labs( title = “Mobile Device
Usage for Different Models”, subtitle = “Median app usage time
differentiated by gender and age groups”, x = “Device Model”, y =
“Median App Usage Time (hours/day)”, fill = “Gender”, color = “Age
Group” ) + theme\_minimal()

device\_user\_counts &lt;- data %&gt;% group\_by(Device.Model) %&gt;%
summarize(UserCount = n())

ggplot(device\_user\_counts, aes(x = Device.Model, y = UserCount)) +
geom\_col(fill = “lightblue”) + geom\_text(aes(label = UserCount), vjust
= -0.5) + labs( title = “User Count per Device Model”, x = “Device
Model”, y = “User Count” ) + theme\_minimal()
