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

#Add Year to column
hdb2$year <- format(as.Date(hdb2$month, format="%Y-%m-%d"),"%Y")

#Add Quarter column
hdb2$quarter <- quarters(hdb2$month)

#Choose only those 2012 and above
hdb3 <- filter(hdb2, month >= "2012-01-01")
hdb3

#Choose specific flat type only
hdb4 <- filter(hdb3, flat_type == "4 ROOM" | 
                 flat_type == "5 ROOM" | 
                 flat_type == "EXECUTIVE" | 
                 flat_type == "MULTI GENERATION"|
                 flat_type == "MULTI-GENERATION")

hdb4 <- filter(hdb3, flat_type == "MULTI-GENERATION")
hdb4

#Resale value above $900,000 
hdb5 <- filter(hdb4, resale_price >= 900000)
hdb5

#Select specific columns

hdb6 <- data.frame(hdb5$flat_type, hdb5$resale_price)
hdb6

#Add id ros
hdb6$row <- seq_len(nrow(hdb6))

library(tidyr)
hdb7 <- spread(hdb6, key = hdb5.flat_type, value = hdb5.resale_price)
hdb7

#Remove NAs
#install.packages("data.table")
library(data.table)

result <- data.table(hdb7)[, lapply(.SD, function(x) x[order(is.na(x))])]
hdb8 <- zoo::na.trim(result, is.na = "all")
hdb8

#try stack plot now
library(reshape2)
hdb9 <- melt(hdb8, id.vars = "row")
hdb9


library(ggplot2)
ggplot(hdb9, aes(x = variable, y = value, fill = row)) + 
  geom_bar(stat = "identity") +
  xlab("\nType") +
  ylab("Time\n") +
  guides(fill = FALSE) +
  theme_bw()
