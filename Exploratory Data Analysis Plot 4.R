data <-read.csv("C:\\Users\\aabdulkhalek\\Documents\\Test\\Electric Power Consumption\\household_power_consumption.txt", sep=";", na.string="?", check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
filtered_data <-rbind(data[data$Date=="1/2/2007",],data[data$Date=="2/2/2007",])
filtered_data$Date <-as.Date(filtered_data$Date, format="%d/%m/%Y")
##hist(filtered_data$Global_active_power,col="Red", main="Global Active Power", ylab="Freq", xlab="kWh")

##png("plot1.png", height = 480, width = 480)
DT <- paste(as.Date(filtered_data$Date), filtered_data$Time)
filtered_data$DateTime <- as.POSIXct(DT)
##plot(filtered_data$Global_active_power ~ filtered_data$DateTime,  type="l", xlab="", ylab="kWh")

##with(filtered_data, {plot(Sub_metering_1~DateTime,type="l",ylab="Global Active Power",xlab="Day")
 ## lines(Sub_metering_2~DateTime,col='Red')
 ## lines(Sub_metering_3~DateTime,col='Blue')})
##legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

par(mfrow=c(2,2))
with(filtered_data, {plot(Global_active_power~DateTime, type="l", 
       ylab="kWh", xlab="")
  plot(Voltage~DateTime, type="l", 
       ylab="Volts", xlab="")
  plot(Sub_metering_1~DateTime, type="l", 
       ylab="kWh", xlab="")
  
  
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
  
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(Global_reactive_power~DateTime, type="l", 
       ylab="kWh",xlab="")
})

dev.copy(png,'plot4.png', height = 480, width = 480)
dev.off()
