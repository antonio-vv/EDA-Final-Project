# Plot 6
library(ggplot2)
head(SCC)
ind <- grepl('Vehicles', SCC$Short.Name)
cods = SCC$SCC[ind]
head(NEI)
graph_data = NEI %>% filter(SCC %in% cods, fips %in% c("24510", "06037")) %>% group_by(year, fips) %>%
  summarise(total = sum(Emissions)) %>% mutate(city = ifelse(fips == "24510", "Baltimore", "Los Angeles"))

png(filename = "plot6.png", width = 480, height = 480)
qplot(year, total, data = graph_data, geom = "path", facets = .~city, main = "Emissions of PM2.5 of Motor Vehicles")
dev.off()
