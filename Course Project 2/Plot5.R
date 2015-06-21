
unzip("data/exdata-data-NEI_data.zip", exdir = "data" )
NEI <- readRDS("data//summarySCC_PM25.rds")
SCC <- readRDS("data//Source_Classification_Code.rds")




motorRowsFilter <- grep("motor", SCC$Short.Name, ignore.case = TRUE)
motorRowsinSCC <- SCC[motorRowsFilter, ]
motorRowsIds <- as.character(motorRowsinSCC$SCC)

NEI$SCC <- as.character(NEI$SCC)
emissionByMotor <- NEI[NEI$SCC %in% motorRowsIds, ]
dataBaltimore <- emissionByMotor[which(emissionByMotor$fips == "24510"), ]

emissionByYearBaltimore <- with(dataBaltimore, aggregate(Emissions, by = list(year), sum))


plot(emissionByYearBaltimore, type = "o", ylab = expression("PM"[2.5]), 
     xlab = "Year", main = "Emissions from Motor Vehicles in Baltimore")

dev.copy(png, file = "Plot5.png", height=480, width=480) 

dev.off()