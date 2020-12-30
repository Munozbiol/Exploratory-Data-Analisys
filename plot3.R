## Read the corresponding files 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#four type of sources in Baltimore 
Baltimore_emissions <- subset(NEI, fips == "24510")
Baltimore4sources <- aggregate(Emissions~year + type, data = Baltimore_emissions, sum)

#plotting
library(ggplot2)
png("plot3.png")
BaltiPlot <- ggplot(Baltimore4sources, aes(x=year, y=Emissions, fill=type)) + 
        geom_bar(stat = "identity") + facet_grid(.~ type) +
        ggtitle("Total PM2.5 Emissions in Baltimore by Year and Type")
print(BaltiPlot)
dev.off()