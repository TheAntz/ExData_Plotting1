plot1 <- function () {
  ## Function to create histogram as per 'Plot 1'
  ## Load the dataset (if not already loaded)
  if(!exists("dataset")) {
    source('loadDataset.R')
    loadDataset()
  }
  ## Open the PNG graphics device
  png(file="plot1.png", width=480, height=480)
  ## Plot the histogram
  hist(dataset$Global_active_power, main="Global Active Power", 
       xlab="Global Active Power (kilowatts)", col="red")
  ## Close the device and save file
  dev.off()
}