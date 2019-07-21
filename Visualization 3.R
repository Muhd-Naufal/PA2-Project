#Headline: 
#Singaporeans' HDB predicament: HDB dilemma for the future

#The problem: 
#A. If HDB prices were to drop back to the early 2000s, home owners would potentially lose half their asset value
#B. If HDB prices were to keep increasing, will the future generations be able to afford houses?

#Level 1
library(dplyr)
library(ggplot2)
library(plotly)
data <- read.csv("./Datasets/PopulationData.csv")

#Find population change from 2000 to 2015
population2000 <- data[4,2]
population2015 <- data[6,2]

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
#Ratio = 5.9152


#Level 1 Findings:
#Definition of the ratio is to evaluate on average, how many (new) people (new people being the increase in population) will accomodate every new HDB after 2000.
#Using View(data), we can see that the persons per dwelling units(PDU) is 4.3. However, the ratio exceeds the PDU.
#In comparison too, the PDU in 2000 is lower than 2015. 
#Singaporeans were actually worse off in 2015 than compared to 2000.


#Level 2
data1 <- read.csv("./Datasets/YearsUnits.csv")

ay2 <- list(
  tickfont = list(color = "red"),
  overlaying = "y",
  side = "right",
  title = "Index"
)

p <- plot_ly() %>%
  add_bars(x = ~data1$ï..Year, y = ~data1$Units.completed, name = "Units Completed", yaxis = "y1") %>%
  add_lines(x = ~data1$ï..Year, y = ~data1$Price.Index.2009...100, name = "Index", yaxis = "y2") %>%
  layout(
    title = "Year against Units completed and Index", yaxis2 = ay2,
    xaxis = list(title="Year"),
    yaxis = list(title="Units Completed")
  )
p


#Level 2 Findings:
#Findings have shown that prices have skyrocketed from 2008 onwards.
#On the other hand, the units completed over the years against the population growth faces a mismatch, as there are more Singaporeans than available HDBs.
#This supply and demand forced the prices to increase drastically.
