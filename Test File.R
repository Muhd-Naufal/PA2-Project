#This file is for testing purposes 

#Unused code
leaflet() %>%
  addTiles() %>%
  addCircleMarkers(data=mrt,
                   radius=4, 
                   stroke=2, 
                   fillColor = "Red", 
                   color="Red",
                   popup = stationname) %>%
  addMarkers(data = primaryschool, popup = primaryschoolname) %>%
  addMarkers(data = attractions, popup = attractionname) %>%
  addMarkers(data = cc, popup = ccname) %>%
  addMarkers(data = hawkers, popup = hawkername) %>%
  addMarkers(data = institutes, popup = institutename) %>%
  addMarkers(data = hospitals, popup = hospitalname) %>%
  addMarkers(data = kindergartens, popup = kindergartenname) %>%
  addMarkers(data = parks, popup = parkname) %>%
  addMarkers(data = polyclinics, popup = polyclinicname) %>%
  addMarkers(data = secondaryschool, popup = secondaryschoolname) %>%
  addMarkers(data = shoppingmall, popup = shoppingmallname) %>%
  addMarkers(data = supermarket, popup = supermarketname)

over(pointsBuffer2, mrt, fn=length)
over(pointsBuffer2, mrt, returnList = TRUE)

#Combined
#Combined test 
combined <- read.csv("./Datasets/CombinedDataset.csv")
combined <- as.data.frame(combined)
coordinates(combined) <- ~Longitude + Latitude

onehundredhdb <- read.csv("./Datasets/100HDBAddress.csv")
onehundredhdb

str(onehundredhdb)

coordinates(onehundredhdb) <- ~Longitude + Latitude


#Choose point in map
example_points2 <- data.frame(lat=numeric(), long= numeric())
example_points2[1,] <- c(1.2817753,103.8429707)
example_points2[2,] <- c(1.4431022,103.775057)
example_points2[3,] <- c()

coordinates(example_points2) <- ~long + lat

#Buffer range
pointsBuffer2 <- gBuffer(example_points2, width=.005, byid = TRUE)
pointsBuffer3 <- gBuffer(onehundredhdb, width=.005, byid = TRUE)

#Combined test map 
leaflet(options = leafletOptions(preferCanvas = TRUE)) %>%
  addTiles() %>%
  addMarkers(data=combined,clusterOptions = markerClusterOptions()) %>%
  addMarkers(data=onehundredhdb) %>%
  addPolygons(data=pointsBuffer3)

count<- over(pointsBuffer3, combined, fn=length)
count <- as.data.frame(count)
count

View(count)

over(pointsBuffer2, combined, returnList = TRUE)