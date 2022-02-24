maryland_ppp$zip

maryland_ppp$naics_code

maryland_ppp <- maryland_ppp %>% 
  left_join(naics_code) 

maryland_ppp %>%
  select(title)



maryland_ppp_final %>%
  group_by(title) %>%
  summarize(count = n()) %>%
  arrange(desc(count))

maryland_ppp_final %>%
  filter(amount > 150000) %>%
  group_by(title) %>%
  summarize(count = n()) %>%
  arrange(desc(count))


maryland_ppp_final %>%
  filter(title == "Ammunition (except Small Arms) Manufacturing")
 