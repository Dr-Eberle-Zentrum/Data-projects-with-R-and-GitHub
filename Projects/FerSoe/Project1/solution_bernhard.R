# library
library(tidyverse)
library(viridis)
library(patchwork)
library(hrbrthemes)
library(circlize)
#library(chorddiag)

# Arrange the layout
setwd("~//r2-advanced-r//Advanced-data-processing-with-R//Projects//FerSoe//Project1")
data <- read.csv2("Data//Chord_test.csv")

# Inhalt von spalte X wird zur Reihennamen und dann geloescht
row.names(data) <- data$X
data <- data[2:length(data[1,])]

# für jede 1 wird die korrespondierende Klasse eingesetzt sodass col~row ein Paar bilden
for (i in 1:length(data[1,])){
  for (j in 1:length(data[,1])){
    if (data[i, j] == 1 && !is.na(data[i,j])){
      print(data[i, j])
      data[i, j] <- rownames(data)[i]
    }
  }
}

data[data == 0] <- NA
gathered <- gather(data, key = "key", value = "value", na.rm = TRUE, factor_key = TRUE)


chordDiagram(
  x = gathered,
  #grid.col = mycolor,
  transparency = 0.25,
  directional = 1,
  direction.type = c("arrows", "diffHeight"), 
  diffHeight  = -0.04,
  annotationTrack = "grid", 
  annotationTrackHeight = c(0.05, 0.1),
  link.arr.type = "big.arrow", 
  link.sort = TRUE, 
  link.largest.ontop = TRUE)



