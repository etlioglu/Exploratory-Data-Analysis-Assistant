library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("A Simple Exploratory Data Analysis Assistant Prototype"),
  
  # A row for documentation
  fluidRow(
      column(12,
             wellPanel(
                 helpText(h3("Using this app:")),
                 helpText(h4("This simple map enables the user to do exploratory data analysis without the need to code for histograms or scattor plots.")),
                 helpText(h4("The top panel is used to create a histogram with a variable of interest. Use the drop-down menu to select the variable and the slider for the appropriate bin-size respectively.")),
                 helpText(h4("The bottom panel is used to create a scatter plot for two variables of interest. X and Y axes are selected using the two drop-down menus."))
             )
      )
  ),
  

  # Sidebar with a slider input for the varibale to be used in the histogram
  fluidRow(
      column(4,
             wellPanel(
                 helpText(h3("Produce a histogram for the variable of interest")),
                 selectInput("histVar",
                             "Select the variable for which you would like to create a histogram:",
                            colnames(myData),
                            multiple = FALSE,
                            selectize = TRUE),
                 sliderInput("bins",
                            "Select the bin size for the histogram:",
                            min = 1,
                            max = 100,
                            value = 30)
             )
      ),
      
      # Show the histogram
      column(8,
             plotOutput("hist")
      )
  ),
  
  fluidRow(
      column(4,
             wellPanel(
                 helpText(h3("Produce a scatterplot for two variables of interest")),
                 selectInput("X",
                             "Select the X Variable",
                             colnames(myData),
                             multiple = FALSE,
                             selectize = TRUE),
                 selectInput("Y",
                             "Select the Y Variable",
                             colnames(myData),
                             multiple = FALSE,
                             selectize = TRUE)
             )
      ),
      column(8,
         plotOutput("scatter")
      )
  )
))
