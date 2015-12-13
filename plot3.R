library("grDevices")

mydata <- read.table("household_power_consumption.txt", sep=";",header =TRUE,as.is=T,na.strings = "?")

mydata2 <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007") ,]


Submetering1<-as.numeric(mydata2$Sub_metering_1)
Submetering2<-as.numeric(mydata2$Sub_metering_2)
Submetering3<-as.numeric(mydata2$Sub_metering_3)

datetime <- paste(as.Date(mydata2$Date, "%d/%m/%Y"), mydata2$Time)
mydata2$Datetime <- as.POSIXct(datetime)

Sys.setlocale("LC_TIME", "English")

png("plot3.png", width=480, height=480, units = "px")
plot(Submetering1~mydata2$Datetime, type="l",ylab="Energy sub metering", xlab="")
lines(Submetering2~mydata2$Datetime, col="red")
lines(Submetering3~mydata2$Datetime, col="blue")
legend("topright", 
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           col=c("black","red", "blue"),
           lty=c(1,1,1))
dev.off()