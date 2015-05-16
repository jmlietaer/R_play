#
#   Author:   J.M. Lietaer
#   Date:     20150516
#
#   Subject:  Test - Libraries leaflet, dplyr, ggmap
#
#   Source:   http://www.computerworld.com/article/2894448/useful-new-r-packages-for-data-visualization-and-analysis.html
#

# install.packages("devtools")
# devtools::install_github("rstudio/leaflet")
library("leaflet")

# install.packages("dplyr")
library(dplyr)

# install.packages("ggmap")
library(ggmap)

x <- geocode(c("paleizenplein, 1000 Brussel"), output="more")

# leaflet() %>% addTiles() %>% setView(x$lon, x$lat, zoom = 18) 
leaflet() %>% addTiles() %>% setView(x$lon, x$lat, zoom = 16) %>% addMarkers(data = x, lng = x$lon, lat = x$lat, popup = "Brussels<br/><b>Royal Palace</b>") %>% addPopups(x$lon, x$lat, "<center>Brussels<br/><b>Royal Palace</b></center>")


