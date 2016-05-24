library(shiny)

server <- function(input, output){
  
  x <- reactive({as.numeric(mtcars[[input$"var1"]])})
  y <- reactive({as.numeric(mtcars[[input$"var2"]])})
  
  
  output$table1 <- renderTable({head(mtcars)})
  
  output$table2 <- renderTable({
    mtModel <- lm(y() ~ x())
    ypred <- mtModel$coefficients[1] + x()*mtModel$coefficients[2]
    data.frame( x = x()[1:5], y = y()[1:5], "y Predicted" = ypred[1:5])
  })
  
  output$plot1 <- renderPlot({
    mtModel <- lm(y() ~ x())
    ypred <- mtModel$coefficients[1] + x()*mtModel$coefficients[2]
    
    plot(x(), y(), cex = 1.5, col = "red", pch = 19, xlab = input$"var1", ylab =  input$"var2", main = "Plot 1")
    lines(x(), ypred, col = "blue")
  })
  
  output$corVal <- renderPrint({
   cor(x(),y())
 })
  
  output$corSq <- renderPrint({
    cor(x(),y())*cor(x(),y())
  })
  
 output$formula1 <- renderText({
   paste("lmModel <- lm(", input$"var2", " ~ ", input$"var1", ", ", "data = mtcars", ")", sep = "")
 })
 
 output$formula2 <- renderText({
   paste('plot(mtcars$', input$"var1", ',', ' mtcars$', input$"var2", ',', ' xlab = ', '"', input$"var1", 
        '"', ',', ' ylab = ', '"', input$"var2", '"', ',', ' col = ', '"','red', '")', sep = "")
 })
 
 output$formula3 <- renderText({
   paste('abline(lmModel, col = ', '"', 'blue', '")', sep = "")
 })
 
 output$formula4 <- renderText({
   paste('data1 <- data.frame(', input$"var1", ' = ',  'mtcars$', input$"var1", '[1:5])',  sep = "")
 })
 
 output$formula5 <- renderText({
   paste('predict.lm(lmModel, newdata = data1)',  sep = "")
 })
 
 output$formula6 <- renderText({
   paste('summary(lmModel)$r.squared', sep = "")
 })
 
 output$formula7 <- renderText({
   paste('cor(', 'mtcars$', input$"var2", ', ', ' mtcars$', input$"var1", ")" ,sep = "")
 })
 
 output$formula8 <- renderText({
   paste('cor(', 'mtcars$', input$"var2", ', ', ' mtcars$', input$"var1", ")^2" ,sep = "")
 })
  
 output$coeff1 <- renderText({
   mtModel <- lm(y() ~ x())
   mtModel$coefficients[1]
 })
 
 
 output$coeff2 <- renderText({
   mtModel <- lm(y() ~ x())
   mtModel$coefficients[2]
 })
 
 output$rsqrd <- renderText({
   mtModel <- lm(y() ~ x())
   mdlSum <- summary(mtModel)
   mdlSum$r.squared
 })
 
 output$plot2 <- renderPlot({
   mtModel <- lm(y() ~ x())
   n <- length(x())
   ypred <- mtModel$coefficients[1] + x()*mtModel$coefficients[2]
   
   plot(x(), y(), cex = 1.5, col = "red", pch = 19, xlab = input$"var1", ylab =  input$"var2", main = "Plot 2")
   lines(x(), ypred, col = "blue")
   for (i in 1:n)
     lines(c(x()[i], x()[i]), c(y()[i], ypred[i]), col = "red" , lwd = 2)
     
 })
 
 
 output$plot3 <- renderPlot({
   mtModel <- lm(y() ~ x())
   n <- length(x())
   ypred <- mtModel$coefficients[1] + x()*mtModel$coefficients[2]
   res <- mtModel$residuals
   
   plot(x(), res, cex = 1.5, col = "red", pch = 19, xlab = input$"var1", ylab =  "Residual", main = "Plot 3")
   abline(h=0, lwd = 2)
   for (i in 1:n)
     lines(c(x()[i], x()[i]), c(res[i], 0), col = "red" , lwd = 2)
   
 })
 
 
 
}
