# Libraries
library(ggplot2)
library(tidyverse)
library(cowplot)
library(magick)
library(ggtext)

#Set working directory
setwd(dirname(rstudioapi::getSourceEditorContext()$path))

#Read in animal data from CSV
animals <- read_csv("Mammal-comeback-in-Europe-data-OWID.csv", show_col_types = FALSE)

#HTML style caption for use with ggtext
mycaption <-'<p style="color:#7e7e7e;"><strong>*The Loggerhead turtle is a reptile, not a mammal but has been included as an important, well-studied animal in Europe that has made a significant recovery. </strong><br /></p><p style="color:#b7b6b5;"><span style="color:#72706f;"><strong>Source:</strong></span> Sophie Ledger et al. (2022). Wildlife Comeback in Europe: Opportunities and challenges for species recovery.Final report to Rewilding Europe by the Zoological <br />Society of London, BirdLife International and the European Bird Census Council. London, UK: ZSL. <span style="color:#72706f;"><strong>Icons</strong></span> sourced from the Noun Project. <br /><span style="color: #0000ff;">Our WorldinData.org</span> - Research and data to make progress against the world\'s largest problems.</span> <span style = "color:#ffffff;">.............................................</span> Licensed under CC-BY by the author Hannah Ritchie.</p>'

#Annotation strings
otter = "Between 1977 and 2016, populations of
Eurasian otters increased by an average of 294%"
bear = "Between 1960 and 2016, populations of
Brown bears increased by an average of 44%"

#Rename columns for ease of use in ggplot
animals <- rename(animals, avg_change = "Average relative change in abundance")
animals <- rename(animals, names = "Common name of species")

#Convert avg_change from string to numeric
animals$"avg_change" <- as.numeric(sub("%", "", animals$"avg_change"))

#Create new col, char_change, with correctly formatted string version 
#of avg_change. Used for quick labeling in ggplot
animals <- animals %>% add_column(char_change = paste0(format(
  animals$avg_change, big.mark = ",", scientific=FALSE),"%"))
animals$char_change <- gsub('\\s+', '', animals$char_change)

#Call reorder to put the rows in descending avg_change order.
#These damn animals are varmits. This project hurt my brain and I taint
#never wan deal wit no damn pixel positions 'gin.
varmits <- ggplot(animals, aes(x=reorder(names, avg_change), y=avg_change)) +
  
  #Draw row arrow segments
  geom_segment( aes(x=reorder(names, avg_change), xend=reorder(names, avg_change), 
                y=1, yend=avg_change - avg_change/6), color="#c3c3c3", 
                arrow  = arrow(angle = 20, length = unit(0.25, "cm"),
                  ends = "last", type = "closed")) +
  
  #Dots at end of arrows, they have an almost indiscernible boarder
  geom_point(shape = 21, color="#515d72", fill="#697996", size=3) + 
  
  #Percentage text labels next to dots. I think they're bold but idk.
  #Use char_change here to make things easy. Scale the y by log10 for
  #correct spacing next to dots. Left justified + 2 spaces seems to 
  #be the secret sauce for log based positioning.
  geom_text(y=log10(animals$avg_change), vjust=.4,
            label = str_c("  ", animals$char_change), color="#697996",
            fontface = "bold", size = 3, hjust = 0)+
  
  #Gray/black dots at 0ish. .9 makes them look 
  #more similar to the original image
  geom_point( aes(x = names, y = .9), color = "#4d4d4d", size = 3) +
  
  #Labels have boxes around them that overlay everything else. Turn off the 
  #border outline and it looks like you've got two segments.
  geom_label(aes(label=str_c(animals$`Start year`, " to ", animals$`End year`),
                 x=names, y=2.1), size=2.5, color="#4d4d4d", label.size = NA) +
  
  #Transform y axis to log10 and reformat tick values to have , and %
  scale_y_continuous( label = function(x) 
    paste0(format(x, big.mark = ",", scientific=FALSE),"%"), trans="log10") +
  
  #y axis label will be x axis after coor_flip()
  ylab(label = expression(paste(
    bold("Average relative change in the size of populations"), 
    " (logarithmic scale)")))+
  
  #Eliminate x (really y) label
  xlab("") +
  
  #May god smite whoever decided that positioning in a ggplot should work as 
  #it does below
  
  #Start and end year + tiny down arrow between subtitle and plot
  annotate("text", x = 26.5, y = 1.8, label = "Start and end year", fontface =2,
           size = 3, color = "#4f4f4f") +
  annotate("segment", x = 26.5, xend = 25.3, y = 2, yend = 2, size = .2,
           arrow  = arrow(angle = 20, length = unit(0.1, "cm"),
                          ends = "last", type = "closed"), color = "#a3a3a3") +
  
  #Avg change label above percentage labels
  annotate("text", x = 26.1, y = 19000, 
           label = "Average relative change\nin animal populations", 
           lineheight = .8, hjust = 0, fontface =2, size = 3.5, 
           color = "#697996") +
  
  #Otter annotation and two geom_curves to spoof a cubic function squiggle arrow
  annotate("text", label = otter, size = 3, color = "#697996", lineheight = .8, 
           hjust = 0, x = 11.6, y = 1200) +
  annotate("curve", x = 11.6, xend = 11.8, y = 1150, yend = 900, 
           curvature = -0.4, angle = 60, size = .2, color = "#697996") +
  annotate("curve", x = 11.8, xend = 12, y = 900, yend = 700, curvature = 0.4, 
           angle = 60, size = .2, color = "#697996",
           arrow = arrow(angle = 20, length = unit(0.1, "cm"),
                          ends = "last", type = "closed")) +
  
  #Bear annotation and two geom_curves to spoof a cubic function squiggle arrow
  annotate("text", label = bear, size = 3, color = "#697996", lineheight = .8, 
           hjust = 0, x = 3.6, y = 250) +
  annotate("curve", x = 3.6, xend = 3.8, y = 240, yend = 130, curvature = -0.3, 
           angle = 20, size = .2, color = "#697996") +
  annotate("curve", x = 3.8, xend = 4, y = 130, yend = 90, curvature = 0.3, 
           angle = 40, size = .2, color = "#697996",
           arrow  = arrow(angle = 20, length = unit(0.1, "cm"),
                          ends = "last", type = "closed")) +
  
  #Formatting this text block got weird when it wasn't explicitly written in 
  #the ggtitle() call. May Satan forgive me for this horror of code.
  ggtitle("Wildlife is making a comeback in Europe", subtitle="Shown is the average relative change in the abundance (the number of individuals in a population) of animals
across selected mammal populations in Europe. For example, the numbers for Eurasian beavers shows the average
relative change in the abundance of beavers between 1960 and 2016 across 98 studied populations.") +  
  
  #Add in the HTML caption
  labs(caption = mycaption) +
  
  #Flip x and y and supposedly turn clipping off which should have let me 
  #annotate below the x axis. This did not work hence the demonically long 
  #ggtext() HTML workaround
  coord_flip(clip = "off") +
  
  #Attempting to make things pretty. ggplot thinks its special and should have
  #certain elements have their properties definined in theme and not in the 
  #actual instatiating call. This is due to theme being relatively new and its
  #features being built piecemeal to satisfy angry R developers in the ggplot
  #forums. (I'm not actually lying about this, sometimes complaining does work)
  theme(
    #Get rid off default aesthetic elements
    panel.grid.major = element_blank(), 
    panel.grid.minor = element_blank(),
    panel.background = element_blank(),
    panel.border = element_blank(),
    axis.ticks.y = element_blank(),
    axis.ticks.x = element_blank(),
    
    #Previously was the ylab() text.
    axis.title.x = element_text(size = 9),
    
    #Make the animal names bold + have the right color and spacing
    axis.text.y = element_text(colour="#4d4d4d", face = "bold", 
                               margin=margin(0,-5,0,0)),
    
    #Left align the title and subtitle
    plot.title.position = "plot",
    
    #Title and subtitle text formatting
    plot.title = element_text(color='#303030', size = 23, family = "serif"),
    plot.subtitle = element_text(color="#4d4d4d", size = 9.5, 
                                 margin=margin(0,0,10,0)),
    
    #Caption text formatting
    plot.caption = element_markdown(hjust = 0, size = 7),
    plot.caption.position = "plot",
    
    #Pad the plot so the final saved image has some whitespace along border
    #Also reduces size of x axis a bit to make it more in line with the original
    #image
    plot.margin = margin(.5, 4, .1, .1, "cm"),
  ) 


#Add logo and bear pngs with cowplot
varmits + 
  draw_image( "logo.png", x = 29, y = 5, scale = 3
  ) +
  draw_image("bear.png",
    x = 3.6, y = -1.5, scale = 1
  )

#Save the image
ggsave("plottest.png", width =  7.94, height = 6.86, units = "in")








