# Read in global gender inequality data
library(sf)
library(here)
library(raster)
library(terra)
library(fs)
library(tidyverse)
library(ggplot2)
library(farver)
library(dplyr)
library(janitor)
library(tmap)
#aaaa

gender_data <- read_csv("F:/UCL/Geographic Information Systems and Science (CASA0005)/WK4/homework/HDR21-22_Composite_indices_complete_time_series.csv",
                           locale = locale(encoding = "latin1"))
# Read in spatial data of the world
world_spatial_data <- st_read("F:/UCL/Geographic Information Systems and Science (CASA0005)/WK4/homework/World_Countries_Generalized/World_Countries_Generalized.shp")

# Calculate the difference in inequality
diff_data <- gender_data %>%
  mutate(inequality_difference = gii_2019 - gii_2010) %>%
  dplyr::select(country,
                inequality_difference)

# Join the data
merged_data <- dplyr::left_join(world_spatial_data, diff_data, by = c("COUNTRY" = "country"))

#test git pull
tm_shape(merged_data) + 
  tm_fill("inequality_difference", style = "quantile", palette = "Blues")
qtm(merged_data, fill = "inequality_difference", col = "reds")