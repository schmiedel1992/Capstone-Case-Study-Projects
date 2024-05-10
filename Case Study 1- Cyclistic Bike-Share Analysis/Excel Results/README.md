
<a class="libutton" href="https://www.linkedin.com/comm/mynetwork/discovery-see-all?usecase=PEOPLE_FOLLOWS&followMember=amanda-schmiedel" target="_blank">Follow
on LinkedIn</a>

# Prepare the Data from Dirty to Clean

*Google Sheets won't open files of these sizes. Excel is your only
option to open the data.*

-   Download the most recent consecutive annual data here (which will be
    12 files): <https://divvy-tripdata.s3.amazonaws.com/index.html>.
-   Unzip all 12 files 
-   Separate into files for raw XLSX and CSV data
-   **FIRST** we clean the individual CSV data files and add columns for ride length and day of week.
-   **THEN** we will save as CSV and XLSX with updated name, YYYYMM-tripdata.
-   **SECOND** combine all clean XLSX files into one workbook.
-   **THIRD** we have the raw and clean dataset in XLSX and CSV, and XLSX workbook with all trip data. Naming Cyclistic_tripdata.xlsx 
-   **FOURTH** perform calculations

*XLSX files can store more data and have a better compression algorithm,
saving you space.*

### *If* the sheets have any missing data, remove the entire row 
<details>
<summary>Cleaning the data</summary>

*This process is per situation, and normally stakeholders are involved
with the decision on what to do with empty cells.*

<ol>

<li>Open the first file. Select all fields (including column names) by
clicking and dragging over all columns or by clicking the utmost
upper-left from the field section of the sheet. Aka, above row 1 and to
the left of column A.</li>

<li>After selecting all fields, press F5 or hold down CTRL+G until a "Go
To" window pops up \> Select "Special" \> Click "Blanks" \> Hit OK. This
may take minutes to finish running.</li>

<li>Once finished, scroll down until you see a highlighted cell or chunk
of cells. Right-click when hovered over one and choose "Delete," then
choose "Entire row" (you may get a warning; hit OK). This will take
minutes, and your sheet may freeze; that's normal.</li>

<li>Unfortunately, you must do all of these steps on your current sheet
and following sheets as many times as it takes until your results land
you at the bottom of the sheet. The benefit of checking one too many
times is you get the last row number. This information is useful.</li>
</ol>
<ul>
<li>Normally you sort and filter each column depending on the data type
looking for anomalies or any number of error values</li>
<ul>
<li>Currency: currency types that are out of range.</li>
<li>Date: dates that are out of range.</li>
<li>Number: numbers that are out of range.</li>
<li>Percentage: percentages that are out of range.</li>
<li>Text: letters or word lengths that are out of range.</li>
<li>Time: times that are out of range.</li>
</ul>
</ul>

*This data is much cleaner than normal situations, but we will see one
instance where it may be applicable.*

</details>

<details>
<summary>Deleting columns</summary>

*This one is straight forward*

<ol>

<li>In your spreadsheet, select columns F, H, I, J, K, & L.</li>

<li>Right click \> select 'Delete' </li>

<li>Repeat these steps for all 12 sheets, and make sure to save your
work.</li>

</ol>

</details>

### Now the data is clean and consistent, it's time to add new columns by using formulas

<details>
<summary>Adding ride_length</summary>

*In truth, normally we would also touch base with the stakeholders to
ask about removing certain ride_length duration ranges because high and
low thresholds are anomalies, offer little insight, and skew most
results, outside of rare instances.*     

<ol>

<li>In your spreadsheet, create a column called "ride_length" in Column
H, row 1.</li>

<li>Calculate the length of each ride using the minus operator from
columns C (started_at) and D (ended_at) Enter "=D2-C2" in cell H2.</li>

<li>Your result will be a data type called "float". We need to change
that into the time format of HH:MM:SS.</li>

<li>Select H column \> right click \> A window pop up will appear select
"Format Cells" (again Excel may freeze).</li>

<li>While in the "Number" tab find "Category:" and change it to "Time"
\> Type: \> "37:30:55" \> hit OK.</li>


<li>Select H2 \> press CTRL+C \> use macros to autofill the column (web
search) or Select H2 \> press CTRL+C \> in H3, hold
CTRL+SHIFT+down-arrow key \> CTRL+V aka paste.</li>

<li>Now we need to scroll down and find the last data filled row + 1.
Select that cell then hold CTRL+SHIFT+down-arrow key again to delete the
invalid entries (Use PAGE UP & DOWN to move smoothly when close to the
bottom filled row).</li>

  
  ### Some months *might* have faulty "ride_length" data filled with \####### which SQL will not allow. As analyst doing our process step, let's filter "ride_length" for ####### or 00:00:00.

  ### Also, I suggest deleting all rows from "ride_length" with durations above 23:59:59. This is not a mandate, but depending on your SQL skill level, it may help.

<li> Select **ALL** columns and click on the "Data" tab at the top of the sheet > click Sort > Sort by ride_length > Order Largest to Smallest. Any cells in "ride_length" filled with #######, or above 23:59:59 need their whole row deleted (mind your header row). Then check from smallest to largest for any cells filled with #######, and 00:00:00. The reason the cells are messed up and filled with ####### is that the "start_at" and "end_at" column data is reading backwards. We don't have the authority to flip them, so our only means is to delete. </li>
   
   * *Excel is a mess when sorting. It doesn't have the ability to use a primary key to sort all of the fields based on one column. If you forget to sort by <strong>all</strong> columns, your data will be wrong. Also, filtering is limited to 10,000 unique items; with files of this size, filtering for what we need to accomplish is useless.*


<li>Now repeat these steps for all 12 sheets.</li>

</ol>

</details>

<details>


<summary>Adding day_of_week</summary>

<ol>

<li>In your spreadsheet, create a column called "day_of_week." in Column
I, row 1.</li>

<li>In I2, enter "=WEEKDAY(C2,1)", 1 = Sunday, and 7 = Saturday. Later,
if you prefer your column to have the actual weekday name, use
"=TEXT(C2, "dddd")" but only after switching to XLSX. The only catch is
=MODE() cannot use the TEXT data type. Workarounds include manually
writing in the day name in your pivot tables or flipping the column
formula when desired.</li>

<li>Select I2 \> press CTRL+C \> use macros to autofill the column (web
search) or Select I2 \> press CTRL+C \> in I3, hold
CTRL+SHIFT+down-arrow key \> CTRL + V aka paste.</li>

<li>Again we need to scroll down and find the last data filled row + 1.
Select that cell then hold CTRL+SHIFT+down-arrow key again to delete the
invalid entries (use PAGE UP and PAGE DOWN to move smoothly when close
to the bottom filled row).</li>

<li>Repeat these steps for all 12 sheets, and make sure to save your
work. We're done with the CSV files until SQL and R.</li>

</ol>

</details>

<details>

<summary>Combining all files into one sheet</summary>

**NOW** we are going to copy and convert all the files to
XLSX inside a new folder with XLSX in the title.

<ol>

<li>Open the first clean CSV file.</li>

<li>File \> Save As \> Browse \> Your XLSX folder location \> Save as
type: Excel Workbook. Do this for all 12.</li>

<li>We are going to merge the 11 other sheets into the first sheet by
creating new tabs at the bottom by using Power Query (Google search) or
simply copying and pasting each sheet with CTRL+A \> CTRL+C \> then
pasting into a new tab in the first sheet with CTRL+V. Your first sheet
will have 12 tabs when finished.</li>

<li>Do this for all 12. Be mindful to keep your sheet tab names
consistent if you're copying and pasting. They won't auto populate.</li>

</ol>

*Notice all your files sizes are smaller now and you now have a mega
file too*

</details>

# The Excel Process - Time to Analyze:

<details>

<summary>Run a few calculations</summary>

*Switch to the XLSX mega file now. Run a few calculations to get a better sense of the data layout.*    

<ol>

<li>Calculate the mean of ride_length: in cell K2, type =AVERAGE(H:H),
then format to time just like when we made column H "ride_length". Then
make a header in K1 so you remember what your result represents.</li>

<li>Calculate the max ride_length: in cell K5, enter =MAX(H:H), then
format to time again. Then make a header in K4 so you remember what your
result represents.</li>

<li>Calculate the mode for day_of_week: in cell K8 enter =MODE(I:I).
Then make a header in K7 so you remember what your result
represents.</li>

<li>Copy column K and paste in each sheet, take a look at the diffences by month and seasons</li>
 

</ol>

</details>

## Data Wrangling Change Log

* Date Range: 2024-04-26 to 2024-04-30

    April 26, 2024:
  
* Total Rows: 5,750,165
* I raised the following concern (about the data) with Lily Moreno(The director of marketing): 
86,980,785 cells with missing data.
* I was advised by Lily Moreno that we could ignore rows with ride length <=0, and any over 23:59:59.
* We could also ignore rows with  any missing data, deleting the **WHOLE** row. 
* Also delete columns with long, lat, and station ids.
* Cleaning reduced rows to 4,355,499

## Summary

Per stakeholder request: \* We downloaded, cleaned, sorted and converted
the CSV files with **NO** error values allowed \* We added new columns
by combining data using formulas

I hope you've found this Excel section guide helpful!

Be sure to check out my SQL and R sections and future case studies!

I am open to criticism. Please contact me via email or LinkedIn for any
corrections, improvements, or suggestions.

-   [LinkedIn](https://www.linkedin.com/in/amanda-schmiedel/)
-   [amanda\schmiedel@gmail.com](mailto:amanda.schmiedel@gmail.com)

**Thank you**
