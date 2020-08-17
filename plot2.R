## plot2 -- Line graph with x = Day, y = Global Active Power

tabData <- read.table("household_power_consumption.txt", header=T, sep = ";", colClasses = "character", nrows = 70000, na.strings = "?")
tabData <- rbind(subset(tabData, Date == "1/2/2007"), subset(tabData, Date == "2/2/2007"))
datetime <- paste(tabData$Date, tabData$Time)
tabData <- cbind(tabData, datetime)
tabData$datetime = strptime(tabData$datetime, "%d/%m/%Y %H:%M:%S")
with(tabData, plot(datetime, Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l" ))
dev.copy(png, file = "plot2.png")
dev.off()