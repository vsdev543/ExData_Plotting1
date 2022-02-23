# Source dataProcessing.R before running below
# source("dataProcessing.R")

df1<-df%>%
  mutate(Date=dmy_hms(paste(as.character(Date),as.character(Time))))%>%
  select(-Time)
  
png(filename = "out/plot2.png",width = 480,height = 480)
plot(x = df1$Date,y = df1$Global_active_power,type = "l",lty = 1,xlab = "",ylab = "Global Active Power (kilowatts)")
dev.off()
