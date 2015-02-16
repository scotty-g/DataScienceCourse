complete <- function(directory, id = 1:332) {
  csv.files <- list.files(directory)
  final.dat <- data.frame()
  
  for(i in id) {
    raw.data <- read.csv(paste(directory, "/", csv.files[i], sep = ""))
    num.comp.cases <- nrow(raw.data[complete.cases(raw.data),])
    
    final.dat <- rbind(final.dat, data.frame(id=i, nobs=num.comp.cases))
  }
  
  final.dat
}