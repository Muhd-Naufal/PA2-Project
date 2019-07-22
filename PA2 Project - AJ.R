data <- read.csv("HDB Resale Prices.csv")
data

library(dplyr)

filtertownamk <- filter(data, town == "ANG MO KIO")
filtertownamk

data %>%
  sum(data$resale_price)

