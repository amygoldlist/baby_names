##clean_data.R
##by Amy Goldlist, January 2018

## Usage:  Rscript src/clean_data.R 



## This script takes the raw data from DataBC, and cleans it up, making it into one nice dataframe for analysis




###load libraries
library(tidyverse)
#library(stringr)
#library(forcats)

##read in data
male_data <- read_csv("data/bc-popular-boys-names.csv")
female_data <- read_csv("data/bc-popular-girls-names.csv")




##Add in a column to indicate sex, and gather data
female_data <- female_data %>% 
  gather(key = "year", value = "n", 2:102) %>% 
  mutate(Sex = 0)

female_data

male_data <- male_data %>% 
  gather(key = "year", value = "n", 2:102) %>% 
  mutate(Sex = 1)

## create one data.frame, with Sex as a factor
names <- bind_rows(female_data, male_data) %>% 
  mutate(Sex =as.factor(Sex))

##clean up
names <- names %>% 
  filter(year !="Total") %>% 
  mutate(year = as.integer(year))

names



##write data to a new csv
write_csv(names, "app_files/app_data/name_data.csv")
