#Exploratory Data Analysis
#Course Project 1 - Plot 1
#Sara Regina Ferreira de Faria
#sarareginaff@gmail.com

#Set English as language
Sys.setlocale("LC_ALL","English")

#Read table from file
consumption <- read.table("household_power_consumption.txt",sep=";", header=TRUE)

#convert date and time to proper data type
consumption$Date <- as.Date(consumption$Date, format = "%d/%m/%Y")
consumption$DateTime <- strptime(paste(consumption$Date, consumption$Time), format="%Y-%m-%d %H:%M:%S")

#Select only the desired data
consumptionTwoDays <- subset(consumption, consumption$Date >= "2007-02-01" & consumption$Date <= "2007-02-02")

#Generate and save plot
png(file = "plot1.png", width=480, height=480)

hist(as.numeric(as.character(consumptionTwoDays$Global_active_power)), col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()
