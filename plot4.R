#Loading Data

data <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
head(data)
str(data)

#Subsetting Data

sub <- subset(data, Date == "1/2/2007" | Date =="2/2/2007")

#Joining Data and Time coloum and adding

FullTimeDate <- strptime(paste(sub$Date, sub$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")
sub <- cbind(sub, FullTimeDate)
str(sub)

#Plotting data

png("plot4.png", width=480, height=480)

#Setting rows and coloums for graphs

par(mfrow = c(2, 2)) 

#Plotting first grapg

plot(sub$FullTimeDate, sub$Global_active_power, type="l", xlab="", ylab="Global Active Power")

#Plotting second graph

plot(sub$FullTimeDate, sub$Voltage, type = "l", xlab="datetime", ylab="Voltage")

#Plotting third graph

plot(sub$FullTimeDate, sub$Sub_metering_1, type="l", xlab="Day", ylab="Energy sub metering")
lines(sub$FullTimeDate, sub$Sub_metering_2,type="l", col= "red")
lines(sub$FullTimeDate, sub$Sub_metering_3,type="l", col= "blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))

##Plotting fourth graph

plot(sub$FullTimeDate, sub$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

