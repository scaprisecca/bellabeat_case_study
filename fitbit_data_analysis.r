library(tidyverse)
library(dplyr)
library(ggplot2)
library(janitor)
library(lubridate)
library(readr)
library(msgr)

# Load the data

activity_df <- read_csv("~/Documents/my_docs/bellabeat_case_study/fitbit_data_original/dailyActivity_merged.csv")
hr_df <- read_csv("~/Documents/my_docs/bellabeat_case_study/fitbit_data_original/heartrate_seconds_merged.csv")
sleep_df <- read_csv("~/Documents/my_docs/bellabeat_case_study/fitbit_data_original/sleepDay_merged.csv")
weightlog_df <- read_csv("~/Documents/my_docs/bellabeat_case_study/fitbit_data_original/weightLogInfo_merged.csv")

# Checking on data types of each dataset

glimpse(activity_df)
glimpse(hr_df)
glimpse(sleep_df)
glimpse(weightlog_df)

#Convert date/time from string to date object and reorder columns

# hr_df2 <- hr_df %>% 
#  mutate(Time = dmy_hms(Time)) %>% 
#  separate(Time, into = c('Date', 'Time'), sep = ' ')


hr_df$Time <- parse_date_time(hr_df$Time, orders = "%m/%d/%Y %I:%M:%S %p")
hr_df$Date <- format(as.Date(hr_df$Time, format = "%m/%d/%Y"), "%m/%d/%Y")
hr_df$Time <- format(as.POSIXct(hr_df$Time, format = "%m/%d/%Y %I:%M:%S %p"), "%I:%M:%S %p")
hr_df <- hr_df %>% 
  select(Id, Date, Time, Value)

sleep_df$SleepDay <- parse_date_time(sleep_df$SleepDay, orders = "%m/%d/%Y %I:%M:%S %p")
sleep_df$Date <- format(as.Date(sleep_df$SleepDay, format = "%m/%d/%Y"), "%m/%d/%Y")
sleep_df <- sleep_df %>% 
  select(Id, Date, TotalSleepRecords, TotalMinutesAsleep, TotalTimeInBed)

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



