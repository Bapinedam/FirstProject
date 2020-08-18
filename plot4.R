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
data2$Voltage <- as.numeric(data2$Voltage)
data2$Global_reactive_power <- as.numeric(data2$Global_reactive_power)

str(data2)

## Set par()


par(mfrow = c(2, 2), mar = c(4, 4, 1, 4))

## Plot 1, 1

plot(data2$dia, data2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

## Plot 1, 2

plot(data2$dia, data2$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")


## Plot 2, 1

plot(data2$dia, data2$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "n")
points(data2$dia, data2$Sub_metering_1, type = "l", col = "black")
points(data2$dia, data2$Sub_metering_2, type = "l", col = "red")
points(data2$dia, data2$Sub_metering_3, type = "l", col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1, 1, 1), bty = "n", cex = 0.8)

## Plot 2, 2

plot(data2$dia, data2$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png, "plot4.png")
dev.off()


