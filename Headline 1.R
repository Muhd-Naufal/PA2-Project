#Multiple Regression

#Punggol Resale Prices
Punggol <- read.csv("./Datasets/HDB Resale Prices.csv")

library(dplyr)

#Convert month to date format

Punggol$month <- as.Date(paste0(Punggol$month, "-01"), "%Y-%m-%d")
Punggol

Punggol$year <- format(as.Date(Punggol$month, format="%Y-%m-%d"),"%Y")
Punggol

#Choose only those 2007 and above

library(dplyr)
Punggol2 <- filter(Punggol, month >= "2007-01-01",town == "PUNGGOL")
Punggol2

levels(Punggol2$flat_type)


