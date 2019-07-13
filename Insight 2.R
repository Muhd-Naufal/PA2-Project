#High Resale Prices

hdb<-read.csv("insight 2.csv")
hdb

library(ggplot2)
ggplot(hdb,aes(x=hdb$flat_model,y=hdb$resale_price)) +
  geom_point(fill="pink",color ="red")

ggplot(hdb,aes(x=hdb$flat_model,y=hdb$resale_price)) +
  geom_smooth( fill = "pink", colour = "red",se=FALSE)
  geom_smooth(method="lm",se=FALSE)

