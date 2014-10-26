
library(shiny)

shinyUI(fluidPage(
  withTags(div(class='row-fluid',div(class='span6',textInput("xaxis",label="X-axis",value="I am x-axis")),div(class='span6',textInput("title",label="Title",value="I am title.Just Edit me")))    
  ),
  selectInput(inputId = "n_breaks",
              label = "Number of bins in histogram (approximate):",
              choices = c(5, 10, 25, 50),
              selected = 25),
  
  checkboxInput(inputId = "individual_obs",
                label = strong("Show individual observations"),
                value = FALSE),
  
  checkboxInput(inputId = "density",
                label = strong("Show density estimate"),
                value = FALSE),
  
  plotOutput(outputId = "plot", height = "200px"),
  
  # Display this only if checkboxinput,density is checked
  conditionalPanel(condition = "input.density == true",
                   sliderInput(inputId = "bw_adjust",
                               label = "Bandwidth adjustment:",
                               min = 0.2, max = 2, value = 1, step = 0.2)
  )
))
