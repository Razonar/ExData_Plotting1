download <- download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "temp")
unzip("temp")
unlink("temp")

b <- read.csv(file="household_power_consumption.txt",sep=";",colClasses="character")
v <- b[b$Date == "1/2/2007"| b$Date =="2/2/2007",]
v$Date <- as.Date(v$Date,"%d/%m/%Y")
v$Global_active_power <- as.numeric(v$Global_active_power)
png("plot1.png")
hist(v$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()

