# Source dataProcessing.R before running below

df1<-df%>%
  mutate(Date=dmy_hms(paste(as.character(Date),as.character(Time))))%>%
  select(-Time)


png(filename = "out/plot4.png",width = 480,height = 480)

par(mfrow=c(2,2))

# 1st plot
plot(x = df1$Date, y = df1$Global_active_power,type = "l",lty = 1,xlab = "",ylab = "Global Active Power")

# 2nd plot
plot(x = df1$Date, y = df1$Voltage,type = "l",lty = 1,xlab = "datetime",ylab = "Voltage")

# 3rd plot
plot(x = df1$Date,y = df1$Sub_metering_1,type = "l",lty = 1,xlab = "",ylab = "Energy sub meeting")
lines(x = df1$Date,y = df1$Sub_metering_2,type = "l",lty = 1,xlab = "",col='red')
lines(x = df1$Date,y = df1$Sub_metering_3,type = "l",lty = 1,xlab = "",col='blue')

legend(x = "topright",          # Position
       legend = c("Sub_metering_1", "Sub_metering_1","Sub_metering_1"),  # Legend texts
       col = c('black','red','blue'),           # Line colors,
       lty = 1,cex = 0.5
)

# 4th plot
plot(x = df1$Date,y = df1$Global_reactive_power,type = "l",lty = 1,xlab = "datetime",ylab = "Global_reactive_power")


dev.off()
