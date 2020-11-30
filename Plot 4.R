NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Plot 4
### Coal combustion-related emission changed over the years?
SCC.coal = SCC[(grepl(x = SCC$Short.Name, pattern = "Coal", ignore.case=TRUE)),]
NEI.coal = merge(NEI, SCC.coal, by = "SCC")

# Aggregate emissions
Emissions.coal <- aggregate(NEI.coal$Emissions, 
                            by=list(NEI.coal$year), 
                            FUN=sum)
names(Emissions.coal) = c("year","x")
Emissions.coal$group=rep("coal",nrow(Emissions.coal))

# Make the plot
barplot(totalEmissions, xlab = "Year", ylab = "Total Emission (ton)", 
        main = "Total Emission from coal sources")
png("plot4.png", width = 700, height = 400)
dev.off()