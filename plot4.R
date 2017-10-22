filename <- "data.zip"
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "data.zip")
unzip(filename)
list.files()
d <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
d$Date <- as.Date(d$Date, "%d/%m/%Y")
d$DateTime <- as.POSIXct(with(d,paste(Date, Time), format="%Y-%m-%d %H:%M:%S"))
important.dates <- d[d$DateTime >= "2007-02-01" & d$DateTime < "2007-02-03",]

par(mfrow=c(2,2))
plot(data=important.dates, Global_active_power~DateTime, type = "l", xlab = "", ylab = "Global Acitive Power (kilowatts)")
plot(data=important.dates, Voltage~DateTime, type = "l", xlab = "datetime", ylab = "Voltage")
plot(data=important.dates, Sub_metering_1~DateTime, type = "l", xlab = "", ylab = "Energy sub meeting")
points(data=important.dates, Sub_metering_2~DateTime, type = "l", col = "red")
points(data=important.dates, Sub_metering_3~DateTime, type = "l", col = "blue")
plot(data=important.dates, Global_reactive_power~DateTime, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png,'plot4.png')
dev.off()
