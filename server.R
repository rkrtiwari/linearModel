library(shiny)

server <- function(input, output){
  
  x <- reactive({as.numeric(mtcars[[input$"var1"]])})
  y <- reactive({as.numeric(mtcars[[input$"var2"]])})
  
  
  output$plot1 <- renderPlot({
    mtModel <- lm(y() ~ x())
    ypred <- mtModel$coefficients[1] + x()*mtModel$coefficients[2]
    
    plot(x(), y(), cex = 1.5, col = "red", pch = 19)
    lines(x(), ypred, col = "blue")
  })
  
  output$corVal <- renderPrint({
   cor(x(),y())
 })
 
 output$coeff1 <- renderText({
   mtModel <- lm(y() ~ x())
   mtModel$coefficients[1]
 })
 
 
 output$coeff2 <- renderText({
   mtModel <- lm(y() ~ x())
   mtModel$coefficients[2]
 })
 
}
