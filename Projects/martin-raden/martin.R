
library(tidyverse)

# load data
data <-
  read_csv("https://ourworldindata.org/uploads/2022/09/Mammal-comeback-in-Europe-data-OWID-download.csv") |>
  # reduce column names to first single word
  rename_with(~str_extract(., "^\\w+")) |>
  # clean up
  mutate(
    Average = str_sub(Average, 1,-2) %>% as.integer(),
    Min = 1,
    yIdx = rank(Average),
    # set order of names based on Average values for later plotting
    Common = factor(Common) %>% fct_reorder(Average),
    Range = str_c(Start," to ", End)
    ) %>%
  arrange(yIdx)

# load bear image from local file
# library(png)
# img_bear <- readPNG("icons8-bear-67.png", native=TRUE) # https://icons8.de/icons/set/bear

# lib to load bear image from web
# https://stackoverflow.com/questions/17918330/how-to-directly-read-an-image-file-from-a-url-address-in-r
library(magick)
# lib to embedd image in plot
library(patchwork)

data %>%
  ggplot(aes(x=Min, y= Common, yend= Common)) +
  theme_minimal()+
  # disable horizontal grid lines
  theme(panel.grid.major.y = element_blank(),
        panel.grid.minor.y = element_blank()) +
  geom_segment(aes(xend = 0.93*Average),
               col="gray",
               arrow = arrow(ends = "last", length = unit(5,"pt"), type = "closed"),
               arrow.fill = "gray") +
  geom_point(col="ivory4") +
  geom_point(aes(x=Average), col="lightskyblue4") +
  scale_x_log10(breaks = 10^(0:4),
                # use a scales-function to generate a function for label generation
                labels = scales::percent_format(scale = 1, big.mark=",")(10^(0:4)),
                limits=c(1,10^5)) +
  labs(
    x = "Average relative change in size of population (logarithmic scale)",
    y = NULL
  ) +
  # disable clipping to allow for annotations outside of plot area
  coord_cartesian(clip = "off")+
  # year range annotations
  geom_label(aes(label = Range, x=Min+0.1), hjust=0, size=3, fill="white", label.size=0, col="darkgray" ) +
  # average change annotations after end points
  geom_text(aes(label= scales::percent_format(scale = 1, big.mark=",")(Average), x=Average*1.1), hjust=0, size=3)+
  # curved annotation line for bear population
  annotate(
    geom = "curve", x = 150, xend=85, y = 4, yend = 4, col = "darkgray",
    curvature = .2, arrow = arrow(length = unit(1, "mm"), type = "closed")
  ) +
  # text annotation for bear population
  annotate(geom = "text", x = 180, y = 4,
           label = "Between 1960 and 2016, populations\nof brown bears increased by and average of 44%",
           hjust = "left", vjust=1, size=2.5, col="darkgrey") +
  # text annotations in header
  annotate(geom = "text", x = 1, y = 26,
           label = "Start and end year",
           hjust=0, size=2.5) +
  annotate(geom = "text", x = 17000, y = 26,
           label = "Average maximal change\nin animal populations",
           hjust=0, size=3) +
  # bear image
  inset_element(p= # read bear image from URL
                  magick::image_read("https://github.com/Dr-Eberle-Zentrum/Data-projects-with-R-and-GitHub/raw/main/Projects/martin-raden/icons8-bear-67.png") |>
                  # convert to raster image for embedding in ggplot
                  as.raster(),
                left=-0.005, right=0.035, bottom=0.12, top=0.2)





