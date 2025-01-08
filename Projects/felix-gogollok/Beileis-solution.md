# Load necessary libraries

library(tidyverse) library(fmsb)

# Load data from the GitHub CSV link

url &lt;-
“<https://raw.githubusercontent.com/Dr-Eberle-Zentrum/Data-projects-with-R-and-GitHub/main/Projects/felix-gogollok/whisky-statistics/Whisky.csv>”
whisky\_data &lt;- read.csv(url, sep = “;”, stringsAsFactors = FALSE)

# Clean column names (remove extra dots)

colnames(whisky\_data) &lt;- gsub(“\\+”, ““, colnames(whisky\_data)) \#
Remove redundant dots

# Filter whiskies with a score greater than 80

high\_rated\_whiskies &lt;- whisky\_data %&gt;% filter(Punkte &gt; 80)

# Count whiskies with high ratings (grouped by distillery and region)

region\_counts &lt;- high\_rated\_whiskies %&gt;% group\_by(Region,
Destillerie) %&gt;% summarise(Count = n()) %&gt;% spread(key =
Destillerie, value = Count, fill = 0)

# Calculate median scores for each region

median\_data &lt;- high\_rated\_whiskies %&gt;% group\_by(Region) %&gt;%
summarise(Median\_Score = median(Punkte))

# Add the median scores as a row

median\_row &lt;- median\_data %&gt;% spread(key = Region, value =
Median\_Score) %&gt;% mutate(Distillery = “Median”)

# Combine data

region\_distillery\_count &lt;- region\_counts %&gt;% ungroup() %&gt;%
select(-Region) %&gt;% bind\_rows(median\_row)

# Replace NAs with 0 for numeric columns

region\_distillery\_count &lt;- region\_distillery\_count %&gt;%
mutate(across(where(is.numeric), ~replace\_na(., 0)))

# Add max and min rows for spider chart normalization

max\_row &lt;- sapply(region\_distillery\_count\[-1\], max, na.rm =
TRUE) \# Exclude character column min\_row &lt;- rep(0,
ncol(region\_distillery\_count) - 1) region\_distillery\_count &lt;-
rbind(max\_row, min\_row, region\_distillery\_count)

# Convert to numeric (exclude character column)

radar\_data &lt;- region\_distillery\_count %&gt;% select(-Distillery)
%&gt;% \# Exclude character column mutate(across(everything(),
as.numeric)) \# Ensure numeric columns

# Generate the spider chart

colors &lt;- rainbow(nrow(radar\_data) - 2) colors\[length(colors)\]
&lt;- “red” \# Median line in red

par(mar = c(0, 0, 2, 0)) \# Set chart margins radarchart( radar\_data,
axistype = 1, pcol = colors, pfcol = adjustcolor(colors, alpha.f = 0.5),
plwd = 2, cglcol = “grey”, cglty = 1, axislabcol = “black”, caxislabels
= seq(0, max(radar\_data, na.rm = TRUE), length.out = 5), vlcex = 0.8 )

# Add title and legend

title(“The Quality of Scotch Whiskies by Region and the Median Quality
of Each Region”, cex.main = 1.2) legend(“topright”, legend =
colnames(radar\_data), col = colors, lty = 1, cex = 0.8)
