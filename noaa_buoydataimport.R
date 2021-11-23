#### request buoy data from related buoyd stations 
library(tidyverse)
library(stringr)

### make URLs

## download data from NOAA
url1 <- "https://www.ndbc.noaa.gov/view_text_file.php?filename="
url2 <- "h2005.txt.gz&dir=data/historical/stdmet/"

buoys.loc<- unique(buoys[c("station", "longitude", "latitude")])
### interested in: buoylist that are on track of Katrina 
buoylist = tolower(str_c(buoys.loc$station))
urls <- str_c(url1, buoylist, url2, sep = "")

N <- length(urls)

datalist = list()

for (i in 1:N){
    data <-  read_table(urls[i], col_names = TRUE)
    data$i <- i
    datalist[[i]] <- data
}
  
## convert buoylist to dataframe 
buoylist = data.frame(buoylist) %>%
  tibble::rowid_to_column(., "i")

## combine buoydata as dataframe,
### keep data in After August 20, before Septeber, during Katrina time 
buoydata <- do.call(rbind, datalist) %>%
  filter(., MM == '08'& DD >= '23') %>%
  select(.,c("DD", "WSPD","GST", "WVHT", "TIDE","i")) # Keep variables that are interested, Wind speed, gust speed, significant wave height, and water level
 
buoydata$i = as.integer(buoydata$i)
buoydt <- merge(x=buoydata, y = buoylist, by='i', all.x = TRUE)

#buoydt <- merge(x=buoydt, y = buoys.loc, by.x = 'buoylist', by.y = 'station', all.x = TRUE)


### map average windspeed by day at stations 
buoydt_agg = aggregate(buoydt,
                by = list(buoydt$buoylist, buoydt$DD),
                FUN = mean) 

buoys.loc$station = tolower(buoys.loc$station)

#### aggregate by station, day, calculating the average 
buoydt_agg <- buoydt_agg %>%
  select(c("Group.1","Group.2","WSPD", "GST", "WVHT","TIDE")) %>%
  merge(x=., y = buoys.loc, by.x = 'Group.1', by.y = 'station', all.x=TRUE)

