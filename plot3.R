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



# Section for Plot
#######################################
# In order to generate the plots w.rt. days, function strptime has been used. 
date_time <- paste(req_data$Date, req_data$Time)
strp_date <- strptime(date_time, "%d/%m/%Y %H:%M:%S") 

# creating png file
png(filename = "plot3.png", width = 480, height = 480, units = "px")

# As this plot contrains three graphs, plotting the first graph
plot(strp_date, req_data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

# Adding second graph in the same plot
lines(strp_date, req_data$Sub_metering_2, type = "l", col = "red" )

# Adding third graph in the same plot
lines(strp_date, req_data$Sub_metering_3, type = "l", col = "blue" )

# Specifying legeng to the plot
legend("topright", lty= 1, col = c("black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Closing the plot window
dev.off()
#######################################
