# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
# for each of the years 1999, 2002, 2005, and 2008.

#Read the data into R
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

#Compute total emissions by year
totals <- by(NEI$Emissions, NEI$year, sum)

#Create a numeric class years variable 
years <- as.numeric(names(totals))

#Create a numeric class total emissions variable
totalems <- as.numeric(totals)

#Plot the total emissions by year
plot1 <- plot(years, totalems, type = "b", main = "P25 Emissions by Year",
     ylab = "P25 Emissions", xlab = "Year", pch = 8, col = "red", 
     col.axis = "darkblue", col.main = "darkblue", col.lab = "darkblue")

#Create a PNG file of the total emissions by year
png('plot1.png')
plot(years, totalems, type = "b", main = "P25 Emissions by Year",
     ylab = "P25 Emissions", xlab = "Year", pch = 8, col = "red", 
     col.axis = "darkblue", col.main = "darkblue", col.lab = "darkblue")
dev.off()