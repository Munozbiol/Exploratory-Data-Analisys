## Read the corresponding files 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset coal emissions changed in USA 1999-2008
coal <- grepl("coal", SCC$EI.Sector, ignore.case=TRUE)
SCC_coal <- SCC[coal,]
coal_NEI <- merge(NEI, SCC_coal, by="SCC")

#get total emissions by year then save it to a data frame
coal_sum <- tapply(coal_NEI$Emissions, coal_NEI$year, sum)
coal_sum <- as.data.frame(coal_sum)
names(coal_sum)[1] <- "Emissions"
rownames(coal_sum) <- c(1:4)
coal_sum$Year <- c(1999, 2002, 2005, 2008)

#plotting
library(ggplot2)
png("plot4.png")
coal_plot <- ggplot(coal_sum, aes(x=Year, y=Emissions/100000, fill= Year))  + geom_bar(stat = "identity")
print(coal_plot)
dev.off()