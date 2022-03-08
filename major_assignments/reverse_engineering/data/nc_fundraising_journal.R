library(tidyverse)
library(lubridate)

getwd()
setwd("/Users/gregorymorton/reverse_engineer")

# Read File ---------------------------------------------------------------


nc_fundraising <- read_csv("nc_fundraising.csv")

# turn amount into a number
nc_fundraising <- nc_fundraising %>%
  mutate(amount = parse_number(amount))


# turn dates into dates

nc_fundraising %>%
  mutate(date = parse_date(date, "%d/%m/%y"))






nc_fundraising %>%
  mutate(date = dmy(date)) 

nc_fundraising %>%
  mutate(date = parse_date(date, )) %>%
  select(date)

nc_fundraising$date

nc_fundraising$date %>%
  format(as.Date(nc_fundraising$date), "%d/%m/%Y") 




nc_fundraising %>%
  filter(date >= "2018-06-15") %>%
  View()









