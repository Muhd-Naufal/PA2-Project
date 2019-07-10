library("rjson")

json_file <-"https://developers.onemap.sg/privateapi/popapi/getOccupation?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjI3MjksInVzZXJfaWQiOjI3MjksImVtYWlsIjoiMTk5OG5hdWZhbEBnbWFpbC5jb20iLCJmb3JldmVyIjpmYWxzZSwiaXNzIjoiaHR0cDpcL1wvb20yLmRmZS5vbmVtYXAuc2dcL2FwaVwvdjJcL3VzZXJcL3Nlc3Npb24iLCJpYXQiOjE1NjA0MDk3MjIsImV4cCI6MTU2MDg0MTcyMiwibmJmIjoxNTYwNDA5NzIyLCJqdGkiOiI0NjUzN2YzZmE4YjEyZTMwZTMzODdlZDZmMzgwZTEzMiJ9.0WQUOPl_s0n9TxNaLondpmVamvAvt0PLFSYzCQlkhpU&planningArea=Bedok&year=2010"
json_data <- fromJSON(file=json_file)
json_data


library(jsonlite)

data <- fromJSON("https://developers.onemap.sg/privateapi/popapi/getOccupation?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjI3MjksInVzZXJfaWQiOjI3MjksImVtYWlsIjoiMTk5OG5hdWZhbEBnbWFpbC5jb20iLCJmb3JldmVyIjpmYWxzZSwiaXNzIjoiaHR0cDpcL1wvb20yLmRmZS5vbmVtYXAuc2dcL2FwaVwvdjJcL3VzZXJcL3Nlc3Npb24iLCJpYXQiOjE1NjA0MDk3MjIsImV4cCI6MTU2MDg0MTcyMiwibmJmIjoxNTYwNDA5NzIyLCJqdGkiOiI0NjUzN2YzZmE4YjEyZTMwZTMzODdlZDZmMzgwZTEzMiJ9.0WQUOPl_s0n9TxNaLondpmVamvAvt0PLFSYzCQlkhpU&planningArea=Bedok&year=2010")
data

View(data)

write.csv(data, file="data.csv")

#Leaflet Stuff

#install.packages("leaflet")
library(dplyr)
library(RColorBrewer)
library(leaflet)
library(geojsonio)

mymap = leaflet()
mymap

mymap = leaflet()
mymap = addTiles(mymap)
mymap

mymap = leaflet()
mymap = addTiles(mymap)
mymap = setView(mymap, lat=1.3110390, lng =103.7767958, zoom= 17)
mymap = addMarkers(mymap, lat=1.3110390, lng =103.7767958, popup = "Singapore Polytechic")
mymap

mrt<-read.csv("mrtsg.csv")
mrt<- as.data.frame(mrt)
stationname<-mrt$STN_NAME
stationname

primaryschool <- read.csv("primaryschoolsg.csv")
primaryschool <- as.data.frame(primaryschool)

leaflet() %>%
  addTiles() %>%
  addCircleMarkers(
    data = mrt, 
    radius = 7, 
    color = ~pal(COLOR),
    stroke = FALSE, 
    fillOpacity = 0.7, 
    lat = ~Latitude, lng = ~Longitude,
    popup = stationname) %>%
  addMarkers(data = primaryschool,
             lat =~Latitude, lng = ~Longitude, 
             clusterOptions = markerClusterOptions())

pal <- colorFactor(levels = c("RED", "BLUE", "GREEN","YELLOW","PURPLE","BROWN","GREY"),
                   palette = c("red", "blue", "green","yellow","purple","brown","grey"))

leaflet() %>%
  addTiles() %>%
  #addMarkers(data = mrt, lat = ~Latitude, lng = ~Longitude)
  addCircleMarkers(data = mrt, 
                   radius = 5, 
                   color = ~pal(COLOR),
                   stroke = FALSE, 
                   fillOpacity = 0.7, 
                   lat = ~Latitude, lng = ~Longitude,
                   popup = stationname)

install.packages("geojsonio")
library(geojsonio)

town <- geojsonio::geojson_read("MP14_PLNG_AREA_NO_SEA_PL.geojson", what = "sp")
class(town)
names(town)

m <- leaflet(town) %>%
  setView(mymap, lat=1.290270, lng =103.851959, zoom = 11) %>%
  addTiles()

m %>% addPolygons()

library(RColorBrewer)
factpal <- colorFactor(brewer.pal(n = 11, name ="Spectral") , town$Name)

#Add Colour
m %>% addPolygons(
    data = town,
    weight = 1,
    stroke = TRUE, fillOpacity = 0.5, smoothFactor = 0.5,
    color = "black", opacity = 1,
    fillColor = ~factpal(town$Name)) %>%
    addTiles()

#Add highlights
m %>% addPolygons(
  weight = 2,
  opacity = 1,
  color = "white",
  dashArray = "3",
  fillOpacity = 0.7,
  highlight = highlightOptions(
    weight = 5,
    color = "#666",
    dashArray = "",
    fillOpacity = 0.7,
    bringToFront = TRUE))

#Test 1
m %>% addPolygons(
  fillColor = ~factpal(town$Name),
  weight = 2,
  opacity = 1,
  color = "white",
  dashArray = "3",
  fillOpacity = 0.7,
  highlight = highlightOptions(
    weight = 5,
    color = "#666",
    dashArray = "",
    fillOpacity = 0.7,
    bringToFront = TRUE))

#Final Output 1

labels <- sprintf(
  "<strong>%s</strong>",
  town$Name
) %>% lapply(htmltools::HTML)


m <-  m %>% addPolygons(
  fillColor = ~factpal(town$Name),
  weight = 2,
  opacity = 0.4,
  color = "white",
  dashArray = "3",
  fillOpacity = 0.7,
  highlight = highlightOptions(
    weight = 5,
    color = "#666",
    dashArray = "",
    fillOpacity = 0.7,
    bringToFront = TRUE),
  label = labels,
  labelOptions = labelOptions(
    style = list("font-weight" = "normal", padding = "3px 8px"),
    textsize = "15px",
    direction = "auto"))
m

#Final Output 2
#html %s = text, %g = numeric

labels <- sprintf(
  "<strong>%s</strong><br/>%s",
  town$Name, town$Region.Name
) %>% lapply(htmltools::HTML)

m <- m %>% addPolygons(
  fillColor = ~factpal(town$Name),
  weight = 2,
  opacity = 1,
  color = "white",
  dashArray = "3",
  fillOpacity = 0.7,
  highlight = highlightOptions(
    weight = 5,
    color = "#666",
    dashArray = "",
    fillOpacity = 0.7,
    bringToFront = TRUE),
  label = labels,
  labelOptions = labelOptions(
    style = list("font-weight" = "normal", padding = "3px 8px"),
    textsize = "15px",
    direction = "auto"))
m

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

