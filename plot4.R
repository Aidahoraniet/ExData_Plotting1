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
par(mfrow=c(2,2))
with(file2,{
  #Plot1
  plot(file2$Time,as.numeric(file2$Global_active_power),type = "l",ylab = "Global Active Power",xlab="")
  #Plot2
  plot(file2$Time,as.numeric(file2$Voltage),type = "l",ylab = "Voltage",xlab="datetime")
  #Plot3
  plot(file2$Time,as.numeric(file2$Sub_metering_1),type = "l",ylab = "Energy submetering",xlab="",col="black")
  lines(file2$Time,as.numeric(file2$Sub_metering_2),type = "l",ylab = "Energy submetering",xlab="",col="red")
  lines(file2$Time,as.numeric(file2$Sub_metering_3),type = "l",ylab = "Energy submetering",xlab="",col="blue")
  legend("topright",pch="-",col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex = 0.50,bty = "n")
  #Plot4
  plot(file2$Time,as.numeric(file2$Global_reactive_power),type = "l",ylab = "Global_Reactive_ Power",xlab="datetime")
})
#Copy to png
dev.copy(png,file="plot4.png")
#Close device
dev.off()