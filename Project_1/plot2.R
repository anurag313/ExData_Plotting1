mydata <- read.table("household_power_consumption.txt", sep=";",
                     header=T,stringsAsFactor=F, na.strings="?")

mydata$DateTime <- strptime(paste(mydata$Date, mydata$Time),
                            format="%d/%m/%Y %H:%M:%S")

subdata <- subset(mydata, Date == "1/2/2007" | Date == "2/2/2007")
yaxisdata <- as.numeric(subdata$Global_active_power)
xaxisdata=seq(from = as.POSIXct("2007-02-01 00:00:00"), 
              to = as.POSIXct("2007-02-02 23:59:59"), by="min")
plot(x=xaxisdata, y=yaxisdata, xlab= "", 
      ylab= "Global Active Power (Kilowatts)", type ="l")