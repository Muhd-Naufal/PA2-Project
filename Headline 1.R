
#Will Tengah Property prices be the same as Punggol



#Punggol Resale Prices
Punggol <- read.csv("./Datasets/HDB Resale Prices.csv")

library(dplyr)



Punggol$month <- as.Date(paste0(Punggol$month, "-01"), "%Y-%m-%d")
Punggol

Punggol$year <- format(as.Date(Punggol$month, format= "%Y-%m"),"%Y")
Punggol


#Choose only those 2007 and above

library(dplyr)
Punggol2 <- filter(Punggol, month >= "2007-01-01",town == "PUNGGOL")
Punggol2

type2<-filter(Punggol2, Punggol2$flat_type=="2 ROOM")
a<-mean(type2$resale_price)
a

type3<-filter(Punggol2, Punggol2$flat_type=="3 ROOM")
b<-mean(type3$resale_price)
b

type4<-filter(Punggol2, Punggol2$flat_type=="4 ROOM")
c<-mean(type4$resale_price)
c

type5<-filter(Punggol2, Punggol2$flat_type=="5 ROOM")
d<-mean(type5$resale_price)
d
