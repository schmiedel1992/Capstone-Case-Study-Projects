# R Studio                                                
* This option has instructions, which is what we will be covering; parts of the instructions are dated, while other parts are outright wrong and not based on how the "Process" steps for the CSV files. I still suggest you see if it works for you and/or use it as a template; it is helpful in that way. However, the instructions set me up for confusion.
* In truth, it may be possible to finish this just by using R. However, I use the IDE RStudio and suggest you do the same.
* Here are the instructions: [R Script](https://docs.google.com/document/d/1TTj5KNKf4BWvEORGm10oNbpwTRk1hamsWJGj6qRWpuI/edit). You don't need them, but it doesn't hurt to try them solo or follow along with them as well.  

## Installation
<details>
  <summary> **Details** </summary>
  
### Click here  [R](https://cloud.r-project.org/bin/windows/base/R-4.3.0-win.exe)

* I created an auto-download link because I find the CRAN website confusing. 
* Keep in mind that R does not auto-update. Also, those old versions stay on your hard drive.
* Run through the setup, keeping all the default settings.

### Click here  [R Studio](https://download1.rstudio.org/electron/windows/RStudio-2023.06.0-421.exe)
* I created an auto-download link because, why not.
* Keep in mind that RStudio does not auto-update, nor do the libraries, but it will prompt you when updates are available. 
* Run through the setup, keeping all the default settings.
  
### Make sure you create a directory for your project
  * The far top-right has a tab just below the RStudio "Close tab." Click it > New Project > New Directory > New Project >  Name your directory and its location > Create Project.
  
<details>
  <summary>**Settings**</summary> 
  
  * To change RStudio to nightmode: Tools > Global Options > Appearance > Editor theme > "Tomorrow Night" is my current selection.
  * I prefer this pane layout. I ask that you consider it yourself. To change it: View > Panes > Pane Layout. However, it is all preference: 
  
![RStudio](RStudio.PNG)
  
</details>

</details>

## Uploading 

<details>
    <summary>**Details**</summary>
 *Note: The point of this set of instructions is to answer "In what ways do members and casual riders use Cyclistic bikes differently?". * We can use R to answer other questions as well.
  
* In my opinion, to save on typing, you should copy the instructions listed at the top of this page into a new R script or copy [mine](https://github.com/schmiedel1992/Capstone-Case-Study-Projects/blob/main/Case%20Study%201-%20Cyclistic%20Bike-Share%20Analysis/R%20Results/cyclistic_script.R), which is what I did.
* File tab > New File > R Script. Copy the instructions and paste them into your new script, then: File tab > Save As > cyclistic_script.r *(or whatever file name you like).* 
  
<details>
  <summary>**Instructions**</summary>
  
<ol>
<li> We potentially need to install tidyverse. * It's likely you already have it installed if you took the Coursera Google Data Analytics course and followed their instructions word for word. You installed tidyverse like 15 times. * </li>
<details>
  <summary>**Install and load packages**</summary>

* We do not need "lubridate" and "ggplot2" installed because "tidyverse" already comes with them. *
```{r}
install.packages("tidyverse")
library(tidyverse)
```

</details>
  

<li>Now we check and set the directory.</li>
  
  <details>
    <summary>**Check and set directory**</summary>
```{r}
# displays your working directory
getwd() 

# sets your working directory 
setwd("Your Directory location") 

# check you set your directory correctly
getwd()
```

    
 </details>
  
<li> It's time to upload the CSV files we cleaned earlier. </li>
    <details>
    <summary>**CSV files**</summary>
      *Simple file names mean less typing*
      
```{r}
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
```

*Check your "Environment" tab to see that all 12 files are loaded in R Studio*

</details>
  
<li> Check once again that all 12 column names are consistent. </li>
  <details>
    <summary>**Checking column names**</summary>
    
```{r}
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
```
  
</details>
  
<li> There is no need to rename columns or use mutate() on "ride_id" or "rideable_type" if you're using data after 2020. </li>
    <details>
 <summary>**Double checking column names**</summary>
  *Simply check the structure of each file*
  
```{r}
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
```
  


*Notice all column names are already correct, and both columns listed directly above are already labeled as "col_character()"*
</ol>
  
</details>
</details>
  
## Cleaning & Combining

  <details>
    <summary>**Details**</summary>
<ol>
 <li>Making one large data frame.</li> 
 <details>
 <summary>**Combining**</summary>
```{r}
all_trips <- bind_rows(db1,db2,db3,db4,db5,db6,db7,db8,db9,db10,db11,db12) 
```

</details>
  
</details>

<li> Changing "ride_length" to cooperate with us. </li> 
<details>
  <summary>**Changing "ride_length"**</summary>
<details>
```{r}
all_trips$ride_length <- as.numeric(as.POSIXlt(all_trips$ride_length, format = "%H:%M:%S"))
```

</details> 
</details>  
  
<li> Inspecting the new table we've created. </li>  
<details>
  <summary>**Inspection syntax**</summary>
  *This is all important information about our data frame.*
```{r}
colnames(all_trips)# List of column names
nrow(all_trips)# How many rows are in data frame?
dim(all_trips)# Dimensions of the data frame?
head(all_trips)# See the first 6 rows of data frame.
str(all_trips)# See list of columns and data types (numeric, character, etc)
summary(all_trips)# Statistical summary of data. Mainly for numerics
```
  
</details>  
  
<li> There is no need to use mutate() on "member_casual" which only applies to data from 2020 and older. </li>   
<details>
  <summary>**Checking column "member_casual"**</summary>
    *Run this code to prove to yourself that you're in the clear*
```{r}
distinct_values <- unique(all_trips$member_casual)

print(distinct_values)
```

*Notice your results are only "casual" and "member"*                    
</details>  

<li> Adding a "date" column.</li>     
<details>
  <summary>**Adding date**</summary>
  <details>
```{r}
all_trips$date <- as.Date(all_trips$started_at, format = "%m/%d/%Y %H:%M")
```

</details>
 </details>

<li> Adding columns: month, day, and year of each ride. Plus, altering the day_of_week column. </em>       
<details>
 <summary>**Adding columns**</summary>
```{r}
all_trips$month <- format(as.Date(all_trips$date), "%m")
all_trips$day <- format(as.Date(all_trips$date), "%d")
all_trips$year <- format(as.Date(all_trips$date), "%Y")
all_trips$day_of_week <- format(as.Date(all_trips$date), "%A")
```

</details>

<li> Removing bad data.</li> 
<details>
  <summary>**Removing negative numbers**</summary>
   *We already took care of this in our Excel work.*
```{r}
all_trips_v2 <- all_trips[!(all_trips$start_station_name == "HQ QR" | all_trips$ride_length<0),]
```

</details>

</ol>
 
</details>
      
## Analysis

<details>
<summary>**"ride_length" Summaries:**</summary>
*Time for descriptive analysis on ride_length (all figures in seconds)*
```{r}
mean(all_trips_v2$ride_length)
median(all_trips_v2$ride_length)
max(all_trips_v2$ride_length)
min(all_trips_v2$ride_length)
summary(all_trips_v2$ride_length)
```

</details>

<details>
<summary>**Rider Type Summaries:**</summary>
*Compare members and casual users*
```{r}
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = mean)
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = median)
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = max)
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = min)
```
  
</details>

<details>
<summary>**Average Ride Time by Day by User Type:**</summary>
*First, we should put the days of the week in order.*
```{r}
all_trips_v2$day_of_week <- ordered(all_trips_v2$day_of_week, levels=c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))
```


*I also rounded it up for visual appeal.*

```{r}
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual + all_trips_v2$day_of_week, FUN = function(x) round(mean(x), 2))
```
`

</details>

<details>
<summary>**Rider Data by Type and Weekday:**</summary>
*Another place where we must __first__ format to utilize further investigations*
```{r}
all_trips_v2 <- all_trips_v2 %>% mutate(started_at = as.POSIXct(started_at, format = "%m/%d/%Y %H:%M"))
```
`

*This is the actual code:*
```{r}
all_trips_v2 %>%
  mutate(weekday = wday(started_at, label = TRUE)) %>%
  group_by(member_casual, weekday) %>%
  summarise(
    number_of_rides = n(),
    average_duration = mean(ride_length)
  ) %>%
  arrange(member_casual, weekday)
```

</details>


<details>
<summary>**Total Annual Rides by Weekday, per Rider Type:**</summary>
*The first visual product the instructions seek to produce is this code. I pasted my results in the exporting section.*

```{r}
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
```

</details>


<details>
<summary>**Average Annual Ride Duration by Weekday per Rider Type:**</summary>
*The second visual product the instructions seek to produce is this code. I pasted my results in the exporting section.*
```{r}
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
```

</details>


## Exporting

<details>
<summary>**How to export:**</summary> 

<ol>
<li>**You need to choose your file format:**</li>

Exporting data examples:

```  
"write.csv()", "write.json()", "write.xlsx()," and so on
```

Exporting plot examples:

```  
"jpeg()" "pdf()", ".png()," and so on
```
  
<li>**You need to choose the data you're exporting:**</li>

This is what you're picking to export

```
write.csv(all_trips)
```

This is what you're picking to export

```
write.csv(all_trips$ride_length) 
```

<li>**You need to choose your file path:**</li>
*Inside your export function, use the parameter syntax: file = "your destination" *

This will save to your current R directory

```
write.csv(all_trips, file = "all_trips.csv", row.names = FALSE)
```

This will save your file inside D > Merit
```
write.csv(all_trips, file = "D:/Merit/all_trips.csv", row.names = FALSE) 
```

</details>

</ol>


*At times, this involves first using data.frame(), but you can export whatever you want* for example: 

<details>
<summary>**Combining**</summary>
  
* When you combine your 12 sheets into one data frame
* If you make a custom data frame for detailed specifics
* The list is endless! Think of the over 30 queues we made in SQL. All of those can be done in R, plus more!

</details>

<details>
<summary>**Analysis**</summary>
  
* "ride_length" summaries
* Rider-type summaries
* Average Ride Time by Day by User Type
* Rider Data by Type and Weekday
  
</details>

<details>
<summary>**What the Default Instructions Have You Export:**</summary>
  
*counts is just the variable name for the data to export*
```{r}
counts <- aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual + all_trips_v2$day_of_week, FUN = mean)
```

*file_path is just the variable name for the file destination*
```{r}
file_path <- "C:/Users/Amanda/OneDrive/Desktop/Capstone/Cyclistic/R/avg_ride_length.csv"
```

*Bringing it all together with file type*
```{r}
write.csv(counts, file = file_path, row.names = FALSE)
```

</details>

<details>
<summary>**The Final Product: Visualizations**</summary>
  *These two images are the results the R instructions are seeking*
  
* Total Annual Rides by Weekday per Rider Type:
![Total Annual Rides by Weekday]("C:\Users\Amanda\OneDrive\Desktop\Capstone\Cyclistic\R\Total Annual Rides by Weekday.png")

* Average Annual Ride Duration by Weekday per Rider Type:
![Average Annual Ride Duration by Weekday]("C:\Users\Amanda\OneDrive\Desktop\Capstone\Cyclistic\R\Average Annual Ride Duration by Weekday.png")



*The R instructions have you export a CSV file. This is that file charted in Excel then converted into minutes * 

* R Export Summary File Results in Excel
![avg_ride_length.csv]("C:\Users\Amanda\OneDrive\Desktop\Capstone\Cyclistic\R\avg_ride_length.csv")
 
* However, you can do any number of visualizations with R!

</details>


## R Markdown - Bringing it all together

<details>
<summary>**R Markdown file**</summary>
*I used an Rmd file as an opportunity to answer the questions from the case study and show my R syntax.*

* R Markdown is a Markdown file exclusively for R. Markdown files are a lightweight markup language akin to HTML. HTML is very simple and similar to something we covered in SQL. Neither is a programming language. SQL is a query language. HTML is a markup language and the foundation of all websites.

* This is the site I used: [Markdown Guide](https://www.markdownguide.org)

* This is the site I used to create the Rmd sections: [R Markdown Guide](https://rmarkdown.rstudio.com/lesson-15.html)

* My Rmd file: []()

* Although Rmd files take time to create, they are worth the effort, and if desired, different formats can be applied, creating distinct fonts and layouts. 

</details>  


# Summary
Per stakeholder request: 
* We imported the previously cleaned CSV files into R.
* We made the columns consistent, then merged them into a single data frame.
* We cleaned up "ride_length" discrepancies and added new columns: date, year, month, and day. 
* We answered the questions the instructions set out to answer in graphical form.
* Finally, we learned how to export summary files for further analysis.

I hope you've found this R-section guide helpful! There is lots more that R can do, but this covers just the case study 1 PDF instructions.

Be sure to check out my Excel and SQL sections and future case studies!

I am open to criticism. Please contact me via email or LinkedIn for any corrections, improvements, or suggestions.


-   [LinkedIn](https://www.linkedin.com/in/amanda-schmiedel/)
-   [amanda\schmiedel@gmail.com](mailto:amanda.schmiedel@gmail.com){.email}

**Thank you**
