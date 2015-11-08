# Course Project 1, Plot 4 


# Read in complete file to "elec" 
  
  elec <- read.table("household_power_consumption.txt",header= TRUE,sep=";",na.strings = "?",stringsAsFactors=FALSE,dec=".")
#Subset by date into elec1
  elec1 <- elec[elec$Date %in% c("1/2/2007","2/2/2007") ,]
# form the date time stamp
  datetime <- strptime(paste(elec1$Date, elec1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
# Create the output file
  png("plot4.png",width=480,height = 480)
# Configure the 2x2 plot panels 
   par(mfrow=c(2,2))
#plot each individual sup-plot    
  plot(datetime, elec1$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
  plot(datetime,elec1$Voltage,type="l",ylab="Voltage")
        plot(datetime, elec1$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
  lines(datetime,elec1$Sub_metering_2,type="l",col="red")
  lines(datetime,elec1$Sub_metering_3,type="l",col="blue")
  legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),bty="n")
  plot(datetime,elec1$Global_reactive_power,type="l",ylab="Global_reactive_power")

  dev.off()
