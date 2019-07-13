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

a <- max(mature$resale_price)
b <- min(mature$resale_price)

c <- max(nonmature$resale_price)
d <- min(nonmature$resale_price)


mature1<-c(maxmature,minmature)
nonmature1<-c(maxnonmature,minnonmature)

data<-data.frame(mature1,nonmature1)
data


rownames(data)<-c("max","min")
data

library(ggplot2)
library(reshape2)

melt(data,id.vars="",measure.vars = c("max","min"))

 employee <- c('John Doe','Peter Gynn','Jolie Hope')
 salary <- c(21000, 23400, 26800)
 startdate <- as.Date(c('2010-11-1','2008-3-25','2007-3-14'))

 employ.data <- data.frame(employee, salary, startdate)
 employ.data

 maturetown <- c(a,b)
 nonmaturetown <- c(c,d)
 
 town <- data.frame(maturetown,nonmaturetown)
 town
 
id <- c(1,2,3,4)
town2 <-cbind(id,town)
town2
 
town3 <- melt(town,id='id')
town3

ggplot(data = town3, aes(x=id, y=value, fill=variable)) +
  geom_bar(stat = 'identity',position = 'dodge')



ggplot(data,aes(x=max,y=max(mature$resale_price),fill=variable))+
  geom_bar(stat="identity",position='dodge')+
ggplot(nonmature,aes(x=town,y=max(nonmature$resale_price),fill=variable))+
  geom_bar(stat="identity",position='dodge')+
  ggtitle("Mature vs Non-Mature")+xlab("town")+ylab("resale_price")+
  theme(
    plot.title=element_text(color="red",size=12,face="bold.italic",hjust=0.5),
    axis.title.x = element_text(color="blue",size=12,face="bold"),
    axis.title.y = element_text(color="green",size=12,face="bold"))
