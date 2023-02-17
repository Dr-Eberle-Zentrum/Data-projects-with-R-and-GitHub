
#' (1) Check documentation and find out
#' what the following two lines of code are doing
plot( x=c(0,10), y=c(0,10), col="red", type="p")
locator(n=1, type="p", col="blue")


#' (2) We want to create some x,y data via
#' interactive selection within a plotting area.
#' In detail we want to
#' - collect at most 30 data points
#' - see each new data point after we clicked
#' - aggregate all selected points in a tibble
#' - allow for early interruption of selection via
#'   "Finish" button

library(tidyverse)

plot( x=c(0,10), y=c(0,10), col="white")
# collect each point independently
myPoints <- tibble(x=as.double(1:30),y=NA)
for (i in 1:nrow(myPoints)) {
  # get selected point
  point <- locator(1, type="p", col="red")
  # stop if user finished selection
  if (is.null(point)) {
    break
  }
  # store data
  myPoints[i,] <- point
}
myPoints <- drop_na(myPoints)

# let's try via ggplot
library(ggmap) # for gglocator
x11() # gglocator is not working in RStudio plot viewer >> new window needed
myPoints <- tibble(x=as.double(1:30),y=NA)
for (i in 1:nrow(myPoints)) {
  print(ggplot(drop_na(myPoints)) +
          geom_point(aes(x=x,y=y), col="red") +
          xlim(0,10) + ylim(0,10) + theme_bw()
        )
  point <- gglocator(mercator = F)
  if (is.na(point[1,1])) { break }
  myPoints[i,] <- point
}
myPoints <- drop_na(myPoints)
dev.off() # close x11 window


#' (3) Let's find a suitable model for our data
#' - fit three models to your data (linear, quadratic, cubic )
#'   using "poly()" function in your "lm()" formula,
#'   e.g. "lm( y ~ poly(x,degree=3), ... )"
#' - add predictions for each model to your tibble via modelr
#' - plot the original data points as points
#'   and model predictions as a colored lines via ggplot
#' - try to avoid redundant coding... :) (maybe the hardest part)

# creating models ... lots of code redundancy
m1 <- lm( y ~ poly(x,degree=1), data=myPoints )
m2 <- lm( y ~ poly(x,degree=2), data=myPoints )
m3 <- lm( y ~ poly(x,degree=3), data=myPoints )

origPoints <- myPoints

# testing for a single (cubic) model
myPoints |>
  add_predictions(m3, var="m3") |>
  ggplot(aes(x=x))+
  geom_point(aes(y=y))+
  geom_line(aes(y=m3), col="red")

# for loop to store each model in the same data frame
newPoints <- myPoints
for( deg in 1:3) {
  newPoints <-
  add_predictions(myPoints,
                    lm( y ~ poly(x,degree= deg ), data=myPoints ),
                   var = str_c("model",deg) )
}

# and plotting first version
newPoints |>
  pivot_longer(!x, values_to = "y", names_to="model") |>
  ggplot(aes(x=x, y=y)) +
  geom_line(aes(col=model))



# instead of for loop: let's walk ! is it better to read? not sure...

library(modelr)
walk( 1:3,
      function(i) {
        # note GLOBAL SCOPE writing via "<<-" to object OUTSIDE the function !!!
          myPoints <<- add_predictions( myPoints,
                                        # inline model creation
                                        lm( y ~ poly(x,degree=i), data=myPoints ),
                                        # output column name
                                        var = str_c("m",i))
        })

myPoints |>
  # make things tidy for plotting
  pivot_longer(starts_with("m"), names_to = "model", values_to = "pred") |>
  # let's plot
  ggplot(aes(x=x)) +
  # original data
  geom_point(aes(y=y)) +
  # models
  geom_line(aes(y=pred, col=model))

