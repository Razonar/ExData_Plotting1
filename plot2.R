download <- download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "temp")
unzip("temp")
unlink("temp")

b <- read.csv(file="household_power_consumption.txt",sep=";",colClasses="character")
v <- b[b$Date == "1/2/2007"| b$Date =="2/2/2007",]
v$Date <- strptime(paste(v$Date,v$Time),"%d/%m/%Y %H:%M:%S")
v$Global_active_power <- as.numeric(v$Global_active_power)
png("plot2.png")
plot(v[,c(1,3)],type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
