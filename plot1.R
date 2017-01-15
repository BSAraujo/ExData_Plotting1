
library(dplyr)

destfile <- "C:/Users/Breno/Downloads/exdata_2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt"
dataset <- read.table(destfile, sep = ";", header = TRUE, 
                      colClasses = c(rep("character",7)))
dataset <- dataset %>% mutate(date_time = paste(Date, Time))
tail(dataset)
head(dataset)
