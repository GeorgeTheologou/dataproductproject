library(shiny)
library(leaflet)
library(tidyverse)
library(plotly)


ui <- fluidPage(
  
  titlePanel("World airports"),
  p("The map below shows airports across the world along with the number of airlines that fly from each airport. 
    You can zoom in in selected areas to hover of airports of interest."),
  
  sidebarLayout(
    position = "right",
    sidebarPanel(
      p("If you click at an airport sign, a popup box will appear showing the airport name and the number of airlines flying from that airport."),
      br(),
      p("You can filter for airports that have specific volume range of airlines by applying the following filter."),
      sliderInput("slider1", label = h5("Filter volume of airlines"), min = 1, max = 878, value = c(1, 878)),
      actionButton("filter", "Perform calculation"),
      p(h5("Note that the server calculation is displayed at the bottom of the HTML page.")),
      br(),
      br(),
      p("Project's github", a("repo", href = "TBC")),
      p("The data was downloaded from", a("OpenFlights.org", href = "http://openflights.org/data.html"))

          ),
    mainPanel(
      leafletOutput("mymap"),
      plotlyOutput("plot")
    )
  )
)