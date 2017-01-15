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


# opens graphics device
png(filename = "plot1.png")

dev.cur()

# starts plotting
with(dataset, hist(as.numeric(Global_active_power), col = "red", main = "Global Active Power", 
                   xlab = "Global Active Power (kilowatts)", ylab = "Frequency"))

# closes graphics device
dev.off()

