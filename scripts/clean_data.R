##clean_data.R
##by Amy Goldlist, January 2018

## Usage:  Rscript src/clean_data.R 



## This script takes the raw data from DataBC, and cleans it up, making it into one nice dataframe for analysis
## This saves two versions:  the tidy one for plotting, the original to create a correlation, using years as features




library(tidyverse)


##read in data
male_data <- read_csv("data/bc-popular-boys-names.csv")
female_data <- read_csv("data/bc-popular-girls-names.csv")


##Add in a column to indicate sex, and gather data
female_data <- female_data %>% 
  #gather(key = "year", value = "n", 2:102) %>% 
  mutate(Sex = 0)


male_data <- male_data %>% 
  #gather(key = "year", value = "n", 2:102) %>% 
  mutate(Sex = 1)



## create one data.frame, with Sex as a factor
names <- bind_rows(female_data, male_data) %>% 
  mutate(Sex =as.factor(Sex)) %>% 
  select(-Total) %>% 
  select(Name, Sex, everything())

names

##write data to a new csv, for correlations
write_csv(names, "app_files/app_data/name_spread_data.csv")


##Gather the data for plotting, and clean data
name_g <- names %>% 
  gather(key="year", value = "n", 3:102) %>% 
  mutate(year = as.integer(year))


write_csv(name_g, "app_files/app_data/name_data.csv")
