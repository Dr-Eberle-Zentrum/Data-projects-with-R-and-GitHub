install.packages("tictoc")
######################
#' We want to test the effect of pre-allocation of output data structures and
#' the performance of different looping strategies.
#'
#' (1) For performance testing, we will use the 'tictoc' package, which you
#' will need to install first via "install.packages("tictoc")"
#' Check its documentation or the following website how to use it:
#' https://codeparttime.com/measuring-function-execution-time-in-r/#section-4-timing-code-execution-with-the-tictoc-package
#'
library(tictoc)

#' (2) write a code block that
#' - creates a variable "vecLength <- 10000" that defines the number of tests
#' - creates an (empty, not initialized) output vector of "vecLength" length
#' - run a for loop that stores the square root of each number from 1 to
#'   vecLength within the number's "entry" without the output vector
#' - measure the required time of all steps from above using the tictoc package
#'

# Task - 2
{tic("Task 2")
vecLength <- 10000
class(vecLength)
vector <- vector("numeric",length = vecLength)
class(vector)
for (i in 1:vecLength) {vector[i]<-sqrt(i)}
vector
toc()
}
#' (3) copy and paste the code from above
#' - replace the output vector creation with the creation of an initialized
#'   vector that contains "vecLength" NA values.
#' - compare the time consumption to the previous run

# Task - 3
tic("Task 3")
output3 <- vector("numeric", length = vecLength)
output3[] <- NA
class(output3)
for (i in 1:vecLength) {output3[i]<-sqrt(i)}
output3
toc()

#' (4) copy and adapt your code from above such that
#' - you are starting with an empty output vector
#' - you are "growing" the output vector in each step of the for loop by one
#'   new element, ie. increasing its length step by step
#' - any time impact?

tic("Task 4")
output3 <- vector("numeric", length = vecLength)
output3[] <- NA
class(output3)
for (i in 1:vecLength) {output3[i]<-sqrt(i)}
output3
toc()

#' (5) copy and adapt your last code such that
#' - you store your output within a list (rather than a vector)
#' - start with an empty list
#' - store within the for loop the new value via "element access" within the
#'   list, i.e. increasing the list length step by step
#' - compare to the previous results



#' (6) now use R "vector processing" capabilities
#' - by directly feeding the vector of all numbers of 1 to vecLength to sqrt()
#' - store within an output variable
#' - check the time consumption and compare

output6 <- sqrt(1:vecLength)


#' (7) think about explanations of your observations. Especially w.r.t. to the
#' timings of (2), (4) and (5)
#' 
#' #' (4) copy and adapt your code from above such that
#' - you are starting with an empty output vector
#' - you are "growing" the output vector in each step of the for loop by one
#'   new element, ie. increasing its length step by step
#' - any time impact?
#'
#' (5) copy and adapt your last code such that
#' - you store your output within a list (rather than a vector)
#' - start with an empty list
#' - store within the for loop the new value via "element access" within the
#'   list, i.e. increasing the list length step by step
#' - compare to the previous results
#'
#' (6) now use R "vector processing" capabilities
#' - by directly feeding the vector of all numbers of 1 to vecLength to sqrt()
#' - store within an output variable
#' - check the time consumption and compare
#'
#' (7) think about explanations of your observations. Especially w.r.t. to the
#' timings of (2), (4) and (5)