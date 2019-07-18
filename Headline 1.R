
#Will Tengah Property prices be the same as Punggol



#Punggol Resale Prices
Punggol <- read.csv("HDB Resale Prices.csv")

library(dplyr)



Punggol$month <- as.Date(paste0(Punggol$month, "-01"), "%Y-%m-%d")
Punggol

Punggol$year <- format(as.Date(Punggol$month, format= "%Y-%m"),"%Y")
Punggol


#Choose only those 2007 and above

library(dplyr)
Punggol2 <- filter(Punggol, month >= "2007-01-01",town == "PUNGGOL")
Punggol2

Punggol3 <- filter(Punggol2, year == 2007, flat_type == "4 ROOM")
Punggol3



