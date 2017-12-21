readAddresses <- function( includeOnlyKeyAndGeoid = TRUE ) {
  # Reads the geocoded address file
  #
  #  Args:
  #    includeOnlyKeyAndGeoid: if true, return only the KIVA.PIN and GEO_ID columns.
  #    Otherwise, return all columns.
  
  # read in the code violations data from a csv file
  columnClasses = c(
    #Kiva.Pin
    "integer",
    #County.APN
    "character",
    #Address.Number
    "character",
    #Street
    "character",
    #Street.Type
    "character",
    #Combined.Full.Address
    "character",
    #City
    "character",
    #State
    "character",
    #Longitude
    "double",
    #Latitude
    "double",
    #AFFGEOID
    "character",
    #GEOID
    "character"
  )
  
  addresses <- read.csv("data/input/address_blockgroup_master.csv", colClasses = columnClasses)
  # clean up temporary objects
  rm(columnClasses)
  
  # match the casing of the violations dataset
  names(addresses)[names(addresses) == 'Kiva.Pin'] <- 'KIVA.PIN'
    

  # return only the KIVA.PIN and GEOID if requested
  if(includeOnlyKeyAndGeoid) {
    addresses <- addresses %>% select(KIVA.PIN, GEOID) 
  }
  addresses
}