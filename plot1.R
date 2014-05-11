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

par(mar=c(4.3, 4, 1.5, 1), cex=0.8)
hist(hpc$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "red")
mtext("Plot 1", 3, adj=0, font=2)

dev.copy(png, file = "plot1.png")
dev.off()


  