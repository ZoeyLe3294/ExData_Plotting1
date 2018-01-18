##load text file and read as character
data=read.table("household_power_consumption.txt",header = TRUE,sep=";",stringsAsFactors = FALSE)

##get the subset data from on 1/2/2007 and 2/2/2007
data=data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]

##create new column with format Date for convenience
data$DateTime=strptime(paste(data$Date,data$Time),format = "%d/%m/%Y %H:%M:%S")
##update format of those with value measurement to be numeric
for (i in 3:8){
  data[,i]=as.numeric(data[,i])
}


##plots of all measurement variables vs Time and format the plot as required
##create png file for the plot
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(data$DateTime,data$Global_active_power,type = "l",ylab="Global Active Power",xlab="")
plot(data$DateTime,data$Voltage,type = "l",ylab="Voltage",xlab="datetime")
plot(data$DateTime, data$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
plot(data$DateTime,data$Global_reactive_power,type = "l",ylab="Global Reactive Power",xlab="datetime")
dev.off()
