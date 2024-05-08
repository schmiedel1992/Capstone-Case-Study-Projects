### Cyclistic_Exercise_Full_Year_Analysis ###

# This analysis is based on the Cyclistic case study 
# The purpose of this script is to consolidate downloaded data 
# into a single dataframe and then conduct simple analysis to help 
# answer the key question: “In what ways do members and casual riders use 
# Cyclistic bikes differently?”

# # # # # # # # # # # # # # # # # # # # # # # 
# Install required packages
# tidyverse for data import and wrangling
# # # # # # # # # # # # # # # # # # # # # # #   

library(tidyverse)  #helps wrangle data
#library(lubridate)  #helps wrangle date attributes
#library(ggplot2)  #helps visualize data
getwd() #displays your working directory
setwd("Your_File_Destination") #sets your working directory 
getwd() #check you set your directory correctly


#=====================
# STEP 1: COLLECT DATA
#=====================
# Upload Cyclistic datasets (csv files) here
db1 <- read_csv("202304-tripdata.csv")
db2 <- read_csv("202305-tripdata.csv")
db3 <- read_csv("202306-tripdata.csv")
db4 <- read_csv("202307-tripdata.csv")
db5 <- read_csv("202308-tripdata.csv")
db6 <- read_csv("202309-tripdata.csv")
db7 <- read_csv("202310-tripdata.csv")
db8 <- read_csv("202311-tripdata.csv")
db9 <- read_csv("202312-tripdata.csv")
db10 <- read_csv("202401-tripdata.csv")
db11 <- read_csv("202402-tripdata.csv")
db12 <- read_csv("202403-tripdata.csv")


#====================================================
# STEP 2: WRANGLE DATA AND COMBINE INTO A SINGLE FILE
#====================================================
# Compare column names each of the files
# While the names don't have to be in the same order, 
# they DO need to match perfectly before we can use a command to join them 
# into one file
colnames(db1)
colnames(db2)
colnames(db3)
colnames(db4)
colnames(db5)
colnames(db6)
colnames(db7)
colnames(db8)
colnames(db9)
colnames(db10)
colnames(db11)
colnames(db12)


# Inspect the dataframes and look for incongruencies
str(db1)
str(db2)
str(db3)
str(db4)
str(db5)
str(db6)
str(db7)
str(db8)
str(db9)
str(db10)
str(db11)
str(db12)


# Stack individual data frames into one big data frame
all_trips <- bind_rows(db1,db2,db3,db4,db5,db6,db7,db8,db9,db10,db11,db12)

# Making ride_length the col_type the instructions want.
all_trips$ride_length <- as.numeric(as.POSIXlt(all_trips$ride_length, format = "%H:%M:%S"))

#======================================================
# STEP 3: CLEAN UP AND ADD DATA TO PREPARE FOR ANALYSIS
#======================================================
# Inspect the new table that has been created
colnames(all_trips)  #List of column names
nrow(all_trips)  #How many rows are in data frame? 4355499
dim(all_trips)  #Dimensions of the data frame? 4355499 9
head(all_trips)  #See the first 6 rows of data frame.  Also tail(all_trips)
str(all_trips)  #See list of columns and data types (numeric, character, etc)
summary(all_trips)  #Statistical summary of data. Mainly for numerics


# There are a few problems we will need to fix:
# (1) The data can only be aggregated at the ride-level, which is too granular. We will want to add some additional columns of data -- such as day, month, year -- that provide additional opportunities to aggregate the data.
# (2) There are some rides where tripduration shows up as negative, including several hundred rides where Divvy took bikes out of circulation for Quality Control reasons. We will want to delete these rides.


# Add columns that list the date, month, day, and year of each ride
# This will allow us to aggregate ride data for each month, day, or year ... before completing these operations we could only aggregate at the ride level
# https://www.statmethods.net/input/dates.html more on date formats in R found at that link


all_trips$date <- as.Date(all_trips$started_at, format = "%m/%d/%Y %H:%M") 
all_trips$month <- format(as.Date(all_trips$date), "%m")
all_trips$day <- format(as.Date(all_trips$date), "%d")
all_trips$year <- format(as.Date(all_trips$date), "%Y")
all_trips$day_of_week <- format(as.Date(all_trips$date), "%A")


# Inspect the structure of the columns
str(all_trips)


# Remove "bad" data
# The dataframe includes a few hundred entries when bikes were taken out of docks and checked for quality by Divvy or ride_length was negative
# We will create a new version of the dataframe (v2) since data is being removed
# https://www.datasciencemadesimple.com/delete-or-drop-rows-in-r-with-conditions-2/
all_trips_v2 <- all_trips[!(all_trips$start_station_name == "HQ QR" | all_trips$ride_length<0),]



#=====================================
# STEP 4: CONDUCT DESCRIPTIVE ANALYSIS
#=====================================
# Descriptive analysis on ride_length (all figures in seconds)

mean(all_trips_v2$ride_length) #straight average (total ride length / rides) 967.4112

median(all_trips_v2$ride_length) #midpoint number in the ascending array of ride lengths 599

max(all_trips_v2$ride_length) #longest ride 86392

min(all_trips_v2$ride_length) #shortest ride 0


# You can condense the four lines above to one line using summary() on the specific attribute
summary(all_trips_v2$ride_length)

# Compare members and casual users
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = mean)
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = median)
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = max)
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = min)



# Notice that the days of the week are out of order. Let's fix that.
all_trips_v2$day_of_week <- ordered(all_trips_v2$day_of_week, 
                                    levels=c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))


# See the average ride time by each day for members vs casual users rounded up to leave easier to understand 
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual + all_trips_v2$day_of_week, FUN = function(x) round(mean(x), 2))


# we must format "started_at" to utilize further investigations
all_trips_v2 <- all_trips_v2 %>%
  mutate(started_at = as.POSIXct(started_at, format = "%m/%d/%Y %H:%M"))


# analyze ridership data by type and weekday
all_trips_v2 %>%
  mutate(weekday = wday(started_at, label = TRUE)) %>%
  group_by(member_casual, weekday) %>%
  summarise(
    number_of_rides = n(),
    average_duration = mean(ride_length)
  ) %>%
  arrange(member_casual, weekday)


# Let's visualize the number of rides by rider type
all_trips_v2 %>%
  mutate(weekday = wday(started_at, label = TRUE)) %>%
  group_by(member_casual, weekday) %>%
  summarise(
    number_of_rides = n(),
    average_duration = mean(ride_length)
  ) %>%
  arrange(member_casual, weekday) %>%
  ggplot(aes(x = weekday, y = number_of_rides, fill = member_casual)) +
  geom_col(position = "dodge") +
  scale_y_continuous(labels = scales::comma) +
  labs(title = "Total Annual Rides by Weekday")


# Let's create a visualization for average duration
all_trips_v2 %>%
  mutate(weekday = wday(started_at, label = TRUE)) %>%
  group_by(member_casual, weekday) %>%
  summarise(
    number_of_rides = n(),
    average_duration = mean(ride_length)
  ) %>%
  arrange(member_casual, weekday) %>%
  ggplot(aes(x = weekday, y = average_duration / 60, fill = member_casual)) +
  geom_col(position = "dodge") +
  scale_y_continuous(labels = scales::comma) +
  labs(title = "Average Annual Ride Duration by Weekday", y = "Average Duration (minutes)")


#=================================================
# STEP 5: EXPORT SUMMARY FILE FOR FURTHER ANALYSIS
#=================================================
# Create a csv file that we will visualize in Excel, Tableau, or my presentation software
# N.B.: This file location is for a Mac. If you are working on a PC, change the file location accordingly (most likely "C:\Users\YOUR_USERNAME\Desktop\...") to export the data. You can read more here: https://datatofish.com/export-dataframe-to-csv-in-r/

counts <- aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual + all_trips_v2$day_of_week, FUN = mean)

file_path <- "C:/Users/Amanda/OneDrive/Desktop/Capstone/Cyclistic/R/avg_ride_length.csv"

write.csv(counts, file = file_path, row.names = FALSE)

# You're done! Congratulations!