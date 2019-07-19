
#Will Tengah Property prices be the same rise as Punggol?


#Punggol Resale Prices
Punggol <- read.csv("./Datasets/HDB Resale Prices.csv")

library(dplyr)

#Convert month to date format
Punggol$month <- as.Date(paste0(Punggol$month, "-01"), "%Y-%m-%d")
Punggol

#Extract only Year from date
Punggol$year <- format(as.Date(Punggol$month, format="%Y-%m-%d"),"%Y")
Punggol

#Choose only those 2007 and above
library(dplyr)
Punggol2 <- filter(Punggol, month >= "2007-01-01",town == "PUNGGOL")
Punggol2

#Punggol 2 Room
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

a2007<-as.integer(mean(type22007$resale_price))
a2008<-as.integer(mean(type22008$resale_price))
a2009<-as.integer(mean(type22009$resale_price))
a2010<-as.integer(mean(type22010$resale_price))
a2011<-as.integer(mean(type22011$resale_price))
a2012<-as.integer(mean(type22012$resale_price))
a2013<-as.integer(mean(type22013$resale_price))
a2014<-as.integer(mean(type22014$resale_price))
a2015<-as.integer(mean(type22015$resale_price))
a2016<-as.integer(mean(type22016$resale_price))
a2017<-as.integer(mean(type22017$resale_price))

#Punggol 3 Room
type32007<-filter(Punggol2, Punggol2$flat_type=="3 ROOM", Punggol2$year == "2007")
type32008<-filter(Punggol2, Punggol2$flat_type=="3 ROOM", Punggol2$year == "2008")
type32009<-filter(Punggol2, Punggol2$flat_type=="3 ROOM", Punggol2$year == "2009")
type32010<-filter(Punggol2, Punggol2$flat_type=="3 ROOM", Punggol2$year == "2010")
type32011<-filter(Punggol2, Punggol2$flat_type=="3 ROOM", Punggol2$year == "2011")
type32012<-filter(Punggol2, Punggol2$flat_type=="3 ROOM", Punggol2$year == "2012")
type32013<-filter(Punggol2, Punggol2$flat_type=="3 ROOM", Punggol2$year == "2013")
type32014<-filter(Punggol2, Punggol2$flat_type=="3 ROOM", Punggol2$year == "2014")
type32015<-filter(Punggol2, Punggol2$flat_type=="3 ROOM", Punggol2$year == "2015")
type32016<-filter(Punggol2, Punggol2$flat_type=="3 ROOM", Punggol2$year == "2016")
type32017<-filter(Punggol2, Punggol2$flat_type=="3 ROOM", Punggol2$year == "2017")

b2007<-as.integer(mean(type32007$resale_price))
b2008<-as.integer(mean(type32008$resale_price))
b2009<-as.integer(mean(type32009$resale_price))
b2010<-as.integer(mean(type32010$resale_price))
b2011<-as.integer(mean(type32011$resale_price))
b2012<-as.integer(mean(type32012$resale_price))
b2013<-as.integer(mean(type32013$resale_price))
b2014<-as.integer(mean(type32014$resale_price))
b2015<-as.integer(mean(type32015$resale_price))
b2016<-as.integer(mean(type32016$resale_price))
b2017<-as.integer(mean(type32017$resale_price))

#Punggol 4 Room
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

c2007<-as.integer(mean(type42007$resale_price))
c2008<-as.integer(mean(type42008$resale_price))
c2009<-as.integer(mean(type42009$resale_price))
c2010<-as.integer(mean(type42010$resale_price))
c2011<-as.integer(mean(type42011$resale_price))
c2012<-as.integer(mean(type42012$resale_price))
c2013<-as.integer(mean(type42013$resale_price))
c2014<-as.integer(mean(type42014$resale_price))
c2015<-as.integer(mean(type42015$resale_price))
c2016<-as.integer(mean(type42016$resale_price))
c2017<-as.integer(mean(type42017$resale_price))

#Punggol 5 Room
type52007<-filter(Punggol2, Punggol2$flat_type=="5 ROOM", Punggol2$year == "2007")
type52008<-filter(Punggol2, Punggol2$flat_type=="5 ROOM", Punggol2$year == "2008")
type52009<-filter(Punggol2, Punggol2$flat_type=="5 ROOM", Punggol2$year == "2009")
type52010<-filter(Punggol2, Punggol2$flat_type=="5 ROOM", Punggol2$year == "2010")
type52011<-filter(Punggol2, Punggol2$flat_type=="5 ROOM", Punggol2$year == "2011")
type52012<-filter(Punggol2, Punggol2$flat_type=="5 ROOM", Punggol2$year == "2012")
type52013<-filter(Punggol2, Punggol2$flat_type=="5 ROOM", Punggol2$year == "2013")
type52014<-filter(Punggol2, Punggol2$flat_type=="5 ROOM", Punggol2$year == "2014")
type52015<-filter(Punggol2, Punggol2$flat_type=="5 ROOM", Punggol2$year == "2015")
type52016<-filter(Punggol2, Punggol2$flat_type=="5 ROOM", Punggol2$year == "2016")
type52017<-filter(Punggol2, Punggol2$flat_type=="5 ROOM", Punggol2$year == "2017")

d2007<-as.integer(mean(type52007$resale_price))
d2008<-as.integer(mean(type52008$resale_price))
d2009<-as.integer(mean(type52009$resale_price))
d2010<-as.integer(mean(type52010$resale_price))
d2011<-as.integer(mean(type52011$resale_price))
d2012<-as.integer(mean(type52012$resale_price))
d2013<-as.integer(mean(type52013$resale_price))
d2014<-as.integer(mean(type52014$resale_price))
d2015<-as.integer(mean(type52015$resale_price))
d2016<-as.integer(mean(type52016$resale_price))
d2017<-as.integer(mean(type52017$resale_price))

#Total Average Prices Per Year
type4and52007<-filter(Punggol2, Punggol2$year=="2007"| Punggol2$flat_type=="4 ROOM"& Punggol2$flat_type=="5 ROOM")
type4and52008<-filter(Punggol2, Punggol2$year=="2008"| Punggol2$flat_type=="4 ROOM"& Punggol2$flat_type=="5 ROOM")
type4and52009<-filter(Punggol2, Punggol2$year=="2009"| Punggol2$flat_type=="4 ROOM"& Punggol2$flat_type=="5 ROOM")
type4and52010<-filter(Punggol2, Punggol2$year=="2010"| Punggol2$flat_type=="4 ROOM"& Punggol2$flat_type=="5 ROOM")
type4and52011<-filter(Punggol2, Punggol2$year=="2011"| Punggol2$flat_type=="4 ROOM"& Punggol2$flat_type=="5 ROOM")
type4and52012<-filter(Punggol2, Punggol2$year=="2012"| Punggol2$flat_type=="4 ROOM"& Punggol2$flat_type=="5 ROOM")
type4and52013<-filter(Punggol2, Punggol2$year=="2013"| Punggol2$flat_type=="4 ROOM"& Punggol2$flat_type=="5 ROOM")
type4and52014<-filter(Punggol2, Punggol2$year=="2014"| Punggol2$flat_type=="4 ROOM"& Punggol2$flat_type=="5 ROOM")

type23452015<-filter(Punggol2, Punggol2$year=="2015"| Punggol2$flat_type=="2 ROOM"& Punggol2$flat_type=="3 ROOM"&Punggol2$flat_type=="4 ROOM"& Punggol2$flat_type=="5 ROOM")
type23452016<-filter(Punggol2, Punggol2$year=="2016"| Punggol2$flat_type=="2 ROOM"& Punggol2$flat_type=="3 ROOM"&Punggol2$flat_type=="4 ROOM"& Punggol2$flat_type=="5 ROOM")
type23452017<-filter(Punggol2, Punggol2$year=="2017"| Punggol2$flat_type=="2 ROOM"& Punggol2$flat_type=="3 ROOM"&Punggol2$flat_type=="4 ROOM"& Punggol2$flat_type=="5 ROOM")

e2007<-as.integer(mean(type4and52007$resale_price))
e2008<-as.integer(mean(type4and52008$resale_price))
e2009<-as.integer(mean(type4and52009$resale_price))
e2010<-as.integer(mean(type4and52010$resale_price))
e2011<-as.integer(mean(type4and52011$resale_price))
e2012<-as.integer(mean(type4and52012$resale_price))
e2013<-as.integer(mean(type4and52013$resale_price))
e2014<-as.integer(mean(type4and52014$resale_price))
e2015<-as.integer(mean(type23452015$resale_price))
e2016<-as.integer(mean(type23452016$resale_price))
e2017<-as.integer(mean(type23452017$resale_price))

#Add to data frame
Year <- c("2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017")

tworoom <- c(a2007,a2008,a2009,a2010,a2011,a2012,a2013,a2014,a2015,a2016,a2017)
threeroom <- c(b2007,b2008,b2009,b2010,b2011,b2012,b2013,b2014,b2015,b2016,b2017)
fourroom <- c(c2007,c2008,c2009,c2010,c2011,c2012,c2013,c2014,c2015,c2016,c2017)
fiveroom <- c(d2007,d2008,d2009,d2010,d2011,d2012,d2013,d2014,d2015,d2016,d2017)
average <- c(e2007,e2008,e2009,e2010,e2011,e2012,e2013,e2014,e2015,e2016,e2017)

Punggoldf <- data.frame(Year,tworoom,threeroom,fourroom,fiveroom,average)

#Replace NaN value with zero
is.nan.data.frame <- function(x)
  do.call(cbind, lapply(x, is.nan))

Punggoldf[is.nan(Punggoldf)] <- 0

str(Punggoldf)

library(plotly)

p <- plot_ly(
  type = 'table',
  header = list(
    values = c('<b>YEAR</b>', '<b>2 Room</b>','<b>3 Room</b>','<b>4 Room</b>','<b>5 Room</b>','<b>Total<b>'),
    line = list(color = '#506784'),
    fill = list(color = '#119DFF'),
    align = c('left','center'),
    font = list(color = 'white', size = 12)
  ),
  cells = list(
    values = rbind(
      c("2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017", '<b>2008 vs 2018</b>'),
      c(a2007,a2008,a2009,a2010,a2011,a2012,a2013,a2014,a2015,a2016,a2017),
      c(b2007,b2008,b2009,b2010,b2011,b2012,b2013,b2014,b2015,b2016,b2017),
      c(c2007,c2008,c2009,c2010,c2011,c2012,c2013,c2014,c2015,c2016,c2017),
      c(d2007,d2008,d2009,d2010,d2011,d2012,d2013,d2014,d2015,d2016,d2017),
      c(e2007,e2008,e2009,e2010,e2011,e2012,e2013,e2014,e2015,e2016,e2017)),
    line = list(color = '#506784'),
    fill = list(color = c('#25FEFD', 'white')),
    align = c('left', 'center'),
    font = list(color = c('#506784'), size = 12)
  ))
p

