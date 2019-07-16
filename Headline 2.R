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
hdb2

#Convert Factor to Date (Year-Month)
#It'll assume first day of each month

hdb2$month <- as.Date(paste0(hdb2$month, "-01"), "%Y-%m-%d")

#Add Quarter column
hdb2$quarter <- quarters(hdb2$month)


str(hdb2)

#Choose only those 2012 and above
hdb3 <- filter(hdb2, month >= "2012-01-01")
hdb3

#Choose specific flat type only
hdb4 <- filter(hdb3, flat_type == "4 ROOM" | 
                      flat_type == "5 ROOM" | 
                      flat_type =="EXECUTIVE" | 
                      flat_type =="MULTI GENERATION")
hdb4



#Resale value above $900,000 
hdb5 <- filter(hdb4, resale_price >= 900000)
hdb5


