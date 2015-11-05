#Read file
file <-read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")
#Format dates
file$Date<-as.Date(file$Date,format= "%d/%m/%Y")
#Filter required dates
file2<-file[(file$Date>="2007-02-01" & file$Date<="2007-02-02"),]
#Join Date and Time and format
file2$Time<-strptime(paste(file2$Date,file2$Time),format="%Y-%m-%d %H:%M:%S")
library(datasets)
#Create plot
par(mfrow=c(1,1))
plot(file2$Time,as.numeric(file2$Sub_metering_1),type = "l",ylab = "Energy submetering",xlab="",col="black")
lines(file2$Time,as.numeric(file2$Sub_metering_2),type = "l",ylab = "Energy submetering",xlab="",col="red")
lines(file2$Time,as.numeric(file2$Sub_metering_3),type = "l",ylab = "Energy submetering",xlab="",col="blue")
legend("topright",pch="-",col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#Copy to png
dev.copy(png,file="plot3.png")
#Close device
dev.off()