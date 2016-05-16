library(shiny)

server <- function(input, output){
  
  output$plot1 <- renderPlot({
    x <- mtcars[[input$"var1"]]
    y <- mtcars[[input$"var2"]]
    
    mtModel <- lm(y ~ x)
    ypred <- mtModel$coefficients[1] + x*mtModel$coefficients[2]
    
    plot(x, y, cex = 1.5, col = "red", pch = 19)
    lines(x, ypred, col = "blue")
  })
  
 output$corVal <- renderPrint({
   x <- mtcars[[input$"var1"]]
   y <- mtcars[[input$"var2"]]
   cor(x,y)
 }
 )
}
