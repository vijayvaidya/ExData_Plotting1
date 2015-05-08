#
# plot1.R - Exploratory Data ANalysis - Project 1
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

png(file = "plot1.png", width = 480, height = 480, units = "px")
hist(plotData$Global_active_power, main = "Global Active Power",  xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()

