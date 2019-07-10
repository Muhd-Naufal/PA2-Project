#Relationship between POI and Resale Value

#Libraries
library(dplyr)
library(leaflet)
library(geojsonio)
library(RColorBrewer)
library(rgeos)


#install.packages("rgeos")
library(rgeos)

mrt<-read.csv("mrtsg.csv")
mrt<- as.data.frame(mrt)
stationname<-mrt$STN_NAME
stationname
#CCK lat long example point
#1.385361693	103.744367


mrtsg <- mrt
coordinates(mrtsg) <- ~Longitude + Latitude

leaflet(mrtsg) %>% 
  addTiles() %>% 
  addCircleMarkers(radius=4, stroke=2, fillColor = "Red", color="Red")

example_points <- data.frame(lat=numeric(), long= numeric()) 
example_points[1,] <- c(1.385361693,103.74436,7)

#add coordinates to make it spatial data
coordinates(example_points) <- ~long + lat

pointsBuffer <- gBuffer(example_points, width=.05, byid = TRUE)

leaflet(mrtsg) %>% addTiles() %>% addCircleMarkers(radius=4, stroke=2, fillColor = "Red", color="Red") %>%
  addMarkers(data=example_points) %>%
  addPolygons(data=pointsBuffer)

over(pointsBuffer, mrtsg, fn=length)

