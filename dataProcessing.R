# Downloading data
if(!dir.exists("data")){
  dir.create("data")
}

if(!file.exists("data/data.txt")){
  if(!file.exists("data/file.zip")){
    url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    
    download.file(url,destfile = "data/file.zip")
  }
  
  unzip(zipfile = "data/file.zip",exdir = "data")
}



library(sqldf)
library(data.table)
library(dplyr)
library(lubridate)
# df<-as_tibble(fread("data/household_power_consumption.txt"))

# Reading data where Date == 1/2/2007 or 2/2/2007
df<-read.csv.sql(file = "data/household_power_consumption.txt",sep = ";",sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007' ")

df<-as_tibble(df)

# # Data preperation
# df$Date<-mdy(df$Date)
# df$Time<-hms(df$Time)

