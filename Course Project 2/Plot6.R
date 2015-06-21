
unzip("data/exdata-data-NEI_data.zip", exdir = "data" )
NEI <- readRDS("data//summarySCC_PM25.rds")
SCC <- readRDS("data//Source_Classification_Code.rds")



motorRowsFilter <- grep("motor", SCC$Short.Name, ignore.case = TRUE)
motorRowsinSCC <- SCC[motorRowsFilter, ]
motorRowsIds <- as.character(motorRowsinSCC$SCC)

NEI$SCC <- as.character(NEI$SCC)
emissionByMotor <- NEI[NEI$SCC %in% motorRowsIds, ]
dataBaltimoreAndLosAngles <- emissionByMotor[which(emissionByMotor$fips %in% c( "24510","06037") ) ,]
library(data.table)
dataTable <- data.table(dataBaltimoreAndLosAngles)
emissionByYear <- dataTable[, sum(Emissions), by = c("year","fips")]

colnames(emissionByYear) <- c("year", "fips", "Emissions")

emissionByYear$County <- "NA"
emissionByYear[fips  == "24510"]$County <- "Baltimore"
emissionByYear[fips  == "06037"]$County <- "os Angeles County" 

 
qplot(year, Emissions, data = emissionByYear, group = County, color = County, 
      geom = c("point", "line"), ylab = expression("PM"[2.5]), 
      xlab = "Year", main = "Comparision of Motor Emisions")


dev.copy(png, file = "Plot6.png", height=480, width=480) 

dev.off()