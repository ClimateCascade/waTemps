###script for getting weather station data
library(weatherData)
rm.space <- function(x,lim=10){
 out <- x
 for (i in 1:lim){out <- sub('   ',' ',out)}
 for (i in 1:lim){out <- sub('  ',' ',out)}
 return(as.character(out))
}

###Get station IDs
ws.ids <- readLines('http://weather.rap.ucar.edu/surface/stations.txt')
nc.ids <- ws.ids[2161:2253]
ma.ids <- ws.ids[1609:1651]
nc.ids <- as.character(sapply(sapply(nc.ids,rm.space),rm.space))
ma.ids <- as.character(sapply(sapply(ma.ids,rm.space),rm.space))
nc.ids <- sapply(nc.ids,strsplit,split=' ')
ma.ids <- sapply(ma.ids,strsplit,split=' ')
nc.ids <- do.call(rbind,nc.ids)
ma.ids <- do.call(rbind,ma.ids)