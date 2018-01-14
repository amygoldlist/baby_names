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


##Add in a column to indicate sex
female_data <- female_data %>% 
  mutate(Sex = 0)

male_data <- male_data %>% 
  mutate(Sex = 1)

## create one data.frame, with Sex as a factor
names <- bind_rows(female_data, male_data) %>% 
  mutate(Sex =as.factor(Sex))

names %>% 
  select("Name", "Sex", "Total", everything())



##write data to a new csv
write_csv(names, "results/name_data.csv")
