filename <- "data.zip"
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "data.zip")
unzip(filename)
list.files()
d <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
d$Date <- as.Date(d$Date, "%d/%m/%Y")
d$DateTime <- as.POSIXct(with(d,paste(Date, Time), format="%Y-%m-%d %H:%M:%S"))
important.dates <- d[d$DateTime >= "2007-02-01" & d$DateTime < "2007-02-03",]
plot(data=important.dates, Global_active_power~DateTime, type = "l", xlab = "", ylab = "Global Acitive Power (kilowatts)")
dev.copy(png,'plot2.png')
dev.off()
