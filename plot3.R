# don't know why, but if i use skip, the read.table won't read in the column names
power.usage = read.table('household_power_consumption.txt', header=TRUE, sep=';',
                         na.strings='?',nrows=69516, stringsAsFactors = F)

power.usage = power.usage[66637:69516,]
str(power.usage)

power.usage$DateTime = strptime(paste(power.usage$Date, power.usage$Time, sep=' '),
                                format='%d/%m/%Y %H:%M:%S')

png('plot3.png')
plot(power.usage$DateTime, power.usage$Sub_metering_1, type='n',xlab='',ylab='Energy sub metering')
lines(power.usage$DateTime, power.usage$Sub_metering_1)
lines(power.usage$DateTime, power.usage$Sub_metering_2,col='red')
lines(power.usage$DateTime, power.usage$Sub_metering_3,col='blue')
legend('topright',lty=1,col=c('black','red','blue'),
       legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
dev.off()