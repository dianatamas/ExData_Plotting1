createPlot <- function() {
  ## Read the data
  house_power <- read.table("./household_power_consumption.txt", header = FALSE, 
                            sep = ";", na.strings = "?",skip=66637,nrows=2880);
  names(house_power) <- c("Date","Time","Global_active_power",
                          "Global_reactive_power","Voltage","Global_intensity",
                          "Sub_metering_1","Sub_metering_2","Sub_metering_3");
  house_power$Date <- as.Date(house_power$Date,"%d/%m/%Y");
  house_power$Time <- strptime(paste(house_power$Date,house_power$Time),
                               format="%Y-%m-%d %H:%M:%S");
  
  ## Create plot
  png(filename = "plot3.png");
  plot(house_power$Time, house_power$Sub_metering_1,col="black",
       type="l",ylab="Energy sub metering",xlab="");
  lines(house_power$Time, house_power$Sub_metering_2,col="red");
  lines(house_power$Time, house_power$Sub_metering_3,col="blue");
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         lty=1,col=c('black','red','blue'))
  dev.off();
}
