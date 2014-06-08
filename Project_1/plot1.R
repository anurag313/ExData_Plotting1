mydata <- read.table("household_power_consumption.txt", sep=";",
                     header=T,stringsAsFactor=F, na.strings="?")

mydata$DateTime <- strptime(paste(mydata$Date, mydata$Time),
                             format="%d/%m/%Y %H:%M:%S")

subdata <- subset(mydata, Date == "1/2/2007" | Date == "2/2/2007")
graphdata <- as.numeric(subdata$Global_active_power)
hist(graphdata, main = "Global Active Power",
      xlab= "Global Active Power (Kilowatts)", col="red")