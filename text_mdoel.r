#!/usr/bin/env Rscript

## Load packages
chooseCRANmirror(graphics = FALSE, ind = 4, local.only = FALSE)
install.packages("pacman")
## remotes::install_github("news-r/newsapi")
pacman::p_load(ggplot2, tidyr, dplyr,tidymodels, httr, jsonlite, tokenizers, tidytext, tidyverse)

## newsapi_key("0e4167a6dea241259827a0aba74ab876")

res_all = GET("https://newsapi.org/v2/everything?q=resilience&apiKey=0e4167a6dea241259827a0aba74ab876")

res_all
data <- fromJSON("https://newsapi.org/v2/everything?q=resilience&apiKey=0e4167a6dea241259827a0aba74ab876")
names(data)

data_art_names <- names(data$articles)

data_art_numbers <- data$totalResults
data_art_numbers

data_des <- data$articles$description

#dim(data_des)
#print(data_des)
#class(data_des)

data_des1 <- tibble(text = data_des) %>%
unnest_tokens(word, text, token = "words") %>%
group_by(word)%>%
count(word)%>%
arrange(desc(n))


dim(data_des1)
print(data_des1)
class(data_des1)



## unnest_tokens(word, text, token = "words")

## grepl("PayPal", data_des)

## data_des %>%
  ##separate_rows(sep = ' ') %>%
  ##group_by(tolower()) %>%
  ##summarise(Count = n(),
    ##        ScoreSum = sum(score))

## split strings



## flatten(data_des)

## rawToChar(res_all$content))

## names(data)
## head(data)

## res_sources = GET("https://newsapi.org/v2/sources?apiKey=0e4167a6dea241259827a0aba74ab876")

## res_sources

## res = GET("https://newsapi.org/v2/everything?q=bitcoin&apiKey=0e4167a6dea241259827a0aba74ab876", query = list(resilience))
## res
