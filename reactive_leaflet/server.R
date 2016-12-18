library(shiny)
library(leaflet)
library(tidyverse)
library(plotly)


server <- function(input, output, session) {

  n <- eventReactive(input$recalc, {
    input$slider2
  })
  
  points <- eventReactive(input$recalc, {
    
    df <- data.frame(lat = runif(input$slider2, min = 55.95, max = 55.96), lng = runif(input$slider2, min = -3.19, max = -3.15))
    
  }, ignoreNULL = FALSE)
  
  
  price <- eventReactive(input$recalc, {
        
        (round(runif(input$slider2, min = input$slider1[1], max = input$slider1[2] ), digits = 2))
  }, ignoreNULL = FALSE)

  output$mymap <- renderLeaflet({
    leaflet() %>%
      addProviderTiles( "OpenStreetMap.HOT",options = providerTileOptions(noWrap = TRUE)) %>%
      addMarkers(data = points(), clusterOptions = markerClusterOptions(), 
                 popup = paste0("Property price", "<br>","£", as.character(price()), " pcm"))
    
  })
  

  
  
}