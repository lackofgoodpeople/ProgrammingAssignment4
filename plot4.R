par(mfrow = c(2,2))

tabData <- read.table("household_power_consumption.txt", header=T, sep = ";", colClasses = "character", nrows = 70000, na.strings = "?")
tabData <- rbind(subset(tabData, Date == "1/2/2007"), subset(tabData, Date == "2/2/2007"))
datetime <- paste(tabData$Date, tabData$Time)
tabData <- cbind(tabData, datetime)
tabData$datetime = strptime(tabData$datetime, "%d/%m/%Y %H:%M:%S")

with(tabData, plot(datetime, Global_active_power, ylab = "Global Active Power", xlab = "", type = "l" ))

with(tabData, plot(datetime, Voltage, ylab = "Voltage", xlab = "datetime", type = "l" ))

with(tabData, plot(datetime, Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l", lty = 1 ))
lines(tabData$datetime, tabData$Sub_metering_2, col = "red")
lines(tabData$datetime, tabData$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), lwd = c(1.5,1.5,1.5), col = c("black","blue","red"), bty = 'n', cex = 0.5, y.intersp = 0.25, inset = 0.0025)

with(tabData, plot(datetime, Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type = "l" ))

dev.copy(png, file = "plot4.png")
dev.off()