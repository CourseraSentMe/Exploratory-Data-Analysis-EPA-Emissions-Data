# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
# (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

#Read the data into R
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

#Compute total emissions for Baltimore by year
Baltems <- subset(NEI, fips == "24510")
totals <- by(Baltems$Emissions, Baltems$year, sum)

#Create a numeric class years variable 
years <- as.numeric(names(totals))

#Create a numeric class total emissions for Baltimore variable
totalems <- as.numeric(totals)

#Plot the total emissions for Baltimore by year
plot1 <- plot(years, totalems, type = "b", main = "P25 Emissions in Baltimore by Year",
              ylab = "P25 Emissions in Baltimore", xlab = "Year", pch = 15, col = "gold", 
              col.axis = "maroon", col.main = "maroon", col.lab = "maroon")

#Create a PNG file of the total emissions by year
png('plot2.png')
plot1 <- plot(years, totalems, type = "b", main = "P25 Emissions in Baltimore by Year",
              ylab = "P25 Emissions in Baltimore", xlab = "Year", pch = 15, col = "gold", 
              col.axis = "maroon", col.main = "maroon", col.lab = "maroon")
dev.off()