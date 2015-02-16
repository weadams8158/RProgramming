complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        files_full <- list.files(directory, full.names=TRUE)  
  
        # create an empty data frame to place our raw data from the files.
        dat <- data.frame()                                   
  
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        for ( i in id ) { 
          tmp1 <- read.csv(files_full[i]);
          tmp2 <- tmp1[complete.cases(tmp1),] 
          dat <- rbind(dat,c(i, nrow(tmp2)))
          names(dat)=c("id", "nobs")
        }

        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
        dat
}
