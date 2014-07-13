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
png(file="plot1.png",width=480,height=480)

## Plot 1
hist(HPCData$Global_active_power, col = "red", ylab = "Frequency", 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power ")

## Close png file
dev.off()
