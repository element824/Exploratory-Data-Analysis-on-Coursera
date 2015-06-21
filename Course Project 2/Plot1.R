unzip("data/exdata-data-NEI_data.zip", exdir = "data" )
NEI <- readRDS("data//summarySCC_PM25.rds")
SCC <- readRDS("data//Source_Classification_Code.rds")


##Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
##Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
##for each of the years 1999, 2002, 2005, and 2008.

emissionByYear <- with(NEI, aggregate(Emissions, by = list(year), sum))


plot(emissionByYear, type = "o", ylab = expression("PM"[2.5]), 
     xlab = "Year", main = "Total Emissions in the United States")

dev.copy(png, file = "Plot1.png", height=480, width=480) 

dev.off()