##########################################
####  C. Muhs                         ####
####  August  2017                    ####
##########################################

##########################################
####  This script:                    ####
####  * Make a test map with osm      ####
##########################################

# Setup
################################################
# install.packages("osmdata")
# install.packages("osmplotr")
library("osmdata")
library("osmplotr")
library("tidyverse")

# Make map
################################################
bb <- get_bbox(c(-75.174, 39.945, -75.152, 39.960)) # part of center city Philadelphia

# Retrieve some data
bldgs <- extract_osm_objects(key = "building", bbox = bb)
park <- extract_osm_objects(key = "park", bbox = bb)

# Define map, tidily
map <- osm_basemap(bbox = bb, bg = "gray20") %>%
    add_osm_objects(bldgs, col = "gray70") %>%
    add_osm_objects(park, col = "darkseagreen4")

# Show map
print_osm_map(map)