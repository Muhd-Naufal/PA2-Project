#install.packages("shiny")
library(shiny)
library(dplyr)

#Headline: Here's what to expect for the upcoming "Average Price per Square Meter" for different Flat Types in the next 10 months
#In this Prediction Model, GlobNex aim to predict future Price per Square Meter for different Flat Types, in the next 10months.
#As many houses are getting smaller, GlobNex has provided users to understand and expect ranges of the "Average Price per Square Meter" for each flat types to help families estimate the prices they are paying. Also, allowing them to be able to recognise if the prices has been unreasonably priced


#ONE ROOM
#Codes from Line 13 to Line 192 is repeated but with different filters of Flat Types
#We decided to filter the years starting from 2012. Then by choosing 1 Room flats, we aim to predict the future prices of the Price per Square Meter
resale <- read.csv("./Datasets/HDB1.csv")
resale <- filter(resale, Year >= 2012)
resale <- filter(resale, resale$flat_type == "1 ROOM")

#Changing the column of resale price to from factor to numeric
resale$resale_price <- as.numeric(levels(resale$resale_price))[resale$resale_price]

#Calculate and bind PriceArea into 'resale' dataset using formula
resale$PriceArea <- resale$resale_price/resale$floor_area_sqm

#finding the aggregate of the of each month's PriceArea
#using ts() to identify the number of months in a year, from first and last observation, freq = 12 for monthly)
monthly = aggregate(PriceArea~month, FUN=mean, data=resale)
monthly_ts = ts(monthly$PriceArea,start = c(2012,3), frequency=12)
plot(monthly_ts, xlab="Year", ylab="Average Price per Square Meter")


#ACF is used to determine stationarity and seasonality
#Noticing how the graph from above is non-stationary, we use acf to ascertain this indication as seen in the 2 acfs,
#the ACF is decaying very slowly.
par(mfrow = c(1,2), pty = "s")
acf(monthly_ts, xlab="Lag (in years)")
acf(diff(monthly_ts), xlab="Lag (in years)")

library(forecast)
#Predicting expected values in the future
fit2 = auto.arima(log10(monthly_ts), approximation = F,trace= F)
summary(fit2)


#Formulated to predict future prices. Lines in orange shows the limits and blue indicates the expected flow of value of Average Price per Square Meter
prediction = predict(fit2, n.ahead=10)
plot(monthly_ts, type ="l", xlab="", ylab = "Average Price per Square Meter", xlim = c(2012,2019),ylim = c(5000,9000), main="ARIMA prediction") + 
  lines(10^(prediction$pred),col="blue") + 
  lines(10^(prediction$pred+2*prediction$se),col="orange") +
  lines(10^(prediction$pred-2*prediction$se),col="orange")

p1.base <- recordPlot()

#TWO ROOM
resale <- read.csv("./Datasets/HDB1.csv")
resale <- filter(resale, Year >= 2012)
resale <- filter(resale, flat_type == "2 ROOM")

resale$resale_price <- as.numeric(levels(resale$resale_price))[resale$resale_price]
resale$PriceArea <- resale$resale_price/resale$floor_area_sqm

head(resale)

monthly = aggregate(PriceArea~month, FUN=mean, data=resale)
monthly_ts = ts(monthly$PriceArea,start = c(2012,3), frequency=12)
plot(monthly_ts, xlab="Year", ylab="Average Resale Flat Price")

par(mfrow = c(1,2), pty = "s")
acf(monthly_ts, xlab="Lag (in years)")
acf(diff(monthly_ts), xlab="Lag (in years)")

library(forecast)
fit2 = auto.arima(log10(monthly_ts), approximation = F,trace= F)
summary(fit2)

prediction = predict(fit2, n.ahead=10)
plot(monthly_ts, type ="l", xlab="", ylab = "Average Price per Square Meter", xlim = c(2012,2019),ylim = c(4500,6500), main="ARIMA prediction") +
  lines(10^(prediction$pred),col="blue") +
  lines(10^(prediction$pred+2*prediction$se),col="orange") +
  lines(10^(prediction$pred-2*prediction$se),col="orange")

p2.base <- recordPlot()

#THREE ROOM
resale <- read.csv("./Datasets/HDB1.csv")
resale <- filter(resale, Year >= 2012)
resale <- filter(resale, flat_type == "3 ROOM")

resale$resale_price <- as.numeric(levels(resale$resale_price))[resale$resale_price]
resale$PriceArea <- resale$resale_price/resale$floor_area_sqm

monthly = aggregate(PriceArea~month, FUN=mean, data=resale)
monthly_ts = ts(monthly$PriceArea,start = c(2012,3), frequency=12)
plot(monthly_ts, xlab="Year", ylab="Average Resale Flat Price")

par(mfrow = c(1,2), pty = "s")
acf(monthly_ts, xlab="Lag (in years)")
acf(diff(monthly_ts), xlab="Lag (in years)")

library(forecast)
fit2 = auto.arima(log10(monthly_ts), approximation = F,trace= F)
summary(fit2)

prediction = predict(fit2, n.ahead=10)
plot(monthly_ts, type ="l", xlab="", ylab = "Average Price per Square Meter", xlim = c(2012,2019),ylim = c(4000,6000), main="ARIMA prediction") +
  lines(10^(prediction$pred),col="blue") +
  lines(10^(prediction$pred+2*prediction$se),col="orange") +
  lines(10^(prediction$pred-2*prediction$se),col="orange")

p3.base <- recordPlot()
#FOUR ROOM
resale <- read.csv("./Datasets/HDB1.csv")
resale <- filter(resale, Year >= 2012)
resale <- filter(resale, flat_type == "4 ROOM")

resale$resale_price <- as.numeric(levels(resale$resale_price))[resale$resale_price]
resale$PriceArea <- resale$resale_price/resale$floor_area_sqm

monthly = aggregate(PriceArea~month, FUN=mean, data=resale)
monthly_ts = ts(monthly$PriceArea,start = c(2012,3), frequency=12)
plot(monthly_ts, xlab="Year", ylab="Average Resale Flat Price")

par(mfrow = c(1,2), pty = "s")
acf(monthly_ts, xlab="Lag (in years)")
acf(diff(monthly_ts), xlab="Lag (in years)")

library(forecast)
fit2 = auto.arima(log10(monthly_ts), approximation = F,trace= F)
summary(fit2)

prediction = predict(fit2, n.ahead=10)
plot(monthly_ts, type ="l", xlab="", ylab = "Average Price per Square Meter", xlim = c(2012,2019),ylim = c(4000,6000), main="ARIMA prediction") +
  lines(10^(prediction$pred),col="blue") +
  lines(10^(prediction$pred+2*prediction$se),col="orange") +
  lines(10^(prediction$pred-2*prediction$se),col="orange")

p4.base <- recordPlot()
#FIVE ROOM
resale <- read.csv("./Datasets/HDB1.csv")
resale <- filter(resale, Year >= 2012)
resale <- filter(resale, flat_type == "5 ROOM")

resale$resale_price <- as.numeric(levels(resale$resale_price))[resale$resale_price]
resale$PriceArea <- resale$resale_price/resale$floor_area_sqm

monthly = aggregate(PriceArea~month, FUN=mean, data=resale)
monthly_ts = ts(monthly$PriceArea,start = c(2012,3), frequency=12)
plot(monthly_ts, xlab="Year", ylab="Average Resale Flat Price")

par(mfrow = c(1,2), pty = "s")
acf(monthly_ts, xlab="Lag (in years)")
acf(diff(monthly_ts), xlab="Lag (in years)")

library(forecast)
fit2 = auto.arima(log10(monthly_ts), approximation = F,trace= F)
summary(fit2)

prediction = predict(fit2, n.ahead=10)
plot(monthly_ts, type ="l", xlab="", ylab = "Average Price per Square Meter", xlim = c(2012,2019),ylim = c(4000,6000), main="ARIMA prediction") +
  lines(10^(prediction$pred),col="blue") +
  lines(10^(prediction$pred+2*prediction$se),col="orange") +
  lines(10^(prediction$pred-2*prediction$se),col="orange")

p5.base <- recordPlot()

#EXECUTIVE
resale <- read.csv("./Datasets/HDB1.csv")
resale <- filter(resale, Year >= 2012)
resale <- filter(resale, flat_type == "EXECUTIVE")

resale$resale_price <- as.numeric(levels(resale$resale_price))[resale$resale_price]
resale$PriceArea <- resale$resale_price/resale$floor_area_sqm

monthly = aggregate(PriceArea~month, FUN=mean, data=resale)
monthly_ts = ts(monthly$PriceArea,start = c(2012,3), frequency=12)
plot(monthly_ts, xlab="Year", ylab="Average Resale Flat Price")

par(mfrow = c(1,2), pty = "s")
acf(monthly_ts, xlab="Lag (in years)")
acf(diff(monthly_ts), xlab="Lag (in years)")

library(forecast)
fit2 = auto.arima(log10(monthly_ts), approximation = F,trace= F)
summary(fit2)

prediction = predict(fit2, n.ahead=10)
plot(monthly_ts, type ="l", xlab="", ylab = "Average Price per Square Meter", xlim = c(2012,2019),ylim = c(3500,5000), main="ARIMA prediction") +
  lines(10^(prediction$pred),col="blue") +
  lines(10^(prediction$pred+2*prediction$se),col="orange") +
  lines(10^(prediction$pred-2*prediction$se),col="orange")

p6.base <- recordPlot()

#### END OF LOOPS####

#With Shiny package, we have collated plot graphs to allow Users to visualize the Average Price per Square Meter
#App allows users to click on radio buttons to interact and display different plots according to selection, list of flat types.

library(shiny)
myData <- runif(100)


plotType <- function(x, type) {
  switch(type,
         "1 ROOM" = p1.base,
         "2 ROOM" = p2.base,
         "3 ROOM" = p3.base,
         "4 ROOM" = p4.base,
         "5 ROOM" = p5.base,
         "Executive" = p6.base)
}
runApp(list(
  ui = bootstrapPage(
    radioButtons("pType", "Choose plot type:",
                 list("1 ROOM", "2 ROOM", "3 ROOM","4 ROOM","5 ROOM","Executive")),
    plotOutput('plot')
  ),
  server = function(input, output) {
    output$plot <- renderPlot({ 
      plotType(myData, input$pType)
    })
  }
))