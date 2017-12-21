library(stringr)
library(dplyr)
library(tidyr)

source('scripts/geocoded_addresses.R', echo=FALSE)

# this script scrubs and geocodes the KC tax auction data for 2017

# todo: refresh KC address data each year from AddressAPI - use batch solution if available

# todo: follow similar process for Independence data (I2017Sale.csv) by attempting to use Independence API for 
# addresses

# todo: automate production of map overlaying tax auction data onto census tracts with per capita income info

input_file <- 'data/input/K2017Sale.csv'
output_file <- 'data/output/kc-2017-tax-auctions.csv'
unmatched_output <- 'data/output/kc-2017-tax-auctions-no-address.csv'

foreclosures <- read.csv(input_file, stringsAsFactors = FALSE)
foreclosures$APN <- str_replace_all(foreclosures$APN, "-", "")

#read geocoded addresses and strip the first two characters from APN
geo_addresses <- readAddresses(FALSE)
geo_addresses$County.APN <- str_sub(geo_addresses$County.APN, 3)
geo_addresses <- distinct(geo_addresses, KIVA.PIN, .keep_all = TRUE)
colnames(geo_addresses)[2] <- 'APN'
geo_addresses_with_geoid <- select(geo_addresses, KIVA.PIN, GEOID)
geo_addresses <- select(geo_addresses, -GEOID, -AFFGEOID)

#inner join geo_addresses to foreclosures
foreclosures <- left_join(foreclosures, geo_addresses, by = "APN")

# filter out those without matching addresses
unmatched <- filter(foreclosures, is.na(KIVA.PIN))
foreclosures <- filter(foreclosures, !is.na(KIVA.PIN))

write.csv(foreclosures, file = output_file, row.names = FALSE)
write.csv(unmatched, file = unmatched_output, row.names = FALSE)