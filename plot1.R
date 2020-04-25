## Exploratory Data Analysis Week 1 Graded Assessment

## Read in data set
# Only read the dates we are interested in
data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",
                   skip = 66636, nrows = 2880, col.names = c("Date","Time","Global Active Power",
                                                             "Global Reactive Power", "Voltage",
                                                             "Global Intensity", "Sub Metering 1",
                                                             "Sub Metering 2", "Sub Metering 3"))

# Convert date column to date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Graph plot1 and save to a png file
hist(data$Global.Active.Power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)",
     col = "orangered")
dev.copy(png, file = "plot1.png")
dev.off()