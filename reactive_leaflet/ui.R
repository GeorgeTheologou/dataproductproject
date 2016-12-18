library(shiny)
library(leaflet)
library(tidyverse)
library(plotly)


ui <- fluidPage(
  
  titlePanel("Interactive airport map"),
  
  sidebarLayout(
    
    sidebarPanel(
      
      sliderInput("slider1", label = h3("Define the number of airlines range"), min = 450, max = 1500, value = c(600, 850)),
      sliderInput("slider2", label = h3("Number of markers"), min = 1000, max = 10000, value = 5000),
      checkboxGroupInput("checkGroup", label = h3("Airline checkbox"), 
                         choices = list("Choice 1" = 1, "Choice 2" = 2, "Choice 3" = 3),
                         selected = 1),
      actionButton("recalc", "Apply selections"),
      br(),
      p("All the code can be found in this github ", a("repository.", href = "https://github.com/spymark/data_products_proj"))

          ),
    
    mainPanel(
      leafletOutput("mymap"),
      plotlyOutput("plot")
    )
  )
)