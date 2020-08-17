## plot1 -- Frequency Histogram with x = Global Active Power

tabData <- read.table("household_power_consumption.txt", header=T, sep = ";", colClasses = "character", nrows = 70000)
tabData <- rbind(subset(tabData, Date == "1/2/2007"), subset(tabData, Date == "2/2/2007"))
with(tabData, hist(as.numeric(Global_active_power), freq = T, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))
dev.copy(png, file = "plot1.png")
