# Plot 4
library(ggplot2)
head(SCC)
ind <- grepl('Coal', SCC$EI.Sector) & grepl('Combustion', SCC$SCC.Level.One)
cods = SCC$SCC[ind]
head(NEI)
graph_data = NEI %>% filter(SCC %in% cods) %>% group_by(year) %>% summarise(total = sum(Emissions))

png(filename = "plot4.png", width = 480, height = 480)
qplot(year, total, data = graph_data, geom = "path", main = "Emissions of PM2.5 Coal Combustion Related")
dev.off()
