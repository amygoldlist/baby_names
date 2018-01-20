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
  mutate(Sex = 0)


male_data <- male_data %>% 
  mutate(Sex = 1)



## create one data.frame, with Sex as a factor
names <- bind_rows(female_data, male_data) %>% 
  mutate(Sex =as.factor(Sex)) %>% 
  select(-Total) %>% 
  select(Name, Sex, everything())





##create a distance matrix, this is pretty slow process
name_s <- names %>% 
  select(-Sex)

name_s


row.names(name_s) <- name_s$Name
name_s <- name_s %>% 
  select(-Name)

name_mat <- as.matrix(name_s)

name_mat_t <- t(name_mat)

##k_flex <- flexclust::kcca(name_mat_t, k = 100, control = list(initcent = "kmeanspp"))

name_dist <- dist(name_mat,diag = FALSE, upper = FALSE)

##I'm clustering the names...
name_cluster <- hclust(name_dist)

name_cluster

#k_flex <- flexclust::kcca(name_dist, k = 100, control = list(initcent = "kmeanspp"))

k_flex


#name_dist <- as.data.frame(as.matrix(name_dist))




##write data to a new csv, for correlations
#write_csv(name_dist, "app_files/app_data/name_sdistance.csv")
 

##Gather the data for plotting, and clean data
name_g <- names %>% 
  gather(key="year", value = "n", 3:102) %>% 
  mutate(year = as.integer(year))








write_csv(name_g, "app_files/app_data/name_data.csv")


