
#plot4.R
install.packages("sqldf", dependencies = TRUE)
library("sqldf")

#LoadDataSet
newdataset<- read.csv.sql("household_power_consumption.txt", sep = ";", sql = "select * from file where Date = '2/2/2007' or Date = '1/2/2007' ", eol = "\n")

datetime <- paste(as.Date(newdataset$Date,format = "%d/%m/%Y"), newdataset$Time)
newdataset$Datetime <- as.POSIXct(datetime)

par(mfcol = c(2,2))

#1,1
plot(newdataset$Global_active_power~newdataset$Datetime, type="l",
     ylab="Global Active Power", xlab="")

#2,1
with(newdataset, {
  plot(Sub_metering_1~Datetime, type="l",
       xlab="", ylab="Energy sub metering")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#1,2
with(newdataset, plot(Voltage~Datetime, type="l",
       xlab="datetime", ylab="Voltage"))

#2,2
with(newdataset, plot(Global_reactive_power~Datetime, type="l",
                      xlab="datetime", ylab="Global_reactive_power"))

dev.copy(png, file = "plot4.png", height=480, width=480) 
dev.off()