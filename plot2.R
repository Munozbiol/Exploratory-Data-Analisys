## Read the corresponding files 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Baltimore emissions subset 
Baltimore_emissions <- subset(NEI, fips == "24510")
Balti_by_years <- tapply(Baltimore_emissions$Emissions, Baltimore_emissions$year, sum)

#Plotting 
png("plot2.png")
barplot(Balti_by_years/1000, col = c("black", "red","green", "blue"), xlab = "Years", ylab = "PM2.5 Emissions (millions of tons)", ylim = c(0,3.5), main = "PM2.5 Emissions in Baltimore")
dev.off()