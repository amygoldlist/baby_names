#names

library(shiny)
library(ggplot2)
library(readr)
#library(wordcloud2)
library(wordcloud)
library(dplyr)
#library(shinysky)



## read in data
names <- read_csv("app_data/name_data.csv")

##this should probablyu be deleted
wordcloud_rep <- repeatable(wordcloud)


###delete:  this is for experimenting
name_filter <- names %>% 
  filter(year >=1980,
         year <=2000) %>% 
  group_by(Name) %>% 
  summarize(x= sum(n))


##experimenting 
#cloud <- wordcloud(name_19$Name, name_19$n, max.words = 15, random.color = FAlSE, colors = pal)

#wordcloud(filtered$Name, filtered$freq, max.words = 15, scale=c(2,0.8),colors=brewer.pal(8, "Dark2"))

##create list of names in the dataframe
names_all <- unique(names$Name)

##If statement to choose boy or girl names
gender_select <- function(choice){
  if (choice == "either"){
    gender <- c(0,1)
  }
  else if (choice =="boy"){
    gender <- c(1)
  }
  else{
    gender <- c(0)
  }
  gender
}



#experiment

filter_n <- names %>% 
  filter(Name %in% c("CHARLES", "SAMUEL", "AMY", "WARREN")) %>% 
  group_by(Name, year) %>% 
  summarize(freq = sum(n))

ggplot(filter_n,aes(x = year, y = freq, group = Name, colour=Name))+
  geom_line()+
  theme_bw()+
  ggtitle("Name Trends from 1915 to 2014")+
  ylab("Name Frequency")+
  xlab("Year")
