# Question 5: How have emissions from motor vehicle sources changed from 1999–2008 
# in Baltimore City?

# Loading datasets from local folder (remove "#" below if needed)
# NEI <- readRDS("NEI_data/summarySCC_PM25.rds")
# SCC <- readRDS("NEI_data/Source_Classification_Code.rds")

# Subset NEI data according to vehicles
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]

# Baltimore City Data:
vehiclesBC <- vehiclesNEI[vehiclesNEI$fips == "24510", ]

png("plot5.png", width = 480, height = 480)

library(ggplot2)

p <- ggplot(vehiclesBC, aes(factor(year), Emissions)) +
      geom_bar(stat = "identity", fill = "darkblue", width=0.80) +
      theme_bw() +  
      guides(fill = FALSE) +
      labs(x = "year", y = expression("Total PM"[2.5]*" Emission (KTons)")) + 
      labs(title = expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999 to 2008"))

print(p)

dev.off()