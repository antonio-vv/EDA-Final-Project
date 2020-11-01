# Reading Datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(dplyr)

# Plot 1
head(NEI)
pm25_total = NEI %>% group_by(year) %>% summarise(total = sum(Emissions))

png(filename = "plot1.png", width = 480, height = 480)
with(pm25_total, plot(year, total, type = "h", main = "Total PM2.5 emission per year", col = "red"))
dev.off()
