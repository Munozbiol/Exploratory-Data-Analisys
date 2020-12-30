## Read the corresponding files 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Make the sum of the two variables 
Total_emissions <- tapply(NEI$Emissions, NEI$year, sum)

#Plotting 
png("plot1.png")
barplot(Total_emissions/1000000, col= c("green", "red", "blue", "black"), xlab = "Year", ylab = "PM2.5 Emissions (millions of tons)", main = "Total PM2.5 Emissions in US by Year", ylim = c(0,8))
dev.off()
