# Compare emissions from motor vehicle sources in Baltimore City 
# with emissions from motor vehicle sources in Los Angeles County, 
# California (fips == "06037"). Which city has seen greater changes 
# over time in motor vehicle emissions?

#Read the data into R
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

#Compute Onroad emissions for Baltimore by year
Baltems <- subset(NEI, fips == "24510")
BORs <- subset(Baltems, type == "ON-ROAD")
Btotals <- by(BORs$Emissions, BORs$year, sum)

#Compute Onroad emissions for Baltimore by year
LAems <- subset(NEI, fips == "06037")
LAORs <- subset(LAems, type == "ON-ROAD")
LAtotals <- by(LAORs$Emissions, LAORs$year, sum)

#Create a numeric class years variable 
years <- as.numeric(names(Btotals))

#Create numeric class total emissions variables for Baltimore and LA
Btotalems <- as.numeric(Btotals)
LAtotalems <- as.numeric(LAtotals)

#Create a plot of the total motor vehicle emissions by year for Baltimo re and LA
par(bg = "black", fg = "white", yaxs = "r", mfrow = c(2,2), mai = c(.3,.3,.3,.3))

plot(years, Btotalems, type = "b", main = "Baltimore",
     ylab = "Emissions from Motor Vehicle Sources", xlab = "Year", pch = 15, col = "purple", lwd = 4, 
     col.axis = "yellow", col.main = "yellow", col.lab = "yellow")

abline(h = max(Btotalems), col = "white")
abline(h = min(Btotalems), col = "white")

plot(years, LAtotalems, type = "b", main = "LA",
     ylab = "Emissions from Motor Vehicle Sources", xlab = "Year", pch = 15, col = "yellow", lwd = 4, 
     col.axis = "purple", col.main = "purple", col.lab = "purple")

abline(h = max(LAtotalems), col = "white")
abline(h = min(LAtotalems), col = "white")

boxplot(Btotalems, main = "Baltimore",
        ylab = "Emissions from Motor Vehicle Sources", col = "purple", 
        col.axis = "yellow", col.main = "yellow", col.lab = "yellow")

boxplot(LAtotalems, main = "LA",
        ylab = "Emissions from Motor Vehicle Sources", col = "yellow",
        col.axis = "purple", col.main = "purple", col.lab = "purple")

#Create a PNG file of the total motor vehicle emissions by year
png('plot6.png', width = 720, height = 480)
par(bg = "black", fg = "white", yaxs = "r", mfrow = c(2,2), mai = c(.75,.75,.75,.75))

plot(years, Btotalems, type = "b", main = "Baltimore",
     ylab = "Emissions from Motor Vehicle Sources", xlab = "Year", pch = 15, col = "purple", lwd = 4, 
     col.axis = "yellow", col.main = "yellow", col.lab = "yellow")

abline(h = max(Btotalems), col = "white")
abline(h = min(Btotalems), col = "white")

plot(years, LAtotalems, type = "b", main = "LA",
     ylab = "Emissions from Motor Vehicle Sources", xlab = "Year", pch = 15, col = "yellow", lwd = 4, 
     col.axis = "purple", col.main = "purple", col.lab = "purple")

abline(h = max(LAtotalems), col = "white")
abline(h = min(LAtotalems), col = "white")

boxplot(Btotalems, main = "Baltimore",
        ylab = "Emissions from Motor Vehicle Sources", col = "purple", 
        col.axis = "yellow", col.main = "yellow", col.lab = "yellow")

boxplot(LAtotalems, main = "LA",
        ylab = "Emissions from Motor Vehicle Sources", col = "yellow",
        col.axis = "purple", col.main = "purple", col.lab = "purple")
dev.off()
