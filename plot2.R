# don't know why, but if i use skip, the read.table won't read in the column names
power.usage = read.table('household_power_consumption.txt', header=TRUE, sep=';',
                         na.strings='?',nrows=69516, stringsAsFactors = F)

power.usage = power.usage[66637:69516,]
str(power.usage)

power.usage$DateTime = strptime(paste(power.usage$Date, power.usage$Time, sep=' '),
                                format='%d/%m/%Y %H:%M:%S')


png('plot2.png')
plot(power.usage$DateTime,power.usage$Global_active_power,type='l',xlab='',ylab='Global Active Power (kilowatts)')
dev.off()