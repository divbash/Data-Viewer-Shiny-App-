shinyUI(fluidPage(
  headerPanel('Dataset Viewer'),
  sidebarPanel(
    selectInput('dataset', 'Choose a dataset:', choices=c('mtcars','rock','pressure','cars','quakes','iris','trees')),
    
    submitButton("Update"),
    p("Select a Dataset from the above Dropdown list and click the Update button "),
    br(),
    p("A graph for the interaction between the variables of the selected dataset can be seen in the",
      strong("Interaction Plot tab")),
    br(),
    p("The Summary of the selected dataset can be seen in 
      the",strong("Summary tab.")),
    p("A graph for the regression diagnostics can be seen in 
      the",strong("Regression Diagnostics tab."))
        ),
  
  mainPanel(
    
    tabsetPanel(
    tabPanel('Interaction Plot',plotOutput('plot1')),
    tabPanel('Summary',verbatimTextOutput("summary")),
    tabPanel('Regression Diagnostics',plotOutput('plot2'),
             p("Shows the Regression Diagnostics of dataset where the 
               first variable is considered to be ",strong("Outcome"),"and
                all the remaining variables are the",strong("Regressors")))
             ))
))