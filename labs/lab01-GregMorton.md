---
title: "lab_01"
author: "Greg Morton"
date: "1/31/2021"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
# Turn off scientific notation
options(scipen=999)
```

## About this lab

To complete this lab, you need to:
* run existing code as directed (look for **Task**).
* modify existing code as directed (look for **Task**).
* write code in empty codeblocks provided to answer questions included (look for **Q**).
* write out the answer in the form of a complete sentence in the space given (look for **A**).

When you are finished, commit changes and push to your personal GitHub repo, then submit the URL to this document on ELMS.

Remember to add any new verbs or concepts to your reference notebook!

## Load libraries and establish settings

**Task** Run the codeblock below to load the Tidyverse. To run the codeblock, hit the little green play button in the upper right corner of the gray area (the codeblock) below.

```{r}
# Load the tidyverse. If you have not installed the tidyverse already, remove the # from the next line and run it first.  
# install.packages('tidyverse')
library(tidyverse)
```

## Load Data

We're going to load the slice of PPP loans for West Virginia.

**Task** Run the codeblock below to load the data.

```{r}
wv_ppp_loans <- read_rds("lab_01.rds")
```

## Examine Data

**Task** Run the codeblock below to use glimpse to get a sense of the column names, types and sample data.
**Q1** How many rows and columns does this dataframe have?
**A1**: **33,326 rows and 42 columns**

```{r}
glimpse(wv_ppp_loans)
```

## Answer questions

Use the pre-lab and your reference notebook as examples.

**Q2** Which West Virginia county got the most loans? How many?
**A2**: **Kanawha County, 4273**

```{r}
wv_ppp_loans %>%
  group_by(project_county_name) %>%
  count(sort = T)

```
**Q3** Which West Virginia county got the fewest loans? How many?
**A3** : **Wirth County, 36**

```{r}
wv_ppp_loans %>%
  group_by(project_county_name) %>%
  count(sort = T) %>%
  arrange(n)


```
**Q4** What's your best educated guess to explain why the county identified in question 2 had a lot of loans and why the county identified in question 3 had only a few loans? Hint: you won't find the answer in the data, you'll need to do some quick web research. You do not need to write any code for this question, so no codeblock is provided.  
**A4** **Kanawha is West Virginia's most populous district and the home of its state capital. Wirt county is the state's least populous county and has almost as many residents as Kanawha County received PPP loans. **


**Q5** What West Virginia business got the state's largest PPP loan? How much was it for? What does the business do? How many jobs did the loan retain, according to the data?
**A5**: **WV's largest PPP loan was received by the Greenbriar Hotel Corporation, parent company of the Greenbriar luxury hotel in Greenbriar County, WV.  According to the data they retained 500 jobs**

```{r}
wv_ppp_loans %>%
  arrange(desc(amount))

```

**Q6** What West Virginia politician (with his family) owns the company identified in question 5? What's your source for that information? Hint: this will require web research, you won't be able to answer this purely from the data set.  You do not need to write any code for this question, so no codeblock is provided.  
**A6** : **The Greenbriar is owned by Billionaire WV Governor Jim Justice and his family.  I found this info from quickly Googling a company profile for the [Greenbriar Corporation](https://www.dnb.com/business-directory/company-profiles.greenbrier_hotel_corporation.e1db40121658957db9cea32db34fe5d4.html).**

**Q7**. Produce a summary table that has the following information for West Virginia as a whole (the whole state, not by county):
* count of loans
* total amount of all loans
* the average loan amount
* the median loan amount
* the smallest loan amount
* the largest loan amount

Store it as a variable object called `wv_summary` so that you can examine it with the data viewer. What newsworthy nuggets jump out at you that you could imagine dropping into a news story? Write a few summary sentences with overall findings.

**A7** : **The first thing I noticed was the slightly greater skew when compared with MD PPP loans.  While the highest loans are higher in Maryland, a greater percentage of WV PPP laons are at the higher end of the "amount" distribution.  Despite being a smaller and poorer state, the average loan amount in WV is slightly higher than in MD**
```{r}
wv_summary <- wv_ppp_loans %>%
  summarize("WV PPP LOANS",
            total = sum(amount),
            avg_loan = mean(amount),
            med_loan = median(amount),
            min_loan = min(amount),
            max_loan = max(amount))

wv_summary
```
