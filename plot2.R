#
# plot2.R - Exploratory Data ANalysis - Project 1
#
#Keep the power consumtion data in file "powerdata.txt" in the current dir
powerFile <- "powerdata.txt"

#Read from the file
powerData <- read.csv(powerFile, sep = ";", na.strings = c("?"))

# Filter the dates 2007-02-01 and 2007-02-02
powerData$Days <- as.Date(strptime(powerData$Date, "%d/%m/%Y"))
startDate <- as.Date(strptime("2007-02-01", "%Y-%m-%d"))
endDate <- as.Date(strptime("2007-02-02", "%Y-%m-%d"))

plotData <- powerData[ powerData$Days >= startDate & powerData$Days <= endDate , ]
rm(powerData) # release the memory

plotData$t <- strptime(paste(plotData$Date, plotData$Time), "%d/%m/%Y %H:%M:%S")

print(paste("Charting"))
png(file = "plot2.png", width = 480, height = 480, units = "px")
plot(x = plotData$t,
     y = plotData$Global_active_power,
     type = "l",
     xlab = " ",
     ylab = "Global Active Power (Kilowatts)",
     col = "black")

dev.off()
