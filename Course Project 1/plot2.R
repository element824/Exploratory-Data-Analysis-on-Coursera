
#plot2.R
install.packages("sqldf", dependencies = TRUE)
library("sqldf")

#LoadDataSet
newdataset<- read.csv.sql("household_power_consumption.txt", sep = ";", sql = "select * from file where Date = '2/2/2007' or Date = '1/2/2007' ", eol = "\n")

datetime <- paste(as.Date(newdataset$Date,format = "%d/%m/%Y"), newdataset$Time)
newdataset$Datetime <- as.POSIXct(datetime)

par(mfcol = c(1,1))
plot(newdataset$Global_active_power~newdataset$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file = "plot2.png", height=480, width=480)  
dev.off()