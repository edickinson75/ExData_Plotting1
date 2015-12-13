## Load necessary R libraries.
library(data.table)
library(lubridate)

## Read household power consumption data.
hhpower <- fread("household_power_consumption.txt", na.strings = "?")

## Convert Date to date format.
hhpower$Date <- as.Date(hhpower$Date, format="%d/%m/%Y")

## Subset data to dates of interest.
hhpower_sub <- subset(hhpower, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Create DateTime variable.
hhpower_sub$DateTime <- ymd_hms(paste(hhpower_sub$Date, hhpower_sub$Time))

## Create four plots.
png("plot4.png", height=480, width=480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(hhpower_sub, {
    plot(DateTime, Global_active_power, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    plot(DateTime, Voltage, type="l", 
         ylab="Voltage (volt)", xlab="")
    plot(DateTime, Sub_metering_1, type="l",
         ylab="Energy sub metering", xlab="", col="black")
    lines(DateTime, Sub_metering_2, col="red")
    lines(DateTime, Sub_metering_3, col="blue")
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(DateTime, Global_reactive_power, type="l", 
         ylab="Global Rective Power (kilowatts)",xlab="")
})
dev.off()