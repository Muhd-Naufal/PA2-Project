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

#onehundredhdb <- read.csv("./Datasets/100HDBAddress.csv")
#onehundredhdb

#str(onehundredhdb)

#coordinates(onehundredhdb) <- ~Longitude + Latitude


#Choose point in map
example_points2 <- data.frame(lat=numeric(), long= numeric())
example_points2[1,] <- c(1.344179,103.7124931)

coordinates(example_points2) <- ~long + lat

#Buffer range
pointsBuffer2 <- gBuffer(example_points2, width=.005, byid = TRUE)
#pointsBuffer3 <- gBuffer(onehundredhdb, width=.005, byid = TRUE)

#Combined test map 
leaflet(options = leafletOptions(preferCanvas = TRUE)) %>%
  addTiles() %>%
  addMarkers(data=combined,clusterOptions = markerClusterOptions()) %>%
  addMarkers(data=example_points2) %>%
  addPolygons(data=pointsBuffer2)

over(pointsBuffer2, combined, fn=length)

##################

dat <- read.table(text = "2012Q1   2012Q2   2012Q3   2012Q4   2013Q1   201Q2    2013Q3
        4ROOM             480       780       431       295     670     360       190
        5ROOM             720       350       377       255     340     615       345
        EXECUTIVE         460       480       179       560     60      735       1260
        MULTIGENERATION   220       240       876       789     820     100       75", header = TRUE)
dat

library(reshape2)

dat$row <- seq_len(nrow(dat))
dat
dat2 <- melt(dat, id.vars = "row")
dat2

library(ggplot2)

ggplot(dat2, aes(x = variable, y = value, fill = row)) + 
  geom_bar(stat = "identity") +
  xlab("\nType") +
  ylab("Time\n") +
  theme_bw()

