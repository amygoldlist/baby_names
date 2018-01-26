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
#name_s <- read_csv("app_data/name_spread_data.csv")

##this should probablyu be deleted
wordcloud_rep <- repeatable(wordcloud)


##create list of names in the dataframe
#names_all <- unique(names$Name)

#names_girl <- unique(names %>% filter(Sex ==0))$Name

#names_boy <- unique(names %>% filter(Sex ==1))$Name

##If statement to choose name list to pull from


##If statement to choose boy or girl names
gender_select <- function(choice){
  if (choice == "All names"){
    gender <- c(0,1)
  }
  else if (choice =="Boy's names"){
    gender <- c(1)
  }
  else{
    gender <- c(0)
  }
  gender
}



