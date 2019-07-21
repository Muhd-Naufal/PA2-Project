#Headline: Singaporeans' HDB predicament: HDB dilemma for the future

#Findings have shown that prices have skyrocketed from 2008 onwards.
#On the other hand, the units completed over the years against the population growth faces a mismatch, as there are more Singaporeans than available HDBs.
#This supply and demand forced the prices to increase drastically.
#The problem: 
#A. If HDB prices were to drop back to the early 2000s, home owners would potentially lose half their asset value
#B. If HDB prices were to keep increasing, will the future generations be able to afford houses?


#Level 1

data <- read.csv("./Datasets/PopulationData.csv")
library(dplyr)
str(data)
#data$Population <- as.numeric(levels(data$Population))[data$Population]

#Find population change from 2000 to 2015
population2000 <- data[4,2]
population2015 <- data[6,2]

class(population2000)
#Population change

no_population <- population2015-population2000
no_population
population_change <- ((population2015-population2000)/population2000)*100
population_change

#The population change was 37.7894% from 2000 to 2015

#Housing Shortage
housing2000 <- data[4,3]
housing2015 <- data[6,3]

no_housing <- housing2015-housing2000
housing_change <- ((housing2015-housing2000)/housing2000)*100
housing_change

#Ratio of new population
no_population/no_housing


#Level 2
data1 <- read.csv("./Datasets/YearsUnits.csv")
<<<<<<< HEAD

=======
data1
>>>>>>> 2610dcf9d556c9083112a9a6ed9346fbaa767bd4
library(ggplot2)

ggplot()+
  geom_bar(mapping = aes(x = data1$ï..Year, y = data1$Units.completed), stat = "identity", color = "black",fill = "blue")+
  geom_line(mapping = aes(x = data1$ï..Year, y = data1$Price.Index.2009...100 * 40000/160)) +
  geom_point(mapping = aes(x = data1$ï..Year, y = data1$Price.Index.2009...100 * 40000/160)) +
  xlab("Year") + ggtitle("Year against Units completed and Index") +
  scale_y_continuous(
    name = expression("Units completed"),
    sec.axis = sec_axis(~. /40000*160,name = "Index"),
    limits = c(0,40000))
<<<<<<< HEAD
=======



ay <- list(
  tickfont = list(color = "red"),
  overlaying = "y",
  side = "right",
  title = "Index"
)
ay
p <- plot_ly() %>%
  add_bars(x = ~data1$ï..Year, y = ~data1$Units.completed, name = "Units completed") %>%
  add_lines(x = ~data1$ï..Year, y = ~data1$Price.Index.2009...100, name = "Index", yaxis = "y2") %>%
  layout(
    title = "Year against Units completed and Index", yaxis2 = ay,
    xaxis = list(title="Year")
  )
p

>>>>>>> 2610dcf9d556c9083112a9a6ed9346fbaa767bd4
