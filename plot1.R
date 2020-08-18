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

## Plot 1

data2$Global_active_power <-  as.numeric(data2$Global_active_power)
hist(data2$Global_active_power, xlab = "Global Active Power (kilowatts)", 
      main = "Global Active Power", col = "red", ylim = c(0, 1200))

dev.copy(png, file = "plot1.png")
dev.off()
