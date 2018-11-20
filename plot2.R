library(readr)
library(lubridate)
library(dplyr)
file <- "household_power_consumption.txt"
power <- read_csv2( file = file )
power$Date <- dmy(power$Date)
power <- power %>% filter( Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

Sys.setlocale("LC_TIME", "English") 
datetime<-strptime(paste(power$Date,power$Time),format = "%Y-%m-%d %H:%M:%S")

plot(datetime,power$Global_active_power,type = "l", ylab ="Global Active Power (kilowatts)",xlab = "" )

dev.copy(png,"plot2.png")

dev.off()