## This first line will likely take a few seconds. Be patient!
if(!exists("NEI")){
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
# for each of the years 1999, 2002, 2005, and 2008.

aggregatedTotalByYear <- aggregate(Emissions ~ year, NEI, sum)

png('plot1.png')
x1<-barplot(height=aggregatedTotalByYear$Emissions/1000, names.arg=aggregatedTotalByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission in kilotons'),ylim=c(0,8000),main=expression('Total PM'[2.5]*' emissions at various years'),col=rainbow(4))
text(x = x1, y = round(aggregatedTotalByYear$Emissions/1000,2), label = round(aggregatedTotalByYear$Emissions/1000,2), pos = 3, cex = 0.8, col = "black")
dev.off()