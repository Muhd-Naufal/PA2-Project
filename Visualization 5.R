#Household size vs Flat size from 1990s to 2000s

#Libraries
library(dplyr)
library(leaflet)
library(geojsonio)
library(RColorBrewer)
library(rgeos)
library(likert) 
library(zoo) 
library(plotly)
library(ggplot2)
options(scipen=10000)

Householdcsv<-read.csv("./Datasets/HDB1.csv")

Household <- filter(Householdcsv, flat_type == "3 ROOM" |
                       flat_type == "4 ROOM" | 
                       flat_type == "5 ROOM" | 
                       flat_type == "EXECUTIVE" )

Household

##
Setyear <- filter(Household, Year >= 1990 , Year < 2000)
Setyear 

str(Setyear)
tail(Setyear)

Setyear$resale_price <- as.numeric(levels(Setyear$resale_price))[Setyear$resale_price]

ThreeRoom1990 <- filter(Setyear, flat_type == "3 ROOM")
FourRoom1990 <- filter(Setyear, flat_type == "4 ROOM")
FiveRoom1990 <- filter(Setyear, flat_type == "5 ROOM")
ExecutiveRoom1990 <- filter(Setyear, flat_type == "EXECUTIVE")

v3r1990 <- nrow(ThreeRoom1990)
v3r1990
v4r1990 <- nrow(FourRoom1990)
v4r1990
v5r1990 <- nrow(FiveRoom1990)
v5r1990
vExr1990 <- nrow(ExecutiveRoom1990)
vExr1990

total1990 <- sum(v3r1990,v4r1990,v5r1990,vExr1990)
total1990

v3r1990p <- v3r1990/total1990 * 100
v3r1990p


v4r1990p <- v4r1990/total1990 * 100
v4r1990p

v5r1990p <- v5r1990/total1990 * 100
v5r1990p

vExr1990p <- vExr1990/total1990 * 100
vExr1990p






##

Setyear2 <- filter(Household, Year >= 2000 , Year <= 2017)
Setyear2


Setyear2$resale_price <- as.numeric(levels(Setyear2$resale_price))[Setyear2$resale_price]
str(Setyear2)

ThreeRoom2000 <- filter(Setyear2, flat_type == "3 ROOM")
FourRoom2000 <- filter(Setyear2, flat_type == "4 ROOM")
FiveRoom2000 <- filter(Setyear2, flat_type == "5 ROOM")
ExecutiveRoom2000 <- filter(Setyear2, flat_type == "EXECUTIVE")

v3r2000 <- nrow(ThreeRoom2000)
v3r2000
v4r2000 <- nrow(FourRoom2000)
v4r2000
v5r2000 <- nrow(FiveRoom2000)
v5r2000
vExr2000 <- nrow(ExecutiveRoom2000)
vExr2000

total2000 <- sum(v3r2000,v4r2000,v5r2000,vExr2000)
total2000

v3r2000p <- v3r2000/total2000 * 100
v3r2000p


v4r2000p <- v4r2000/total2000 * 100
v4r2000p

v5r2000p <- v5r2000/total2000 * 100
v5r2000p

vExr2000p <- vExr2000/total2000 * 100
vExr2000p

str(FiveRoom2000)



library(plotly)

Flat_Type1990 <- c("3 ROOM","4 ROOM","5 ROOM","EXECUTIVE")
Categories1990 <- c(v3r1990,v4r1990,v5r1990,vExr1990)

final1990 <- data.frame(Flat_Type1990,Categories1990)

p <- plot_ly(final1990, labels = ~Flat_Type1990, values = ~Categories1990, type = 'pie') %>%
  layout(title = 'Percentage of Flat types sold in 1990s',
         xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
         yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
p

Flat_Type2000 <- c("3 ROOM","4 ROOM","5 ROOM","EXECUTIVE")
Categories2000 <- c(v3r2000,v4r2000,v5r2000,vExr2000)

final1990 <- data.frame(Flat_Type2000,Categories2000)

q <- plot_ly(final2000, labels = ~Flat_Type2000, values = ~Categories2000, type = 'pie') %>%
  layout(title = 'Percentage of Flat types sold in 2000s',
         xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
         yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
q

x <- c("3 ROOM","4 ROOM","5 ROOM","EXECUTIVE")
y1 <- c(v3r1990,v4r1990,v5r1990,vExr1990)
y2 <- c(v3r2000,v4r2000,v5r2000,vExr2000)
data <- data.frame(x, y1, y2)

t <- plot_ly(data, x = ~x, y = ~y1, type = 'bar', name = '1990s', marker = list(color = 'dark green')) %>%
  add_trace(y = ~y2, name = '2000s', marker = list(color = 'red')) %>%
  layout(xaxis = list(title = "Flat Types", tickangle = -45),
         yaxis = list(title = "Number Of Flats Sold"),
         margin = list(b = 100),
         barmode = 'group')
t

