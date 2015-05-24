library(shiny)
library(car)
shinyServer(function(input, output) {
  
  # Combine the selected variables into a new data frame
  datasetInput <- reactive({
    switch(input$dataset,
           "mtcars"=mtcars,
           "rock" = rock,
           "pressure" = pressure,
           "cars" = cars,
           "quakes"=quakes,
           "iris"=iris,
           "trees"=trees
           )
  })
  
  
  ### Shows the Ineraction plot between all the variables of the dataset
  output$plot1 <- renderPlot({
    data<-datasetInput()
    require(stats); require(graphics) 
    pairs(data, panel = panel.smooth, main = "Interaction Relationship of Variables")
  },height=600,width=800)
  
  ### Shows the Summary of the dataset
  output$summary <- renderPrint({
    dataset <- datasetInput()
  summary(dataset)
  })
  
  ### Shows the Regression Diagnostics of dataset  
  ### First column variabe is considered to be outcome and
  ### All the remaining variables are the regressors 
  output$plot2<-renderPlot({
    dataset<-datasetInput()
   fit<-lm(dataset[,1]~.,dataset)
   par(mfrow=c(2,2))
   plot(fit)
  })
  
})