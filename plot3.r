# Course Project 1, Plot 3 


# Read in complete file to "elec" 
  elec <- read.table("household_power_consumption.txt",header= TRUE,sep=";",na.strings = "?",stringsAsFactors=FALSE,dec=".")
  
# Subset elec by date range, store in "elec1"
    elec1 <- elec[elec$Date %in% c("1/2/2007","2/2/2007") ,]

# combine the date and timestamp into "datetime"  
    datetime <- strptime(paste(elec1$Date, elec1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#create the plot file
  png("plot3.png",width=480,height = 480)

# Create the plot, with three separate data lines and a legend
  plot(datetime, elec1$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
  lines(datetime,elec1$Sub_metering_2,type="l",col="red")
  lines(datetime,elec1$Sub_metering_3,type="l",col="blue")
  legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
  dev.off()
