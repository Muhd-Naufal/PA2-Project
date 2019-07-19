#Value comparison between Mature towns and Non-Mature Towns

#Libraries
library(dplyr)
library(leaflet)
library(geojsonio)
library(RColorBrewer)
library(rgeos)
library(zoo) 
library(plotly)

#mature
maturecsv<-read.csv("./Datasets/HDB Resale Prices.csv")

mature2 <- filter(maturecsv, flat_type == "2 ROOM"|
                    flat_type == "3 ROOM" |
                    flat_type == "4 ROOM" | 
                    flat_type == "5 ROOM" | 
                    flat_type == "EXECUTIVE" | 
                    flat_type == "MULTI-GENERATION"|
                    flat_type == "MULTI GENERATION")

mature <-filter(mature2, town =="ANG MO KIO"|
                  town=="BEDOK"|
                  town=="BISHAN"|
                  town=="BUKIT MERAH"|
                  town=="BUKIT TIMAH"|
                  town=="CENTRAL AREA"|
                  town=="CLEMENTI"|
                  town=="GEYLANG"|
                  town=="KALLANG/WHAMPOA"|
                  town=="MARINE PARADE"|
                  town=="QUEENSTOWN"|
                  town=="SERANGOON"|
                  town=="TAMPINES"|
                  town=="TOA PAYOH"|
                  town=="PASIR RIS")

#nonmature

nonmaturecsv<-read.csv("./Datasets/HDB Resale Prices.csv")

nonmature2 <- filter(nonmaturecsv, flat_type == "2 ROOM"|
                       flat_type == "3 ROOM" |
                       flat_type == "4 ROOM" | 
                       flat_type == "5 ROOM" | 
                       flat_type == "EXECUTIVE" | 
                       flat_type == "MULTI-GENERATION"|
                       flat_type == "MULTI GENERATION")

nonmature <-filter(nonmature2, town =="BUKIT BATOK"|
                     town=="CHOA CHU KANG"|
                     town=="HOUGANG"|
                     town=="JURONG EAST"|
                     town=="JURONG WEST"|
                     town=="SENGKANG"|
                     town=="WOODLANDS"|
                     town=="YISHUN"|
                     town=="LIM CHU KANG"|
                     town=="SEMBAWANG"|
                     town=="BUKIT PANJANG"|
                     town=="PUNGGOL")

#Mature boxplot

k <-  plot_ly(mature, x = ~resale_price, color = ~flat_type, type = "box") %>%
  
  layout(title="Mature Town Resale Prices per Flat Type",
         xaxis=list(title="Mature Resale"),
         yaxis=list(title="Flat Type"))
k

#Non-Mature boxplot

o <-  plot_ly(nonmature, x = ~resale_price, color = ~flat_type, type = "box") %>%
  
  layout(title="Non-Mature Town Resale Prices per Flat Type",
         xaxis=list(title="Non-Mature Resale"),
         yaxis=list(title="Flat Type"))
o

####################################################################################################

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

ggplot(boxmature, aes(y=mature$resale_price))+ 
  geom_boxplot()

ggplot(nonmature, aes(y=nonmature$resale_price))+ 
  geom_boxplot()

#New HDBs built (2010+)	
#install.packages("zoo")
library(zoo) 

#convert to yearmonth

mature$month <- as.yearmon(mature$month, "%Y-%m")
str(mature)
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

townavg <- c(matureavg,nonmatureavg)
townname <- c("Mature","Non-Mature")
townbar <- data.frame(townname,townavg)

d <- plot_ly(townbar, x = ~townname, y = ~townavg, type = 'bar',text = townavg, textposition = 'auto') %>%
  layout(title = "Average Resale Price Difference Between Mature and Non-Mature Estate",
         xaxis = list(title = "Estate"),
         yaxis = list(title = "Average Resale Price"))

d

mature2 <- substr(mature$month,4,8)
mature2

mature$month2 <- format(as.Date(mature$month, format="%Y-%m"),"%Y")
mature

str(mature)


