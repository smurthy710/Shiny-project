# Define UI for application that draws a histogram
shinyUI(fluidPage(
     
     # Application title
     titlePanel("Sample testing"),
     
     # Sidebar with a slider input for the number of bins
     sidebarLayout(
          sidebarPanel(
               sliderInput("PerDef",
                           "% allowable defect:",
                           min = 1,
                           max = 50,
                           value = 8),
               helpText("Select the % of defect that you are testing for"),
        
          numericInput("Poplu","Population:",1000),
          helpText("Input the population size"),
          numericInput("Samp","Sample Size:",100),
          helpText("Input the Sample size"),
          sliderInput("ciI",
                      "% Confidence:",
                      min = 80,
                      max = 95,
                      value = 90,
                      step = 5),
          
          helpText("Select the % of confidence testing")
          ),
          # Show a plot of the generated distribution
          mainPanel(
               h2(helpText("Probability curve")),
               plotOutput("distPlot"),
               h2(helpText("Max allowed defect:")),
               h2(textOutput("MaxDef"))
          )
     )
))