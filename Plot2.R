#########################################################################################################################
## Initial file Prep work for All scripts in the project.  

## set the working directory to appropriate directory for local drive.
## change the following to your local testing directory.....
setwd("C:\\Users\\andy\\Dropbox\\Andy P\\Training\\Coursera\\Data Science Certification\\Exploring Data\\Week 1\\Course Project 1")

## download and upzip raw data file if necessary
zipfile <- "./exdata-data-household_power_consumption.zip"
if(!file.exists(zipfile)){
  download.file ("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", zipfile, mode = "wb")
}

data_file <- "./household_power_consumption.txt"
if (!file.exists(data_file)){
  unzip("./exdata-data-household_power_consumption.zip")
}

##read in full table
full_file <- read.delim("./household_power_consumption.txt", header=T, sep = ";", stringsAsFactors = FALSE, na.strings = "?")

##convert Date column to POSIXlt
full_file$Date <- strptime(full_file$Date,"%d/%m/%Y")

##subset file to only dates for analysis
subset_file <- subset(full_file, Date >= "2007-02-01" & Date <= "2007-02-02")

## End of file prep work
###########################################################################################################

######## Plot 2 ###########

## View on screen
datetime <- strptime(paste(subset_file$Date, subset_file$Time, sep=" "), "%Y-%m-%d %H:%M:%S")
with(subset_file, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

##save to png
png(filename = "Plot2.png", width = 480, height = 480)
with(subset_file, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()











