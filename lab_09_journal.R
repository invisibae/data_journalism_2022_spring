getwd()
setwd("/Users/gregorymorton/Documents/GitHub/data_journalism_2022_spring/labs/lab_09")

?scale_x_date

?rename

state_ppp_all

state_ppp_all %>%
  mutate(state = case_when(state == "N Dakota" ~ "North Dakota",
                           state == "S Dakota" ~ "South Dakota",
                           TRUE ~ as.character(state)
                           
  )) 



barber_shops %>%
  colnames()

barber_shops %>%
  group_by(race) %>%
  summarise(count = n(),
            mean_amount = mean(amount, na.rm = T),
            mean_undisp_amount = mean(undisbursed_amount, na.rm = T)) %>%
  arrange(desc(mean_amount))

barber_shops$jobs_retained %>%
  quantile()

barber_shops   %>%
  group_by(rural_urban_indicator) %>%
  summarise(count = n(),
            mean_amount = mean(amount, na.rm = T),
            mean_undisp_amount = mean(undisbursed_amount, na.rm = T)) %>%
  arrange(desc(mean_amount))


