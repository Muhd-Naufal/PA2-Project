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

Householdcsv<-read.csv("./Datasets/HDB1.csv")

Household <- filter(Householdcsv, flat_type == "3 ROOM" |
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

###

w <-  plot_ly(Household, x = ~floor_area_sqm, color = ~flat_type, type = "scatter") %>%
  
  layout(title="Floor area of Square Meters per Flat Type",
         xaxis=list(title="Floor Square Meter"),
         yaxis=list(title="Flat Type"))
w

Household$Year <- factor(Household$Year, levels = Household[["Year"]])

p <- plot_ly(Household, x = ~Year, y = ~floor_area_sqm, name = '1990', type = 'scatter', mode = 'lines',
             line = list(color = 'rgb(205, 12, 24)', width = 4)) %>%
  add_trace(y = ~floor_area_sqm, name = '2000', line = list(color = 'rgb(22, 96, 167)', width = 4)) %>%
  layout(title = "Average Floor Square per meters for Flat types",
         xaxis = list(title = "Year"),
         yaxis = list (title = "Floor Square Meters"))

