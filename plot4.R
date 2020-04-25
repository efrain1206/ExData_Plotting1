## Exploratory Data Analysis Week 1 Graded Assessment

# Only read the dates we are interested in
data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",
                   skip = 66636, nrows = 2880, col.names = c("Date","Time","Global Active Power",
                                                             "Global Reactive Power", "Voltage",
                                                             "Global Intensity", "Sub Metering 1",
                                                             "Sub Metering 2", "Sub Metering 3"))

# Convert date column to date class and time column to time class
datetime <- strptime(paste(data$Date, data$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

# Graph plot4 and save to a png file
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
with(data, {
  plot(datetime, Global.Active.Power, xlab = "", ylab = "Global Active Power", type = "l")
  plot(datetime, Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
  plot(datetime, subMetering1, ylab = "Energy sub metering", xlab = "", type = "l", col = "black")
  lines(datetime, subMetering2, ylab = "Energy sub metering", xlab = "", type = "l", col = "red")
  lines(datetime, subMetering3, ylab = "Energy sub metering", xlab = "", type = "l", col = "blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, 
         col = c("black", "red", "blue"), bty = "n")
  plot(datetime, Global.Reactive.Power, xlab = "datetime", ylab = "Global_reactive_power", 
       type = "l")
})
dev.off()