

data_all<-read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
data_work<-subset(data_all, Date %in% c("1/2/2007","2/2/2007"))
data_work$Date <- as.Date(data_work$Date, format="%d/%m/%Y")

png(filename = "plot1.png", width = 480, height = 480, pointsize = 12, bg = "white",  res = NA)

hist(data_work$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power(kilowatts)", ylab="Frequency")

dev.off()

