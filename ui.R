library(shiny)

ui <- fluidPage(
  variables <- names(mtcars),
  
  fluidRow(
    column(4, selectInput("var1", "x", variables)),
    column(4, selectInput("var2", "y", variables))
  ),
  
  plotOutput("plot1")
)