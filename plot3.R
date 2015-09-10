##load the data
elec <- read.table("household_power_consumption.txt",header =TRUE, sep=";", as.is = TRUE)
##format all columns
elec$Time <- strptime(paste(elec$Date,elec$Time,sep =" "), "%d/%m/%Y %H:%M:%S")
elec$Date <- strptime(elec$Date, "%d/%m/%Y")
elec$Global_active_power <- as.numeric(elec$Global_active_power)
elec$Global_reactive_power <- as.numeric(elec$Global_reactive_power)
elec$Voltage <- as.numeric(elec$Voltage)
elec$Global_intensity <- as.numeric(elec$Global_intensity)
elec$Sub_metering_1 <- as.numeric(elec$Sub_metering_1)
elec$Sub_metering_2 <- as.numeric(elec$Sub_metering_2)
elec$Sub_metering_3 <- as.numeric(elec$Sub_metering_3)
##select only the period of intrests
base <- elec[(elec$Date == "2007-02-01"|elec$Date == "2007-02-02"),]
##create plot 3
plot(base$Time,base$Sub_metering_1,type="l", ylab = "Energy sub metering", xlab ="")
lines(base$Time,base$Sub_metering_2, type = "l", col = "red") 
lines(base$Time,base$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = c(1,1,1),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black", "red", "blue"))
dev.copy(png, file = "plot3.png")
dev.off()