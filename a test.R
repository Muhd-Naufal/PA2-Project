#install.packages("plotly")

library(plotly)
p <- plot_ly(midwest, x = ~percollege, color = ~state, type = "box")
p

str(midwest)
View(midwest)

mature<-read.csv("./Datasets/maturetowns.csv")
mature
str(mature)
k <-  plot_ly(mature, x = ~resale_price, color = ~flat_type, type = "box") %>%
  
      layout(title="Mature Town Resale Prices per Flat Type",
             xaxis=list(title="Mature Resale"),
             yaxis=list(title="Flat Type"))
k

nonmature<-read.csv("./Datasets/nonmaturetowns.csv")
nonmature

o <-  plot_ly(nonmature, x = ~resale_price, color = ~flat_type, type = "box") %>%
  
      layout(title="Non-Mature Town Resale Prices per Flat Type",
         xaxis=list(title="Non-Mature Resale"),
         yaxis=list(title="Flat Type"))
o

a <- levels(mature$town)
a




