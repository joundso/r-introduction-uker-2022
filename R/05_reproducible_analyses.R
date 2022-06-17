### This file is for demo purposes only. This comment describes the main
### focus.
### @Date 2022-06-17

## Install necessary packages:
packages <- c(
  "cleaR",
  "data.table",
  "REDCapR"
)
install.packages(packages)

# Cleanup the backend in RStudio:
cleaR::clear()

## Variables for this script:
path_to_patient_information <- "./data/synthetic_data.csv"

col_types <- readr::cols(.default = readr::col_character())
redcap_export <-
  REDCapR::redcap_read(
    redcap_uri = Sys.getenv("REDCAP_API_URL"),
    token = Sys.getenv("REDCAP_API_KEY"),
    col_types = col_types
  )
stopifnot(redcap_export$success)

redcap_export <- data.table::as.data.table(redcap_export$data)
rm(redcap_export)
