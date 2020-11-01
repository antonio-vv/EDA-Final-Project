# Plot 3
head(NEI)
pm25_total = NEI %>% filter(fips == "24510") %>% group_by(year, type) %>% summarise(total = sum(Emissions))
library(ggplot2)

png(filename = "plot3.png", width = 480, height = 480)
qplot(year, total, data = pm25_total, facets = .~type, main = "Sources of Emissions of PM2.5 for Baltimore")
dev.off()
