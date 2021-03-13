# Instalar librerías
# install.packages('osmdata')
# install.packages('sf')
# install.packages('tidyverse')
# install.packages('tmap')

# Cargar librerías
library(osmdata)
library(sf)
library(tidyverse)
library(tmap)

# Obtener query
q <- getbb('Caracas') %>%
  opq() %>%
  add_osm_feature("name","McDonald's")

# Obtener datos
data_raw <- osmdata_sf(q)

# Eliminar datos faltantes
mcdonalds <- data_raw$osm_points %>%
  filter(!is.na(addr.housename))

# Crear mapa interactivo
tmap_mode('view')

tm_shape(mcdonalds) +
  tm_dots(col = "red", size = .1)