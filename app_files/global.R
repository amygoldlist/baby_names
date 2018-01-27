###libraries used

library(shiny)
library(ggplot2)
library(readr)
library(wordcloud)
library(dplyr)




## read in data
names <- read_csv("app_data/name_data.csv")
#name_s <- read_csv("app_data/name_spread_data.csv")

##this should make the clouds repeatable in one session
wordcloud_rep <- repeatable(wordcloud)



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



