#Level 1

data <- read.csv("PopulationData.csv")
library(dplyr)
str(data)
#data$Population <- as.numeric(levels(data$Population))[data$Population]

#Find population change from 2000 to 2015
#Not sure if should hardcode or not
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
data1 <- read.csv("YearsUnits.csv")

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