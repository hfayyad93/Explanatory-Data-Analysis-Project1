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
png("plot3.png")
plot(febtiming,febdata$Sub_metering_1,xlab="",ylab="Energy sub metering",type="n")
lines(febtiming,febdata$Sub_metering_1,col="black")
lines(febtiming,febdata$Sub_metering_2,col="red")
lines(febtiming,febdata$Sub_metering_3,col="blue")
legend("topright",lty=c(1,1,1),lwd=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()