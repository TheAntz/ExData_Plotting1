loadDataset <- function () {
  ## This function loads the required "Individual household electric power 
  ## consumption Data Set" from the working directory of the local repo.
  ## It creates the variable 'dataset' in the parent environment which contains
  ## the needed data subset for the project.
  
  ## Check that we have the dataset archive present in the working directory
  # Check if we already have the archive of the original dataset in the current
  # working directory.
  if(!file.exists("./exdata-data-household_power_consumption.zip")) {
    # We don't have the archive, so download it to our working directory
    fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    message("Downloading project dataset archive...")
    download.file(fileURL, destfile="./exdata-data-household_power_consumption.zip")  
  }
  # Ensure that the project data has been extracted from the downloaded archive file
  if(!file.exists("./household_power_consumption.txt")) {
    # Extract the dataset from the archive into the working directory
    library(utils)
    message("Extracting dataset from ZIP archive to working directory...")
    unzip("./exdata-data-household_power_consumption.zip")
  }
  
  dataClasses <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
  data <- read.csv("./household_power_consumption.txt", header = TRUE, sep=";",
                   na.strings = "?", colClasses = dataClasses)
  ## Subset the data for only the dates 2007-02-01 and 2007-02-02
  data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007", select=Date:Sub_metering_3)
  ## Convert time column values to R POSIXlt class
  data$datetime <- strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
  
  ## Create variable 'dataset' in parent environment
  dataset <<- data
}
