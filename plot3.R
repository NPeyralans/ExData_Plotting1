data <- read.csv("household_power_consumption.txt", header = T, sep = ';', 
                 na.strings = "?", stringsAsFactors = F)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
date_and_time <- paste(data$Date, data$Time)
data$DateTime <- as.POSIXct(date_and_time)
png(filename = "plot3.png", width = 480, height = 480)
with(data, {
  plot(Sub_metering_1 ~ DateTime, type = "l", 
       ylab = "Global Active Power (kilowatts)", xlab = "")
  lines(Sub_metering_2 ~ DateTime, col = 'Red')
  lines(Sub_metering_3 ~ DateTime, col = 'Blue')
})
legend("topright", col=c("black","red","blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))