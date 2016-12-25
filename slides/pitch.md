A reactive property map, made with Shiny, leaflet and plotly
========================================================
author: Spyros Marketos
date: 27/11/2016
autosize: true
transition: rotate

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


```
# A tibble: 2,304 × 1
   labels
    <chr>
1       7
2      10
3       5
4       2
5       3
6       1
7       5
8       8
9      25
10      8
# ... with 2,294 more rows
```


```r
my_map <- leaflet() %>%
addProviderTiles( "OpenStreetMap.HOT",options = providerTileOptions(noWrap = TRUE)) %>%
addMarkers(data = filtered_df, clusterOptions = markerClusterOptions(), icon = greenLeafIcon,popup = paste("<strong>Airport name: </strong>","<br>",as.character(airportnames$labels),"<br>","<hr>", "<em>Airlines flying: </em>","<br>","<em>",as.character(airlines$labels),"</em>"))
```




```
Error in file(con, "rb") : cannot open the connection
```
