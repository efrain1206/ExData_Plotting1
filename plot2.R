## Exploratory Data Analysis Week 1 Graded Assessment

# Only read the dates we are interested in
data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",
                   skip = 66636, nrows = 2880, col.names = c("Date","Time","Global Active Power",
                                                             "Global Reactive Power", "Voltage",
                                                             "Global Intensity", "Sub Metering 1",
                                                             "Sub Metering 2", "Sub Metering 3"))

# Convert date column to date class and time column to time class
datetime <- strptime(paste(data$Date, data$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

# Make sure to convert Global Active Power to numeric if it is not already
globalActivePower <- as.numeric(data$Global.Active.Power)

# Graph plot2 and save to a png file
png("plot2.png", width = 480, height = 480)
plot(datetime, globalActivePower, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")
dev.off()
