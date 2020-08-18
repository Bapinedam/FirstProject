setwd("C:/Users/Usuario/Desktop/Data science/John Hopkins University Course/4. Exploratory Data Analysis/First project")
data <- read.csv2("household_power_consumption.txt")
head(data)
data

# We will only be using data from the dates 2007-02-01 and 2007-02-02. 
# One alternative is to read the data from just those dates 
# rather than reading in the entire dataset and subsetting to those dates.

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
class(data$Date)
data$Voltage <- as.numeric(data$Voltage)
summary(data$Voltage)
data2 <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")



# Comodin 1

data2$Dia <- format(data2$Date, "%a")
comodin1 <- data2[data2$Dia == "jue.", ]
plot(comodin1$Time, comodin1$Global_active_power, type = "l")

#

## Plot 2

data2$dia <- paste(data2$Date, data2$Time, sep = " ")
data2$dia <- strptime(data2$dia, format = "%Y-%m-%d %H:%M:%S")
class(data2$dia)

plot(data2$dia, data2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, "plot2.png")
dev.off()
