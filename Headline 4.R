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
library(reshape2)

max <- c(a,c)
min <- c(b,d)

town <- data.frame(max,min)
town

#id <- c(1,2,3,4)
id <- c("Mature-Max","Non-Mature-Max","Mature-Min","Non-Mature-Min")
town2 <-cbind(id,town)
town2

town3 <- melt(town)
town3

ggplot(data = town3, aes(x=id, y=value, fill=variable)) +
  geom_bar(stat = 'identity',position = 'dodge') +
  geom_smooth(method = "lm")

mean(mature[,10])

mean(nonmature[,10])

ggplot(mature, aes(y=mature$resale_price))+ 
  geom_boxplot()

ggplot(nonmature, aes(y=nonmature$resale_price))+ 
  geom_boxplot()

#New HDBs built (2010+)	
#install.packages("zoo")
library(zoo) 

#convert to yearmonth
mature$month <- as.yearmon(mature$month, "%Y-%m")
mature
nonmature$month <- as.yearmon(nonmature$month, "%Y-%m")

#filter to >=2010
newmature <- filter(mature, month >= "2010-01")
newmature
newnonmature <- filter(nonmature, month >= "2010-01")
newnonmature

#Find avg resale price & difference
matureavg <- mean(newmature$resale_price)
nonmatureavg <- mean(newnonmature$resale_price)
difference <- matureavg - nonmatureavg
difference



month<-mature[,1]
mature$month<-substr(month,1,4)
mature$month
