
#Will Tengah Property prices be the same as Punggol



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

type2<-filter(Punggol2, Punggol2$flat_type=="2 ROOM" , Punggol2$year == 2007)
type2
a<-mean(type2$resale_price)
a

type32007<-filter(Punggol2, Punggol2$flat_type=="3 ROOM", Punggol2$year == 2007)
b2007<-mean(type32007$resale_price)

type32008<-filter(Punggol2, Punggol2$flat_type=="3 ROOM", Punggol2$year == 2008)
b2007<-mean(type32008$resale_price)

type32009<-filter(Punggol2, Punggol2$flat_type=="3 ROOM", Punggol2$year == 2009)
b2009<-mean(type32009$resale_price)

type32010<-filter(Punggol2, Punggol2$flat_type=="3 ROOM", Punggol2$year == 2010)
b2010<-mean(type32010$resale_price)

type32011<-filter(Punggol2, Punggol2$flat_type=="3 ROOM", Punggol2$year == 2011)
b2011<-mean(type32011$resale_price)

type32012<-filter(Punggol2, Punggol2$flat_type=="3 ROOM", Punggol2$year == 2012)
b2012<-mean(type32012$resale_price)

type32013<-filter(Punggol2, Punggol2$flat_type=="3 ROOM", Punggol2$year == 2013)
b2013<-mean(type32013$resale_price)

type32014<-filter(Punggol2, Punggol2$flat_type=="3 ROOM", Punggol2$year == 2014)
b2014<-mean(type32014$resale_price)

type32015<-filter(Punggol2, Punggol2$flat_type=="3 ROOM", Punggol2$year == 2015)
b2015<-mean(type32015$resale_price)

type32016<-filter(Punggol2, Punggol2$flat_type=="3 ROOM", Punggol2$year == 2016)
b2016<-mean(type32016$resale_price)

type32017<-filter(Punggol2, Punggol2$flat_type=="3 ROOM", Punggol2$year == 2017)
b2017<-mean(type32017$resale_price)

type4<-filter(Punggol2, Punggol2$flat_type=="4 ROOM")
c<-mean(type4$resale_price)
c

type5<-filter(Punggol2, Punggol2$flat_type=="5 ROOM")
d<-mean(type5$resale_price)
d

