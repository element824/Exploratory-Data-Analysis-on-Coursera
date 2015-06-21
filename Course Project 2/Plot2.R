
unzip("data/exdata-data-NEI_data.zip", exdir = "data" )
NEI <- readRDS("data//summarySCC_PM25.rds")
SCC <- readRDS("data//Source_Classification_Code.rds")


#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
#from 1999 to 2008? Use the base plotting system to make a plot answering this question.

dataBaltimore <- NEI[which(NEI$fips == "24510"), ]
emissionByYearBaltimore <- with(dataBaltimore, aggregate(Emissions, by = list(year), sum))


plot(emissionByYearBaltimore, type = "o", ylab = expression("PM"[2.5]), 
     xlab = "Year", main = "Total Emissions in the Baltimore City")

dev.copy(png, file = "Plot2.png", height=480, width=480) 

dev.off()