## Read in the data
HPCMain <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?",
  colClasses="character", col.names = colnames(read.table("household_power_consumption.txt",
  nrow = 1, header = TRUE, sep=";")))

## Select data for February
HPCData <- subset(HPCMain,HPCMain[1] == "1/2/2007" | HPCMain[1] == "2/2/2007")
HPCData$Date_Hour <- paste(HPCData$Date,HPCData$Time, sep = " ")
HPCData$Date_Hour <- strptime(HPCData$Date_Hour, "%d/%m/%Y %H:%M:%S")

## Define variable as numeric
HPCData$Global_active_power = as.numeric(as.character(HPCData$Global_active_power))

## Set up png file and define pixels:
png(file="plot2.png",width=480,height=480)

## Plot 2
plot(HPCData$Date_Hour, HPCData$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

## Close png file
dev.off()