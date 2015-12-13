library("grDevices")

mydata <- read.table("household_power_consumption.txt", sep=";",header =TRUE,as.is=T,na.strings = "?")

mydata2 <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007") ,]


GlobalActivePower<-as.numeric(mydata2$Global_active_power)
Voltage<-as.numeric(mydata2$Voltage)

Submetering1<-as.numeric(mydata2$Sub_metering_1)
Submetering2<-as.numeric(mydata2$Sub_metering_2)
Submetering3<-as.numeric(mydata2$Sub_metering_3)


datetime <- paste(as.Date(mydata2$Date, "%d/%m/%Y"), mydata2$Time)
mydata2$Datetime <- as.POSIXct(datetime)

Sys.setlocale("LC_TIME", "English")

png("plot4.png", width=480, height=480, units = "px")

par(mfrow=c(2,2))
plot(GlobalActivePower~mydata2$Datetime, type="l",
     ylab="Global active power (kilowatts)", xlab="")

plot(Voltage~mydata2$Datetime, type="l",
     ylab="Voltage (kilowatts)", xlab="datetime")
axis(side=1, at=seq(234,246,4), labels=seq(234,246,4))

plot(Submetering1~mydata2$Datetime, type="l",ylab="Energy sub metering", xlab="")
lines(Submetering2~mydata2$Datetime, col="red")
lines(Submetering3~mydata2$Datetime, col="blue")
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black","red", "blue"),
       lty=c(1,1,1))
dev.off()