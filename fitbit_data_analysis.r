library(tidyverse)
library(dplyr)
library(ggplot2)
library(janitor)
library(lubridate)
library(readr)
library(msgr)

# Load the data

activity_df <- read_csv("dailyActivity_merged.csv")
hr_df <- read_csv("heartrate_seconds_merged.csv")
sleep_df <- read_csv("sleepDay_merged.csv")
weightlog_df <- read_csv("weightLogInfo_merged.csv")

# Checking on data types of each dataset

glimpse(activity_df)
glimpse(hr_df)
glimpse(sleep_df)
glimpse(weightlog_df)

#Convert date from string to date object

# hr_df2 <- hr_df %>% 
#  mutate(Time = dmy_hms(Time)) %>% 
#  separate(Time, into = c('Date', 'Time'), sep = ' ')

# 

# Checking for the number of users in each dataset

n_distinct(activity_df$Id)
n_distinct(hr_df$Id)
n_distinct(sleep_df$Id)
n_distinct(weightlog_df$Id)

rm(weightlog_df)

# Checking for duplicates
sum(duplicated(activity_df))
sum(duplicated(hr_df))
sum(duplicated(sleep_df))



