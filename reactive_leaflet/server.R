library(shiny)
library(leaflet)
library(tidyverse)
library(plotly)


server <- function(input, output, session) {

  greenLeafIcon <- makeIcon(
    iconUrl = "http://seeklogo.com/images/D/departure-flights-airport-sign-logo-A9A341DA0F-seeklogo.com.gif",
    iconWidth = 22, iconHeight = 22,
    iconAnchorX = 22, iconAnchorY = 22
    )
  
  n <- eventReactive(input$recalc, {
    input$slider2
  })

  df <- read_csv("../data/processed/airlinesbyairport.csv")  
  airportnames <- df%>%mutate(labels=paste(airportname))%>%select(labels)
  airlines <- df%>%mutate(labels=paste(count))%>%select(labels)
  
  df <- df%>%select(latitude,longitude)

  price <- eventReactive(input$recalc, {
        
        (round(runif(input$slider2, min = input$slider1[1], max = input$slider1[2] ), digits = 2))
  }, ignoreNULL = FALSE)

  output$mymap <- renderLeaflet({
    leaflet() %>%
      addProviderTiles( "OpenStreetMap.HOT",options = providerTileOptions(noWrap = TRUE)) %>%
      addMarkers(data = df, clusterOptions = markerClusterOptions(), icon = greenLeafIcon,
                 popup = paste("<strong>Airport name: </strong>","<br>",as.character(airportnames$labels),"<br>","<hr>", "<em>Airlines flying: </em>","<br>","<em>",as.character(airlines$labels),"</em>"))

    
  })
  

  
  
}