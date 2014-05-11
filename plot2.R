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

par(mar=c(4.3, 4, 1.5, 1), cex=0.85)
plot(date.time1, hpc$Global_active_power, type="l", 
    ylab = "Global Active Power (kilowatts)", xlab = "")
mtext("Plot 2", 3, adj=0, font=2)


dev.copy(png, file = "plot2.png")
dev.off()