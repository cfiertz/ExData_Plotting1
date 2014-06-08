#Read in relevant data
file <- read.table("./data/household_power_consumption.txt", sep=";", as.is=TRUE, skip=66637, nrows=2880, col.names=c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Create plot 1 as png
png("plot1.png")
hist(file$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
dev.off()