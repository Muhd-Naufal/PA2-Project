data<-read.csv("HDB Resale Prices.csv")

#Part 1: Data Cleansing

#regroup data to year
year<-substr(data$month, start = 1, stop = 4)
df1<-as.data.frame(year)
data2<-cbind(df1,data)

#determine number of rooms
no_rooms<-substr(data2$flat_type, start = 1, stop = 1)
roomdf<-as.data.frame(no_rooms)
datab<-cbind(roomdf,data2)

#find average of storey range
lower<-substr(datab$storey_range,start=1,stop=2)
upper<-substr(datab$storey_range,start=7,stop=8)
storey1<-cbind(lower,upper,datab)
storeydf<-as.data.frame(storey1)

#convert to numeric
storeydf$lower <- as.numeric(as.character(storeydf$lower))
storeydf$upper <- as.numeric(as.character(storeydf$upper))
storeydf$year <- as.numeric(as.character(storeydf$year))

#check
str(storeydf)

#average storey in storey range
meanstorey<-(storeydf$upper+storeydf$lower)/2
meanstorey

#add meanstorey to dataframe
mstorey<-as.data.frame(meanstorey)
data3<-cbind(meanstorey,storeydf)

#change "E" and "M" in no_rooms col to 5rooms
table(data3$no_rooms)
data3$no_rooms<-gsub("M", "5", data3$no_rooms)
data3$no_rooms<-gsub("E", "5", data3$no_rooms)
table(data3$no_rooms)

#convert no_rooms to numeric
data3$no_rooms <- as.numeric(as.character(data3$no_rooms))

#final check on structure

#remove unneccesary columns
#keep floor,number of rooms,year, floor area sqm,lease commence date and resale price
finaldata<-data3[,-c(2,3,5,6,7,8,9,10,11,13)]

#Part 2: Regression

#correlation
cor(finaldata)[6,]

#lm()
fit1<-lm(resale_price~.,data=finaldata)
summary(fit1)
