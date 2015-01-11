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
## them to a date/time variable.
## Add the date_time to the data frame for easier plotting.
date_time <- paste(as.character(data$Date),as.character(data$Time))
date_time <- strptime(date_time,'%e/%m/%Y %T')
data$datetime <- date_time

png(file='plot4.png', width=480, height=480)

## Initialize a 2x2 plot area by row.
par(mfrow=c(2,2))

## Plot the 4 required plots, using the fact that 'datetime' is now a variable
## in the 'data' data frame.
with(data, {
    plot(datetime, Global_active_power,xlab='',ylab='Global Active Power',
         type='l')
    plot(datetime, Voltage, type='l')
    plot(date_time, data$Sub_metering_1,type='l',xlab='',
         ylab='Energy sub metering')
    lines(date_time, data$Sub_metering_2,col='red')
    lines(date_time, data$Sub_metering_3, col='blue')
    legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
           lwd=c(1,1,1),col=c('black','red','blue'), bty='n')
    plot(datetime, Global_reactive_power, type='l')
})
dev.off()