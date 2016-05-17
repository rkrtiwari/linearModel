library(shiny)

ui <- fluidPage(
  variables <- names(mtcars),
  
  fluidRow(
    column(4, selectInput("var1", "x", variables)),
    column(4, selectInput("var2", "y", variables))
  ),
  
  fluidRow(
    column(4, p("Correlation"))
  ),
  
  fluidRow(
    column(4, textOutput("corVal")),
    column(6, plotOutput("plot1"))
  ),
  
  fluidRow(
    column(2, p("Intercept")),
    column(2, p("Coefficient"))
  ),
  
  fluidRow(
    column(2, textOutput("coeff1")),
    column(2, textOutput("coeff2"))
  )
)