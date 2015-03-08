## Get the full data set. Put the data in in the correct format.
setwd("C:/Users/C16Augustus.Jensen/Documents/Math378/exploratoryproject1/")
data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## Use only the data that was collected between the two days in february of 2007
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Create the histogram for plot 1.
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving the file and the plot.png 
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

