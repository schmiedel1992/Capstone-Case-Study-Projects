--Using GROUP BY to sort.
--Sort by days of the week. Saturday is the most popular day to rent a bike.  
--By member_casual. There are more member riders than casual on an annual basis. 
--By ride_length. 5:00 minutes is the most common rental duration annually.
--By rideable_type total per type. Classic bikes are the most popular product of the three.
--------------------------------------------------------------------------
--By day_of_week
SELECT day_of_week, COUNT(*) AS totalRides
FROM (
    SELECT day_of_week FROM [202304-tripdata]
    UNION ALL
    SELECT day_of_week FROM [202305-tripdata]
    UNION ALL
    SELECT day_of_week FROM [202306-tripdata]
    UNION ALL
    SELECT day_of_week FROM [202307-tripdata]
    UNION ALL
    SELECT day_of_week FROM [202308-tripdata]
    UNION ALL
    SELECT day_of_week FROM [202309-tripdata]
    UNION ALL
    SELECT day_of_week FROM [202310-tripdata]
    UNION ALL
    SELECT day_of_week FROM [202311-tripdata]
    UNION ALL
    SELECT day_of_week FROM [202312-tripdata]
    UNION ALL
    SELECT day_of_week FROM [202401-tripdata]
    UNION ALL
    SELECT day_of_week FROM [202402-tripdata]
    UNION ALL
    SELECT day_of_week FROM [202403-tripdata]
) AS AnnualTable
GROUP BY day_of_week;

day_of_week	totalRides
Sunday	561994
Monday	568567
Tuesday	624302
Wednesday	636414
Thursday	663167
Friday	628805
Saturday	672250
--------------------------------------------------------- 
--By member_casual
SELECT member_casual, COUNT(*) AS totalRides
FROM (
    SELECT member_casual FROM [202304-tripdata]
    UNION ALL
    SELECT member_casual FROM [202305-tripdata]
    UNION ALL
    SELECT member_casual FROM [202306-tripdata]
    UNION ALL
    SELECT member_casual FROM [202307-tripdata]
    UNION ALL
    SELECT member_casual FROM [202308-tripdata]
    UNION ALL
    SELECT member_casual FROM [202309-tripdata]
    UNION ALL
    SELECT member_casual FROM [202310-tripdata]
    UNION ALL
    SELECT member_casual FROM [202311-tripdata]
    UNION ALL
    SELECT member_casual FROM [202312-tripdata]
    UNION ALL
    SELECT member_casual FROM [202401-tripdata]
    UNION ALL
    SELECT member_casual FROM [202402-tripdata]
    UNION ALL
    SELECT member_casual FROM [202403-tripdata]
) AS AnnualTable
GROUP BY  member_casual;

member_casual	totalRides
casual	1539121
member	2816378
----------------------------------------------
--By ride_length
 
SELECT ride_length, COUNT(*) AS totalRides
FROM (
    SELECT ride_length FROM [202304-tripdata]
    UNION ALL
    SELECT ride_length FROM [202305-tripdata]
    UNION ALL
    SELECT ride_length FROM [202306-tripdata]
    UNION ALL
    SELECT ride_length FROM [202307-tripdata]
    UNION ALL
    SELECT ride_length FROM [202308-tripdata]
    UNION ALL
    SELECT ride_length FROM [202309-tripdata]
    UNION ALL
    SELECT ride_length FROM [202310-tripdata]
    UNION ALL
    SELECT ride_length FROM [202311-tripdata]
    UNION ALL
    SELECT ride_length FROM [202312-tripdata]
    UNION ALL
    SELECT ride_length FROM [202401-tripdata]
    UNION ALL
    SELECT ride_length FROM [202402-tripdata]
    UNION ALL
    SELECT ride_length FROM [202403-tripdata]
) AS AnnualTable
GROUP BY  ride_length
ORDER BY totalRides DESC;

--Showing top 5 results
ride_length   totalRides
00:05:00	33137
00:06:00	32727
00:07:00	31600
00:04:00	31240
00:08:00	29526
--------------------------------------------------------
--By rideable_type total per type
  
SELECT rideable_type, COUNT(*) AS totalRides
FROM (
    SELECT rideable_type FROM [202304-tripdata]
    UNION ALL
    SELECT rideable_type FROM [202305-tripdata]
    UNION ALL
    SELECT rideable_type FROM [202306-tripdata]
    UNION ALL
    SELECT rideable_type FROM [202307-tripdata]
    UNION ALL
    SELECT rideable_type FROM [202308-tripdata]
    UNION ALL
    SELECT rideable_type FROM [202309-tripdata]
    UNION ALL
    SELECT rideable_type FROM [202310-tripdata]
    UNION ALL
    SELECT rideable_type FROM [202311-tripdata]
    UNION ALL
    SELECT rideable_type FROM [202312-tripdata]
    UNION ALL
    SELECT rideable_type FROM [202401-tripdata]
    UNION ALL
    SELECT rideable_type FROM [202402-tripdata]
    UNION ALL
    SELECT rideable_type FROM [202403-tripdata]
) AS AnnualTable
GROUP BY  rideable_type;

rideable_type	totalRides
classic_bike	2765416
docked_bike	69360
electric_bike	1520723