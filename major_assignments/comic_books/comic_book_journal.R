library(readr)
library(dplyr)
library(tidyr)
library(lubridate)
library(janitor)
library(rvest)
library(glue)
library(purrr)
library(tibble)

setwd("/Users/gregorymorton/Documents/GitHub/data_journalism_2022_spring/major_assignments/comic_books")

dc_data <- read_csv("data/dc-wikia-data.csv")

marvel_data <- read_csv("data/marvel-wikia-data.csv")

"https://github.com/fivethirtyeight/data/raw/master/comic-characters/marvel-wikia-data.csv" %>% 
  read_csv() %>% 
  clean_names() %>%
  View()


#define functions to get addtional variables from the wikia sites 

get_jobs <- function(page_link) {
  hero_page = read_html(url(page_link))
  hero_jobs = match_page %>%
    html_nodes(".pi-item-spacing+ .pi-border-color .pi-border-color:nth-child(6) .pi-font , .mw-redirect") %>%
    html_text() 
  return(hero_jobs)
}


get_jobs_marvel <- function(page_link) {
  hero_page = read_html(url(page_link))
  hero_jobs = match_page %>%
    html_nodes(".pi-collapse .pi-border-color:nth-child(4) .pi-font") %>%
    html_text() 
  return(hero_jobs_marvel)
}





test_url <- "https://dc.fandom.com/wiki/Batman_(Bruce_Wayne)"


dc_url <- "https://dc.fandom.com"

marvel_url <- "https://marvel.fandom.com/"

dc_test <- dc_data %>%
  mutate(slug = gsub("([\\])","", dc_data$urlslug)) %>%
  select(name, slug) %>%
  mutate(full_url = paste0(dc_url, slug))

marvel_test <- marvel_data %>%
  mutate(slug = gsub("([\\])","", marvel_data$urlslug)) %>%
  select(name, slug) %>%
  mutate(full_url = paste0(marvel_url, slug))




dc_test$full_url %>% 
  read_html() %>%
  html_nodes(".pi-item-spacing+ .pi-border-color .pi-border-color:nth-child(6) .pi-font") %>%
  html_text()

dc_test$full_url[1]

sapply(match_links, FUN = get_jobs, USE.NAMES = FALSE)

reviews <- character()



page<- (dc_test$full_url[1:200])

page_marvel <- (marvel_test$full_url[55])

page_marvel



gdxg <- lapply(page, function(i) {
  
 tryCatch(
  i %>%
    read_html %>%
    html_nodes(".pi-item-spacing+ .pi-border-color .pi-border-color:nth-child(6) .pi-font") %>% 
    html_text(),
  error = function(e){NA}  
 )
})


gdxg_marvel <- lapply(page, function(i) {
  
  tryCatch(
    i %>%
      read_html %>%
      html_nodes(".pi-collapse .pi-border-color:nth-child(4) .pi-font") %>% 
      html_text(),
    error = function(e){NA}  
  )
})

lapply(page, function(i) {
  
  tryCatch(
    i %>%
      read_html %>%
      html_nodes(".pi-item-spacing+ .pi-border-color .pi-border-color:nth-child(6) .pi-font") %>% 
      html_text(),
    error = function(e){NA}  
  )
})


gdxg

finaldf <- do.call(cbind, gdxg) 

rbind(head(dc_test, 200), test_list)

test_test <- head(dc_test, 200)

test_test$jobs <- gdxg

test_test %>% 
  View()

test_list <- lapply(gdxg, function(x) if(identical(x, character(0))) NA_character_ else x)

do.call(rbind, test_list)

  
rbind(test_test, test_list) %>% 
  View()




str_replace_all(jobs_test$job, "·", ",")

jobs_test %>% 
  filter(!is.na(job)) %>%
  filter(ALIGN == "Good Characters") %>%
  group_by(job) %>%
  count(sort = T)

jobs_test %>% 
  filter(!is.na(job)) %>%
  filter(ALIGN == "Bad Characters") %>%
  group_by(job) %>%
  count(sort = T)

jobs_test$full_url <- dc_test$full_url

jobs_test %>%
  View()





