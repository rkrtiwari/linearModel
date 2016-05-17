library(shiny)

server <- function(input, output){
  
  x <- reactive({as.numeric(mtcars[[input$"var1"]])})
  y <- reactive({as.numeric(mtcars[[input$"var2"]])})
  
  
  output$plot1 <- renderPlot({
    mtModel <- lm(y() ~ x())
    ypred <- mtModel$coefficients[1] + x()*mtModel$coefficients[2]
    
    plot(x(), y(), cex = 1.5, col = "red", pch = 19, xlab = input$"var1", ylab =  input$"var2")
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
 
 output$plot2 <- renderPlot({
   mtModel <- lm(y() ~ x())
   n <- length(x())
   ypred <- mtModel$coefficients[1] + x()*mtModel$coefficients[2]
   
   plot(x(), y(), cex = 1.5, col = "red", pch = 19, xlab = input$"var1", ylab =  input$"var2")
   lines(x(), ypred, col = "blue")
   for (i in 1:n)
     lines(c(x()[i], x()[i]), c(y()[i], ypred[i]), col = "red" , lwd = 2)
     
 })
 
 
 output$plot3 <- renderPlot({
   mtModel <- lm(y() ~ x())
   n <- length(x())
   ypred <- mtModel$coefficients[1] + x()*mtModel$coefficients[2]
   res <- mtModel$residuals
   
   plot(x(), res, cex = 1.5, col = "red", pch = 19, xlab = input$"var1", ylab =  "Residual")
   abline(h=0, lwd = 2)
   for (i in 1:n)
     lines(c(x()[i], x()[i]), c(res[i], 0), col = "red" , lwd = 2)
   
 })
 
 
 
}
