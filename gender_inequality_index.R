# Read in global gender inequality data
gender_data <- read.csv("E:/GIS/wk4/gender_inequality_data.csv")

# Read in spatial data of the world
world_spatial_data <- sf::st_read("E:/GIS/wk4/World_Countries_Generalized/World_Countries_Generalized.shp")

# Calculate the difference in inequality
diff_data <- gender_data %>%
  mutate(inequality_difference = gii_2019 - gii_2010) %>%
  dplyr::select(country,
                inequality_difference)

# Join the data
merged_data <- dplyr::left_join(world_spatial_data, diff_data, by = c("COUNTRY" = "country"))


