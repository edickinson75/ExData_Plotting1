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

## Create plot of global active power(y-axis) by day(x-axis).
png("plot2.png", height=480, width=480)
plot(hhpower_sub$DateTime, hhpower_sub$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()