#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Load package UsingR and data set diamond in  UsingR package
library(UsingR)
data(diamond)

# Define a server for the Shiny app

shinyServer(function(input, output) {
  
  model1 <- lm(price ~ carat, data = diamond)
  
  model1pred <- reactive({
    caratInput <- input$sliderCarat
    predict(model1, newdata = data.frame(carat = caratInput))
  })
  
  
  # Render plot between carat and price for diamond dataset and display abline in blue colour
  
  output$plot1 <- renderPlot({
    caratInput <- input$sliderCarat
    
    plot(diamond$carat, diamond$price, xlab = "carat", 
         ylab = "DiamondPrice", bty = "n", pch = 16,
         xlim = c(0.1, 0.5), ylim = c(200, 1200))
    if(input$showModel1){
      abline(model1, col = "blue", lwd = 2)
    }
    
    # Display slider input in plot in red colour 
    
    points(caratInput, model1pred(), col = "red", pch = 16, cex = 2)
  })
  
  
  # Render predicted value of diamond price based on slider input 
  
  output$pred1 <- renderText({
    model1pred()
    
  
  })
 
  # Render model coefficient 
  output$modelcoef <- renderPrint({
    coef(model1)
  })
  
})
