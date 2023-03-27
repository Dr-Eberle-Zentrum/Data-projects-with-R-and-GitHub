
library(tidyverse)

data <- read_csv("https://ourworldindata.org/uploads/2022/09/Mammal-comeback-in-Europe-data-OWID-download.csv")

# store column names and single-word replacements
data_cols <- colnames(data)
names(data_cols) = str_extract(colnames(data),"^\\w+")

# replace column names
colnames(data) <- names(data_cols)

# library(scales) # https://thomasadventure.blog/posts/ggplot2-percentage-scale/
inPercent <- function(n) {
  str_c(n,"%") %>% str_replace("(.)(.{4})$","\\1,\\2") %>% return()
}

library(png)
img_bear <- readPNG("icons8-bear-67.png", native=TRUE) # https://icons8.de/icons/set/bear
library(patchwork)

data %>%
  # clean up
  mutate(
    Average = str_sub(Average, 1,-2) %>% as.integer(),
    Min = 1,
    yIdx = rank(Average),
    Common = factor(Common) %>% fct_reorder(Average),
    Range = str_c(Start," to ", End)
    ) %>%
  arrange(yIdx) ->
  plotData

plotData %>%
  ggplot(aes(x=Min, y=yIdx, yend=yIdx)) +
  theme_minimal()+
  theme(panel.grid.major.y = element_blank(),
        panel.grid.minor.y = element_blank()) +
  coord_cartesian(clip = "off")+
  geom_segment(aes(xend = 0.93*Average),
               col="gray",
               arrow = arrow(ends = "last", length = unit(5,"pt"), type = "closed"),
               arrow.fill = "gray") +
  geom_point(col="ivory4") +
  geom_point(aes(x=Average), col="lightskyblue4") +
  # scale_x_log10(labels = scales::percent_format(scale = 1, big.mark=","), limits=c(1,10^5)) +
  scale_x_log10(breaks = 10^(0:4), labels = inPercent(10^(0:4)), limits=c(1,10^5)) +
  scale_y_continuous(labels=plotData$Common, breaks=plotData$yIdx)+
  labs(
    x = "Average relative change in size of population (logarithmic scale)",
    y = NULL
  ) +
  geom_label(aes(label = Range, x=Min+0.1), hjust=0, size=3, fill="white", label.size=0, col="darkgray" ) +
  geom_text(aes(label= inPercent(Average), x=Average*1.1), hjust=0, size=3)+
  annotate(
    geom = "curve", x = 150, xend=85, y = 4, yend = 4, col = "darkgray",
    curvature = .2, arrow = arrow(length = unit(1, "mm"), type = "closed")
  ) +
  annotate(geom = "text", x = 180, y = 4,
           label = "Between 1960 and 2016, populations\nof brown bears increased by and average of 44%",
           hjust = "left", vjust=1, size=2.5, col="darkgrey") +
  annotate(geom = "text", x = 1, y = 26,
           label = "Start and end year",
           hjust=0, size=2.5) +
  annotate(geom = "text", x = 17000, y = 26,
           label = "Average maximal change\nin animal populations",
           hjust=0, size=3) +
  inset_element(p=img_bear, left=-0.005, right=0.035, bottom=0.12, top=0.2)

