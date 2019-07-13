#Value comparison between Mature towns and Non-Mature Towns

#Libraries
library(dplyr)
library(leaflet)
library(geojsonio)
library(RColorBrewer)
library(rgeos)

mature<-read.csv("./Datasets/maturetowns.csv")
mature
nonmature<-read.csv("./Datasets/nonmaturetowns.csv")
nonmature

max(mature$resale_price)
min(mature$resale_price)

max(nonmature$resale_price)
min(nonmature$resale_price)

library(ggplot2)
ggplot(mature, aes(x=mature$month, y=mature$resale_price))+
  geom_point(stat="identity",color ="red") +
  ggtitle("Resale Price of Mature Towns by Year-Month") +
  xlab("year-month") + ylab("Resale Price")




