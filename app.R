#install.packages("shiny")
library(shiny)
resale <- read.csv("./Datasets/HDB Resale Prices.csv")

ui <- fluidPage(
  
  sidebarLayout(
    sidebarPanel(
     selectInput("select", "Select Option",
      choices = c("1-Room" = 1, "2-Room" = 2, "3-Room" = 3))),

    mainPanel(
      textOutput("dispText")))
)

choiceVec <- list("1-Room" = 1, "2-Room" = 2, "3-Room" = 3)


  

server <- function(input, output) {
  output$dispText <- renderPrint({
    paste("You chose", names(choiceVec)[choiceVec == input$select])})
}
shinyApp(ui = ui, server = server)

#############

ibrary(shiny)
myData <- runif(100)
plotType <- function(x, type) {
  switch(type,
         A = hist(x),
         B = barplot(x),
         C = pie(x))
}
runApp(list(
  ui = bootstrapPage(
    radioButtons("pType", "Choose plot type:",
                 list("A", "B", "C")),
    plotOutput('plot')
  ),
  server = function(input, output) {
    output$plot <- renderPlot({ 
      plotType(myData, input$pType)
    })
  }
))

