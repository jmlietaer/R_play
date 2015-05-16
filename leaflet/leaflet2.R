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

library(ggmap)
library(leaflet)

# pop1 <- c(-93.55, 42.0275, 'A')
pop1 <- geocode(c("paleizenplein, 1000 Brussel"), output="more")
# pop2 <- c(-93.65, 42.0285, 'B')
pop2 <- geocode(c("wetstraat 16, 1000 Brussel"), output="more")
# pop3 <- c(-93.75, 42.0295, 'C')
pop3 <- geocode(c("avenue des arts 51, 1000 Brussel"), output="more")

pop1 <- c(pop1$lon, pop1$lat, pop1$street)
pop2 <- c(pop2$lon, pop2$lat, pop2$street)
pop3 <- c(pop3$lon, pop3$lat, pop3$street)

A = matrix(c(pop1, pop2, pop3), nrow=3, ncol=3, byrow = TRUE) 

x <- mean(as.numeric(A[,1]))
y <- mean(as.numeric(A[,2]))

z_lng <- round(abs((max(as.numeric(A[,1]))-min(as.numeric(A[,1])))*3000))
z_lat <- round(abs((max(as.numeric(A[,2]))-min(as.numeric(A[,2])))*3000))
z <- z_lat
if (z_lng > z_lat) {z <- z_lng}

m = leaflet() %>% addTiles() %>% setView(x, y, zoom = z)

m = m %>% addMarkers(data = A, lng = A[,1], lat = A[,2], icon = icons(iconUrl = "http://a.fsdn.com/allura/p/freemind/icon", iconWidth = 30, iconHeight = 30), popup = A[,3])

m = m %>% addPopups(data = A, lng = A[,1], lat = A[,2], popup = A[,3])

m

leaflet() %>% addTiles() %>% setView(x, y, zoom = z) %>% addMarkers(A[3,1], A[3,2], icon = icons(iconUrl = "http://a.fsdn.com/allura/p/freemind/icon", iconWidth = 30, iconHeight = 30), popup = A[,3]) %>% addPopups(A[3,1], A[3,2], paste("<b>", A[3,3], "</b>", sep=""))

#
