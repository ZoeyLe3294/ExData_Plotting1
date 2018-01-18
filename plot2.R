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

##plot of the Global Active Power vs Time and format the plot as required
##create png file for the plot
png("plot2.png", width=480, height=480)
plot(data$DateTime,data$Global_active_power,type = "l",xlab="Global Active Power(kilowatts)",ylab="",main = "Global Active Power Vs Time")
dev.off()