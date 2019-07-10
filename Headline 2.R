#Relationship between POI and Resale Value

#Libraries
library(dplyr)
library(leaflet)
library(geojsonio)
library(RColorBrewer)
library(rgeos)


mrt<-read.csv("./Datasets/mrtsg.csv")
mrt<- as.data.frame(mrt)

mrtsg <- mrt
coordinates(mrtsg) <- ~Longitude + Latitude

leaflet(mrtsg) %>% 
  addTiles() %>% 
  addCircleMarkers(radius=4, stroke=2, fillColor = "Red", color="Red")

#Create a new dataframe with lat and long being column names and as numeric
example_points <- data.frame(lat=numeric(), long= numeric())
example_points[1,] <- c(1.385361693,103.744367)


#add coordinates to make it spatial data
#reason why lat and long is because the dataframe that was created before this was named lat and long
coordinates(example_points) <- ~long + lat

pointsBuffer <- gBuffer(example_points, width=.05, byid = TRUE)

leaflet(mrtsg) %>% 
  addTiles() %>% 
  addCircleMarkers(radius=4, stroke=2, fillColor = "Red", color="Red") %>%
  addMarkers(data=example_points) %>%
  addPolygons(data=pointsBuffer)

over(pointsBuffer, mrtsg, fn=length)
over(pointsBuffer, mrtsg, returnList = TRUE)

#############################################################################################


mrt <- read.csv("./Datasets/mrtsg.csv")
primaryschool <-read.csv("./Datasets/primaryschoolsg.csv")

mrt <- as.data.frame(mrt)
primaryschool <- as.data.frame(primaryschool)

stationname<-mrt$STN_NAME
primaryschoolname <- primaryschool$Name

coordinates(mrt) <- ~Longitude + Latitude
coordinates(primaryschool) <- ~Longitude + Latitude

#Combined test 
combined <- read.csv("./Datasets/CombinedTest.csv")
combined <- as.data.frame(combined)
coordinates(combined) <- ~Longitude + Latitude

leaflet() %>%
  addTiles() %>%
  addCircleMarkers(data=mrt,
                   radius=4, 
                   stroke=2, 
                   fillColor = "Red", 
                   color="Red",
                   popup = stationname) %>%
  addMarkers(data=primaryschool,
             popup = primaryschoolname)

example_points2 <- data.frame(lat=numeric(), long= numeric())
example_points2[1,] <- c(1.385361693,103.744367)

coordinates(example_points2) <- ~long + lat

pointsBuffer2 <- gBuffer(example_points2, width=.01, byid = TRUE)

leaflet() %>%
  addTiles() %>%
  addCircleMarkers(data=mrt,
                   radius=4, 
                   stroke=2, 
                   fillColor = "Red", 
                   color="Red",
                   popup = stationname) %>%
  addMarkers(data=primaryschool,
             popup = primaryschoolname) %>%
  addMarkers(data=example_points2) %>%
  addPolygons(data=pointsBuffer2)
  
over(pointsBuffer2, mrt, fn=length)
over(pointsBuffer2, mrt, returnList = TRUE)

leaflet(options = leafletOptions(preferCanvas = TRUE)) %>%
  addTiles() %>%
  addMarkers(data=combined) %>%
  addMarkers(data=example_points2) %>%
  addPolygons(data=pointsBuffer2)

over(pointsBuffer2, combined, fn=length)
over(pointsBuffer2, combined, returnList = TRUE)
