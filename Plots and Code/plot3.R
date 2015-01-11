## Download and unzip the data file.
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip',
              destfile='household_power_consumption.zip')
unzip('household_power_consumption.zip')

## Read all the data at once. Then subset the data to only include the
## required observations.
data <- read.table('household_power_consumption.txt', header=TRUE,sep=';',
                   na.strings='?')
data <- subset(data, xor(Date=='1/2/2007',Date=='2/2/2007'))

## Paste character strings of the date and time together and transform
## them to a date/time variable
date_time <- paste(as.character(data$Date),as.character(data$Time))
date_time <- strptime(date_time,'%e/%m/%Y %T')

## Open a .png file to write to, and close it at the very end.
png(file='plot3.png')

## Create a single plot and add two more lines to it since the axes
## are the same anyway. Add a legend with specified names and colors.
plot(date_time, data$Sub_metering_1,type='l',xlab='',
     ylab='Energy sub metering')
lines(date_time, data$Sub_metering_2,col='red')
lines(date_time, data$Sub_metering_3, col='blue')
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       lwd=c(1,1,1),col=c('black','red','blue'))
dev.off()