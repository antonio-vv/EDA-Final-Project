# Plot 2
head(NEI)
pm25_total = NEI %>% filter(fips == "24510") %>% group_by(year) %>% summarise(total = sum(Emissions))

png(filename = "plot2.png", width = 480, height = 480)
with(pm25_total, plot(year, total, type = "h", main = "Total PM2.5 emission for Baltimore City", col = "red"))
dev.off()
