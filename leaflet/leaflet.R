




# install.packages("devtools")
# devtools::install_github("rstudio/leaflet")
library("leaflet")

# install.packages("dplyr")
library(dplyr)

# install.packages("ggmap")
library(ggmap)



x <- geocode(c("koningsstraat 100, 1000 Brussel"), output="more")

leaflet() %>% addTiles() %>% setView(x$lon, x$lat, zoom = 18) %>% addMarkers(data = x, lng = x$lon, lat = x$lat, popup = "Popup, <b>bold text</b>") %>% addPopups(x$lon, x$lat, "Popup, <b>bold text</b>")

# leaflet() %>% addTiles() %>% setView(-84.3847, 33.7613, zoom = 16) %>%
#  +     addMarkers(data = atlanta, lat = ~ Latitude, lng = ~ Longitude,popup = atlanta$Name) %>%
#  +     addPopups(-84.3847, 33.7616, 'Data journalists at work, <b>NICAR 2015</b>')

