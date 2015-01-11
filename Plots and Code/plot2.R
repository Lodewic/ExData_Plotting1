## Assume the data to be in the working directory!

## Read all the data at once. Then subset the data to only include the
## required observations.
data <- read.table('household_power_consumption.txt', header=TRUE,sep=';',
                   na.strings='?')
data <- subset(data, xor(Date=='1/2/2007',Date=='2/2/2007'))

## Paste character strings of the date and time together and transform
## them to a date/time variable
date_time <- paste(as.character(data$Date),as.character(data$Time))
date_time <- strptime(date_time,'%e/%m/%Y %T')

## Open a .png file with the correct size and create the plot.
## Finally close the file.
png(file='plot2.png',width=480,height=480)
plot(date_time, data$Global_active_power,
     ylab='Global Active Power (kilowatts', xlab='', type='l')
dev.off()
