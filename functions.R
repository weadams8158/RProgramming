above <- function(x, n=10) {
  use <- x > n   # variable use is assigned all vector elements > n
  x[use]   # return the subset > n
}

columnmean <- function(y, removena=TRUE) {  # y is dataframe or matrix
  nc <- ncol(y)    # number of columns
  means <- numeric(nc)  # create  empty vector of col to store each mean value
  for ( i in 1:nc) {
    means[i] <- mean(y[,i], na.rm=removena)   # store the mean of each column
  }
  means   # return the vector
}


