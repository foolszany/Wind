
#connects the libraries that we will need
library(shiny)
library(openair)
options(shiny.maxRequestSize = -1)
# Define server logic for random distribution application
shinyServer(function(input, output) {
  # Reactive expression.  
  # This is called whenever the inputs change. The renderers defined 
  # below then all use the value computed from this expression
  userdata <- reactive(function(){
     if(is.null(input$bugs)){return()}
       bugs <- read.csv(input$bugs$datapath, header=TRUE)
     })
	   
	   
	   

  # Generate a plot of the data. Also uses the inputs to build the 
  # plot label. Note that the dependencies on both the inputs and
  # the 'data' reactive expression are both tracked, and all expressions 
  # are called in the sequence implied by the dependency graph
  output$plot <- renderPlot({
   if(is.null(input$bugs)){return()}
  data<-unlist(userdata()$ws)
    hist(data, main="wind speed histogram")
	  })

  # Generate a summary of the data
  output$summary <- renderPrint({
    summary(userdata())
  })

  
  output$windrose <- renderPlot({
   windRose(userdata(),type=input$sorted)
  })
  output$pollutionrose <- renderPlot({
   polarPlot(userdata(),pollutant=input$pollutant,type=input$sorted)
})
})
