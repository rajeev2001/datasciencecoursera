#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(fluidPage(
  # Give the page a title
  
  titlePanel("Predict Diamond Price from Carat"),
  
  # Generate a row with a sidebar
  
  sidebarLayout(
    sidebarPanel(
      
      # Input of carat of diamond through slider 
      
      sliderInput("sliderCarat", "Select Carat of the Diamond", 0.12, 0.40, value = 0.20),
      
      # checkbox to select to display model 
      
      checkboxInput("showModel1", "Display Model", value = TRUE)
      
    ),
    # Create spot for main panel to show plot and model output
    
    mainPanel(
      h3("Overview of App:"),
      
      helpText("This app predicts the price of diamond based on the input value of carat provided by user through slider.
               When user chooses 'Display Model' option, the app displays the regression line in blue colour.
               Input value of carat, provided through slider, is displayed in red color on the regression line in plot.
               
               "),
    
      helpText("Regression between diamond price and carat is used as prediction algoritham.Data for this app has been taken from diamond dataset
               of UsingR package."),
      # Display plot of diamond price and carat for the dataset diamond in R package UsingR
      plotOutput("plot1"),
      # Display predicted price of model based on slider input
      h3("Predicted Diamond Price from Model:"),
      textOutput("pred1"),
      # Coefficent of Model displays intercept and coefficent of independent variable carat in the model
      h3(" Coefficient of Model:"),
      textOutput("modelcoef")
     
    )
  )
))
