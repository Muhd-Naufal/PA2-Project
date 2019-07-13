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

maxmature<-max(mature$resale_price)
minmature<-min(mature$resale_price)

maxnonmature<-max(nonmature$resale_price)
minnonmature<-min(nonmature$resale_price)

mature1<-c(maxmature,minmature)
nonmature1<-c(maxnonmature,minnonmature)

data<-data.frame(mature1,nonmature1)
data

rownames(data)<-c("max","min")
data

library(ggplot2)
library(reshape2)

melt(data,id.vars="",measure.vars = c("max","min"))


ggplot(data,aes(x=max,y=max(mature$resale_price),fill=variable))+
  geom_bar(stat="identity",position='dodge')+
ggplot(nonmature,aes(x=town,y=max(nonmature$resale_price),fill=variable))+
  geom_bar(stat="identity",position='dodge')+
  ggtitle("Mature vs Non-Mature")+xlab("town")+ylab("resale_price")+
  theme(
    plot.title=element_text(color="red",size=12,face="bold.italic",hjust=0.5),
    axis.title.x = element_text(color="blue",size=12,face="bold"),
    axis.title.y = element_text(color="green",size=12,face="bold"))
