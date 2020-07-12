data_all<-read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
data_work<-subset(data_all, Date %in% c("1/2/2007","2/2/2007"))
data_work$Date <- as.Date(data_work$Date, format="%d/%m/%Y")

datetime <- paste(as.Date(data_work$Date), data_work$Time)
data_work$datetime <- as.POSIXct(datetime)

png(filename = "plot4.png", width = 480, height = 480, pointsize = 12, bg = "white",  res = NA)
par(mfrow=c(2,2), mar=c(5,4,2,2), oma=2)

#Graph1
with(data_work, plot(Global_active_power~datetime, type="l",ylab="Global Active Power (kilowatts)", xlab=""))

#Graph2
with(data_work, plot(Voltage~datetime, type="l",ylab="Voltage", xlab="datetime"))

#Graph3
with(data_work, plot(datetime,Sub_metering_1, type="l", ylab="Energy Submetering", xlab=""))
with(data_work, lines(datetime,Sub_metering_2, type="l", col="red"))
with(data_work, lines(datetime,Sub_metering_3, type="l",col="blue" ))
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, lwd=2.5,col=c("black", "red", "blue"))

#Graph4

with(data_work, plot(Global_reactive_power~datetime, type="l",ylab="Global_reactive_powee", xlab="datetime"))


dev.off()
