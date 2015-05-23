library(ggplot2)

BC  <- subset(NEI, fips == "24510")
pd <- aggregate(BC[c("Emissions")], list(type = BC$type, year = BC$year), sum)


png('plot3b.png', width=480, height=480)

p <- qplot(BC, data=pd, geom="density", fill=type, alpha=I(.5), 
      main="Distribution of Gas Milage", xlab="Miles Per Gallon", 
      ylab="Density")

print(p)

dev.off()