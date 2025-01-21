# Load required libraries

library(tidyverse) library(fmsb)

# Load and clean the whisky data

whisky\_data &lt;-
read.csv2(“Projects/felix-gogollok/whisky-statistics/Whisky.csv”, sep =
“;”, stringsAsFactors = FALSE) %&gt;% rename\_with(~ gsub(“\\+$”, ““,
.), everything()) %&gt;% \# Remove trailing dots from column names
filter(!is.na(Region) & Region !=”“) \# Remove rows with NA or empty
Region

# Convert ‘Punkte’ to numeric

whisky\_data*P**u**n**k**t**e* &lt; −*a**s*.*n**u**m**e**r**i**c*(*w**h**i**s**k**y*<sub>*d*</sub>*a**t**a*Punkte)

# Calculate the fraction of whiskies rated 80 or higher by region

region\_fractions &lt;- whisky\_data %&gt;% mutate(High\_Rating = Punkte
&gt; 80) %&gt;% \# Add flag for high ratings group\_by(Region) %&gt;%
summarise(Fraction = mean(High\_Rating, na.rm = TRUE), .groups = “drop”)
\# Calculate fraction per region

# Prepare data for the spider web chart

max\_fraction &lt;- 1 \# Maximum value for normalization min\_fraction
&lt;- 0 \# Minimum value for normalization

# Transform data for radarchart

chart\_data &lt;- region\_fractions %&gt;% pivot\_wider(names\_from =
Region, values\_from = Fraction)

# Add Max and Min rows as a dataframe

chart\_data &lt;- rbind( Max = rep(max\_fraction, ncol(chart\_data)),
Min = rep(min\_fraction, ncol(chart\_data)), chart\_data ) %&gt;%
as.data.frame() \# Convert to data.frame

# Generate the spider web chart

par(mar = c(0, 0, 2, 0)) \# Set margins radarchart( chart\_data,
axistype = 1, \# Set axis type pcol = “black”, \# Line color pfcol =
adjustcolor(“blue”, alpha.f = 0.5), \# Transparent fill color plwd = 2,
\# Line width cglcol = “blue”, \# Grid line color cglty = 1, \# Grid
line type (solid) cglwd = 0.8, \# Grid line width axislabcol = “blue”,
\# Axis label color caxislabels = seq(0, 1, 0.25), \# Axis labels vlcex
= 1.0 \# Vertex label size )

# Add a title

title(“Fraction of Whiskies Rated 80 or Higher per Region”, cex.main =
1.5)
