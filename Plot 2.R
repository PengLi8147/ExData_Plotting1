#####################################################################################################################################
# Coursera Project 
# Peer Graded Assignment: Exploratory Data Analysis Course Project
# Plot2.R
# Name: Peng Li
#####################################################################################################################################

# R Script starts here below:

####################################################################################################################################

# Download the zip file
rm(list = ls()) # clean up the working environment
fileurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl,destfile = "Dataset.zip")

# Read the text file into R
electric <- read.table(unz("Dataset.zip", "household_power_consumption.txt"), sep = ";", header = TRUE)

# Load the relevant R packages
library(tidyr)
library(dplyr)
library(lubridate)

electric <- tbl_df(electric) # read the data in tbl data frame format 

# Select only two dates: 2007 Feb 1st and 2007 Feb 2nd
elec_power <- filter(electric, Date == "1/2/2007" | Date == "2/2/2007" )

# Convert the Time Variable in Elec_Power in time format
elec_power$Time <- strptime(paste(elec_power$Date, elec_power$Time), "%e/%m/%Y %H:%M:%S")

# Convert the Date Variable to a Date class
elec_power$Date <- strptime(elec_power$Date, "%e/%m/%Y")
elec_power$Date <- as.Date(elec_power$Date)


# Change the class of other variables from factor to numeric
elec_power$Global_active_power <- as.numeric(levels(elec_power$Global_active_power))[elec_power$Global_active_power]
elec_power$Global_reactive_power <- as.numeric(levels(elec_power$Global_reactive_power))[elec_power$Global_reactive_power]
elec_power$Voltage <- as.numeric(levels(elec_power$Voltage))[elec_power$Voltage]
elec_power$Global_intensity <- as.numeric(levels(elec_power$Global_intensity))[elec_power$Global_intensity]
elec_power$Sub_metering_1 <- as.numeric(levels(elec_power$Sub_metering_1))[elec_power$Sub_metering_1]
elec_power$Sub_metering_2 <- as.numeric(levels(elec_power$Sub_metering_2))[elec_power$Sub_metering_2]
elec_power$Sub_metering_3 <- as.numeric(levels(elec_power$Sub_metering_3))[elec_power$Sub_metering_3]


# Load the "grDevices" R Package so as to save the plotted PNG graph to local directory
require(grDevices)
library(grDevices)

### Ready to make the plots of the variables 


# Plot 2

# plot the Global active power for the two-day period 
png(filename = "Plot 2.png", width = 480, height = 480, units = "px")
plot(elec_power$Time, elec_power$Global_active_power, type = "l", ylab = "Global Active Power (Kilowatts)", xlab = "")
dev.off()




