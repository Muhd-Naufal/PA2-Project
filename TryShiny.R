#install.packages("shiny")
library(shiny)
library(dplyr)


#ONE ROOM
resale <- read.csv("./Datasets/HDB1.csv")
resale <- filter(resale, Year >= 2012)
resale <- filter(resale, resale$flat_type == "1 ROOM")


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
room1 = plot(monthly_ts, type ="l", xlab="", ylab = "Average Price per Square Meter", xlim = c(2012,2019),ylim = c(4500,6500), main="ARIMA prediction") +
  lines(10^(prediction$pred),col="blue") +
  lines(10^(prediction$pred+2*prediction$se),col="orange") +
  lines(10^(prediction$pred-2*prediction$se),col="orange")

room1

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
B <- plot(monthly_ts, type ="l", xlab="", ylab = "Average Price per Square Meter", xlim = c(2012,2019),ylim = c(4500,6500), main="ARIMA prediction") +
  lines(10^(prediction$pred),col="blue") +
  lines(10^(prediction$pred+2*prediction$se),col="orange") +
  lines(10^(prediction$pred-2*prediction$se),col="orange")

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
C <- plot(monthly_ts, type ="l", xlab="", ylab = "Average Price per Square Meter", xlim = c(2012,2019),ylim = c(4500,6500), main="ARIMA prediction") +
  lines(10^(prediction$pred),col="blue") +
  lines(10^(prediction$pred+2*prediction$se),col="orange") +
  lines(10^(prediction$pred-2*prediction$se),col="orange")

#FOUR ROOM
resale <- read.csv("./Datasets/HDB1.csv")
resale <- filter(resale, Year >= 2012)
resale <- filter(resale1, flat_type == "4 ROOM")

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
D <- plot(monthly_ts, type ="l", xlab="", ylab = "Average Price per Square Meter", xlim = c(2012,2019),ylim = c(4500,6500), main="ARIMA prediction") +
  lines(10^(prediction$pred),col="blue") +
  lines(10^(prediction$pred+2*prediction$se),col="orange") +
  lines(10^(prediction$pred-2*prediction$se),col="orange")

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
E <- plot(monthly_ts, type ="l", xlab="", ylab = "Average Price per Square Meter", xlim = c(2012,2019),ylim = c(4500,6500), main="ARIMA prediction") +
  lines(10^(prediction$pred),col="blue") +
  lines(10^(prediction$pred+2*prediction$se),col="orange") +
  lines(10^(prediction$pred-2*prediction$se),col="orange")

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
f <- plot(monthly_ts, type ="l", xlab="", ylab = "Average Price per Square Meter", xlim = c(2012,2019),ylim = c(4500,6500), main="ARIMA prediction") +
  lines(10^(prediction$pred),col="blue") +
  lines(10^(prediction$pred+2*prediction$se),col="orange") +
  lines(10^(prediction$pred-2*prediction$se),col="orange")

#MULTI GENERATION
resale <- read.csv("./Datasets/HDB1.csv")
resale <- filter(resale, Year >= 2012)
resale <- filter(resale, flat_type == "1 ROOM")

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
G <- plot(monthly_ts, type ="l", xlab="", ylab = "Average Price per Square Meter", xlim = c(2012,2019),ylim = c(4500,6500), main="ARIMA prediction") +
  lines(10^(prediction$pred),col="blue") +
  lines(10^(prediction$pred+2*prediction$se),col="orange") +
  lines(10^(prediction$pred-2*prediction$se),col="orange")


library(shiny)
myData <- runif(100)


plotType <- function(x, type) {
  switch(type,
         A = A,
         B = B,
         C = C,
         D = D,
         E = E,
         f = f,
         G = G
}
runApp(list(
  ui = bootstrapPage(
    radioButtons("pType", "Choose plot type:",
                 list("A", "B", "C","D","E","F","G")),
    plotOutput('plot')
  ),
  server = function(input, output) {
    output$plot <- renderPlot({ 
      plotType(myData, input$pType)
    })
  }
))