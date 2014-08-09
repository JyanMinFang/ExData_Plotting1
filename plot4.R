# don't know why, but if i use skip, the read.table won't read in the column names
power.usage = read.table('household_power_consumption.txt', header=TRUE, sep=';',
                         na.strings='?',nrows=69516, stringsAsFactors = F)

power.usage = power.usage[66637:69516,]
str(power.usage)

power.usage$datetime = strptime(paste(power.usage$Date, power.usage$Time, sep=' '),
                                format='%d/%m/%Y %H:%M:%S')

par(mfrow=c(2,2), cex.lab=0.75,cex.axis=0.75)

# top left plot
with(power.usage,plot(datetime,Global_active_power,type='l',xlab='',ylab='Global Active Power'))

# top right plot
with(power.usage,plot(datetime,Voltage,type='l',xlab='datetime'))

# lower left plot
with(power.usage,plot(datetime, Sub_metering_1, type='n',xlab='',ylab='Energy sub metering'))
with(power.usage,lines(datetime, Sub_metering_1))
with(power.usage,lines(datetime, Sub_metering_2,col='red'))
with(power.usage,lines(datetime, Sub_metering_3,col='blue'))
legend('topright',lty=1,col=c('black','red','blue'), bty='n', cex=0.75,pt.cex=1,inset=0.05,
       legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3')) # bty='n' to remove legned border

# lower right plot
with(power.usage,plot(datetime,Global_reactive_power,type='l',xlab='datetime'))

dev.copy(png, 'plot4.png')
dev.off()
