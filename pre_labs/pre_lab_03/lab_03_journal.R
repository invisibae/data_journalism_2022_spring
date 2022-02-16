
# Q1
wv_ppp_loans %>%
  filter(project_county_name == "Kanawha" | project_county_name == "KANAWHA") %>%
  mutate(city = toupper(city)) %>%
  select(name, city, amount) %>%
  mutate(city = case_when(city == "ST.ALBANS" | city == "ST. ALBANS" | city == "ST ALBANS" ~ "SAINT ALBANS",
                          city == "SO CHARLESTON" | city == "S CHARLESTON" ~ "SOUTH CHARLESTON",
                          city == "CHARELSTON" ~ "CHARLESTON",
                          city == "CROSS LANES" ~ "CROSSLANES",
                          city == "ELKVEIW" ~ "ELKVIEW",
                          city == "BALLE" ~ "BELLE",
                          TRUE ~ city)) %>%
  group_by(city) %>%
  summarise(count = n()) %>%
  arrange(desc(count)) 


# Q2

#Find the 5-digit ZIP code in West Virginia that had the highest total amount of loans (by dollar value). What is the name of the business that got the largest loan (by dollar value) in that zip code? Write up a short paragraph that also answers these questions:
  
#  * Where in West Virginia is this ZIP code located?
#  * How much was the business' loan for?
#  * How much of that loan was forgiven?
#  * Which number is bigger, the loan amount or the forgiveness amount? Can you explain the discrepancy?

wv_ppp_loans %>%
  mutate(zip = str_sub(zip, start=1L, end=5L)) %>%
  group_by(zip) %>%
  summarize(total_loan_sum = sum(amount)) %>%
  arrange(desc(total_loan_sum))

wv_ppp_loans %>% 
  mutate(zip = str_sub(zip, start=1L, end=5L)) %>%
  filter(zip == "25301") %>%
  group_by(name) %>%
  summarize(amount, forgiveness_amount) %>%
  arrange(desc(amount))

# Q3

# Q3: Five business entities owned by the spouse of a member of West Virginia's U.S. House delegation got PPP loans. Write up a paragraph that answers the following questions.   

#  * What are the businesses' names?
#  * What do the businesses do?
#  * How much money did the five businesses receive in total?
#  * What percentage of the total loan amount have been forgiven?
#  * How did the U.S. House member vote on the legislation initially author zing the PPP loan program.

wv_ppp_loans %>% 
  filter(str_detect(.$name, c("DUTCH MILLER", "DM MOTORS" )))


wv_ppp_loans %>%
  filter(str_detect(name, "DUTCH MILLER|DM MOTOR, INC")) %>%
  select(name, amount, forgiveness_amount) %>%
  mutate(forgiveness_pct = forgiveness_amount / amount, total = sum(amount))





  

   





