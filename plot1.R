# Source dataProcessing.R before running below
# source("dataProcessing.R")

png(filename = "out/plot1.png",width = 480,height = 480)
hist(df$Global_active_power,main = 'Global Active Power',col="red",xlab = "Global Active Power (kilowatts)")
dev.off()
