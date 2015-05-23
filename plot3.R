# Question 3: Of the four types of sources indicated by the type 
# (point, nonpoint, onroad, nonroad) variable, which of these four sources have 
# seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen 
# increases in emissions from 1999–2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

# Loading datasets from local folder (remove "#" below if needed)
# NEI <- readRDS("NEI_data/summarySCC_PM25.rds")
# SCC <- readRDS("NEI_data/Source_Classification_Code.rds")

library(ggplot2)

BC  <- subset(NEI, fips == "24510")
pm <- aggregate(BC[c("Emissions")], list(type = BC$type, year = BC$year), sum)


png("plot3.png", width=480, height=480)
p <- ggplot(pm, aes(x = year, y = Emissions, colour = type)) +
      geom_point(alpha=.3) +
      geom_smooth(alpha=.2, size=1, method="loess") +
      ggtitle(expression("Total Emissions of PM"[2.5]*" by Type in Baltimore City"))

print(p)

dev.off()