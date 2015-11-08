# Course Project 1, Plot 2


# Read in complete file to "elec" 
elec <- read.table("household_power_consumption.txt",header= TRUE,sep=";",na.strings = "?",stringsAsFactors=FALSE,dec=".")
#Subset by date into "elec1"
elec1 <- elec[elec$Date %in% c("1/2/2007","2/2/2007") ,]
# combine date and time stamps
datetime <- strptime(paste(elec1$Date, elec1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Create the plot file
png("plot2.png",width=480,height = 480)
# Create line plot
plot(datetime, elec1$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
