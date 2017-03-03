## Exploratory Data Analysis Project 1
## Plot 4

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

png("plot4.png", width = 480, height = 480)

## Enable 4 Graphs on one layout

par(mfrow = c(2,2))

## Create Graph 4

## Date vs. Global Active Dower linegraph

plot(household_subset$timestamp, as.numeric(as.character(household_subset$Global_active_power)), 
     type = "l", xlab = "", ylab = "Global Active Power")

## datetime vs. Voltage linegraph

plot(household_subset$timestamp, as.numeric(as.character(household_subset$Voltage)), type = "l", xlab = "datetime", ylab = "Voltage")

## Date vs. Energy sub metering

## Outline of graph

plot(household_subset$timestamp, household_subset$Sub_metering_1, type = "n", xlab = "",
     ylab = "Energy sub metering")


## Add points for Sub metering 1-3

lines(household_subset$timestamp, as.numeric(as.character(household_subset$Sub_metering_1)))
lines(household_subset$timestamp, as.numeric(as.character(household_subset$Sub_metering_2)), col = "red")
lines(household_subset$timestamp, as.numeric(as.character(household_subset$Sub_metering_3)), col = "blue")

## Create Legend

legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.4)


## datetime vs. Global_reactive_power

plot(household_subset$timestamp, as.numeric(as.character(household_subset$Global_reactive_power)), 
     type = "l", xlab = "datetime", ylab = "Global_reactive_power")

## Close Device

dev.off()