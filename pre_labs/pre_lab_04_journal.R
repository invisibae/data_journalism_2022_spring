estimates <- bind_rows(list(popestimate_2010, popestimate_2015, popestimate_2020))



maryland_ppp_with_naics %>%
  group_by(title) %>%
  summarise(count = n()) %>%
  arrange(desc(count))
# Q 12

maryland_ppp_with_naics_and_demographics$PNHW


# Q13:

maryland_ppp_with_naics_and_demographics %>%
  filter(PNHB > 50) %>%
  summarize(
    count = n(),
    avgamount = mean(amount),
    medamount = median(amount))


# Q 14:

maryland_ppp_with_naics_and_demographics %>%
  filter(PNHW > 50) %>%
  summarize(
    count = n(),
    avgamount = mean(amount),
    medamount = median(amount))

# Q 15:

maryland_ppp_with_naics_and_demographics %>%
  filter(PNHB > 50) %>%
  group_by(rural_urban_indicator) %>%
  summarize(
    count = n(),
    avgamount = mean(amount),
    medamount = median(amount))

# Q 16:

# zcta with > 50% non-Hispanic white population grouped by rural/urban
maryland_ppp_with_naics_and_demographics %>%
  filter(PNHW > 50) %>%
  group_by(rural_urban_indicator) %>%
  summarize(
    count = n(),
    avgamount = mean(amount),
    medamount = median(amount))


maryland_ppp_with_naics_and_demographics <- maryland_ppp_with_naics %>% left_join(maryland_zcta, by=c("zip"="ZCTA5N"))


maryland_ppp_with_naics_and_demographics
