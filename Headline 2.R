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

#Convert Factor to Date (Year-Month)
#It'll assume first day of each month

hdb2$month <- as.Date(paste0(hdb2$month, "-01"), "%Y-%m-%d")

#Choose only those 2012 and above
library(dplyr)
hdb3 <- filter(hdb2, month >= "2012-01-01")

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
