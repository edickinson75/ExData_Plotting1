## Load necessary R libraries.
library(data.table)

## Read household power consumption data.
hhpower <- fread("household_power_consumption.txt", na.strings = "?")

## Convert Date to date format.
hhpower$Date <- as.Date(hhpower$Date, format="%d/%m/%Y")

## Subset data to dates of interest.
hhpower_sub <- subset(hhpower, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Create histogram of global active power & save as .png file
png("plot1.png", height=480, width=480)
hist(hhpower_sub$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")
dev.off()