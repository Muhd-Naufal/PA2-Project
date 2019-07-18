
#Will Tengah Property prices be the same as Punggol



#Punggol Resale Prices
Punggol <- read.csv("HDB Resale Prices.csv")

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


Punggol3 <- filter(Punggol2, year == 2007, flat_type == "4 ROOM")
Punggol3


levels(Punggol2$flat_type)

type22007<-filter(Punggol2, Punggol2$flat_type=="2 ROOM", Punggol2$year=="2007")
type22008<-filter(Punggol2, Punggol2$flat_type=="2 ROOM", Punggol2$year=="2008")
type22009<-filter(Punggol2, Punggol2$flat_type=="2 ROOM", Punggol2$year=="2009")
type22010<-filter(Punggol2, Punggol2$flat_type=="2 ROOM", Punggol2$year=="2010")
type22011<-filter(Punggol2, Punggol2$flat_type=="2 ROOM", Punggol2$year=="2011")
type22012<-filter(Punggol2, Punggol2$flat_type=="2 ROOM", Punggol2$year=="2012")
type22013<-filter(Punggol2, Punggol2$flat_type=="2 ROOM", Punggol2$year=="2013")
type22014<-filter(Punggol2, Punggol2$flat_type=="2 ROOM", Punggol2$year=="2014")
type22015<-filter(Punggol2, Punggol2$flat_type=="2 ROOM", Punggol2$year=="2015")
type22016<-filter(Punggol2, Punggol2$flat_type=="2 ROOM", Punggol2$year=="2016")
type22017<-filter(Punggol2, Punggol2$flat_type=="2 ROOM", Punggol2$year=="2017")
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

type32007<-filter(Punggol2, Punggol2$flat_type=="3 ROOM", Punggol2$year == 2007)
type32008<-filter(Punggol2, Punggol2$flat_type=="3 ROOM", Punggol2$year == 2008)
type32009<-filter(Punggol2, Punggol2$flat_type=="3 ROOM", Punggol2$year == 2009)
type32010<-filter(Punggol2, Punggol2$flat_type=="3 ROOM", Punggol2$year == 2010)
type32011<-filter(Punggol2, Punggol2$flat_type=="3 ROOM", Punggol2$year == 2011)
type32012<-filter(Punggol2, Punggol2$flat_type=="3 ROOM", Punggol2$year == 2012)
type32013<-filter(Punggol2, Punggol2$flat_type=="3 ROOM", Punggol2$year == 2013)
type32014<-filter(Punggol2, Punggol2$flat_type=="3 ROOM", Punggol2$year == 2014)
type32015<-filter(Punggol2, Punggol2$flat_type=="3 ROOM", Punggol2$year == 2015)
type32016<-filter(Punggol2, Punggol2$flat_type=="3 ROOM", Punggol2$year == 2016)
type32017<-filter(Punggol2, Punggol2$flat_type=="3 ROOM", Punggol2$year == 2017)

b2007<-mean(type32007$resale_price)
b2008<-mean(type32008$resale_price)
b2009<-mean(type32009$resale_price)
b2010<-mean(type32010$resale_price)
b2011<-mean(type32011$resale_price)
b2012<-mean(type32012$resale_price)
b2013<-mean(type32013$resale_price)
b2014<-mean(type32014$resale_price)
b2015<-mean(type32015$resale_price)
b2016<-mean(type32016$resale_price)
b2017<-mean(type32017$resale_price)

type42007<-filter(Punggol2, Punggol2$flat_type=="4 ROOM", Punggol2$year=="2007")
type42008<-filter(Punggol2, Punggol2$flat_type=="4 ROOM", Punggol2$year=="2008")
type42009<-filter(Punggol2, Punggol2$flat_type=="4 ROOM", Punggol2$year=="2009")
type42010<-filter(Punggol2, Punggol2$flat_type=="4 ROOM", Punggol2$year=="2010")
type42011<-filter(Punggol2, Punggol2$flat_type=="4 ROOM", Punggol2$year=="2011")
type42012<-filter(Punggol2, Punggol2$flat_type=="4 ROOM", Punggol2$year=="2012")
type42013<-filter(Punggol2, Punggol2$flat_type=="4 ROOM", Punggol2$year=="2013")
type42014<-filter(Punggol2, Punggol2$flat_type=="4 ROOM", Punggol2$year=="2014")
type42015<-filter(Punggol2, Punggol2$flat_type=="4 ROOM", Punggol2$year=="2015")
type42016<-filter(Punggol2, Punggol2$flat_type=="4 ROOM", Punggol2$year=="2016")
type42017<-filter(Punggol2, Punggol2$flat_type=="4 ROOM", Punggol2$year=="2017")

c2007<-mean(type42007$resale_price)
c2008<-mean(type42008$resale_price)
c2009<-mean(type42009$resale_price)
c2010<-mean(type42010$resale_price)
c2011<-mean(type42011$resale_price)
c2012<-mean(type42012$resale_price)
c2013<-mean(type42013$resale_price)
c2014<-mean(type42014$resale_price)
c2015<-mean(type42015$resale_price)
c2016<-mean(type42016$resale_price)
c2017<-mean(type42017$resale_price)


type5<-filter(Punggol2, Punggol2$flat_type=="5 ROOM")
d<-mean(type5$resale_price)
d

