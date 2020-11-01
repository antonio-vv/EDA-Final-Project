# Plot 5
library(ggplot2)
head(SCC)
ind <- grepl('Vehicles', SCC$Short.Name)
cods = SCC$SCC[ind]
head(NEI)
graph_data = NEI %>% filter(SCC %in% cods, fips == "24510") %>% group_by(year) %>% summarise(total = sum(Emissions))

png(filename = "plot5.png", width = 480, height = 480)
qplot(year, total, data = graph_data, geom = "path", main = "Emissions of PM2.5 of Motor Vehicles for Baltimore")
dev.off()
