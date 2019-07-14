#Level 1

data <- read.csv("./Datasets/PopulationData.csv")
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
data1 <- read.csv("./Datasets/YearsUnits.csv")
data2 <- read.csv("./Datasets/Quarters.csv")
#data2
#data1 <- read.csv("QuartersYears.csv")

library(ggplot2)
a<- ggplot(data1,aes(x=data1$ï..Year,y=data1$Units.completed)) +
  geom_bar(stat="identity",fill= "blue") +
  ggtitle("Units completed by Year") +
  xlab("Year") + ylab("Units Completed")
a

b <- ggplot(data2, aes(x=data2$ï..Quarter,y=data2$Resale.Price.Index..1Q.2009...100.)) +
  geom_point(stat="identity",color ="red") +
  geom_line(stat="identity", color = "red") +
  ggtitle("Units completed by Year") +
  xlab("Year") + ylab("Resale Price")
b
