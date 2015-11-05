#Read file
file <-read.table("household_power_consumption.txt",header = TRUE,sep = ";")
#Format dates
file$Date<-as.Date(file$Date,format= "%d/%m/%Y")
#Filter required dates
file2<-file[(file$Date>="2007-02-01" & file$Date<="2007-02-02"),]
library(datasets)
#Create histogram
hist(as.numeric(file2$Global_active_power)/1000,col="red",xlab = "Global Active Power (Kwats)",main = "Global Active Power")
#Copy to png
dev.copy(png,file="plot1.png")
#Close device
dev.off()