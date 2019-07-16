#Anime test
library(ggplot2)
library(gganimate)
library(dplyr)

housing_data <- read.csv("./Datasets/HDB Resale Prices.csv")
housing_data

str(housing_data)

housing_data2 <- housing_data[,c(1,2,10)]
housing_data2
str(housing_data2)

i <- sapply(housing_data2, is.factor)
housing_data2[i] <- lapply(housing_data2[i], as.character)

str(housing_data2)

housing_data2012 <- filter(housing_data2, month >= "2012-01-01")
housing_data2012


library(ggplot2)
ggplot(housing_data2012, aes(x=town, y=resale_price), group_by(town)) +
  geom_point(stat='identity')
