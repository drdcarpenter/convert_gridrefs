# convert uk grid reference to spatial point data


library(sf)
library(rnrfa)
library(readr)
library(janitor)
library(leaflet)

# read csv of records

r <- read_csv("data/myrecords.csv")
r <- janitor::clean_names(r)


# convert grid refs to E,N

x <- osg_parse(r$map_ref)

# write to data

r$east <- x$easting
r$north <- x$northing

# create wkt from eastings and northings

r$wkt <- paste0("POINT(", r$east, " ", r$north, ")")


# convert to sf

rs <- st_as_sf(r, wkt="wkt")
class(rs)
rs

# set crs
st_crs(rs) <- 27700
rs

# transform data for leaflet
rs <- st_transform(rs, 4326)

# create leaflet map

m <- leaflet(rs) %>% 
  addTiles() %>% 
  addMarkers(popup = paste0("Species: ", rs$common_name,"<br>",
                           "(", rs$species, ")"))
m
