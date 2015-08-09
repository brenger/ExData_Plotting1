plot2 <- function() {
		data <- read.table("household_power_consumption.txt", header=TRUE,sep=";",colClasses="character")
		d <-data[data[,1] == "1/2/2007" | data[,1] == "2/2/2007" ,c(1,2,3,4,5,6,7,8,9)]
		d$dateTime <- strptime(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S") 
		with(d, plot(dateTime, as.numeric(Global_active_power), type="l", col="black", xlab="", ylab="Global Active Power(kilowatts)"))
		dev.copy(png, file = "plot2.png",width=480,height=480)
		dev.off() 
}