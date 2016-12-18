library(shiny)
library(ggplot2)

data(mtcars)
myData <- mtcars

shinyServer(function(input, output) {

  output$hist <- renderPlot({
    # define the variable for which the histogram is shown
    var <- input$histVar
    x <- mtcars[[var]]
    # generate bins based on input$bins from ui.R
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    # draw the histogram with the specified number of bins
    qplot(x, breaks = bins, xlab = var, fill=I("dodgerblue4"))
  })
  
  output$scatter <- renderPlot({
      X <- input$X
      Y <- input$Y
      x <- myData[[X]]
      y <- myData[[Y]]
      qplot(x, y, xlab = X, ylab = Y, geom = c("point", "smooth"))
  })

  })
