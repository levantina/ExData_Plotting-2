# Question 4: Across the United States, how have emissions from coal combustion-related 
# sources changed from 1999–2008?

# Loading datasets from local folder (remove "#" below if needed)
# NEI <- readRDS("NEI_data/summarySCC_PM25.rds")
# SCC <- readRDS("NEI_data/Source_Classification_Code.rds")

# Subset coal combustion related data:
combustionRelated <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coalRelated <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coalCombustion <- (combustionRelated & coalRelated)
combustionSCC <- SCC[coalCombustion, ]$SCC
combustion <- NEI[NEI$SCC %in% combustionSCC, ]

png("plot4.png", width=480, height=480)

library(ggplot2)

p <- ggplot(combustion, aes(factor(year), Emissions/10^3)) +
      geom_bar(stat = "identity", fill = "darkblue", width=0.80) +
      theme_bw() +  
      guides(fill = FALSE) +
      labs(x = "year", y = expression("Total PM"[2.5]*" Emission (KTons)")) + 
      labs(title = expression("PM"[2.5]*" Coal Combustion Source Emissions - US from 1999 to 2008"))

print(p)

dev.off()
