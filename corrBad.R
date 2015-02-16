corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV file.

        # Get the nobs for each file.
        cmplist <- complete(directory)
        files_full <- list.files(directory, full.names=TRUE)  
        # create an empty data frame to place our raw data from the files.
        
        tmp <- data.frame()
        dat <- data.frame()
#         cmplistc <- cmplist[which(cmplist[, "nobs"] > threshold), "nobs" ] 
#         print(nrow(cmplistc))
        tmpvector1 <- numeric()
        tmpvector2 <- numeric()

#         for each file, pull out the number of observations
          for (i in seq_along(files_full)) {
           if ( cmplist[i,c('nobs')] >=  threshold ) {
               tmp <- rbind(tmp, read.csv(files_full[i]))
               x <- tmp[complete.cases(tmp),"sulfate"] 
               y <- tmp[complete.cases(tmp),"nitrate"] 
               tmpvector1 <- c(round(cor(x,y),5))
#               dat <- rbind(dat,c(round(cor(x,y),5)))
           }
           tmpvector2 <- c(tmpvector2, tmpvector1)
          }
tmpvector2


#file_data <- tmp[complete.cases(tmp),] 

#x
#        dat <- rbind(dat,c(file_data["nitrate"], file_data["sulfate"]))

#x<-file_data["nitrate"]
#y<-as.vector(file_data["sulfate"])

#y

# data<-cor(dat["nitrate"], dat["sulfate"])
#data

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        

#        cor(cmpl["nitrate"], cmpl["sulfate"])
        ## Return a numeric vector of correlations
}
