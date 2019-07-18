
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

type22007<-filter(Punggol2, Punggol2$flat_type=="2 ROOM", Punggol2$year=="2007")
type22008<-filter(Punggol2, Punggol2$flat_type=="2 ROOM", Punggol2$year=="2008")
type22009<-filter(Punggol2, Punggol2$flat_type=="2 ROOM", Punggol2$year=="2009")
type22010<-filter(Punggol2, Punggol2$flat_type=="2 ROOM", Punggol2$year=="2010")
type22011<-filter(Punggol2, Punggol2$flat_type=="2 ROOM", Punggol2$year=="2011")
type22012<-filter(Punggol2, Punggol2$flat_type=="2 ROOM", Punggol2$year=="2012")
type22013<-filter(Punggol2, Punggol2$flat_type=="2 ROOM", Punggol2$year=="2013")
type22014<-filter(Punggol2, Punggol2$flat_type=="2 ROOM", Punggol2$year=="2014")
type22016<-filter(Punggol2, Punggol2$flat_type=="2 ROOM", Punggol2$year=="2015")
type22017<-filter(Punggol2, Punggol2$flat_type=="2 ROOM", Punggol2$year=="2016")
type22018<-filter(Punggol2, Punggol2$flat_type=="2 ROOM", Punggol2$year=="2017")
a2007<-mean(type22007$resale_price)
a2008<-mean(type22008$resale_price)
a2009<-mean(type22009$resale_price)
a2010<-mean(type22010$resale_price)
a2011<-mean(type22011$resale_price)
a2012<-mean(type22012$resale_price)
a2013<-mean(type22013$resale_price)
a2014<-mean(type22014$resale_price)
a2015<-mean(type22015$resale_price)
a2016<-mean(type22016$resale_price)
a2017<-mean(type22017$resale_price)


type3<-filter(Punggol2, Punggol2$flat_type=="3 ROOM")
b<-mean(type3$resale_price)
b

type4<-filter(Punggol2, Punggol2$flat_type=="4 ROOM")
c<-mean(type4$resale_price)
c

type5<-filter(Punggol2, Punggol2$flat_type=="5 ROOM")
d<-mean(type5$resale_price)
d
