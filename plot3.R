# Of the four types of sources indicated by the type 
# (point, nonpoint, onroad, nonroad) variable, which of 
# these four sources have seen decreases in emissions from 
# 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

# Read the data into R
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

# Load the ggplot2 library
library(ggplot2)

# Subset Baltimore
Baltems <- subset(NEI, fips == "24510")


ggplot(data = Baltems, aes(x = year, y = log10(Emissions))) + 
  facet_grid(. ~ type) +
  guides(fill=FALSE) +
  geom_point(aes(fill=type, col = year, alpha = 0.1)) + 
  ylab("Log10 of PM2.5 Emissions") + 
  xlab("Year") + 
  ggtitle("Emissions by Type in Baltimore") +
  geom_smooth(method = lm)
  
png('plot3.png', width=640, height=480)
ggplot(data = Baltems, aes(x = year, y = log10(Emissions))) + 
  facet_grid(. ~ type) +
  guides(fill=FALSE) +
  geom_point(aes(fill=type, col = year, alpha = 0.1)) + 
  ylab("Log10 of PM2.5 Emissions") + 
  xlab("Year") + 
  ggtitle("Emissions by Type in Baltimore") +
  geom_smooth(method = lm)
dev.off()


