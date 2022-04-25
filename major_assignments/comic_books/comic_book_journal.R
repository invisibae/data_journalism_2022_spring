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


test_url <- "https://dc.fandom.com/wiki/Batman_(Bruce_Wayne)"

dc_data %>%
  select(name, urlslug)


dc_data$urlslug %>% 
  str_remove_all("\\/wiki\\")


dc_test <- dc_data %>%
  mutate(slug = gsub("([\\])","", dc_data$urlslug)) %>%
  select(name, slug) %>%
  mutate(full_url = paste0(dc_url, slug))




dc_url <- "https://dc.fandom.com"


dc_test$full_url %>% 
  read_html() %>%
  html_nodes(".pi-item-spacing+ .pi-border-color .pi-border-color:nth-child(6) .pi-font") %>%
  html_text()

dc_test$full_url[1]

sapply(match_links, FUN = get_jobs, USE.NAMES = FALSE)

reviews <- character()

for(test in 1:9){
  
  full_url = paste0(dc_url, dc_test$slug)
  
  pages = read_html(full_url)
  jobs <- 
    pages %>% 
    html_nodes(".pi-item-spacing+ .pi-border-color .pi-border-color:nth-child(6) .pi-font") %>% 
    html_text()
  
  reviews <- c(reviews, jobs)
  
  print("Scraping reviews in progress")  
}


page<- (dc_test$full_url[1:200])





gdxg <- lapply(page, function(i) {
  
 tryCatch(
  i %>%
    read_html %>%
    html_nodes(".pi-item-spacing+ .pi-border-color .pi-border-color:nth-child(6) .pi-font") %>% 
    html_nodes(".pi-item-spacing+ .pi-border-color .pi-border-color:nth-child(5) .pi-font") %>%
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

rbind(head(dc_test, 200), test_list) %>%
  View()

test_test <- head(dc_test, 200)

test_test$jobs <- gdxg

test_test %>% 
  View()

test_list <- lapply(gdxg, function(x) if(identical(x, character(0))) NA_character_ else x)

do.call(rbind, test_list)

rbind()
  




