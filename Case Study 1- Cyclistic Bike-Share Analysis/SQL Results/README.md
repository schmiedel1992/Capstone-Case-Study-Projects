# SQL - Installation and Importing:                                      
*These instructions are for the Windows OS and are only intended to be applied after the data is cleaned in Excel. Follow the Excel guide until the formulas section, then use all 12 cleaned CSV files in SQL*

**Note:** Only Tableau Desktop can utilize .sql files to create charts.

<details>
<summary> Installing the program </summary>
<ol>
<li> Download and install SSMS 20.1; it will be your SQL program: https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver16#download-ssms </li>
<li> You still need a server. Download and install the "Express" server for SQL: https://www.microsoft.com/en-us/sql-server/sql-server-downloads </li>
<li> Launch SQL Server Management Studio 20 </li>
<li> Make sure: </li> 
<ul>
<li>Server type: Database Engine</li>
<li>Server name: should be set to your PC name \SQLEXPRESS</li>
<li>Authentication: Windows Authentication</li>

 * To fix the common server error go to "Options" > "Connection Properties," check the "Trust server certificate" box, and then click "Connect" at the bottom.
</ul>
</ol>
 
  *Now you're up and running, awesome job!*
  
</details>  

<details>
<summary> Database time </summary> 
 
 **We are logged into SSMS already**
 
<ol>
 <li> To your left is the "Object Explorer; this is our nexus.</li>
 <li> Right-click on the "Databases" folder and create a "New Database." Name it "SQL Case Study 1." Click OK.</li>
 <li> Now right-click your new database > Tasks > Import Flat File </li>
 <li> A pop up window appears; click Next. Browse your hard drive for the CSV files folder we made earlier.</li>
 <li> A preview appears; do a quick check that all the column names are as intended. Then click Next.</li>
 <li> Here is where you can assign any columns to be primary keys, which prevents duplicate data, enhances queries, and benefits your ability to establish relationships. All that serves no purpose for this situation. </li>
 <li> Here is also where you can "Allow nulls" essentially saying get this column in the database at any cost of integrity. <em>A selection we want to use sparingly as good practice </em>. </li>
 <li>SQL automatically generates its best guess as to what the data type is for each column and is likely going to interpret "ride_length" as multiple different data types because some sheets have longer than 24-hour durations, which complicates things (<em>and is also why normally we'd ask to remove them in a real data analysis stakeholder situation</em>). Our job is to make sure the data type is consistent throughout all 12 files. These are the three you may see and why SQL chose them:
 <ul>
    <li>**datetime:** This will auto-populate by SQL when data exceeds 25-39 hours. A fair alternative to the "time" data type with moderately small SQL syntax alterations.</li>
  <li>**nvarchar(50):** This will auto-populate when durations are over 40 hours. The syntax needed to coerce this data type  <em>is</em> workable but verbose, if you like a challenge "this is the way". </li>
  <li>**time:** This will auto-populate by SQL when the data **does not** exceed 25 hours and what I **suggest** you change all 12 to. This also means altering your Excel sheets again using "Sort" to remove entries above 25 hours if you did not do so in the Excel guide already.</li>
  
  ### **Make sure you follow step 8; we need consistency**
  
</ul>
</li>
<li> Our new tables are stored inside the "Tables" folder, which is inside our "SQL Case Study 1" database. </li>
 </ol>
 
 ## Troubleshooting time:
 <ol>
 <li> Ironically, columns "start_station_name" and "end_station_name *may* have too many characters for proper processing. If you have that situation. We have two options:</li>
 <ol>
  <li>Edit the CSV files to fit the nvarchar length requirements, which would take ages due to the size of the CSVs.</li>
<li> Change their data types to nvarchar(100), allowing up to 100 characters, or nvarchar(MAX), allowing for what is basically infinite.</li>
 </ol>

 <li>Now time to load all the other sheets</li> 
</ol>
 
*We managed to load LARGE CSV files into SQL without allowing NULLs. Any employer would be proud of our efforts!*
</details>  


# The SQL Process - Query Time:

* Once all 12 CSV files are loaded into your database, refresh your "Object Explorer" by pressing F5 or clicking the reset button in the tab at the top.
* Now it's time to queue. Press CTRL+N or click "New Query" just below the "Tools" tab at the top of the application. 
* One important note: Since we're dealing with .CSV files that start with a number, we need to always use [] square brackets around our file names, i.e., [202304-tripdata].
* Skim around above for SQL syntax that is applicable to the case study.
* The sytnax along with the results are all listed in every .sql file. Take a look and try them out, or make your own!


# Summary
Per stakeholder request: 
* We imported the previously cleaned CSV files **without allowing NULLs** by changing data types in SQL .
* We utilized deep SQL queries using CASE, CREATE, DISTINCT, JOIN, SUBQUERY, UNION, and so on while showing our work.
* We answered every possible question using data-driven decision-making and created files that are ripe for exporting to be used in summary visualizations. 

I hope you've found this SQL section guide helpful!

Be sure to check out my Excel and R sections and future case studies!

I am open to criticism. Please contact me via email or LinkedIn for any
corrections, improvements, or suggestions.

-   [LinkedIn](https://www.linkedin.com/in/amanda-schmiedel/)
-   [amanda.schmiedel@gmail.com](mailto:amanda.schmiedel@gmail.com)

**Thank you**
