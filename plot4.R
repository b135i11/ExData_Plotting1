library(datasets)

# Read data
header <- read.table("household_power_consumption.txt", nrows = 1, sep=";",na.strings = "?", stringsAsFactors = FALSE)
df <- read.table("household_power_consumption.txt", skip = 1, sep=";",na.strings = "?")
colnames(df) <- unlist(header)
df1 <- df
dfsub <- subset(df1,Date %in% c("1/2/2007","2/2/2007"))
dfsub$Date <- as.Date(dfsub$Date, format = "%d/%m/%Y")

names(dfsub)

# Convert dates
DateTime <- paste(as.Date(dfsub$Date),dfsub$Time)
dfsub$DateTime <- as.POSIXct(DateTime)

# Layout of four plots
par(mfcol = c(2,2))

# 1 - Create Global Active Power line plot
with(dfsub, plot(Global_active_power ~ DateTime, type = "l", ylab = "Global Active Power (kilowatts)",xlab=""))

# 2- Create Sub_metering line plot
with(dfsub,{plot(Sub_metering_1 ~ DateTime, type = "l", ylab = "Energy sub metering", xlab = "", col = "black")
        lines(Sub_metering_2 ~ DateTime, col = "red")
        lines(Sub_metering_3 ~ DateTime, col = "blue")
})
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),
       lty = 1,lwd=4)

# 3 - Create Voltage line plot
with(dfsub,plot(Voltage ~ DateTime,type = "l"))

# 4 - Create Global Reactive Power line plot
with(dfsub,plot(Global_reactive_power ~ DateTime, type = "l"))

# Write to png
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()



