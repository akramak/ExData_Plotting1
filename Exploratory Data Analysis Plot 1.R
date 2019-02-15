data <-read.csv("C:\\Users\\aabdulkhalek\\Documents\\Test\\Electric Power Consumption\\household_power_consumption.txt", sep=";", na.string="?", check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
filtered_data <-rbind(data[data$Date=="1/2/2007",],data[data$Date=="2/2/2007",])
filtered_data$Date <-as.Date(filtered_data$Date, format="%d/%m/%Y")
hist(as.numeric(filtered_data$Global_active_power),col="Red", main="Global Active Power", xlab="kWh", ylab="Freq")

dev.copy(png,'plot1.png', height = 480, width = 480)
dev.off()