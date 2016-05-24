library(shiny)

ui <- fluidPage( 
  
  withMathJax(),
  
  fluidRow(
    column(12, h2('Linear Regression'), align = "center")
  ),
  
  fluidRow(
    column( 12, p('Linear models seek to represent the relationship between two variables, x 
               (predictor) and y (response), in the form: (y = c0 + c1*x ), where c0 and c1 are the model parameters.
                  The model parameters c0 and c1 are chosen so that they minimize the RMS error (the sum of the
                  squares of the difference between the actual response and the model prediction).')),
    
    column( 12, p('In this tutorial, I will cover 4 major aspects of the linear mode:')),
    
    column(12, h5('1. How to build a linear model in R'), offset = 1),
    column(12, h5('2. How to interpret the linear model parameters'), offset = 1),
    column(12, h5('3. How to predict using linear model'), offset = 1),
    column(12, h5('4. How to judge the performance of the linear model'), offset = 1)
    
    ),
  
  
  fluidRow(
    column(12, strong('1. How to build a linear model in R'))
  ),
  
  fluidRow(
    column(12, p('A linear model in R can be build using the formula:', span("lmModel <- lm(y~x, data).", style = "color:blue"), 
                 'In the above 
                 equation, lmModel is the linear model object that contains all the model information, data is the name
                 of the dataframe that contains the predictor and the response variable under the column names
                 x and y, respectively. Let me illustrate this with an example. For this example, I will be using mtcars 
                 dataset that
                 comes with the base R package. This dataset contains the fuel consumption and 10 aspects of automobile
                 design and performace for 32 automobiles. For more details about the dataset look in the help section 
                 by typing "?mtcars" at the command prompt.'))
  ),
  
  fluidRow(
    column(12, p('Before building the model, we will, first, get some idea about the datasets. There
                 are various commands (summary(), str(), head()) in R that show some aspect of the data. Here, I will
                 be using', span('head(mtcars)', style = "color:blue"), 'to look at the top 6 rows of the data.')),
    
    column(12, tableOutput("table1"), align = "center"),
    
    column(12, p('The above table show that there are 8 variables. Out of the 8 variables, I choose "wt" as the predictor
                  variable and "mpg" as response variable for the linear model. I use the following command to build a 
                  linear model named lmModel:')),
    column(12, tags$code("lmModel <- lm(mpg ~ wt, data = mtcars)"), align = "center"),
    column(12, p('The linear model and the data points used for the model building are shown in the plot below. 
               The model is shown with the blue line while the data points are shown with red dots.'))
    ),
  
  fluidRow(
    column(6, plotOutput("plot1"), offset = 3)
  ),
  
  fluidRow(
    column(12, p('Such plots provide a visual way to determine the fitness of the model to capture the relationship 
                between the variables. The closer the data points are to the model line, the better is the model
                accuracy. Later on, we will look at other metrics to determine the model performance. 
              For now, I want you to develop a feel for linear models. You  do this by selecting x and y variables 
              using the select button provided below. For each selection, observe how close the actual points 
              are from the model line and judge for yourself, if the model is able to capture the true relationship
                 between the variables.'))
  ),
  
  fluidRow(
    column(4, selectInput("var2", "y", names(mtcars), selected = "mpg"), align = "centre", offset=1),
    column(4, selectInput("var1", "x", names(mtcars), selected = "wt"), align = "centre", offset=1)
  ),
  

  fluidRow(
    column(12, p('Now that you have got the feel for the linear model, try to buid few 
                linear models on your own. You can reproduce
                the above linear model and its corresponding plot using the following commands:')),
    column(12, tags$code(textOutput("formula1")), align = "center"),
    column(12, tags$code(textOutput("formula2")), align = "center"),
    column(12, tags$code(textOutput("formula3")), align = "center"),
    column(12, p('Once again, look at the plots to judge for yourself the fitness of the model.'))
  ),
  

  
  fluidRow(
    column(12, strong('2. How to interpret the linear model parameters'))
  ),
  
  fluidRow(
    column(12, p('As mentioned in the introduction, in the linear model the relationship between two variables 
                 are expressed as y = c0 + c1*x, where the coefficients c0 and c1 are the intercept and the 
                 slope of the regression line. The intercept, c0, represents the expected value of the response variable
                 (y) when the value of the predictor variable (x) is 0. The slope, c1, represents the expected change 
                 in the response variable (y) when the predictor variable (x) changes by one unit. Let us look 
                 at the values of the coefficients and verify the above statements.
                 '))
  ),
  
  fluidRow(
    column(4, p("Intercept"), align = "center", offset = 2),
    column(4, p("Coefficient"))
  ),
  
  fluidRow(
    column(4, textOutput("coeff1"), align = "center", offset = 2),
    column(4, textOutput("coeff2"))
  ),

  
  fluidRow(
    column(12, p('The command to find the coefficient is')),
    column(12, tags$code('coefficients(lmModel)'), align = "center"),
    column(12, p(' '))
  ),
  

  
  fluidRow(
    column(12, strong('3. How to use the linear model to predict y for a given x')),
    column(12, p('Once we know the values of the coefficients, we can easily determine the value of the
                 response variable (y) at any given value of the predictor variable (x) by simply
                 plugging in the values of x and the coefficients (c0, c1) in the equation:')),
    column(12, p('y = c0 + c1*x'), align="center"),
    column(12, p('R, however, provides even easier way to predict from the model object using the function:',
                 span('predict.lm(object, newdata)', style = "color:blue"), ',where the object is the name of the linear model object and newdata is
                 the data frame that has a column containing x values where predictions are required. Do note that
                 the column name of the data frame has to be the same as the name of x variable used during the model
                 building. Using the above command, I show below, how we can find the model prediction for the first 
                 5 values of x that was used for the model building.
                ')),
    
    column(12, tags$code(textOutput("formula4")), align = "center"),
    column(12, tags$code(textOutput("formula5")), align = "center"),
    column(12, p('You can verify your model prediction using the values in the y.Predicted column in the table below:')),
    column(12, tableOutput("table2"), align = "center")
  ), 
  
  
  fluidRow(
    column(12, strong('4. How to judge the performance of the linear model')),
    column(12, p('Earlier, I briefly talked about how visual inspection can reveal the model fitness. The 
                 visual inspection process can be made more perceptible by looking at the residuals (residuals are the
                 differences between the actual response and their predicted values). In Plot 2, I show the residual 
                 (red line segments) on the x, y plot. This plot provides a very good way to judge how big the errors are with respect to 
                 the actual response variable (y). We keep the model only when the errors are within the tolerance level.')),
    column(12, p('In Plot 3, I show the residuals as a function of x variable. This plot provides a good 
                 way to see if there are any patterns in the residuals. The presence of patterns indicates that the linear
                 model is unable to capture the relationship between the variables and we should, therefore, use some 
                 other model. '))
  ),

  
  fluidRow(
    column(5, plotOutput("plot2")),
    column(5, plotOutput("plot3"))
  ),
  
  fluidRow(
    column(12, p('Another way to judge the fitness of the model is to look at the r-squared value. The r-squared
                 value tells us the percentage of the variation in y variable that is captured by the linear 
                 model. Thus, a higher value of r-squared indicates a better fit. As the name suggests, r-squared is
                 literally r*r, where r is the correlation coefficient. Look at the values of r-squared, 
                 correlation coefficient and the square of the correlation coeefficient given below to convince yourself
                 that it is indeed the case. 
                 '))
  ),
  
  fluidRow(
    column(2, p("r-squared")),
    column(4, p("Correlation")),
    column(4, p("Correlation^2"))
  ),
  
  fluidRow(
    column(2, textOutput("rsqrd")),
    column(4, textOutput("corVal")),
    column(4, textOutput("corSq"))
  ),
  
  fluidRow(
    column(12, p('It is not surprising that r-squared
                 value provides a measure of linear model performance given that the correlation
                 coefficient measures the strength of the linear relationship between two variable.'))
  ),
  
  fluidRow(
    column(12, p('To find the r-squared and correlation coefficents and square of the correlation coefficients 
                 use the codes below:')),
    column(12, tags$code(textOutput("formula6")), align = "center"),
    column(12, tags$code(textOutput("formula7")), align = "center"),
    column(12, tags$code(textOutput("formula8")), align = "center")
  )
  

  
)