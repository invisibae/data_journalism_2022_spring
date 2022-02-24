getwd()
setwd("/Users/gregorymorton/Documents/GitHub/data_journalism_2022_spring/pre_labs/pre_lab_05")

md_loans %>%
  group_by(city) %>%
  summarise(
    count=n()
  ) %>%
  filter(str_detect(city, "^a|^A")) %>%
  arrange(city)


?key_collision_merge
