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
