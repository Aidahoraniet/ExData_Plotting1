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
plot(file2$Time,as.numeric(file2$Global_active_power),type = "l",ylab = "Global Active Power(Kwats)",xlab="")
#Copy to png
dev.copy(png,file="plot2.png")
#Close device
dev.off()
