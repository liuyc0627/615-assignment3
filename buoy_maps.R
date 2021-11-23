# import geospatial data 
world <- ne_countries(scale = "medium", returnclass = "sf")


counties <- st_as_sf(map("county", plot = FALSE, fill = TRUE))

buoydt_agg$Group.2 = as.character(buoydt_agg$Group.2)
buoydt_agg$longitude = as.numeric(buoydt_agg$longitude)
buoydt_agg$latitude = as.numeric(buoydt_agg$latitude)

g1 <- ggplot(data = world)+
  geom_sf()+
  geom_sf(data = counties, fill = NA, color = gray(.8)) +
  geom_point(data = buoydt_agg[buoydt_agg$Group.2==23,], aes(x = longitude, y = latitude, colour=WSPD), size=4, alpha=I(0.7))+
  coord_sf(xlim <- c(-100,-70), ylim <- c(20,40))+
  labs(x = "Longitude", 
       y = "Latitude",
       title = "Aug 23 2005", 
       subtitle = "Daily Average Wind Speed", 
       tag = "Figure5a.") +
  theme(panel.grid.major = element_line(color = gray(0.7), linetype = "dashed", 
                                        size = 0.5), panel.background = element_rect(fill = "aliceblue"))
g1


g2 <- ggplot(data = world)+
  geom_sf()+
  geom_sf(data = counties, fill = NA, color = gray(.8)) +
  geom_point(data = buoydt_agg[buoydt_agg$Group.2==24,], aes(x = longitude, y = latitude, colour=WSPD), size=4, alpha=I(0.7))+
  coord_sf(xlim <- c(-100,-70), ylim <- c(20,40))+
  labs(x = "Longitude", 
       y = "Latitude",
       title = "Aug 24 2005", 
       subtitle = "Daily Average Wind Speed", 
       tag = "Figure5b.") +
  theme(panel.grid.major = element_line(color = gray(0.7), linetype = "dashed", 
                                        size = 0.5), panel.background = element_rect(fill = "aliceblue"))
g2

g3 <- ggplot(data = world)+
  geom_sf()+
  geom_sf(data = counties, fill = NA, color = gray(.8)) +
  geom_point(data = buoydt_agg[buoydt_agg$Group.2==25,], aes(x = longitude, y = latitude, colour=WSPD), size=4, alpha=I(0.7))+
  coord_sf(xlim <- c(-100,-70), ylim <- c(20,40))+
  labs(x = "Longitude", 
       y = "Latitude",
       title = "Aug 25 2005", 
       subtitle = "Daily Average Wind Speed", 
       tag = "Figure5c.") +
  theme(panel.grid.major = element_line(color = gray(0.7), linetype = "dashed", 
                                        size = 0.5), panel.background = element_rect(fill = "aliceblue"))
g3

g4 <- ggplot(data = world)+
  geom_sf()+
  geom_sf(data = counties, fill = NA, color = gray(.8)) +
  geom_point(data = buoydt_agg[buoydt_agg$Group.2==26,], aes(x = longitude, y = latitude, colour=WSPD), size=4, alpha=I(0.7))+
  coord_sf(xlim <- c(-100,-70), ylim <- c(20,40))+
  labs(x = "Longitude", 
       y = "Latitude",
       title = "Aug 26 2005", 
       subtitle = "Daily Average Wind Speed", 
       tag = "Figure5d.") +
  theme(panel.grid.major = element_line(color = gray(0.7), linetype = "dashed", 
                                        size = 0.5), panel.background = element_rect(fill = "aliceblue"))
g4

g5 <- ggplot(data = world)+
  geom_sf()+
  geom_sf(data = counties, fill = NA, color = gray(.8)) +
  geom_point(data = buoydt_agg[buoydt_agg$Group.2==27,], aes(x = longitude, y = latitude, colour=WSPD), size=4, alpha=I(0.7))+
  coord_sf(xlim <- c(-100,-70), ylim <- c(20,40))+
  labs(x = "Longitude", 
       y = "Latitude",
       title = "Aug 27 2005", 
       subtitle = "Daily Average Wind Speed", 
       tag = "Figure5e.") +
  theme(panel.grid.major = element_line(color = gray(0.7), linetype = "dashed", 
                                        size = 0.5), panel.background = element_rect(fill = "aliceblue"))
g5

g6 <- ggplot(data = world)+
  geom_sf()+
  geom_sf(data = counties, fill = NA, color = gray(.8)) +
  geom_point(data = buoydt_agg[buoydt_agg$Group.2==28,], aes(x = longitude, y = latitude, colour=WSPD), size=4, alpha=I(0.7))+
  coord_sf(xlim <- c(-100,-70), ylim <- c(20,40))+
  labs(x = "Longitude", 
       y = "Latitude",
       title = "Aug 28 2005", 
       subtitle = "Daily Average Wind Speed", 
       tag = "Figure5f.") +
  theme(panel.grid.major = element_line(color = gray(0.7), linetype = "dashed", 
                                        size = 0.5), panel.background = element_rect(fill = "aliceblue"))
g6

g7 <- ggplot(data = world)+
  geom_sf()+
  geom_sf(data = counties, fill = NA, color = gray(.8)) +
  geom_point(data = buoydt_agg[buoydt_agg$Group.2==29,], aes(x = longitude, y = latitude, colour=WSPD), size=4, alpha=I(0.7))+
  coord_sf(xlim <- c(-100,-70), ylim <- c(20,40))+
  labs(x = "Longitude", 
       y = "Latitude",
       title = "Aug 29 2005", 
       subtitle = "Daily Average Wind Speed", 
       tag = "Figure5g.") +
  theme(panel.grid.major = element_line(color = gray(0.7), linetype = "dashed", 
                                        size = 0.5), panel.background = element_rect(fill = "aliceblue"))
g7


g8 <- ggplot(data = world)+
  geom_sf()+
  geom_sf(data = counties, fill = NA, color = gray(.8)) +
  geom_point(data = buoydt_agg[buoydt_agg$Group.2==30,], aes(x = longitude, y = latitude, colour=WSPD), size=4, alpha=I(0.7))+
  coord_sf(xlim <- c(-100,-70), ylim <- c(20,40))+
  labs(x = "Longitude", 
       y = "Latitude",
       title = "Aug 30 2005", 
       subtitle = "Daily Average Wind Speed", 
       tag = "Figure5h.") +
  theme(panel.grid.major = element_line(color = gray(0.7), linetype = "dashed", 
                                        size = 0.5), panel.background = element_rect(fill = "aliceblue"))
g8

g9 <- ggplot(data = world)+
  geom_sf()+
  geom_sf(data = counties, fill = NA, color = gray(.8)) +
  geom_point(data = buoydt_agg[buoydt_agg$Group.2==31,], aes(x = longitude, y = latitude, colour=WSPD), size=4, alpha=I(0.7))+
  coord_sf(xlim <- c(-100,-70), ylim <- c(20,40))+
  labs(x = "Longitude", 
       y = "Latitude",
       title = "Aug 31 2005", 
       subtitle = "Daily Average Wind Speed", 
       tag = "Figure5i.") +
  theme(panel.grid.major = element_line(color = gray(0.7), linetype = "dashed", 
                                        size = 0.5), panel.background = element_rect(fill = "aliceblue"))
g9

