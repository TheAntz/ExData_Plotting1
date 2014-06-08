plot2 <- function () {
  ## Function to create plot as per 'Plot 2'
  ## Load the dataset (if not already loaded)
  if(!exists("dataset")) {
    source('loadDataset.R')
    loadDataset()
  }
  ## Open the PNG graphics device
  png(file="plot2.png", width=480, height=480)
  ## Draw line plot
  plot(dataset$datetime, dataset$Global_active_power, 
       ylab="Global Active Power (kilowatts)", type="l", xlab="")
  ## Close the device and save file
  dev.off()
}