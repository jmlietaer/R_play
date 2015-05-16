library(leaflet)
m = leaflet() %>% addTiles()
m  # a map with the default OSM tile layer
m = m %>% setView(-93.65, 42.0285, zoom = 14)
m

library(ggmap)

x <- geocode(c("paleizenplein, 1000 Brussel"), output="more")

%>% addMarkers(data = x, lng = x$lon, lat = x$lat, popup = "Brussels<br/><b>Royal Palace</b>")

m

m %>% addPopups(-93.65, 42.0285, 'Here is the <b>Department of Statistics</b>, ISU')

pop1 <- c(-93.55, 42.0275, 'A')
pop2 <- c(-93.65, 42.0285, 'B')
pop3 <- c(-93.75, 42.0295, 'C')

A = matrix(c(pop1, pop2, pop3), nrow=3, ncol=3, byrow = TRUE) 

m %>% addMarkers(data = A, lng = A[,1], lat = A[,2], popup = A[,3])

m %>% addPopups(data = A, lng = A[,1], lat = A[,2], popup = A[,3])



m %>% addPopups(data=x,lng=x$lon,lat=x$lat,popup=x$street) 
