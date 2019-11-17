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

#Creating graphs inside png file
png("plot4.png")
par(mfcol=c(2,2))
par(mar=c(4,5,2,2))

plot(febtiming,febdata$Global_active_power,xlab="",ylab="Global Active Power",type="n")
lines(febtiming,febdata$Global_active_power)

plot(febtiming,febdata$Sub_metering_1,xlab="",ylab="Energy sub metering",type="n")
lines(febtiming,febdata$Sub_metering_1,col="black")
lines(febtiming,febdata$Sub_metering_2,col="red")
lines(febtiming,febdata$Sub_metering_3,col="blue")
legend("topright",lty=c(1,1,1),lwd=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

plot(febtiming,febdata$Voltage,xlab="datetime",ylab="Voltage",type="n")
lines(febtiming,febdata$Voltage)

plot(febtiming,febdata$Global_reactive_power,xlab="datetime",ylab="Global_Reactive_Power",type="n")
lines(febtiming,febdata$Global_reactive_power)

dev.off()