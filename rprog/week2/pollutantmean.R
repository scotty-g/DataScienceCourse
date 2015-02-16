pollutantmean <- function(directory, pollutant, id = 1:332) {  
  # vector to combine data from files
  cmb.data <- data.frame()
  
  # loop over csv files in directory and combine into cmb.data
  # assumes id index matches file index
  csv.files <- list.files(directory)
  for(i in id) {
    raw.data <- read.csv(paste(directory, "/", csv.files[i], sep = ""))
    cmb.data <- rbind(cmb.data, raw.data)
  }
  
  # return the mean, strip out NA
  mean(cmb.data[, pollutant], na.rm = TRUE)
}