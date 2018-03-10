###########################################################################################
##
## Coursera Course: Exploratory Data Analysis
## Week 1:          Project Assignment
## Student:         Gilles Bosc
##
## Script contents: R Commands used to work with the Household Power Consumption dataset
##
###########################################################################################

## Step 1: Clicked on the link on the Coursera Instruction webpage,
##         downloaded the dataset, then unzipped it.
##
## Here is the link to the dataset.
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

## Navigated to the proper working directory, then...
## Step 2: Read the dataset into R.

hpowercon <- read.table("household_power_consumption.txt", sep=";", header=TRUE, dec=".")

## Step 3: Reduce the size of the dataset. Only keep the measures for 
##         Dates = 2007-02-01 and 2007-02-02

hpowercon <- subset(hpowercon, Date == "1/2/2007" | Date == "2/2/2007")

## Step 3: Convert the various columns to more appropriate data formats

## Convert the 'Global_active_power', 'Global_reactive_power', 'Voltage',
## 'Global_intensity', 'Sub_metering_1', and 'Sub_metering_2' columns to numeric.
hpowercon$Global_active_power <- as.numeric(paste(hpowercon$Global_active_power))
hpowercon$Global_reactive_power <- as.numeric(paste(hpowercon$Global_reactive_power))
hpowercon$Voltage <- as.numeric(paste(hpowercon$Voltage))
hpowercon$Global_intensity <- as.numeric(paste(hpowercon$Global_intensity))
hpowercon$Sub_metering_1 <- as.numeric(paste(hpowercon$Sub_metering_1))
hpowercon$Sub_metering_2 <- as.numeric(paste(hpowercon$Sub_metering_2))

## Create a new column in the dataset which is a the date and time combined.

DateTime <- strptime(paste(hpowercon$Date, hpowercon$Time), "%d/%m/%Y %H:%M:%S")
hpowercon <- cbind(hpowercon, DateTime)


#################################################
## Create plot #3, save to file device = PNG
#################################################

png(filename="plot3.png", width = 480, height = 480)

with(hpowercon, plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
lines(hpowercon$DateTime, hpowercon$Sub_metering_2, type="l", col="red")
lines(hpowercon$DateTime, hpowercon$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, lwd=2, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()

