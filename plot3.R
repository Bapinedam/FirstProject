setwd("C:/Users/Usuario/Desktop/Data science/John Hopkins University Course/4. Exploratory Data Analysis/First project")
data <- read.csv2("household_power_consumption.txt")
head(data)
data

# We will only be using data from the dates 2007-02-01 and 2007-02-02. 
# One alternative is to read the data from just those dates 
# rather than reading in the entire dataset and subsetting to those dates.

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Voltage <- as.numeric(data$Voltage)
data2 <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
data2$dia <- paste(data2$Date, data2$Time, sep = " ")
data2$dia <- strptime(data2$dia, format = "%Y-%m-%d %H:%M:%S")

data2$Global_active_power <- as.numeric(data2$Global_active_power)
data2$Sub_metering_1 <- as.numeric(data2$Sub_metering_1)
data2$Sub_metering_2 <- as.numeric(data2$Sub_metering_2)
data2$Sub_metering_3 <- as.numeric(data2$Sub_metering_3)

str(data2)

## Plot 3

plot(data2$dia, data2$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "n")
points(data2$dia, data2$Sub_metering_1, type = "l", col = "black")
points(data2$dia, data2$Sub_metering_2, type = "l", col = "red")
points(data2$dia, data2$Sub_metering_3, type = "l", col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), pch = "-", lwd = 3)

dev.copy(png, "plot3.png")
dev.off()
