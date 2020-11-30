### Read the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

### Plot3
library(ggplot2)
data <- aggregate(Emissions ~ year + type, balt, sum)

# plotting
g <- ggplot(data, aes(year, Emissions, color = type))
g + geom_line() +
  xlab("Year") +
  ylab(expression("Total PM"[2.5]*" Emissions")) +
  ggtitle("Total Emissions per type in Baltimore")
png("plot3.png", width = 700, height = 400)
dev.off()