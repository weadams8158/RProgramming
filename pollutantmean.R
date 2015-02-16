pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
  
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
  
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)

        #
        # Solution:
        #
        
        # Get a list of all the data files located in the requested directory.
        files_full <- list.files(directory, full.names=TRUE)  
        
        # create an empty data frame to place our raw data from the files.
        dat <- data.frame()                                   
        
        # Since each file contains the results of each monitor,
        # we can load the files based on the monitor id.
        #   A. Read the csv file retrieved from the list of files into the data frame.
        #   B. rbind the resulting file into a single data frame.
        
        for ( i in id) {                                      
          dat <- rbind(dat,read.csv(files_full[i]))
        }
        
        # A. Extract the "pollutant" column from the dat set 
        # B. Remove the N/A
        # C. Calculate the mean
        # D. Round the results to 3 decimal points

        round(mean(dat[, pollutant], na.rm=TRUE), digits=3)
}

