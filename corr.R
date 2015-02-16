corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV file.

        # Get the nobs for each file minus the NA values.
        cmplist <- complete(directory)
        # Get a list of files.
        files_full <- list.files(directory, full.names=TRUE)  
        # create an empty data frame to place our raw data from the files.
        #
        tmp <- data.frame()
        dat <- data.frame()
        
#         cmplistc <- cmplist[which(cmplist[, "nobs"] > threshold), "nobs" ] 
#         print(nrow(cmplistc))
       tmpvector2 <- numeric()
        count=0
        for (i in seq_along(files_full)) {
          tmpvector1 <- numeric()
          if ( cmplist[i,c('nobs')] >  threshold ) {
#          print(tmpvector1)
#                           print(i)
#               print(files_full[i])
               count=count+1
               tmp1 <- read.csv(files_full[i])
               tmp2 <- tmp1[complete.cases(tmp1),]
               x<-tmp2$nitrate
               y<-tmp2$sulfate
#               print(y)
               tmpvector1 <- c(cor(x,y))
# print(tmpvector1)
          }
#          print(count)
          tmpvector2 <- c(tmpvector2, tmpvector1)
        }
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        

        ## Return a numeric vector of correlations
        tmpvector2
}
