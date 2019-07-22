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
example_points2[1,] <- c(1.440142,103.790508)
example_points2[2,] <- c(1.420109,103.835187)
example_points2[3,] <- c(1.3341337,103.9062028)

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

#install.packages("data.table")
library(data.table)
library(ggplot2)

a <- c(rep("A", 25), rep("B", 25))
b <- rep(as.Date(c("2007-01-01")) + seq(60,1500,60),2)
c <- runif(50, 0, 1000)
d <- data.frame(a,b,c)

setDT(d)[,b := as.IDate(b)]
ggplot(d[,sum(c), by=.(a, year(b))], aes(x=year, y=V1, fill=a)) +
  geom_bar(stat = "identity")



########## useless
library(tidyr)
hdb7 <- spread(hdb6, key = hdb5.flat_type, value = hdb5.resale_price)
hdb7

#Remove NAs
#install.packages("data.table")
library(data.table)

result <- data.table(hdb7)[, lapply(.SD, function(x) x[order(is.na(x))])]
hdb8 <- zoo::na.trim(result, is.na = "all")
hdb8

#try stack plot now
library(reshape2)
hdb9 <- melt(hdb8, id.vars = "row")
hdb9


library(ggplot2)
ggplot(hdb9, aes(x = variable, y = value, fill = row)) + 
  geom_bar(stat = "identity") +
  xlab("\nType") +
  ylab("Time\n") +
  guides(fill = FALSE) +
  theme_bw()
########useless
#Add Year to column
hdb2$year <- format(as.Date(hdb2$month, format="%Y-%m-%d"),"%Y")

#Add Quarter column
hdb2$quarter <- quarters(hdb2$month)

#Combine Year and Quarter column
hdb2$quarters <- paste(hdb2$year,hdb2$quarter)

#Add id ros
hdb7$row <- seq_len(nrow(hdb5))

##########

a <- c(rep("A", 25), rep("B", 25))
a
b <- rep(as.Date(c("2007-01-01")) + seq(60,1500,60),2)
b
c <- runif(50, 0, 1000)
c
d <- data.frame(a,b,c)
d

setDT(d)[,b := as.IDate(b)]
ggplot(d[,sum(c), by=.(a, year(b))], aes(x=year, y=V1, fill=a)) +
  geom_bar(stat = "identity")

#install.packages("plotly")
library(leaflet)
library(plotly)

accumulate_by <- function(dat, var) {
  var <- lazyeval::f_eval(var, dat)
  lvls <- plotly:::getLevels(var)
  dats <- lapply(seq_along(lvls), function(x) {
    cbind(dat[var %in% lvls[seq(1, x)], ], frame = lvls[[x]])
  })
  dplyr::bind_rows(dats)
}

d <- txhousing %>%
  filter(year > 2005, city %in% c("Abilene", "Bay Area")) %>%
  accumulate_by(~date)

p <- d %>%
  plot_ly(
    x = ~date, 
    y = ~median,
    split = ~city,
    frame = ~frame, 
    type = 'scatter',
    mode = 'lines', 
    line = list(simplyfy = F)
  ) %>% 
  layout(
    xaxis = list(
      title = "Date",
      zeroline = F
    ),
    yaxis = list(
      title = "Median",
      zeroline = F
    )
  ) %>% 
  animation_opts(
    frame = 100, 
    transition = 0, 
    redraw = FALSE
  ) %>%
  animation_slider(
    hide = T
  ) %>%
  animation_button(
    x = 1, xanchor = "right", y = 0, yanchor = "bottom"
  )

housing_data$month <- as.Date(housing_data$month)
housing_data
str(housing_data)

ifelse((students[,3]<25)&(students[,2]=="m"),males.youth<-"t",males.youth<-"f")
c(ifelse((EPLRelegate[,8]>33),PTS<-"Survive",PTS<-"Relegated"))
ifelse((Sea2017[,1]>=10), Grade<-"A",ifelse((Sea2017[,1]>=4)&(Sea2017[,1]<10),Grade<-"B",Grade<-"C"))

#Anime test
library(ggplot2)
library(gganimate)
library(dplyr)

housing_data <- read.csv("./Datasets/HDB Resale Prices.csv")
housing_data

housing_data$month <- as.Date(paste0(housing_data$month, "-01"), "%Y-%m-%d")
housing_data
str(housing_data)

housing_data$month <- format(as.Date(housing_data$month, format="%Y-%m-%d"),"%Y")
housing_data
str(housing_data)

housing_data2 <- filter(housing_data, month >= "2012")
housing_data2
str(housing_data2)

housing_data3 <- filter(housing_data2 ,flat_type == "4 ROOM" | 
                          flat_type == "5 ROOM" | 
                          flat_type == "EXECUTIVE" | 
                          flat_type == "MULTI-GENERATION")
housing_data3
str(housing_data3)

housing_data4 <- housing_data3[,c(1,3,10)]
housing_data4
str(housing_data4)

i <- sapply(housing_data4, is.factor)
housing_data4[i] <- lapply(housing_data4[i], as.character)
str(housing_data4)

housing_data4$month <- as.numeric(as.character(housing_data4$month))
housing_data4
str(housing_data4)


housing_data4$number <- 1
housing_data4$number[housing_data4$flat_type == "5 ROOM"] <- 2
housing_data4$number[housing_data4$flat_type == "EXECUTIVE"] <- 3
housing_data4$number[housing_data4$flat_type == "MULTI-GENERATION"] <- 4
housing_data4

View(housing_data4)

View(airquality)
str(airquality)

p <- ggplot(
  airquality,
  aes(Day, Temp, group = Month, color = factor(Month))
) +
  geom_line() +
  scale_color_viridis_d() +
  labs(x = "Day of Month", y = "Temperature") +
  theme(legend.position = "top")
p + 
  geom_point(aes(group = seq_along(Day))) +
  transition_reveal(Day)

#temp = resale price
#day = month
#Month = town


View(housing_data4)

p <- ggplot(
  housing_data4,
  aes(month, resale_price,group = number, color = factor(number))
) +
  geom_line() +
  scale_color_viridis_d() +
  labs(x = "Year", y = "Resale Price") +
  theme(legend.position = "top")
p


p + 
  geom_point(aes(group = seq_along(number))) +
  transition_reveal(number)


#install.packages("gifski")
library(gifski)

df <- rbind(
  data.frame(group = c("A","B","C"), values = c(3,2,4), frame = rep('a',3)),
  data.frame(group = c("A","B","C"), values = c(5,3,7), frame = rep('b',3))
)

ggplot(df, aes(group, values, fill = group)) + 
  geom_col(position = "identity") + 
  transition_states(frame, .02, .001) + 
  ease_aes('cubic-in-out')

hdb2 <- read.csv("./Datasets/HDB Resale Prices.csv")

str(hdb2)

#Convert Factor to Date (Year-Month)
#It'll assume first day of each month

hdb2$month <- as.Date(paste0(hdb2$month, "-01"), "%Y-%m-%d")
hdb2

#Choose only those 2012 and above
library(dplyr)
hdb3 <- filter(hdb2, month >= "2012-01-01")
hdb3

#Choose specific flat type only
hdb4 <- filter(hdb3, flat_type == "4 ROOM" | 
                 flat_type == "5 ROOM" | 
                 flat_type == "EXECUTIVE" | 
                 flat_type == "MULTI-GENERATION")

#Resale value above $900,000 
hdb5 <- filter(hdb4, resale_price >= 900000)
hdb5

#Count flat types
library(plyr)
library(dplyr)

hdb6 <- count(hdb5, "flat_type")
hdb6
#Select specific columns

hdb7 <- data.frame(hdb5$flat_type, hdb5$resale_price, hdb5$month)
hdb7

hdb7$hdb5.resale_price <- 1
hdb7

str(hdb7)

hdb8 <- filter(hdb3, flat_type == "4 ROOM" | 
                 flat_type == "5 ROOM" | 
                 flat_type == "EXECUTIVE" | 
                 flat_type == "MULTI-GENERATION")

hdb8

hdb9 <- data.frame(hdb8$flat_type, hdb8$month)
hdb9

str(hdb9)

hdb9$year <- substring(hdb9$hdb8.month,1,4)
hdb9

str(hdb9)

i <- sapply(hdb9, is.factor)
hdb9[i] <- lapply(hdb9[i], as.character)
str(hdb9)

hdb9$year <- as.numeric(as.character(hdb9$year))
hdb9
str(hdb9)

#2012
hdb4R2012 <- nrow(subset(hdb9,hdb8.flat_type == '4 ROOM' & hdb9$year=='2012'))
hdb5R2012 <- nrow(subset(hdb9,hdb8.flat_type == '5 ROOM' & hdb9$year=='2012'))
hdbEX2012 <- nrow(subset(hdb9,hdb8.flat_type == 'EXECUTIVE' & hdb9$year=='2012'))
hdbMG2012 <- nrow(subset(hdb9,hdb8.flat_type == 'MULTI-GENERATION' & hdb9$year=='2012'))

#2013
hdb4R2013 <- nrow(subset(hdb9,hdb8.flat_type == '4 ROOM' & hdb9$year=='2013'))
hdb5R2013 <- nrow(subset(hdb9,hdb8.flat_type == '5 ROOM' & hdb9$year=='2013'))
hdbEX2013 <- nrow(subset(hdb9,hdb8.flat_type == 'EXECUTIVE' & hdb9$year=='2013'))
hdbMG2013 <- nrow(subset(hdb9,hdb8.flat_type == 'MULTI-GENERATION' & hdb9$year=='2013'))

#2014
hdb4R2014 <- nrow(subset(hdb9,hdb8.flat_type == '4 ROOM' & hdb9$year=='2014'))
hdb5R2014 <- nrow(subset(hdb9,hdb8.flat_type == '5 ROOM' & hdb9$year=='2014'))
hdbEX2014 <- nrow(subset(hdb9,hdb8.flat_type == 'EXECUTIVE' & hdb9$year=='2014'))
hdbMG2014 <- nrow(subset(hdb9,hdb8.flat_type == 'MULTI-GENERATION' & hdb9$year=='2014'))

#2015
hdb4R2015 <- nrow(subset(hdb9,hdb8.flat_type == '4 ROOM' & hdb9$year=='2015'))
hdb5R2015 <- nrow(subset(hdb9,hdb8.flat_type == '5 ROOM' & hdb9$year=='2015'))
hdbEX2015 <- nrow(subset(hdb9,hdb8.flat_type == 'EXECUTIVE' & hdb9$year=='2015'))
hdbMG2015 <- nrow(subset(hdb9,hdb8.flat_type == 'MULTI-GENERATION' & hdb9$year=='2015'))

#2016
hdb4R2016 <- nrow(subset(hdb9,hdb8.flat_type == '4 ROOM' & hdb9$year=='2016'))
hdb5R2016 <- nrow(subset(hdb9,hdb8.flat_type == '5 ROOM' & hdb9$year=='2016'))
hdbEX2016 <- nrow(subset(hdb9,hdb8.flat_type == 'EXECUTIVE' & hdb9$year=='2016'))
hdbMG2016 <- nrow(subset(hdb9,hdb8.flat_type == 'MULTI-GENERATION' & hdb9$year=='2016'))

#2017
hdb4R2017 <- nrow(subset(hdb9,hdb8.flat_type == '4 ROOM' & hdb9$year=='2017'))
hdb5R2017 <- nrow(subset(hdb9,hdb8.flat_type == '5 ROOM' & hdb9$year=='2017'))
hdbEX2017 <- nrow(subset(hdb9,hdb8.flat_type == 'EXECUTIVE' & hdb9$year=='2017'))
hdbMG2017 <- nrow(subset(hdb9,hdb8.flat_type == 'MULTI-GENERATION' & hdb9$year=='2017'))

Volume <- c(hdb4R2012,hdb4R2013,hdb4R2014,hdb4R2015,hdb4R2016,hdb4R2017,
            hdb5R2012,hdb5R2013,hdb5R2014,hdb5R2015,hdb5R2016,hdb5R2017,
            hdbEX2012,hdbEX2013,hdbEX2014,hdbEX2015,hdbEX2016,hdbEX2017,
            hdbMG2012,hdbMG2013,hdbMG2014,hdbMG2015,hdbMG2016,hdbMG2017)


Flat_Type <- c("4 Room","4 Room","4 Room","4 Room","4 Room","4 Room",
               "5 Room","5 Room","5 Room","5 Room","5 Room","5 Room",
               "Executive","Executive","Executive","Executive","Executive","Executive",
               "Multi-Generation","Multi-Generation","Multi-Generation","Multi-Generation","Multi-Generation","Multi-Generation")

Year <- c("2012","2013","2014","2015","2016","2017",
          "2012","2013","2014","2015","2016","2017",
          "2012","2013","2014","2015","2016","2017",
          "2012","2013","2014","2015","2016","2017")


finalhdb <- data.frame(Volume,Year,Flat_Type)
finalhdb

finalhdb$Year <- as.numeric(as.character(finalhdb$Year))

View(finalhdb)
str(finalhdb)
library(ggplot2)
library(gganimate)

p <- ggplot(
  finalhdb,
  aes(Year,Volume, group = Flat_Type, color = factor(Flat_Type), label = Flat_Type)
) +
  geom_line() +
  scale_color_viridis_d() +
  labs(x = "Years", y = "Transaction Volume") +
  theme(legend.position = "top") +
  geom_label()
p

p + 
  geom_point(aes(group = seq_along(Year)), size = 7) +
  transition_reveal(Year)

#mature

maturecsv<-read.csv("./Datasets/HDB Resale Prices.csv")
maturecsv


mature2 <- filter(maturecsv, flat_type == "4 ROOM" | 
                    flat_type == "5 ROOM" | 
                    flat_type == "EXECUTIVE" | 
                    flat_type == "MULTI-GENERATION"|
                    flat_type == "MULTI GENERATION")
mature2

mature <-filter(mature2, town =="ANG MO KIO"|
                  town=="BEDOK"|
                  town=="BISHAN"|
                  town=="BUKIT MERAH"|
                  town=="BUKIT TIMAH"|
                  town=="CENTRAL AREA"|
                  town=="CLEMENTI"|
                  town=="GEYLANG"|
                  town=="KALLANG/WHAMPOA"|
                  town=="MARINE PARADE"|
                  town=="QUEENSTOWN"|
                  town=="SERANGOON"|
                  town=="TAMPINES"|
                  town=="TOA PAYOH"|
                  town=="PASIR RIS")

#nonmature

nonmaturecsv<-read.csv("./Datasets/HDB Resale Prices.csv")
nonmaturecsv


nonmature2 <- filter(nonmaturecsv, flat_type == "4 ROOM" | 
                       flat_type == "5 ROOM" | 
                       flat_type == "EXECUTIVE" | 
                       flat_type == "MULTI-GENERATION"|
                       flat_type == "MULTI GENERATION")
nonmature2

nonmature <-filter(nonmature2, town =="BUKIT BATOK"|
                     town=="CHOA CHU KANG"|
                     town=="HOUGANG"|
                     town=="JURONG EAST"|
                     town=="JURONG WEST"|
                     town=="SENGKANG"|
                     town=="WOODLANDS"|
                     town=="YISHUN"|
                     town=="LIM CHU KANG"|
                     town=="SEMBAWANG"|
                     town=="BUKIT PANJANG"|
                     town=="PUNGGOL")




