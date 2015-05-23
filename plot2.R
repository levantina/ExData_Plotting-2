# Question 2: Have total emissions from PM2.5 decreased in the Baltimore City, 
# Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

# Loading datasets from local folder (remove "#" below if needed)
# NEI <- readRDS("NEI_data/summarySCC_PM25.rds")
# SCC <- readRDS("NEI_data/Source_Classification_Code.rds")

# Subsetting data (two years in one data frame)
MD <- subset(NEI, fips=="24510")

# Generating graph in working directory
png(filename="plot2.png", width=480, height=480)

barplot(tapply(X=MD$Emissions, INDEX=MD$year, FUN=sum), 
        main = expression("Total Emission of PM"[2.5]*" in Baltimore City, MD"), 
        xlab = "Year", ylab = expression("PM"[2.5]), col = "darkblue")

dev.off()
