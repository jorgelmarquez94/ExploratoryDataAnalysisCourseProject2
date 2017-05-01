## This first line will likely take a few seconds. Be patient!
if(!exists("NEI")){
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

subsetNEI  <- NEI[NEI$fips=="24510", ]

aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)

png('plot2.png')
x1<-barplot(height=aggregatedTotalByYear$Emissions/1000, names.arg=aggregatedTotalByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission in kilotons'),ylim=c(0,4),main=expression('Total PM'[2.5]*' emissions in Baltimore City-MD in kilotons'),col=rainbow(4))
text(x = x1, y = round(aggregatedTotalByYear$Emissions/1000,2), label = round(aggregatedTotalByYear$Emissions/1000,2), pos = 3, cex = 0.8, col = "black")
dev.off()