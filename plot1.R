library(readr)
library(lubridate)
library(dplyr)
file <- "household_power_consumption.txt"
power <- read_csv2( file = file )
power$Date <- dmy(power$Date)
power <- power %>% filter( Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

hist(as.numeric(power$Global_active_power),main="Global Active Power",col ="red",xlab = "Global Active Power (kilowatts)")
dev.copy(png,"plot1.png")
dev.off()