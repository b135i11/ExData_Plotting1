library(datasets)

# Read data
header <- read.table("household_power_consumption.txt", nrows = 1, sep=";",na.strings = "?", stringsAsFactors = FALSE)
df <- read.table("household_power_consumption.txt", skip = 1, sep=";",na.strings = "?")
colnames(df) <- unlist(header)
df1 <- df
dfsub <- subset(df1,Date %in% c("1/2/2007","2/2/2007"))
dfsub$Date <- as.Date(dfsub$Date, format = "%d/%m/%Y")

names(dfsub)

# Layout of plot
par(mfcol = c(1,1))

# Create histogram
par(mfrow = c(1,1))
hist(dfsub$Global_active_power,col = "red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")

# Write to png
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()

