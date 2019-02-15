data <-read.csv("C:\\Users\\aabdulkhalek\\Documents\\Test\\Electric Power Consumption\\household_power_consumption.txt", sep=";", na.string="?", check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
filtered_data <-rbind(data[data$Date=="1/2/2007",],data[data$Date=="2/2/2007",])
filtered_data$Date <-as.Date(filtered_data$Date, format="%d/%m/%Y")
##hist(filtered_data$Global_active_power,col="Red", main="Global Active Power", ylab="Freq", xlab="kWh")

##png("plot1.png", height = 480, width = 480)
DT <- paste(as.Date(filtered_data$Date), filtered_data$Time)
filtered_data$DateTime <- as.POSIXct(DT)
plot(filtered_data$Global_active_power ~ filtered_data$DateTime,  type="l", xlab="", ylab="kWh")

dev.copy(png,'plot2.png', height = 480, width = 480)
dev.off()