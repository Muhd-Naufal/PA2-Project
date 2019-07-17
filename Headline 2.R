#High Resale Prices

hdb<-read.csv("./Datasets/insight 2.csv")
hdb

library(ggplot2)
ggplot(hdb,aes(x=hdb$flat_model,y=hdb$resale_price)) +
  geom_point(fill="pink",color ="red")

levels(hdb$flat_model)

DBSS <- nrow(filter(hdb, hdb$flat_model=="DBSS"))
Maisonette <- nrow(filter(hdb, hdb$flat_model=="Maisonette"))
Type_S2 <- nrow(filter(hdb, hdb$flat_model=="Type S2"))
Terrace <- nrow(filter(hdb, hdb$flat_model=="Terrace"))
Improved <- nrow(filter(hdb, hdb$flat_model=="Improved"))
Apartment <- nrow(filter(hdb, hdb$flat_model=="Apartment"))

flatmodel<-c("DBSS","Maisonette","Type_S2","Terrace","Improved","Apartment")
count<-as.numeric(c(DBSS,Maisonette,Type_S2,Terrace,Improved,Apartment))

data<-data.frame(cbind(flatmodel,count))
data

data$count <- as.numeric(as.character(data$count))

ggplot(data=data, aes(x=reorder(flatmodel,-count),y=count)) +
  geom_bar(stat = "identity")

ggplot(data=data, aes(x=flatmodel,y=count)) +
  geom_bar(stat="identity")

data$count <- as.numeric(as.character(data$count))

ggplot(data=data, aes(x=reorder(flatmodel,-count),y=count)) +
  geom_bar(stat = "identity")



###############################################################

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
#Select specific columns

hdb7 <- data.frame(hdb5$flat_type, hdb5$resale_price, hdb5$month)
hdb7

hdb7$hdb5.resale_price <- 1
hdb7
str(hdb7)

sum(hdb7$hdb5.resale_price)

library(data.table)
library(ggplot2)
#install.packages("ggrepel")
library(ggrepel)


setDT(hdb7)[,hdb5.month := as.IDate(hdb5.month)]
ggplot(hdb7[,sum(hdb5.resale_price), by=.(hdb5.flat_type, year(hdb5.month))], aes(x=year, y=V1, fill=hdb5.flat_type)) +
  geom_bar(stat = "identity") +
  geom_label_repel(aes(label=V1), vjust=0) +
  ggtitle("Resale flats above $900K by Year") +
  xlab("Year") + ylab("Transaction Volume") +
  labs(fill='Flat Type') 

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

Volume <- c(hdb4R2012,hdb4R2013,hdb4R2014,hdb4R2015,hdb4R2016,hdb4R2017,
            hdb5R2012,hdb5R2013,hdb5R2014,hdb5R2015,hdb5R2016,hdb5R2017,
            hdbEX2012,hdbEX2013,hdbEX2014,hdbEX2015,hdbEX2016,hdbEX2017,
            hdbMG2012,hdbMG2013,hdbMG2014,hdbMG2015,hdbMG2016,hdbMG2017)


Flat_Type <- c("4 Room","4 Room","4 Room","4 Room","4 Room","4 Room",
               "5 Room","5 Room","5 Room","5 Room","5 Room","5 Room",
               "Executive","Executive","Executive","Executive","Executive","Executive",
               "Multi-Generation","Multi-Generation","Multi-Generation","Multi-Generation","Multi-Generation","Multi-Generation")

Year <- c("2012","2013","2014","2015","2016","2017",
          "2012","2013","2014","2015","2016","2017",
          "2012","2013","2014","2015","2016","2017",
          "2012","2013","2014","2015","2016","2017")


finalhdb <- data.frame(Volume,Year,Flat_Type)
finalhdb

finalhdb$Year <- as.numeric(as.character(finalhdb$Year))

str(finalhdb)
library(ggplot2)
library(gganimate)

p <- ggplot(
  finalhdb,
  aes(Year,Volume, group = Flat_Type, color = factor(Flat_Type), label = Flat_Type)
) +
  geom_line() +
  scale_color_viridis_d() +
  labs(x = "Years", y = "Transaction Volume") +
  theme(legend.position = "top") +
  geom_label()
p

p + 
  geom_point(aes(group = seq_along(Year)), size = 7) +
  transition_reveal(Year)

