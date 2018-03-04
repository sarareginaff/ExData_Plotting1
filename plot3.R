#Exploratory Data Analysis
#Course Project 1 - Plot 3
#Sara Regina Ferreira de Faria
#sarareginaff@gmail.com

#Set English as language
Sys.setlocale("LC_ALL","English")

#Read table from file
consumption <- read.table("household_power_consumption.txt",sep=";", header=TRUE)

#convert date to proper data type
consumption$Date <- as.Date(consumption$Date, format = "%d/%m/%Y")
consumption$DateTime <- strptime(paste(consumption$Date, consumption$Time), format="%Y-%m-%d %H:%M:%S")

#Select only the desired data
consumptionTwoDays <- subset(consumption, consumption$Date >= "2007-02-01" & consumption$Date <= "2007-02-02")

#Generate and save plot
png(file = "plot3.png", width=480, height=480)

plot((consumptionTwoDays$DateTime), as.numeric(as.character(consumptionTwoDays$Sub_metering_1)), type="l", ylab="Energy sub metering", xlab="", col="black")
lines((consumptionTwoDays$DateTime), as.numeric(as.character(consumptionTwoDays$Sub_metering_2)), col="red")
lines((consumptionTwoDays$DateTime), as.numeric(as.character(consumptionTwoDays$Sub_metering_3)), col="blue")
legend("topright",  lty=1, lwd=2.5, col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
