library(readr)
library(lubridate)
library(dplyr)
file <- "household_power_consumption.txt"
power <- read_csv2( file = file )
power$Date <- dmy(power$Date)
power <- power %>% filter( Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

Sys.setlocale("LC_TIME", "English") 
datetime<-strptime(paste(power$Date,power$Time),format = "%Y-%m-%d %H:%M:%S")

plot(datetime,power$Sub_metering_1,type="n",ylab = "Energy sub metering",xlab="")

lines(datetime,power$Sub_metering_1)
lines(datetime,power$Sub_metering_2,col="red")
lines(datetime,power$Sub_metering_3,col="blue")

legend("topright",lty=1,lwd=2,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png,"plot3.png")


dev.off()