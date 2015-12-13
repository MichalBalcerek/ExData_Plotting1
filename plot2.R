library("grDevices")

mydata <- read.table("household_power_consumption.txt", sep=";",header =TRUE,as.is=T,na.strings = "?")

mydata2 <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007") ,]

GlobalActivePower<-as.numeric(mydata2$Global_active_power)

datetime <- paste(as.Date(mydata2$Date, "%d/%m/%Y"), mydata2$Time)
mydata2$Datetime <- as.POSIXct(datetime)

Sys.setlocale("LC_TIME", "English")


png("plot2.png", width=480, height=480, units = "px")

plot(GlobalActivePower~mydata2$Datetime, type="l",
     ylab="Global active power (kilowatts)", xlab="")

dev.off()