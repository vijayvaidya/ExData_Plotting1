#
# plot3.R - Exploratory Data ANalysis - Project 1
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
png(file = "plot4.png", width = 480, height = 480, units = "px")

par(mfrow = c(2, 2)) # four plots in two rows

#Top left corner
plot(x = plotData$t,
     y = plotData$Global_active_power,
     type = "l",
     xlab = " ",
     ylab = "Global Active Power (kilowatts)",
     col = "black")

#Top right corner
plot(x = plotData$t,
     y = plotData$Voltage,
     type = "l",
     xlab = "datatime",
     ylab = "Voltage",
     col = "black")

#Lower left 
plot(x = plotData$t,
     y = plotData$Sub_metering_1,
     type = "l",
     xlab = "datatime",
     ylab = "Energy sub metering",
     col = "black")

lines(x = plotData$t,
     y = plotData$Sub_metering_2,
     type = "l",
     col = "red")

lines(x = plotData$t,
     y = plotData$Sub_metering_3,
     type = "l",
     col = "blue")

legend("topright", pch = "_",
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
      )

#bottom right
plot(x = plotData$t,
     y = plotData$Global_reactive_power,
     type = "l",
     xlab = "datatime",
     ylab = "Global_eactive_power",
     col = "black")

dev.off()
