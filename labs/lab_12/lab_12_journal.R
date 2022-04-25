getwd()

setwd("/Users/gregorymorton/Documents/GitHub/data_journalism_2022_spring/labs/lab_12")

wvu_crime %>%
  colnames()

stamp(
  x,
  orders = lubridate_formats,
  locale = Sys.getlocale("LC_TIME"),
  quiet = FALSE
)
