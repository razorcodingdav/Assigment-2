#Library
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# summing emission data per year
totalEmissions <- tapply(NEI$Emissions, NEI$year, sum)

# plotting
barplot(totalEmissions, xlab = "Year", ylab = "Total Emission (ton)", 
        main = "Total Emission per year")

png("plot1.png")
dev.off()


