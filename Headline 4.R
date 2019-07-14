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
 
id <- c(1,2,3,4)
town2 <-cbind(id,town)
town2

town3 <- melt(town)
town3

ggplot(data = town3, aes(x=id, y=value, fill=variable)) +
  geom_bar(stat = 'identity',position = 'dodge')
