#Compare Median Resale Price against Dataset

#Libraries
library(dplyr)
library(leaflet)
library(geojsonio)
library(RColorBrewer)
library(rgeos)
library(htmlwidgets)
library(htmltools)

#install.packages("geojsonio")
library(geojsonio)

town <- geojsonio::geojson_read("map.geojson", what = "sp")
class(town)
names(town)

mymap = leaflet()
mymap

tag.map.title <- tags$style(HTML("
  .leaflet-control.map-title { 
    transform: translate(-50%,20%);
    position: fixed !important;
    left: 50%;
    text-align: center;
    padding-left: 10px; 
    padding-right: 10px; 
    background: rgba(255,255,255,0.75);
    font-weight: bold;
    font-size: 28px;
  }
"))

title <- tags$div(
  tag.map.title, HTML("Median Resale Price Per Town")
)  

m <- leaflet(town) %>%
  setView(mymap, lat=1.290270, lng =103.851959, zoom = 11) %>%
  addTiles() %>%
  addControl(title, position = "topleft", className="map-title")

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
  "<strong>%s</strong><br/>2017: %s<br/>2012: %s<br/>2007: %s" ,
  town$Name, town$Median2017, town$Median2012, town$Median2007
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


