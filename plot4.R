# Across the United States, how have emissions from coal 
# combustion-related sources changed from 1999–2008?

# Read the data into R
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

# Extract coal combustion related sources
SCC.coal = SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]


# Merge data sets
merge <- merge(x=NEI, y=SCC.coal, by="SCC")

# Compute the total coal emissions by year
Esums <- by(merge$Emissions, merge$year, sum)

#Create a numeric class years variable 
years <- as.numeric(names(Esums))

#Create a numeric class total emissions for Baltimore variable
Etots <- as.numeric(Esums)

# Plot the total coal emissions by year
par(bg = "black", fg = "white", yaxs = "r")
plot1 <- plot(years, Etots, type = "b", main = "Coal Emissions by Year",
              ylab = "P25 Coal Emissions", xlab = "Year", pch = 5, col = "pink", 
              col.axis = "white", col.main = "white", col.lab = "white", bg = "black")

#Create a PNG file of the total emissions by year
png('plot4.png')
par(bg = "black", fg = "white", yaxs = "r")
plot1 <- plot(years, Etots, type = "b", main = "Coal Emissions by Year",
              ylab = "P25 Coal Emissions", xlab = "Year", pch = 5, col = "pink", 
              col.axis = "white", col.main = "white", col.lab = "white", bg = "black")
dev.off()