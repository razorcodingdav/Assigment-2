NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# reading and subsetting data
balt <- subset(NEI, fips == "24510")

# summing emissions per year
totalEmissions <- tapply(balt$Emissions, balt$year, sum)

# plotting
barplot(totalEmissions, xlab = "Year", ylab = "Total Emission (ton)", 
        main = "Total Emission per year in Baltimore")
png("plot2.png", width = 700, height = 400)
dev.off()
