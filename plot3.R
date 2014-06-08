plot3 <- function () {
  ## Function to create plot as per 'Plot 3'
  ## Load the dataset (if not already loaded)
  if(!exists("dataset")) {
    source('loadDataset.R')
    loadDataset()
  }
  ## Open the PNG graphics device
  png(file="plot3.png", width=480, height=480)
  ## Setup the plot
  plot(dataset$datetime, dataset$Sub_metering_1, ylab="Energy sub metering", 
       type="n", xlab="")
  ## Draw line plot for first submetering values
  lines(dataset$datetime, dataset$Sub_metering_1, col="black")
  ## Draw line plot for second submetering values
  lines(dataset$datetime, dataset$Sub_metering_2, col="red")
  ## Draw line plot for first submetering values
  lines(dataset$datetime, dataset$Sub_metering_3, col="blue")
  ## Add legend to top-right 
  legend("topright", col=c("black", "red", "blue"), 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)
  
  ## Close the device and save file
  dev.off()
}