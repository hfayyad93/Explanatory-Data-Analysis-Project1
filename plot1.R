# Loading needed libraries
library (data.table)

# Reading data
data<-fread("household_power_consumption.txt",na.strings = "\\?")

# Adjusting Date Column
data$Date<-as.Date(data$Date,"%d/%m/%Y")

#Subsetting for needed dates
feb<-data$Date==as.Date("2007-02-01")|data$Date==as.Date("2007-02-02")
febdata<-subset(data,feb)

#Creating Histogram inside png file
png("plot1.png")
hist(as.numeric(febdata$Global_active_power),col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")
dev.off()
