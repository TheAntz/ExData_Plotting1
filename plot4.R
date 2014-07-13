plot4 <- function () {
  ## Function to create set of plots as per 'Plot 4'
  ## Load the dataset (if not already loaded)
  if(!exists("dataset")) {
    source('loadDataset.R')
    loadDataset()
  }
  ## Open the PNG graphics device
  png(file="plot4.png", width=480, height=480, units="px")
  ## Setup 
  par(mfrow=c(2,2))
  
  ## Plot first 
  plot(dataset$datetime, dataset$Global_active_power, 
       ylab="Global Active Power", type="l", xlab="")

  ## Plot second
  plot(dataset$datetime, dataset$Voltage, ylab="Voltage", xlab="datetime", type="l")

  ## Decrease font size for labels slightly
  par(cex.lab=0.95)
  ## Plot third
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
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, 
         box.lwd=0, cex=0.95, inset=0.02)

  ## Plot fourth
  plot(dataset$datetime, dataset$Global_reactive_power, type="l", xlab="datetime", 
       ylab="Global_reactive_power")  
  
  ## Close the device and save file
  dev.off()
}