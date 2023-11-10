### HEADER

# Library
library(ggplot2)
library(dplyr)
#library(hrbrthemes)

# load data & change colnames
dat <- read.csv("Mammal-comeback-in-Europe-data-OWID-download.csv")
dat <- dat %>% 
    select( -c(2,3)) %>% 
    rename(name=1,start=2,end=3,abs_change=4) 

# reformat change col to numeric
dat <- dat %>%
    mutate(abs_change=as.numeric(gsub("%", "", abs_change))) 

# reformat change col to char for plot labels
dat <- dat %>%
    add_column(change=paste0(format(dat$abs_change,
                                    big.mark=",",scientific=FALSE),"%")) %>% 
    mutate(change=gsub('\\s+', '', change))

# plotting
dat %>% 
    ggplot(aes(x=reorder(name,abs_change),y=abs_change,
               label=change)) +
    geom_segment(aes(x=reorder(name,abs_change),xend=name,
                     y=1, yend=abs_change),
                 color="#B7B7B7",
                 arrow=arrow(angle=15,length=unit(0.25,"cm"),
                             ends="last",type ="closed")) +
    geom_point(color="#697996") +
    geom_point(aes(y=-10),
               color="#697996") +
    geom_text(hjust=-0.25,color="#697996",size=3) + 
    ylab("Average relative change in the size of populations (logarithmic scale)") +
    scale_x_discrete(name="") +
    coord_flip(clip="off") +
    annotate("text",x=grep("Eurasian otter",dat$name),
             y=dat$abs_change[which(dat$name=="Eurasian otter")]*5,
             color="#697996",size=2,angle=0,vjust=2.5,hjust=0,
             label="Between 1977 and 2016, populations of\nEurasian otters increased by an average of 294%") +
    annotate("text",x=grep("Brown bear",dat$name),
             y=dat$abs_change[which(dat$name=="Brown bear")]*16,
             color="#697996",size=2,angle=0,vjust=13.5,hjust=0,
             label="Between 1960 and 2016, populations of\nBrown bears increased by an average of 44%") +
    ggtitle("Wildlife is making a comeback in Europe", subtitle="Shown is the average relative change in the abundance (the number of individuals in a population) of animals\nacross selected mammal populations in Europe. For example, the numbers for Eurasian beavers shows the average\nrelative change in the abundance of beavers between 1960 and 2016 across 98 studied populations.") +
    theme(plot.title=element_text(face="bold",family="serif"),
          plot.subtitle=element_text(lineheight=.8),
          panel.background=element_blank(),
          panel.grid=element_blank(),
          axis.title.y=element_text(face="bold"))  
