library(shiny)

ui <- fluidPage(
  variables <- names(mtcars),
  selectInput("var1", "x", variables),
  submitButton("Apply Changes"),
  selectInput("var2", "y", variables),
  submitButton("Apply Changes"),
  plotOutput("plot1")
)