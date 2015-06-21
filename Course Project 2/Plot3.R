library(ggplot2)
unzip("data/exdata-data-NEI_data.zip", exdir = "data" )
NEI <- readRDS("data//summarySCC_PM25.rds")
SCC <- readRDS("data//Source_Classification_Code.rds")

dataBaltimore <- NEI[which(NEI$fips == "24510"), ]
emissionOnBaltimoreBytype <- ddply(dataBaltimore, .(type, year), summarize, Emissions = sum(Emissions))
emissionOnBaltimoreBytype$Pollutant_Type <- emissionOnBaltimoreBytype$type

qplot(year, Emissions, data = emissionOnBaltimoreBytype, group = Pollutant_Type, color = Pollutant_Type, 
      geom = c("point", "line"), ylab = expression("PM"[2.5]), 
      xlab = "Year", main = "Total Emissions in Baltimore by Type ")


dev.copy(png, file = "Plot3.png", height=480, width=480) 

dev.off()