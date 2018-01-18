#names

library(shiny)
library(ggplot2)
library(readr)
#library(wordcloud2)
library(wordcloud)
library(dplyr)




names <- read_csv("app_data/name_data.csv")


wordcloud_rep <- repeatable(wordcloud)



pal <- brewer.pal(9,"BuGn")
pal <- pal[-(1:4)]


name_filter <- names %>% 
  filter(year >=1980,
         year <=2000) %>% 
  group_by(Name) %>% 
  summarize(x= sum(n))

name_filter
  



wordcloud_rep <- repeatable(wordcloud)
#cloud <- wordcloud(name_19$Name, name_19$n, max.words = 15, random.color = FAlSE, colors = pal)


