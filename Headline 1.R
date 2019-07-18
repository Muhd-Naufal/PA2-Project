#Multiple Regression

#Punggol Resale Prices
Punggol <- read.csv("./Datasets/HDB Resale Prices.csv")

library(dplyr)



Punggol$month <- as.Date(paste0(Punggol$month, "-01"), "%Y-%m-%d")
Punggol

#Choose only those 2007 and above

library(dplyr)
Punggol2 <- filter(Punggol, month >= "2007-01-01",town == "PUNGGOL")
Punggol2

