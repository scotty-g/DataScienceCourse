corr <- function(directory, threshold = 0) {
  csv.files <- list.files(directory)
  cc <- complete(directory)
  
  ## df with nobs above threshold
  data <- cc[cc["nobs"] > threshold,]
  
  final <- numeric(nrow(data))
  count <- 1
  
  for(i in data[["id"]]) {
    raw.data <- read.csv(paste(directory, "/", csv.files[i], sep = ""))
    final[count] <- cor(raw.data[["nitrate"]], raw.data[["sulfate"]], use="na.or.complete")
    count <- count + 1
  }
  
  final
}