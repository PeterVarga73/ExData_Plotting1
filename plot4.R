library(readr)
library(lubridate)
library(dplyr)
file <- "household_power_consumption.txt"
power <- read_csv2( file = file )
power$Date <- dmy(power$Date)
power <- power %>% filter( Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

Sys.setlocale("LC_TIME", "English") 
datetime<-strptime(paste(power$Date,power$Time),format = "%Y-%m-%d %H:%M:%S")

par(mfrow=c(2,2))

plot(datetime,power$Global_active_power,type = "l",xlab = "", ylab ="Global Active Power (kilowatts)" )

plot(datetime,power$Voltage/1000,type = "l", ylab ="Voltage")

plot(datetime,power$Sub_metering_1,type="n",ylab = "Energy sub metering",xlab="")
lines(datetime,power$Sub_metering_1)
lines(datetime,power$Sub_metering_2,col="red")
lines(datetime,power$Sub_metering_3,col="blue")
legend("topright",cex=0.5,pt.cex = 1.5,box.lty=0,bg="transparent",lty=1,lwd=4,col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


plot(datetime,power$Global_reactive_power,type="l",ylab = "Global Reactive Power")

dev.copy(png,"plot4.png")


dev.off()
 