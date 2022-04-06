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

