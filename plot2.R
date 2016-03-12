data <- read.csv("household_power_consumption.txt", header = T, sep = ';', 
                 na.strings = "?", stringsAsFactors = F)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
date_and_time <- paste(data$Date, data$Time)
data$DateTime <- as.POSIXct(date_and_time)
png(filename = "plot2.png", width = 480, height = 480)
with(data, plot(Global_active_power ~ DateTime, 
                 type = "l", ylab = "Global Active Power (kilowatts)", xlab=""))