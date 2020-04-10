#Load Data

data <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
head(data)
str(data)

#Subsetting data

sub <- subset(data, Date == "1/2/2007" | Date =="2/2/2007")
sub$Date <- as.Date(sub$Date,format ="%d/%m/%Y")
sub$Time <- strptime(sub$Time, format = "%H:%M:%S")
str(sub)

#Plotting data on histogram

png("plot1.png", width=480, height=480)
graph <- hist(sub$Global_active_power, col = "red", xlab = "Global Active Power (Kilowatts) ", main = "Global Active Power")
dev.off()
