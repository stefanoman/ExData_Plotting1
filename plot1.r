# Course Project 1, Plot 1 


# Read in complete file to "elec" 
elec <- read.table("household_power_consumption.txt",header= TRUE,sep=";",na.strings = "?")
# load lubridate library and convert date formats into YMD
library(lubridate)
elec$Date <- dmy(elec$Date)
elec$Date <- ymd(elec$Date)
elec$Time <- strptime(elec$Time,format = "%H:%M:%S")

# Subset by date range into "elec1"
elec1 <- elec[elec$Date >"2007-01-31" & elec$Date <"2007-02-02",]
# Create the plot file
png("plot1.png",width=480,height = 480)
# Generate the Histogram
hist(elec1$Global_active_power,col="red",main="Global Active Power", xlab="Global Active Power(kilowatts)")
dev.off()
