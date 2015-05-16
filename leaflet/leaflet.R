




# install.packages("devtools")
# devtools::install_github("rstudio/leaflet")
library("leaflet")

# install.packages("dplyr")
library(dplyr)

# install.packages("ggmap")
library(ggmap)



x <- geocode(c("zonienwoudlaan 79, 1640 Sint-genesius-rode"), output="more")

leaflet() %>% addTiles() %>% setView(x$lon, x$lat, zoom = 18) 

# leaflet() %>% addTiles() %>% setView(-84.3847, 33.7613, zoom = 16) %>%
#  +     addMarkers(data = atlanta, lat = ~ Latitude, lng = ~ Longitude,popup = atlanta$Name) %>%
#  +     addPopups(-84.3847, 33.7616, 'Data journalists at work, <b>NICAR 2015</b>')

