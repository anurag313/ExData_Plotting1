mydata <- read.table("household_power_consumption.txt", sep=";",
                     header=T,stringsAsFactor=F, na.strings="?")

mydata$DateTime <- strptime(paste(mydata$Date, mydata$Time),
                          format="%d/%m/%Y %H:%M:%S")

subdata <- subset(mydata, Date == "1/2/2007" | Date == "2/2/2007")
yaxisdata <- as.numeric(subdata$Sub_metering_1,
                        subdata$Sub_metering_2,subdata$Sub_metering_3)
xaxisdata=seq(from = as.POSIXct("2007-02-01 00:00:00"), 
              to = as.POSIXct("2007-02-02 23:59:59"), by="min")
#plot(x=xaxisdata, y=yaxisdata, xlab= "", 
 #    ylab= "Energy sub metering", type ="l")
plot(x=xaxisdata, y= subdata$Sub_metering_1,
     xlab ="", ylab= "Energy sub metering", type = "l")
lines(x=xaxisdata,y=subdata$Sub_metering_2,type="l", col = "red")
lines(x=xaxisdata,y=subdata$Sub_metering_3,type="l",col = "blue")
legend("topright",lty= 1, col=c("black", "red", "blue"),
       legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
