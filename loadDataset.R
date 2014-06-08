loadDataset <- function () {
  ## This function loads the required "Individual household electric power 
  ## consumption Data Set" from the parent directory of the local repo.
  ## It creates the variable 'dataset' in the parent environment which contains
  ## the needed data subset for the project.
  dataClasses <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
  data <- read.csv("../household_power_consumption.txt", header = TRUE, sep=";",
                   na.strings = "?", colClasses = dataClasses)
  ## Subset the data for only the dates 2007-02-01 and 2007-02-02
  data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007", select=Date:Sub_metering_3)
  ## Convert time column values to R POSIXlt class
  data$datetime <- strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
  
  
  ## Create variable 'dataset' in parent environment
  dataset <<- data
}