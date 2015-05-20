#
#   Author:   J.M. Lietaer - https://github.com/jmlietaer
#   Date:     20150520
#   Subject:  Test - Libraries leaflet - Data imported from csv-file
#
#   Source(s):   
#   [1]   http://www.computerworld.com/article/2894448/useful-new-r-packages-for-data-visualization-and-analysis.html
#   [2]   leaflet - http://rstudio.github.io/leaflet/
#   [3]   ggmap
#         D. Kahle and H. Wickham. ggmap: Spatial Visualization with
#         ggplot2. The R Journal, 5(1), 144-161. URL
#         http://journal.r-project.org/archive/2013-1/kahle-wickham.pdf
#   [4]   Get Latitude Longitude - http://www.latlong.net/search.php?keyword=
#   [5]   leaflet providers - http://leaflet-extras.github.io/leaflet-providers/preview/index.html
# 

# library(ggmap) # only needed for "Test with ggmap"
library(leaflet)

### START ### Test with ggmap ###

# pop1 <- geocode(c("paleizenplein, 1000 Brussel"), output="more")
# pop2 <- geocode(c("wetstraat 16, 1000 Brussel"), output="more")
# pop3 <- geocode(c("avenue des arts 51, 1000 Brussel"), output="more")
# pop1 <- c(pop1$lon, pop1$lat, pop1$street)
# pop2 <- c(pop2$lon, pop2$lat, pop2$street)
# pop3 <- c(pop3$lon, pop3$lat, pop3$street)

# pop1 <- c(-77.009003, 38.889931, "Capital Building<br/>Washington, DC, USA")
# pop2 <- c(151.215256, -33.856159, "Opera House<br/>Sydney, Australia")
# pop3 <- c(2.2945, 48.8582, "Eiffel Tower<br/>Paris, France")

# A = matrix(c(pop1, pop2, pop3), nrow=3, ncol=3, byrow = TRUE) 

### END ### Test with ggmap ###

### START ### Test with leaflet ###

file_in = "coordinates.csv"

pop = read.csv(file_in, header=F, stringsAsFactors=F, skip=0, sep=";")

A = matrix(c(pop[,1], pop[,2], pop[,3]), nrow=, ncol=3, byrow = FALSE) 

### END ### Test with leaflet ###

### START ### Common code ###

x <- mean(as.numeric(A[,1]))
y <- mean(as.numeric(A[,2]))

## Define the map
m = leaflet() %>% addTiles() %>% setView(x, y, zoom = 1)

## Ass provider tiles to the map
# m = m %>% addProviderTiles("OpenStreetMap.HOT")
# m = m %>% addProviderTiles("OpenStreetMap.BlackAndWhite")
# m = m %>% addProviderTiles("Stamen.Toner")
# m = m %>% addProviderTiles("Stamen.Watercolor")
# m = m %>% addProviderTiles("Acetate.terrain")
# m = m %>% addProviderTiles("CartoDB.Positron")
# m = m %>% addProviderTiles("Esri.WorldTopoMap")
# m = m %>% addProviderTiles("Acetate.all")
m = m %>% addProviderTiles("HikeBike.HillShading")                                             

## Add pop-ups to the map
m = m %>% addMarkers(data = A, lng = A[,1], lat = A[,2], icon = icons(iconUrl = "icons/man.png", iconWidth = 30, iconHeight = 30), popup = paste(A[,3], "<br/>lon = ", A[,1], "<br/>lat = ", A[,2], sep=""))

## Add pop-ups to the map
m = m %>% addPopups(data = A, lng = A[,1], lat = A[,2], popup = A[,3])

## Plot the map
m

## REMARK
# In case you're not familiar with the magrittr pipe operator (%>%), 
# here is the equivalent without using pipes:
# m <- leaflet()
# m <- addTiles(m)
# m <- addMarkers(m, lng=174.768, lat=-36.852, popup="The birthplace of R")
# m

### END ### Common code ###
