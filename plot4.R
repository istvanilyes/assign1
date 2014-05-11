# First please copy data file to the appropriate working directory
setwd ("C:\\S\\Coursera\\exploratory\\assign1")
hpc <- read.table ("household_power_consumption.txt", skip = 66637, nrow = 2880,
                   sep = ";",  na.strings  = "?",
                   col.names = colnames(read.table("household_power_consumption.txt",
                                                   nrow = 1, header = TRUE, sep=";")
                   )
) 

for( i in 1:2) {
  hpc[, i] <- as.character(hpc[, i])
}

date.time <- paste(hpc$Date, hpc$Time)
date.time1 <- strptime(date.time, "%d/%m/%Y %H:%M:%S")



par(mfcol=c(2, 2), mar=c(4.3, 4, 2, 1), cex=0.8)

#1
plot(date.time1, hpc$Global_active_power, type="l", 
     ylab = "Global Active Power (kilowatts)", xlab = "")

mtext("Plot 4", 3, adj=0, font=2)

#2
plot(date.time1, hpc$Sub_metering_1, type="l", 
     ylab = "Energy sub metering", xlab = "")
lines(date.time1, hpc$Sub_metering_2, type="l", col = "red")
lines(date.time1, hpc$Sub_metering_3, type="l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.5)
#3
plot(date.time1, hpc$Voltage, type="l", 
     ylab = "Voltage", xlab = "datetime")
#4
plot(date.time1, hpc$Global_reactive_power, type="l", 
     ylab = "Global_reactive_power", xlab = "datetime")




dev.copy(png, file = "plot4.png")
dev.off()