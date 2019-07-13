#Relationship between POI and Resale Value

install.packages("dplyr")
install.packages("leaflet")
install.packages("geojsonio")
install.packages("RColorBrewer")
install.packages("rgeos")

sessionInfo()

#Libraries
library(dplyr)
library(leaflet)
library(geojsonio)
library(RColorBrewer)
library(rgeos)

#Test with only 1 dataset

#Read CSV and put into dataframe+
mrt<-read.csv("./Datasets/mrtsg.csv")
mrt<- as.data.frame(mrt)

#add coordinates to make it spatial data
mrtsg <- mrt
coordinates(mrtsg) <- ~Longitude + Latitude

#Create a new dataframe with lat and long being column names and as numeric
example_points <- data.frame(lat=numeric(), long= numeric())

#Add test coordinates into dataframe
example_points[1,] <- c(1.385361693,103.744367)

#add coordinates to make it spatial data
#reason why lat and long is because the dataframe that was created before this was named lat and long
coordinates(example_points) <- ~long + lat

#Identify buffer radius
pointsBuffer <- gBuffer(example_points, width=.05, byid = TRUE)

#Plot map 
leaflet(mrtsg) %>% 
  addTiles() %>% 
  addCircleMarkers(radius=4, stroke=2, fillColor = "Red", color="Red") %>%
  addMarkers(data=example_points) %>%
  addPolygons(data=pointsBuffer)

#Count or list points within the buffer radius
over(pointsBuffer, mrtsg, fn=length)
over(pointsBuffer, mrtsg, returnList = TRUE)

####################################################################################################################################


#Test with multiple dataset

#Load datasets
mrt <- read.csv("./Datasets/mrtsg.csv")
primaryschool <- read.csv("./Datasets/primaryschoolsg.csv")
attractions <- read.csv("./Datasets/Attractions.csv")
cc <- read.csv("./Datasets/communityclubs.csv")
hawkers <- read.csv("./Datasets/hawkercentre.csv")
institutes <- read.csv("./Datasets/HigherEducationInstitutions.csv")
hospitals <- read.csv("./Datasets/Hospitals.csv")
kindergartens <- read.csv("./Datasets/kindergartens.csv")
parks <- read.csv("./Datasets/Parks.csv")
polyclinics <- read.csv("./Datasets/Polyclinics.csv")
secondaryschool <- read.csv("./Datasets/secondaryschoolsg.csv")
shoppingmall <- read.csv("./Datasets/ShoppingMall.csv")
supermarket <- read.csv("./Datasets/supermarkets.csv")

#Convert to dataframe
mrt <- as.data.frame(mrt)
primaryschool <- as.data.frame(primaryschool)
attractions <- as.data.frame(attractions)
cc <- as.data.frame(cc)
hawkers <- as.data.frame(hawkers)
institutes <- as.data.frame(institutes)
hospitals <- as.data.frame(hospitals)
kindergartens <- as.data.frame(kindergartens)
parks <- as.data.frame(parks)
polyclinics <- as.data.frame(polyclinics)
secondaryschool <- as.data.frame(secondaryschool)
shoppingmall <- as.data.frame(shoppingmall)
supermarket <- as.data.frame(supermarket)

#Identify names
stationname<-mrt$STN_NAME
primaryschoolname <- primaryschool$Name
attractionname <- attractions$Attractions
ccname <- cc$Name
hawkername <- hawkers$Name
institutename <- institutes$Tertiary.Institutions
hospitalname <- hospitals$Hospitals
kindergartenname <- kindergartens$Name
parkname <- parks$Nature.Parks.Gardens
polyclinicname <- polyclinics$Polyclinics
secondaryschoolname <- secondaryschool$SCHNAME
shoppingmallname <- shoppingmall$Shopping.malls
supermarketname <- supermarket$LIC_NAME


#Identify their latitite and longitude
coordinates(mrt) <- ~Longitude + Latitude
coordinates(primaryschool) <- ~Longitude + Latitude
coordinates(attractions) <- ~Longitude + Latitude
coordinates(cc) <- ~X + Y
coordinates(hawkers) <- ~X + Y
coordinates(institutes) <- ~Longitude + Latitude
coordinates(hospitals) <- ~Longitude + Latitude
coordinates(kindergartens) <- ~X + Y
coordinates(parks) <- ~Longitude + Latitude
coordinates(polyclinics) <- ~Longitude + Latitude
coordinates(secondaryschool) <- ~longitude + latitude
coordinates(shoppingmall) <- ~Longitude + Latitude
coordinates(supermarket) <- ~X + Y

#MRT Colours
pal <- colorFactor(levels = c("RED","BLUE","GREEN","YELLOW","PURPLE","BROWN","GREY"),
                   palette = c("red","blue","green","yellow","purple","brown","grey"))

#Add markers to map
leaflet() %>%
  addTiles() %>%
  addCircleMarkers(data=mrt,
                   radius=8, 
                   stroke=1, 
                   color=~pal(COLOR),
                   fillColor = ~pal(COLOR),
                   popup = stationname,
                   group = "MRT") %>%
  addMarkers(data=primaryschool, popup = primaryschoolname,
             clusterOptions = markerClusterOptions(),
             group = "Primary School") %>%
  addMarkers(data = attractions, popup = attractionname,
             clusterOptions = markerClusterOptions(),
             group = "Attractions") %>%
  addMarkers(data = cc, popup = ccname,
             clusterOptions = markerClusterOptions(),
             group = "Community Club") %>%
  addMarkers(data = hawkers, popup = hawkername,
             clusterOptions = markerClusterOptions(),
             group = "Hawker Centre") %>%
  addMarkers(data = institutes, popup = institutename,
             clusterOptions = markerClusterOptions(),
             group = "Education Institution") %>%
  addMarkers(data = hospitals, popup = hospitalname,
             clusterOptions = markerClusterOptions(),
             group = "Hospital") %>%
  addMarkers(data = kindergartens, popup = kindergartenname,
             clusterOptions = markerClusterOptions(),
             group = "Kindergarden") %>%
  addMarkers(data = parks, popup = parkname,
             clusterOptions = markerClusterOptions(),
             group = "Parks") %>%
  addMarkers(data = polyclinics, popup = polyclinicname,
             clusterOptions = markerClusterOptions(),
             group = "Polyclinic") %>%
  addMarkers(data = secondaryschool, popup = secondaryschoolname,
             clusterOptions = markerClusterOptions(),
             group = "Secondary School") %>%
  addMarkers(data = shoppingmall, popup = shoppingmallname,
             clusterOptions = markerClusterOptions(),
             group = "Shopping Mall") %>%
  addMarkers(data = supermarket, popup = supermarketname,
             clusterOptions = markerClusterOptions(),
             group = "Supermarket") %>%
  
#Add Layer Control
addLayersControl(
  overlayGroups = c("MRT","Primary School","Attractions","Community Club","Hawker Centre","Education Institution","Hospital","Kindergarden","Parks","Polyclinic","Secondary School","Shopping Mall","Supermarket")
)

####################################################################################################################################


#Combined test 
combined <- read.csv("./Datasets/CombinedDataset.csv")
combined <- as.data.frame(combined)
coordinates(combined) <- ~Longitude + Latitude

#Choose points in map
onehundredhdb <- read.csv("./Datasets/100HDBAddress.csv")
coordinates(onehundredhdb) <- ~Longitude + Latitude

#Buffer range
pointsBuffer3 <- gBuffer(onehundredhdb, width=.005, byid = TRUE)

#Combined test map 
leaflet(options = leafletOptions(preferCanvas = TRUE)) %>%
  addTiles() %>%
  addMarkers(data=combined,clusterOptions = markerClusterOptions()) %>%
  addMarkers(data=onehundredhdb) %>%
  addPolygons(data=pointsBuffer3)

count<- over(pointsBuffer3, combined, fn=length)
count <- as.data.frame(count)
count <-count[,-2:-3]
count <- as.data.frame(count)
count


