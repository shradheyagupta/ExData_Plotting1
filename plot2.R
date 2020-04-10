#Load Data

data <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
head(data)
str(data)

#Subsetting Data

sub <- subset(data, Date == "1/2/2007" | Date =="2/2/2007")

#Joining Data and Time coloum and adding

FullTimeDate <- strptime(paste(sub$Date, sub$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")
sub <- cbind(sub, FullTimeDate)
str(sub)

#Plotting Data

png("plot2.png", width=480, height=480)
plot(y = sub$Global_active_power, x = sub$FullTimeDate, type="l", xlab="Day", ylab="Global Active Power (kilowatts)")
dev.off()