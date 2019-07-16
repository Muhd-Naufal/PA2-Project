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

housing_data4 <- housing_data3[,c(1,2,10)]
housing_data4
str(housing_data4)

i <- sapply(housing_data4, is.factor)
housing_data4[i] <- lapply(housing_data4[i], as.character)
str(housing_data4)

housing_data4$month <- as.numeric(as.character(housing_data4$month))
housing_data4
str(housing_data4)

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
  aes(month, resale_price,group = town, color = factor(town))
) +
  geom_line() +
  scale_color_viridis_d() +
  labs(x = "Year", y = "Resale Price") +
  theme(legend.position = "top")
p


p + 
  geom_point(aes(group = seq_along(month))) +
  transition_reveal(month)








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
  