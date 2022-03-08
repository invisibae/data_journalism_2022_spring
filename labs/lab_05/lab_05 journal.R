getwd()

setwd("/Users/gregorymorton/Documents/GitHub/data_journalism_2022_spring/labs/lab_05")
getwd()


wv_25401_ppp <- wv_25401_ppp %>%
  left_join(naics, by = "naics_code") %>%
  mutate(address = toupper(address)) 

wv_25401_ppp %>%
  select(address) %>%
  View()


wv_25401_ppp_address_clean %>%
  group_by(address) %>%
  count(sort = T)

wv_25401_ppp_address_clean %>%
  filter(address == "126 E BURKE ST") %>%
  select(name, naics_code, title, city)


wv_pop %>%
  group_by(population_2019) %>%
  arrange(desc(population_2019))


wv_ppp %>%
  left_join(naics, by = "naics_code") %>%
  mutate(project_county_name = toupper(project_county_name)) %>%
  mutate(city = toupper(city)) %>%
  filter(project_county_name == "BERKELEY") %>%
  group_by(city) %>%
  summarize(count = n()) %>%
  arrange(desc(count))

martinsburg <- wv_ppp %>%
  left_join(naics, by = "naics_code") %>%
  mutate(project_county_name = toupper(project_county_name)) %>%
  mutate(city = toupper(city)) %>%
  filter(project_county_name == "BERKELEY") %>%
  filter(city == "MARTINSBURG")



martinsburg %>%
  filter(naics_code == 722511) %>%
  group_by(name) %>%
  summarize(loan_amount = sum(amount)) %>%
  arrange(desc(loan_amount))
 
martinsburg <- wv_ppp %>%
  left_join(naics, by = "naics_code") %>%
  mutate(project_county_name = toupper(project_county_name)) %>%
  mutate(city = toupper(city)) %>%
  filter(project_county_name == "BERKELEY") 



#**Q5.** Start with a dataframe of loans to all businesses in the city and industry that answered question 3. Answer the following questions:
#  * What is the name of the business that got the highest approved loan amount?
#  * How much was it for?
#  * When was it approved?
#  * How many jobs does the data say were retained?
#  * Is there a difference between the business' name in the PPP data and the name its customers know it by? If so, what is that name?
#  * How many locations does this business have?
#  * Did one of its locations close during the pandemic, either before or after it got the loan?

martinsburg %>%
  filter(naics_code == 722511) %>%
  group_by(name) %>%
  summarize(loan_amount = sum(amount)) %>%
  arrange(desc(loan_amount))

martinsburg %>%
  filter(name == "COTTLE CHRISTI L LLC") %>%
  select(date_approved, jobs_retained)




