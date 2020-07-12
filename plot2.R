data_all<-read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
data_work<-subset(data_all, Date %in% c("1/2/2007","2/2/2007"))
data_work$Date <- as.Date(data_work$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data_work$Date), data_work$Time)
data_work$datetime <- as.POSIXct(datetime)


png(filename = "plot2.png", width = 480, height = 480, pointsize = 12, bg = "white",  res = NA)

with(data_work, plot(Global_active_power~datetime, type="l",ylab="Global Active Power (kilowatts)", xlab=""))

dev.off()
