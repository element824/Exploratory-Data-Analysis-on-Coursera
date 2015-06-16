#plot1.R
install.packages("sqldf", dependencies = TRUE)
library("sqldf")

#LoadDataSet
newdataset<- read.csv.sql("household_power_consumption.txt", sep = ";", sql = "select * from file where Date = '2/2/2007' or Date = '1/2/2007' ", eol = "\n")

par(mfcol = c(1,1))
hist(newdataset$Global_active_power, col="red" ,xlab = "Global Active Power (kilowatts)", main="Global Active Power")

dev.copy(png, file = "plot1.png", height=480, width=480) 
 
dev.off()