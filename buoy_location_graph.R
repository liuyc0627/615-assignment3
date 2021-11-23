#### Citation: 
# Cara Wilson, Jennifer Sevadjian, and Dale Robinson, "R Excercises for the NOAA Satellite Course", Chapter 7.3,
# Add Nearby Buoy locations, https://coastwatch.pfeg.noaa.gov/projects/r/projectedbuoy.html#add-nearby-buoy-locations

## request buoy location data 
## limit latitude and longtitude to Katrina track, based on the hurricane exposure data returned lat and lon
buoysDatasetId <- 'cwwcNDBCMet'
install.packages('rerddap')
library(rerddap)
buoys <- tabledap(
  buoysDatasetId, 
  fields=c('station', 'latitude',  'longitude', 'time', 'wtmp'), 
  'time>=2005-08-22',   'time<=2005-09-01', 
  'latitude>=23','latitude<=31', 
  'longitude>=-90','longitude<=-75'
)


buoys$wtmp <- as.numeric(buoys$wtmp)

## create dataframe 
buoys.df <-data.frame(
  station=buoys$station,
  longitude=as.numeric(buoys$longitude),
  latitude=as.numeric(buoys$latitude),
  time=strptime(buoys$time, "%Y-%m-%dT%H:%M:%S"),
  sst=as.numeric(buoys$wtmp),
  col=as.numeric((buoys$wtmp-min(buoys$wtmp,na.rm=T))/max(buoys$wtmp,na.rm=T))
)

buoys.df$col[buoys.df$col <= 0] = 0
buoys.df$col[buoys.df$col > 1] = 1

### in total 77 buoys were found 
length(unique(buoys.df$station))


## draw scalebar
Zlim = c(0,12)

drawPalette(zlim = Zlim, 
            breaks = seq(0,12,2),
            col= oceColorsTemperature, 
            at = seq(0,12,2), 
            pos = 4, 
            drawTriangles = FALSE)

## make a base
# define map extents
ylim <- c(20,35)
xlim <- c(-100,-60)
data("coastlineWorldMedium") # included in ocedata

mapPlot(coastlineWorldMedium,
        col="lightgray", 
        longitudelim=xlim, 
        latitudelim=ylim, 
        clip = TRUE,
        main="Figure4. NOAA Buoys \n on Hurricane Katrina track"
)

numColors <- 6
mypalette <- rev(cmocean('thermal')(numColors))
mapPoints(longitude = buoys.df$longitude, 
          latitude = buoys.df$latitude, 
          col = mypalette[as.integer(1+(numColors-1)*buoys.df$col)], 
          pch = 20, cex = 1.25)

buoys.loc<- data.frame(unique(buoys$station))
