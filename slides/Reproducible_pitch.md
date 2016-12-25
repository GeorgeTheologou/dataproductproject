World airports Map
========================================================
author: George Theologou
date: "December 23, 2016"

What is this application?
========================================================
This application is for locating airports and identifying how many airlines fly from each airport. Two data sets were downloaded from OpenFlights.org. 

**1. Route database**

The route database contains 59036 routes between 3209 airports on 5.

**2. Airport database**

The airport database contains 6977 airports spanning the globe, as shown in the map above.

These two files were then joined to create the dataset used for this App.

Data sets link: http://openflights.org/data.html
Note: The current data might not be 100% accurate.

What can you do in the app?
========================================================

- Navigate the map, click through clusters of properties
- Get price for individual marker (property)
- Change the style of the map reactively
- Set the number of properties
- Set the range of the prices
- Explore the actual distribution of prices 
- Observe code execution as it happens


From ggplot2 to plotly (example)
========================================================




```r
my_map <- leaflet() %>%
addProviderTiles( "OpenStreetMap.HOT",options = providerTileOptions(noWrap = TRUE)) %>%
addMarkers(data = filtered_df, clusterOptions = markerClusterOptions(), icon = greenLeafIcon,popup = paste("<strong>Airport name: </strong>","<br>",as.character(airportnames$labels),"<br>","<hr>", "<em>Airlines flying: </em>","<br>","<em>",as.character(airlines$labels),"</em>")
)
```




```
Error in eval(expr, envir, enclos) : object 'my_map' not found
```
