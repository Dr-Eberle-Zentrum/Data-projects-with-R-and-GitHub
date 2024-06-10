#############################################################
# Given the following visualization of a subset of the ChickWeight dataset.
#############################################################
# 1. Add a red circle around the data points at Time == 10.
# 2. Add a half-transparent red line to show the average weight over time.
# 3. Add the Chick number as a label to the last data point of each Chick line.
# 4. Disable the color legend.
#############################################################

#load the chickweight data

```{r}
data <- ChickWeight

#filter the data to keep only chick 1,2 and 3

data <- data[data$Chick %in% c(1,2,3),]
ggplot(data, aes(x=Time, y=weight, color=Chick)) + 
  geom_point() + 
  geom_line(data = aggregate(weight ~ Time, data = data, FUN = mean), 
            aes(x=Time, y=weight), color = "red", alpha = 0.5, linetype = 1) + 
  geom_text(data = data[!duplicated(data$Chick, fromLast = TRUE),], 
            aes(x=Time, y=weight, label=Chick), hjust = 1, vjust = 1) + 
  geom_point(data = data[data$Time == 10,], 
             aes(x=Time, y=weight), alpha=0.5, color = "red", size = 3, shape = 1, show.legend = FALSE) + 
  theme(legend.position = "none")

```

```{r}
library(tidyverse)

count_letters_or_words <- function(input_string) {
    word_count <- length(str_split(input_string, "\\s")[[1]])
    
    if (word_count == 1) {
        return(str_count(input_string, "\\S"))
    } else {
        return(word_count)
    }
}

```