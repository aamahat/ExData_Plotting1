# Section for Data Extract & Load
#######################################
# Unzipping the provided dataset "Electric power consumption" 
filename <- "household_power_consumption.txt"
if(!file.exists(filename)){
  unzip("./exdata-data-household_power_consumption.zip")
}

# Loading data using fread
file_load <- fread(filename, sep=";", na.strings="?")

# Extracting data of only Feb 1, 2007 & Feb 2, 2007
req_data <- file_load[grep("^[1/2]/2/2007", file_load$Date),]
#######################################



# Section for Plots
#######################################
# In order to generate the plots w.rt. days, function strptime has been used. 
date_time <- paste(req_data$Date, req_data$Time)
strp_date <- strptime(date_time, "%d/%m/%Y %H:%M:%S") 

# Creating a png file
png(filename = "plot4.png", width = 480, height = 480, units = "px")

# creating a window to plot 4 figures
par(mfcol = c(2,2))

# Top Left plot
plot(strp_date, req_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

# Bottom Left plot
plot(strp_date, req_data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(strp_date, req_data$Sub_metering_2, type = "l", col = "red" )
lines(strp_date, req_data$Sub_metering_3, type = "l", col = "blue" )

# Adding legend to the bottom left plot. bty is set to "n" to disable the border of legend box
legend("topright", lty= 1, col = c("black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")

# Top Right plot
plot(strp_date, req_data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# Bottom Right plot
plot(strp_date, req_data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

# Turning the device off
dev.off()
#######################################
