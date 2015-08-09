plot4 <- function() {
		data <- read.table("household_power_consumption.txt", header=TRUE,sep=";",colClasses="character")
		d <-data[data[,1] == "1/2/2007" | data[,1] == "2/2/2007" ,c(1:9)]
		d$dateTime <- strptime(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S") 
		linecol<-c('black','red','blue')
		labels<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
		par(mfrow = c(2, 2))
		with(d, plot(dateTime, as.numeric(Global_active_power), type="l", col="black", xlab="", ylab="Global Active Power"))
		with(d, plot(dateTime, as.numeric(Voltage), type="l", col="black", xlab="datetime", ylab="Voltage"))
		with(d, {
				plot(dateTime,Sub_metering_1,type='l',col=linecol[1],xlab='',ylab='Energy sub metering')			
				lines(dateTime,Sub_metering_2,col=linecol[2])
				lines(dateTime,Sub_metering_3,col=linecol[3])
				legend('topright',legend=labels,col=linecol, lty='solid', bty="n", xjust=1)				
		})		
		with(d, plot(dateTime, as.numeric(Global_reactive_power), type="l", col="black", xlab="datetime", ylab="Global_reactive_power"))
		dev.copy(png, file = "plot4.png",width=480,height=480)
		dev.off() 
		}