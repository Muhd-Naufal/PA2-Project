resale <- read.csv("HDB Resale Prices.csv")
library(dplyr)

levels(resale$resale_price)
resale <- filter(resale, Year >= 2012)
resale <- filter(resale, flat_type == "2 ROOM")
str(resale)


resale$resale_price <- as.numeric(levels(resale$resale_price))[resale$resale_price]
resale$PriceArea <- resale$resale_price/resale$floor_area_sqm
str(resale)

monthly = aggregate(PriceArea~month, FUN=mean, data=resale)
monthly_ts = ts(monthly$PriceArea,start = c(2012,3), frequency=12)
plot(monthly_ts, xlab="Year", ylab="Average Resale Flat Price")

par(mfrow = c(1,2), pty = "s")
acf(monthly_ts, xlab="Lag (in years)")
acf(diff(monthly_ts), xlab="Lag (in years)")


#install.packages("forecast")
library(forecast)
fit1 = auto.arima(monthly_ts, approximation = F, trace = F)
summary(fit1)

fit2 = auto.arima(log10(monthly_ts), approximation = F,trace= F)
summary(fit2)

prediction = predict(fit2, n.ahead=10)
plot(monthly_ts, type ="l", xlab="", ylab = "Average Resale Flat Price", xlim = c(2012,2019),ylim = c(4500,6500), main="ARIMA prediction")
plot(monthly_ts, type = "l",xlab = "", ylab = "Average Resale Flat Price",xlim = c(2012,2018),main = "ARIMA Prediction")
lines(10^(prediction$pred),col="blue")
lines(10^(prediction$pred+2*prediction$se),col="orange")
lines(10^(prediction$pred-2*prediction$se),col="orange")
