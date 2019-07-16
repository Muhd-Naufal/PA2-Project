#Animation test
library(ggplot2)
library(gganimate)
install.packages(g)
library(dplyr)

housing_data <- read.csv("./Datasets/HDB Resale Prices.csv")

#Convert Factor to Date (Year-Month)
#It'll assume first day of each month

housing_data$month <- as.Date(paste0(housing_data$month, "-01"), "%Y-%m-%d")

#Choose only those 2012 and above
library(dplyr)
housing_data2012 <- filter(housing_data, month >= "2012-01-01")
housing_data2012


i <- sapply(housing_data, is.factor)
housing_data[i] <- lapply(housing_data[i], as.character)



library(ggplot2)
ggplot(housing_data2012, aes(x=town, y=resale_price, label = town, color = town, group= town)) +
  geom_point(stat= 'identity', size = 15) +
  geom_segment(aes(
    y = 100,
    x = town,
    yend = resale_price,
    xend = town)
  ) +
  geom_text(color="black", size=3) +
  coord_flip() +
  theme(legend.position ="none")
