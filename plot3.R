data_all<-read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
data_work<-subset(data_all, Date %in% c("1/2/2007","2/2/2007"))
data_work$Date <- as.Date(data_work$Date, format="%d/%m/%Y")

datetime <- paste(as.Date(data_work$Date), data_work$Time)
data_work$datetime <- as.POSIXct(datetime)

png(filename = "plot3.png", width = 480, height = 480, pointsize = 12, bg = "white",  res = NA)

with(data_work, plot(datetime,Sub_metering_1, type="l", ylab="Energy Submetering", xlab=""))
with(data_work, lines(datetime,Sub_metering_2, type="l", col="red"))
with(data_work, lines(datetime,Sub_metering_3, type="l",col="blue" ))
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, lwd=2.5,col=c("black", "red", "blue"))


dev.off()
