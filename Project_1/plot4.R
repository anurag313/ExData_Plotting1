
mydata <- read.table("./household_power_consumption.txt", header=TRUE, sep=";"
                     , na.strings = "?", nrows= 2075259, stringsAsFactors=FALSE)

mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y")


selectiondata <- mydata[mydata$Date=="2007-02-01" | mydata$Date=="2007-02-02",
                        c(1:9)]

selectiondata$datetime <- paste(selectiondata$Date, selectiondata$Time)
selectiondata$datetime <- strptime(selectiondata$datetime, "%Y-%m-%d %H:%M:%S")

# Read the subsets to be plotted.
gapower <- selectiondata$Global_active_power
sm1 <- selectiondata$Sub_metering_1
sm2 <- selectiondata$Sub_metering_2
sm3 <- selectiondata$Sub_metering_3


png(filename="plot4.png", width=480, height=480, units="px", pointsize=12, 
    bg="white", res=NA)

par(mfrow=c(2,2))

# Plot1
plot(x=selectiondata$datetime, y=gapower, xlab="", cex.lab=0.7,
     ylab="Global Active Power (kilowatts)", type="l")

# Plot2
plot(x=selectiondata$datetime, y=selectiondata$Voltage, cex.lab=0.7,
     xlab="datetime", ylab="Voltage", type="l")

# Plot3
plot3 <- plot(x=selectiondata$datetime, sm1, col="black", type="l",
              cex.lab=0.7, ylim=range(sm1), ylab= "Energy sub metering", xlab="")
par(new=TRUE)

plot3 <- plot(x=selectiondata$datetime, sm2, col="red", xaxt="n", yaxt="n",
              type="l", cex.lab=0.7, ylim=range(sm1), ylab= "Energy sub metering", xlab="")
par(new=TRUE)
plot3 <- plot(x=selectiondata$datetime, sm3, col="blue", xaxt="n", yaxt="n", 
              type="l", cex.lab=0.7, ylim=range(sm1), ylab= "Energy sub metering", xlab="")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1), lwd=c(2.5,2.5),col=c("black","red", "blue"), cex=0.5)

# Plot4
plot(x=selectiondata$datetime, y=selectiondata$Global_reactive_power, cex.lab=0.7,
     xlab="datetime", ylab="Global_reactive_power", type="l")

# Turn graphics device off
dev.off()
