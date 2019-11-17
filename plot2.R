# Loading needed libraries
library (data.table)

# Reading data
data<-fread("household_power_consumption.txt",na.strings = "\\?")

#Merging date and time
Timing<-paste(data$Date,data$Time)

# Adjusting timing to POSIXlt
Timing<-strptime(Timing,"%d/%m/%Y %H:%M:%S")

#Subsetting for needed dates
feb<-as.Date(Timing)==as.Date("2007-02-01")|as.Date(Timing)==as.Date("2007-02-02")
febdata<-subset(data,feb)
febtiming<-subset(Timing,feb)

#Creating graph inside png file
png("plot2.png")
plot(febtiming,febdata$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="n")
lines(febtiming,febdata$Global_active_power)
dev.off()