## Download and unzip the data file.
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip',
              destfile='household_power_consumption.zip')
unzip('household_power_consumption.zip')

## Read all the data at once. Then subset the data to only include the
## required observations.
data <- read.table('household_power_consumption.txt', header=TRUE,sep=';',
                   na.strings='?')
data <- subset(data, xor(Date=='1/2/2007',Date=='2/2/2007'))

## Open a .png file with the correct size and create the plot.
## Finally close the file.
png(file='plot1.png',width=480,height=480)
hist(data$Global_active_power, xlab='Global Active Power (kilowatts)',
     col='red', main='Global Active Power')
dev.off()

