####################################################################
#' Let's practice our ggplot plotting skills. To this end, we use the
#' "ToothGrowth" data set directly available within R (check help).
#' We want to plot for the different dose levels (X) the respective
#' tooth length. The dose levels should be represented as follows:
#' - 0.5 = non-filled circle in a dark green
#' - 1 = orange filled triangles
#' - 2 = filled circles in a light bluedos
#' Use jittering to avoid overlapping of data points.
#' We don't want to have any background decorations etc. and useful
#' labels for axes and legend.
#' Ensure there is only ONE legend (showing both color and shape).
####################################################################

library(tidyverse)

?ToothGrowth

view(ToothGrowth)

mutate(dose = as.factor(dose)) |>
ggplot(data = ToothGrowth, aes(x = factor(dose), y = len, color = factor(dose), shape = factor(dose)) +
 geom_jitter(width = 0.1, height = 0, size = 3) +
 scale_colour_manual(values = c("darkgreen", "orange", "lightblue") +
 scale_shape_manual(values = ) +
 theme_classic()
 
 
 theme(
    panel.background = element_blank(),        
    axis.line = element_line(color = "black")  
  ) +
 
Sunkyoung Moon (Sunny) an Alle (30. Okt. 2024, 13:17)
# Create the plot : with the factor type

ggplot(ToothGrowth, aes(x = factor(dose), y = len)) +
  geom_jitter(aes(color = factor(dose), shape = factor(dose)), 
              width = 0.2, height = 0,
              size = 3) +
  scale_shape_manual(values = c(16, 17, 16)) +  
  scale_color_manual(values = c("darkgreen", "orange", "lightblue")) +
  labs(x = "Dose Level", y = "Tooth Length", 
       color = "Dose", shape = "Dose", title = "factor type") + 
  theme_minimal() + 
  theme(legend.position = "right")
 
Jungi Hong an Alle (30. Okt. 2024, 13:18)
theme_minimal() +
  theme(panel.grid = element_blank(),                   
        legend.position = "right")