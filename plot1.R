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
# Creating a png file
png(filename = "plot1.png", width = 480, height = 480, units = "px")

# Plotting histogram as stated in requirement
hist(req_data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Closing the plot window
dev.off()
#######################################
