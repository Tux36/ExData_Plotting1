# Plot 2
require(readr)

#Getting full dataset
repo <- read.csv("/home/tux/household_power_consumption.txt", header = T, sep = ';', na.strings = "?", nrows = 2075259, check.names = F, stringsAsFactors = F, comment.char = "", quote = '\"')
repo$Date <- as.Date(repo$Date, format = "%d/%m/%Y")

#Subsetting the data
data <- subset(repo, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(repo)

#Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

#Generating Plot 2
png(filename = "plot2.png", width = 480, height = 480)
plot(data$Global_active_power ~ data$Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
