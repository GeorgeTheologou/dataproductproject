library(dplyr)

# read airports csv
airports_df <- read.csv(file="raw/airports.csv", sep=",", header=FALSE)
names(airports_df) <- c("airportid","name","city","country","iata","icao","latitude","longitude","altitude","timezone","dst","tzdatabasetimezone")

# filter for selected columns
airports_df <- airports_df[, which(names(airports_df) %in% c("airportid","name", "iata", "icao","latitude","longitude"))]
colnames(airports_df)[2] <- "airportname"

# read routes csv
routes_df <- read.csv(file="raw/routes.csv", sep=",", header=FALSE)
names(routes_df) <- c("airline","airlineid","sourceairport","sourceairportid","destinationairport","destinationairportid","codeshare","stops","equipment")

# filter for selected columns
routes_df <- routes_df[, which(names(routes_df) %in% c("airline", "sourceairport", "sourceairportid"))]
colnames(routes_df)[3] <- "airportid"

# identify unique airlines by airport
unique_airlines_by_airport_df <- routes_df[duplicated(routes_df), ]
unique_airlines_by_airport_df <- merge(unique_airlines_by_airport_df,airports_df, by = "airportid")
unique_airlines_by_airport_df <- unique_airlines_by_airport_df[, which(names(unique_airlines_by_airport_df) %in% c("airline", "airportname", "latitude","longitude"))]

# write output
write_csv(unique_airlines_by_airport_df,"processed/airlinesbyairport.csv")

unique_airlines_by_airport_aggregate_df <- unique_airlines_by_airport_df %>%
  group_by(airportname, latitude,longitude) %>%
  summarize(count = n())

write_csv(unique_airlines_by_airport_aggregate_df,"processed/airlinesbyairportaggregate.csv")
