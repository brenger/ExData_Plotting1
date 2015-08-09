plot1 <- function() {
		data <- read.table("household_power_consumption.txt", header=TRUE,sep=";",colClasses="character")
		d <-data[data[,1] == "1/2/2007" | data[,1] == "2/2/2007" ,c(1:9)]
		with(d, hist(as.numeric(Global_active_power), col="red", xlab="Global Active Power(kilowatts)", main = "Global Active Power"))
		dev.copy(png, file = "plot1.png", width=480, height=480)
		dev.off() 
}