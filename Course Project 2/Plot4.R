
unzip("data/exdata-data-NEI_data.zip", exdir = "data" )
NEI <- readRDS("data//summarySCC_PM25.rds")
SCC <- readRDS("data//Source_Classification_Code.rds")

coalRowsFilter <- grep("coal", SCC$Short.Name, ignore.case = TRUE)
coalRowsinSCC <- SCC[coalRowsFilter, ]
coalRowsIds <- as.character(coalRowsinSCC$SCC)

NEI$SCC <- as.character(NEI$SCC)
emissionByCoal <- NEI[NEI$SCC %in% coalRowsIds, ]

emissionByYearOfCoal <- with(emissionByCoal, aggregate(Emissions, by = list(year), sum))
colnames(emissionByYearOfCoal) <- c("year", "Emissions")

plot(emissionByYearOfCoal, type = "o", ylab = expression("PM"[2.5]), 
     xlab = "Year", main = "Emissions from Coal Combustion")

dev.copy(png, file = "Plot4.png", height=480, width=480) 

dev.off()