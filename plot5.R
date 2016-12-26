# How have emissions from motor vehicle sources 
# changed from 1999–2008 in Baltimore City?

#Read the data into R
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

#Compute Onroad emissions for Baltimore by year
Baltems <- subset(NEI, fips == "24510")
ORs <- subset(Baltems, type == "ON-ROAD")
totals <- by(ORs$Emissions, ORs$year, sum)

#Create a numeric class years variable 
years <- as.numeric(names(totals))

#Create a numeric class total emissions for Baltimore variable
totalems <- as.numeric(totals)

#Create a plot of the total motor vehicle emissions by year
par(bg = "black", fg = "purple", yaxs = "r")
plot1 <- plot(years, totalems, type = "b", main = "Emissions from Motor Vehicle Sources in Baltimore by Year",
              ylab = "Emissions from Motor Vehicle Sources", xlab = "Year", pch = 15, col = "purple", lwd = 4, 
              col.axis = "yellow", col.main = "yellow", col.lab = "yellow")

#Create a PNG file of the total motor vehicle emissions by year
png('plot5.png')
par(bg = "black", fg = "purple", yaxs = "r")
plot1 <- plot(years, totalems, type = "b", main = "Emissions from Motor Vehicle Sources in Baltimore by Year",
              ylab = "Emissions from Motor Vehicle Sources", xlab = "Year", pch = 15, col = "purple", lwd = 4, 
              col.axis = "yellow", col.main = "yellow", col.lab = "yellow")
dev.off()
