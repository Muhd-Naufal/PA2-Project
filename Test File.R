
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
library(leaflet)

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
mrt
str(mrt)
str(quakes)
View(mrt)

leaflet() %>%
  addTiles() %>%
  #addMarkers(data = mrt, lat = ~Latitude, lng = ~Longitude)
  addCircleMarkers(data = mrt, lat = ~Latitude, lng = ~Longitude)

pal <- colorFactor(levels = c("RED", "BLUE", "GREEN","YELLOW","PURPLE","BROWN","GREY"),
                   palette = c("red", "blue", "green","yellow","purple","brown","grey"))

leaflet() %>%
  addTiles() %>%
  #addMarkers(data = mrt, lat = ~Latitude, lng = ~Longitude)
  addCircleMarkers(data = mrt, radius = 5, color = ~pal(COLOR), lat = ~Latitude, lng = ~Longitude)
