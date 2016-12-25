library(shiny)
library(leaflet)
library(tidyverse)
library(plotly)

#df <- read_csv("../data/processed/airlinesbyairport.csv")  
df <- read_csv("airlinesbyairport.csv")  
print(getwd())
server <- function(input, output, session) {

  greenLeafIcon <- makeIcon(
    iconUrl = "http://seeklogo.com/images/D/departure-flights-airport-sign-logo-A9A341DA0F-seeklogo.com.gif",
    iconWidth = 22, iconHeight = 22,
    iconAnchorX = 22, iconAnchorY = 22
    )

  filtered_df <- eventReactive(input$filter, {
    min = input$slider1[1]
    max = input$slider1[2]
    df <- df%>%filter(count >= min & count <= max)
    df <- df%>%select(latitude,longitude)
  }, ignoreNULL = FALSE)
 
  airportnames <- eventReactive(input$filter, {
    min = input$slider1[1]
    max = input$slider1[2]
    df <- df%>%filter(count >= min & count <= max)
    airportnames <- df%>%mutate(labels=paste(airportname))%>%select(labels)
    airportnames$labels
  }, ignoreNULL = FALSE)
  
  airlines <- eventReactive(input$filter, {
    min = input$slider1[1]
    max = input$slider1[2]
    df <- df%>%filter(count >= min & count <= max)
    airlines <- df%>%mutate(labels=paste(count))%>%select(labels)
    airlines$labels
  }, ignoreNULL = FALSE)
  
  output$mymap <- renderLeaflet({
    leaflet() %>%
      addProviderTiles( "OpenStreetMap.HOT",options = providerTileOptions(noWrap = TRUE)) %>%
      addMarkers(data = filtered_df(), clusterOptions = markerClusterOptions(), icon = greenLeafIcon,
                 popup = paste("<strong>Airport name: </strong>","<br>",as.character(airportnames()),"<br>","<hr>", "<em>Airlines flying: </em>","<br>","<em>",as.character(airlines()),"</em>")
                 )
  })
  

  
  
}