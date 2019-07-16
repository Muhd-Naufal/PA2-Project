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

#2012
hdb4R2012 <- nrow(subset(hdb9,hdb8.flat_type == '4 ROOM' & hdb9$year=='2012'))
hdb5R2012 <- nrow(subset(hdb9,hdb8.flat_type == '5 ROOM' & hdb9$year=='2012'))
hdbEX2012 <- nrow(subset(hdb9,hdb8.flat_type == 'EXECUTIVE' & hdb9$year=='2012'))
hdbMG2012 <- nrow(subset(hdb9,hdb8.flat_type == 'MULTI-GENERATION' & hdb9$year=='2012'))

#2013
hdb4R2013 <- nrow(subset(hdb9,hdb8.flat_type == '4 ROOM' & hdb9$year=='2013'))
hdb5R2013 <- nrow(subset(hdb9,hdb8.flat_type == '5 ROOM' & hdb9$year=='2013'))
hdbEX2013 <- nrow(subset(hdb9,hdb8.flat_type == 'EXECUTIVE' & hdb9$year=='2013'))
hdbMG2013 <- nrow(subset(hdb9,hdb8.flat_type == 'MULTI-GENERATION' & hdb9$year=='2013'))

#2014
hdb4R2014 <- nrow(subset(hdb9,hdb8.flat_type == '4 ROOM' & hdb9$year=='2014'))
hdb5R2014 <- nrow(subset(hdb9,hdb8.flat_type == '5 ROOM' & hdb9$year=='2014'))
hdbEX2014 <- nrow(subset(hdb9,hdb8.flat_type == 'EXECUTIVE' & hdb9$year=='2014'))
hdbMG2014 <- nrow(subset(hdb9,hdb8.flat_type == 'MULTI-GENERATION' & hdb9$year=='2014'))

#2015
hdb4R2015 <- nrow(subset(hdb9,hdb8.flat_type == '4 ROOM' & hdb9$year=='2015'))
hdb5R2015 <- nrow(subset(hdb9,hdb8.flat_type == '5 ROOM' & hdb9$year=='2015'))
hdbEX2015 <- nrow(subset(hdb9,hdb8.flat_type == 'EXECUTIVE' & hdb9$year=='2015'))
hdbMG2015 <- nrow(subset(hdb9,hdb8.flat_type == 'MULTI-GENERATION' & hdb9$year=='2015'))

#2016
hdb4R2016 <- nrow(subset(hdb9,hdb8.flat_type == '4 ROOM' & hdb9$year=='2016'))
hdb5R2016 <- nrow(subset(hdb9,hdb8.flat_type == '5 ROOM' & hdb9$year=='2016'))
hdbEX2016 <- nrow(subset(hdb9,hdb8.flat_type == 'EXECUTIVE' & hdb9$year=='2016'))
hdbMG2016 <- nrow(subset(hdb9,hdb8.flat_type == 'MULTI-GENERATION' & hdb9$year=='2016'))

#2017
hdb4R2017 <- nrow(subset(hdb9,hdb8.flat_type == '4 ROOM' & hdb9$year=='2017'))
hdb5R2017 <- nrow(subset(hdb9,hdb8.flat_type == '5 ROOM' & hdb9$year=='2017'))
hdbEX2017 <- nrow(subset(hdb9,hdb8.flat_type == 'EXECUTIVE' & hdb9$year=='2017'))
hdbMG2017 <- nrow(subset(hdb9,hdb8.flat_type == 'MULTI-GENERATION' & hdb9$year=='2017'))