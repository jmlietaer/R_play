#
#
#
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

x <- geocode(c("koningsstraat 100, 1000 Brussel"), output="more")

# leaflet() %>% addTiles() %>% setView(x$lon, x$lat, zoom = 18) 
leaflet() %>% addTiles() %>% setView(x$lon, x$lat, zoom = 18) %>% addMarkers(data = x, lng = x$lon, lat = x$lat, popup = "Popup, <b>bold text</b>") %>% addPopups(x$lon, x$lat, "Popup, <b>bold text</b>")

