hdb2 <- read.csv("./Datasets/HDB Resale Prices.csv")

str(hdb2)

#Convert Factor to Date (Year-Month)
#It'll assume first day of each month

hdb2$month <- as.Date(paste0(hdb2$month, "-01"), "%Y-%m-%d")
hdb2

#Choose only those 2012 and above
library(dplyr)
hdb3 <- filter(hdb2, month >= "2012-01-01")
hdb3

#Choose specific flat type only
hdb4 <- filter(hdb3, flat_type == "4 ROOM" | 
                 flat_type == "5 ROOM" | 
                 flat_type == "EXECUTIVE" | 
                 flat_type == "MULTI-GENERATION")

#Resale value above $900,000 
hdb5 <- filter(hdb4, resale_price >= 900000)
hdb5

#Count flat types
library(plyr)
library(dplyr)

hdb6 <- count(hdb5, "flat_type")
hdb6
#Select specific columns

hdb7 <- data.frame(hdb5$flat_type, hdb5$resale_price, hdb5$month)
hdb7

hdb7$hdb5.resale_price <- 1
hdb7

str(hdb7)

hdb8 <- filter(hdb3, flat_type == "4 ROOM" | 
                  flat_type == "5 ROOM" | 
                  flat_type == "EXECUTIVE" | 
                  flat_type == "MULTI-GENERATION")

hdb8

hdb9 <- data.frame(hdb8$flat_type, hdb8$month)
hdb9

str(hdb9)

hdb9$year <- substring(hdb9$hdb8.month,1,4)
hdb9

str(hdb9)

i <- sapply(hdb9, is.factor)
hdb9[i] <- lapply(hdb9[i], as.character)
str(hdb9)

hdb9$year <- as.numeric(as.character(hdb9$year))
hdb9
str(hdb9)

hdb2012 <- sum(which(hdb9$hdb8.flat_type == '4 ROOM' & hdb9$year=='2012'))
hdb2012

hdb2012 <- nrow(subset(hdb9,hdb8.flat_type == '4 ROOM' & hdb9$year=='2012'))
hdb2012

View(hdb9)
