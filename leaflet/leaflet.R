#
#   Author:   J.M. Lietaer - https://github.com/jmlietaer
#   Date:     20150516
#   Subject:  Test - Libraries leaflet, ggmap
#
#   Source(s):   
#   [1]   http://www.computerworld.com/article/2894448/useful-new-r-packages-for-data-visualization-and-analysis.html
#   [2]   leaflet - http://rstudio.github.io/leaflet/
#   [3]   ggmap
#         D. Kahle and H. Wickham. ggmap: Spatial Visualization with
#         ggplot2. The R Journal, 5(1), 144-161. URL
#         http://journal.r-project.org/archive/2013-1/kahle-wickham.pdf
# 

# install.packages("devtools")
# devtools::install_github("rstudio/leaflet")
library(leaflet)

# install.packages("ggmap")
library(ggmap)

x <- geocode(c("paleizenplein, 1000 Brussel"), output="more")

# leaflet() %>% addTiles() %>% setView(x$lon, x$lat, zoom = 18) 
leaflet() %>% addTiles() %>% setView(x$lon, x$lat, zoom = 16) %>% addMarkers(data = x, lng = x$lon, lat = x$lat, popup = "Brussels<br/><b>Royal Palace</b>") %>% addPopups(x$lon, x$lat, "<center>Brussels<br/><b>Royal Palace</b></center>")

# -----