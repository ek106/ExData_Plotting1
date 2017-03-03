## Exploratory Data Analysis Project 1
## Plot 2

## Get data
## Data should previously have been downloaded from the Coursera Assignment page
## and saved as a .zip file

## Unzip file

unzip(zipfile = "exdata_data_household_power_consumption.zip")

## Load data

household_power <- read.table("household_power_consumption.txt", header = TRUE,
                              sep = ";")

## Subset data so only have results from 1/2/2007 and 2/2/2007

household_subset <- household_power[household_power$Date %in% c("1/2/2007", "2/2/2007"),]

## Create single timestamp from Date and Time Columns

household_subset$timestamp <- strptime(paste(household_subset$Date, household_subset$Time), "%d/%m/%Y %H:%M:%S")

## Create png file

png("plot2.png", width = 480, height = 480)

## Create line graph

plot(household_subset$timestamp, as.numeric(as.character(household_subset$Global_active_power)), 
     type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

## Close Device

dev.off()