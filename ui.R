library(shiny)

# Define UI for random distribution application 
shinyUI(pageWithSidebar(

  # Application title
  headerPanel("Tabsets"),

  # Sidebar with controls to select the random distribution type
  # and number of observations to generate. Note the use of the br()
  # element to introduce extra vertical spacing
  sidebarPanel(
  textInput("pollutant","Please enter pollutant","no pollutant"),
  br(),
    fileInput("bugs", "Bug Data"),
  br(),
	radioButtons("sorted", "Sort by:",
				 c("season" ="season",
				 "hour"="hour",
				 "weekday"="weekday",
				 "day/night"="day_night")
 
   ),
     HTML("<hr>"),
	 h6("by Eliav Schmulewitz at", a("Luft Gescheft", 
            href="http://stackexchange.com/users/170655/eliavs"))
			),
  # Show a tabset that includes a plot, summary, and table view
  # of the generated distribution
  mainPanel(
    tabsetPanel(
      tabPanel("Plot", plotOutput("plot")), 
      tabPanel("data Summary", verbatimTextOutput("summary")), 
      tabPanel("Wind Rose", plotOutput("windrose")),
	  tabPanel("Pollution Rose",plotOutput("pollutionrose"))
    )
  )
))
