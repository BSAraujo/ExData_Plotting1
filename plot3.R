library(plyr)
library(dplyr)
library(lubridate)

# downloads the zip file containing the data and unzips it
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destfile <- "household_power_consumption.zip"

download.file(url, destfile)
unzip(destfile)

# reads data from file into R
data_file <- "household_power_consumption.txt"
dataset <- read.table(data_file, sep = ";", header = TRUE, 
                      colClasses = c(rep("character",7)))


dataset <- dataset %>% filter(dmy(Date) == dmy("01/02/2007") | dmy(Date) == dmy("02/02/2007"))

dataset <- dataset %>% mutate(date_time = paste(Date, Time))

dataset$date_time <- dmy_hms(dataset$date_time)

# opens graphics device
png(filename = "plot3.png")

dev.cur()

# starts plotting
with(dataset, plot(date_time, as.numeric(Sub_metering_1), type = "n",  
                   ylab = "Energy sub metering", xlab = ""))
with(dataset, 
     {lines(date_time, as.numeric(Sub_metering_1),type = "l")
      lines(date_time, as.numeric(Sub_metering_2),type = "l", col = "red")
      lines(date_time, as.numeric(Sub_metering_3),type = "l", col = "blue")}
)

legend("topright", col = c("black", "red", "blue"), lty = c(1,1,1),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# closes graphics device
dev.off()

