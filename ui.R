library(shiny)
shinyUI(pageWithSidebar(
  # Title:
  headerPanel("Mileage Prediction"),
  
  sidebarPanel(
    numericInput('cylr','Number of cyllinders',6,min=4,max=8,step=2),
    #numericInput('transmission','Transmission type',1,min=0,max=1,step=1),
    submitButton('Submit')
  ),
  mainPanel(
    plotOutput('regModel'),
    plotOutput('boxPlot'),
    h3('Result of prediction'),
    h4('You entered cyl ='),
    verbatimTextOutput("inputValue"),
    h4('Which resulted in a prediction (mpg) of '),
    verbatimTextOutput("prediction")
  )
))