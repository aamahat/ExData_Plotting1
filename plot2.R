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

# Creating a png file 
png(filename = "plot2.png", width = 480, height = 480, units = "px")

# plotting as stated in required
plot(strp_date, type = "l", req_data$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)")

# closing the plot window
dev.off()
#######################################
