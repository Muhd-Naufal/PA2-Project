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

a <- max(mature$resale_price)
b <- min(mature$resale_price)

c <- max(nonmature$resale_price)
d <- min(nonmature$resale_price)

library(ggplot2)
ggplot(mature, aes(x=mature$month, y=mature$resale_price))+
  geom_point(stat="identity",color ="red") +
  ggtitle("Resale Price of Mature Towns by Year-Month") +
  xlab("year-month") + ylab("Resale Price")

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


