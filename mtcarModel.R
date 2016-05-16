library(shiny)

ui <- fluidPage(
  variables <- names(mtcars),
  selectInput("var1", "x", variables),
  submitButton("Apply Changes"),
  selectInput("var2", "y", variables),
  submitButton("Apply Changes"),
  plotOutput("plot1")
)

server <- function(input, output){
  output$plot1 <- renderPlot({
    x <- mtcars[[input$"var1"]]
    y <- mtcars[[input$"var2"]]
    plot(x, y, cex = 1.5, col = "red", pch = 19)
  })
}



