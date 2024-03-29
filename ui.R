
################################# USER INTERFACE USING SHINY (V2.0) #####################################

library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Regression Model Regularization & Selection Simulator"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("p",
                  "Polynomial Degree : ", min = 0, max = 20, value = 0,step = 1),
      radioButtons("showTest", "Display Results for the Test Set",
                   choices = c(Yes = "TRUE",
                               No = "FALSE"),
                   selected = "FALSE", inline = T),
      radioButtons("useRidge", "Regularization Method",
                   choices = c(Ridge = "T", Lasso = "F"), 
                   selected = "F", inline = F),
      sliderInput("lambda",
                  "Regularization coefficient (Log Lambda) : ", min = -2, max = 10, value = 0.5,step = 0.5), 
      actionButton("showReg","Plot Regularization results")
      
    ),
      
    mainPanel(
      tabsetPanel(type  = "tabs",
                  tabPanel("Polynomial Regression", plotOutput("RegressionPlot")),
                  tabPanel("Tuning lasso", plotOutput("ridgo")),
                  tabPanel("Tuning ridge", plotOutput("lasso")),
                  tabPanel("Regularization", plotOutput("Regul"))
      )
    )
  )
)
)
