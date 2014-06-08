#Read in relevant data
file <- read.table("./data/household_power_consumption.txt", sep=";", as.is=TRUE, skip=66637, nrows=2880, col.names=c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Create DateTime variable
file$Date <- as.Date(file$Date, format="%d/%m/%Y")
file$DateTime <- paste(file$Date, file$Time)
file$DateTime <- strptime(file$DateTime, "%Y-%m-%d %H:%M:%S")

#Create plot 3 as png
png("plot3.png")
plot(x <- file$DateTime, y <- file$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab="")
lines(x <- file$DateTime, y <- file$Sub_metering_2, col="red")
lines(x <- file$DateTime, y <- file$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1)
dev.off()