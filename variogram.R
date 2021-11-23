#aggregate data to hurricane period 
buoydt_agg3 <- aggregate(buoydt,
                         by = list(buoydt$buoylist),
                         FUN = mean) %>%
  select(.,c("Group.1", "WSPD"))

# merge with coordinates data 
buoydt_agg3 <- merge(x = buoydt_agg3, y = buoys.loc, by.x = "Group.1", by.y = "station")
buoydt_agg3$longitude = as.numeric(buoydt_agg3$longitude)
buoydt_agg3$latitude = as.numeric(buoydt_agg3$latitude)

## plot coordinates 
plot(buoydt_agg3[c(2:4)], lowess = TRUE,
     main = "Figure7. Explotary scatterplot")

plot(buoydt_agg3$longitude,buoydt_agg3$latitude,
     main = "Figure8. Explotary check on coordinates ",
     xlab = "Longitude",
     ylab = "Latitude") 

buoydt_agg3=na.omit(buoydt_agg3)

# convert simple data frame into a spatial data frame object
coordinates(buoydt_agg3)= ~ longitude+latitude

# create a bubble plot with the random values
bubble(buoydt_agg3, zcol='WSPD', fill=TRUE, do.sqrt=FALSE, maxsize=3,
       main = "Figure9. Bubble charts for WSPD")

TheVariogram=variogram(WSPD~1, data=buoydt_agg3)
plot(TheVariogram, 
     main = "Figure10. Semivariogram")



