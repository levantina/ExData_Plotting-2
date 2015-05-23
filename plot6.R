# Question 6: Compare emissions from motor vehicle sources in Baltimore City with 
# emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

# Loading datasets from local folder (remove "#" below if needed)
# NEI <- readRDS("NEI_data/summarySCC_PM25.rds")
# SCC <- readRDS("NEI_data/Source_Classification_Code.rds")

# Subset NEI data according to vehicles
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC, ]

# Subset vehicles NEI according to cities: Baltimore (BC) and Los Angeles (LA)
vehiclesBC <- vehiclesNEI[vehiclesNEI$fips == "24510", ]
vehiclesBC$city <- "Baltimore City"
vehiclesLA <- vehiclesNEI[vehiclesNEI$fips == "06037", ]
vehiclesLA$city <- "Los Angeles County"

# Put subsets in one dataframe
dataVehicles <- rbind(vehiclesBC, vehiclesLA)

png("plot6.png", width = 480, height = 480)

library(ggplot2)

p <- ggplot(dataVehicles, aes(x = factor(year), y = Emissions, fill = city)) +
      geom_bar(aes(fill = city), stat = "identity") +
      facet_grid(scales = "free", space = "free", .~city) +
      guides(fill = FALSE) + theme_bw() +
      labs(x= "year", y = expression("Total PM"[2.5]*" Emission (KTons)")) + 
      labs(title= expression("PM"[2.5]*" Motor Vehicle Source Emissions from 1999 to 2008"))

print(p)

dev.off()
