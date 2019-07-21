#Household size vs Flat size from 1990s to 2000s

#Libraries
library(dplyr)
library(leaflet)
library(geojsonio)
library(RColorBrewer)
library(rgeos)
library(likert) 

Household<-read.csv("./Datasets/HDB Resale Prices.csv")

Household2 <- filter(Household, flat_type == "3 ROOM" |
                       flat_type == "4 ROOM" | 
                       flat_type == "5 ROOM" | 
                       flat_type == "EXECUTIVE" )

Period1990 <- c(69,105,123,140)
Period2000 <- c(65,90,110,140)


FloorArea <- data.frame(Period1990,Period2000)

rownames(FloorArea) <- c("3-Room","4-Room","5-Room","Executive")

FloorArea

###

AverageSquare = (Household$resale_price) / FloorArea

FloorArea <- cbind(FloorArea,AverageSquare) 
FloorArea

####

Household<-read.csv("./Datasets/HDB Resale Prices.csv")


g <- which(Household$type == "Company cars"| data$type == "Private cars" | data$type == "Rental cars")
g
h <- data[g,]

i <- which(data$year > 2013 & data$year < 2017)
j <- h[i,]
j <- na.omit(j)

j %>%
  group_by(year)

data %>%
  filter(data$type == "Company cars"| data$type == "Private cars" | data$type == "Rental cars", data$year >= 2013) %>%
  group_by(year) %>%
  summarise(number = sum(number))


library(ggplot2)
library(dplyr)
options(scipen=10000)


data2<-subset(df,df$sector=="Private Sector"& df$year>=2000)
data2


data2 <- filter(data, data$ethnic_group == "Chinese" | data$ethnic_group == "Malay" )
data2

ggplot()+
  geom_line(data=data1,aes(x=data1$year,y=data1$no_of_drug_abusers),color="blue")+
  geom_point(data=data1, aes(x=data1$year,y=data1$no_of_drug_abusers),color="blue")+
  geom_line(data=data2,aes(x=data2$year,y=data2$no_of_drug_abusers),color="red")+
  geom_point(data=data2, aes(x=data2$year,y=data2$no_of_drug_abusers),color="red")+
  ggtitle("Q4.3 - Student Name - New Absersby ethnic groups") + xlab("Year")+ ylab("No of Drugs Abusers")

