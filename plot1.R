##The following code to be run only if to create data frame for the first time - reusing dataset is better if it exists
---------------------------------------------------------------------------------------------------------------
  ##download the zip folder
  ##Extract file from zip folder into working directory
  ##Read Entire File
  power <- read.table("household_power_consumption.txt",sep=";", header = TRUE, na.strings = "?")
##Subset required data from file
RequiredPower <- subset(power, power$Date == '1/2/2007' | power$Date == '2/2/2007')
##Setting Datatype as Date
RequiredPower$Date <- as.Date(RequiredPower$Date, "%d/%m/%Y")
##Setting Datatype as Time
RequiredPower$Time <- as.POSIXlt(paste(RequiredPower$Date, RequiredPower$Time), format="%H:%M:%S")
----------------------------------------------------------------------------------------------------------------

#Creating a png output with required sizing
png("plot1.png", width = 480, height = 480)

#Creating the graph
hist(RequiredPower$Global_active_power, main = "Global Active Power" , xlab = "Global Active Power (kilowatts)", col="red")

#Finish the image
dev.off()
