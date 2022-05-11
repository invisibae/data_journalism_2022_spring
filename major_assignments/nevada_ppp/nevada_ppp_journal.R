library(tidyverse)


setwd("/Users/gregorymorton/Documents/GitHub/data_journalism_2022_spring/major_assignments/nevada_ppp")

nevada_ppp <- read_csv("data/nevada_ppp.csv")

nevada_ppp <- nevada_ppp %>%
  mutate(naics_code = as.character(naics_code))

nevada_ppp <- nevada_ppp %>% 
  mutate(city = str_to_upper(city)) %>%
  mutate(city = case_when(city == "N LAS VEGAS" ~ "NORTH LAS VEGAS",
                          TRUE ~ city))

nevada_ppp %>% 
  mutate(address = str_to_upper(address)) %>%
  mutate(city = case_when(city == "N LAS VEGAS" ~ "NORTH LAS VEGAS",
                          TRUE ~ city)) %>%
  group_by(address, city) %>%
  count(sort = T)

# This address had more loans than any other in the state, 122 loans averaging about $22,000
s_jones_blvd_summary <- nevada_ppp %>% 
  mutate(address = str_to_upper(address)) %>%
  mutate(city = case_when(city == "N LAS VEGAS" ~ "NORTH LAS VEGAS",
                          TRUE ~ city)) %>%
  filter(address == "304 S JONES BLVD") %>% 
  summarise('304 S Jones BLVD' = '.',
            median = median(amount),
            sum = sum(amount),
            avg = sum/ 119,
            n = n())

s_jones_blvd <- nevada_ppp %>% 
  mutate(address = str_to_upper(address)) %>%
  mutate(city = case_when(city == "N LAS VEGAS" ~ "NORTH LAS VEGAS",
                          TRUE ~ city)) %>%
  filter(address == "304 S JONES BLVD")

nevada_ppp %>%
  filter(naics_code == "561599") %>%
  View()


county_summary

?scale_fill_brewer
?geom_sf_label
getwd()
?scale_fill_distiller

census_jobs %>%
  filter(fipstate == 32) %>%
  rename(naics_code = naics) %>%
  left_join(naics_codes_2, by = "naics_code") %>% 
  select(naics_code, title, ap, fipscty) %>%
  filter(!is.na(title)) %>%
  arrange(desc(ap))

fips_codes %>%
  filter(state_code == 32) %>%
  mutate(project_county_name = toupper(str_remove_all(county, " County"))) %>%
  rename(FIPSCTY = county_code,
         FIPSTATE = state_code) %>%
  select(FIPSTATE , FIPSCTY, project_county_name)

naics_codes_2 <- naics_codes %>%
  mutate(naics_code = as.character(naics_code))
