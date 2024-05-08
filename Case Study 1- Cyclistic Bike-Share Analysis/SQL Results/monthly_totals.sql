--This has all queries for monthly totals.
--For all user types
-- May to October contain the majority of rides annually
-- November to April are the low points
-----------------------------------------------------------
--For Casual riders
-- April to October contain the majority of rides annually
-- November to March are the low points
-- July is the most popular month
-- January is the least popular month
------------------------------------------------------------
-- For members
-- April to November contain the majority of rides annually
-- December to March are the low points
-- August is the most popular month
-- January is the least popular month
----------------------------------------------
--All User Types

year_month	total_rides
Apr 2023	324163
May 2023	457013
Jun 2023	534710
Jul 2023	573923
Aug 2023	584839
Sept 2023	506616
Oct 2023	403693
Nov 2023	274713
Dec 2023	167115
Jan 2024	113775
Feb 2024	184709
Mar 2024	230230


SELECT 'Apr 2023' AS year_month, COUNT(*) AS total_rides
FROM [202304-tripdata];
SELECT 'May 2023' AS year_month, COUNT(*) AS total_rides
FROM [202305-tripdata]
UNION ALL
SELECT 'Jun 2023' AS year_month, COUNT(*) AS total_rides
FROM [202306-tripdata]
UNION ALL
SELECT 'Jul 2023' AS year_month, COUNT(*) AS total_rides
FROM [202307-tripdata]
UNION ALL
SELECT 'Aug 2023' AS year_month, COUNT(*) AS total_rides
FROM [202308-tripdata]
UNION ALL
SELECT 'Sept 2023' AS year_month, COUNT(*) AS total_rides
FROM [202309-tripdata]
UNION ALL
SELECT 'Oct 2023' AS year_month, COUNT(*) AS total_rides
FROM [202310-tripdata]
UNION ALL
SELECT 'Nov 2023' AS year_month, COUNT(*) AS total_rides
FROM [202311-tripdata]
UNION ALL
SELECT 'Dec 2023' AS year_month, COUNT(*) AS total_rides
FROM [202312-tripdata]
UNION ALL
SELECT 'Jan 2024' AS year_month, COUNT(*) AS total_rides
FROM [202401-tripdata]
UNION ALL
SELECT 'Feb 2024' AS year_month, COUNT(*) AS total_rides
FROM [202402-tripdata]
UNION ALL
SELECT 'Mar 2024' AS year_month, COUNT(*) AS total_rides
FROM [202403-tripdata];

-----------------------------------------------------------
--For Casual riders

year_month	total_rides
Apr 2023	110516
May 2023	175074
Jun 2023	219770
Jul 2023	245303
Aug 2023	233844
Sept 2023	196948
Oct 2023	130263
Nov 2023	72055
Dec 2023	36682
Jan 2024	17709
Feb 2024	38162
Mar 2024	62795

SELECT 'Apr 2023' AS year_month, COUNT(*) AS total_rides
FROM [202304-tripdata] 
WHERE member_casual = 'casual'
UNION ALL
SELECT 'May 2023' AS year_month, COUNT(*) AS total_rides
FROM [202305-tripdata] 
WHERE member_casual = 'casual'
UNION ALL
SELECT 'Jun 2023' AS year_month, COUNT(*) AS total_rides
FROM [202306-tripdata] 
WHERE member_casual = 'casual'
UNION ALL
SELECT 'Jul 2023' AS year_month, COUNT(*) AS total_rides
FROM [202307-tripdata] 
WHERE member_casual = 'casual'
UNION ALL
SELECT 'Aug 2023' AS year_month, COUNT(*) AS total_rides
FROM [202308-tripdata] 
WHERE member_casual = 'casual'
UNION ALL
SELECT 'Sept 2023' AS year_month, COUNT(*) AS total_rides
FROM [202309-tripdata] 
WHERE member_casual = 'casual'
UNION ALL
SELECT 'Oct 2023' AS year_month, COUNT(*) AS total_rides
FROM [202310-tripdata] 
WHERE member_casual = 'casual'
UNION ALL
SELECT 'Nov 2023' AS year_month, COUNT(*) AS total_rides
FROM [202311-tripdata] 
WHERE member_casual = 'casual'
UNION ALL
SELECT 'Dec 2023' AS year_month, COUNT(*) AS total_rides
FROM [202312-tripdata] 
WHERE member_casual = 'casual'
UNION ALL
SELECT 'Jan 2024' AS year_month, COUNT(*) AS total_rides
FROM [202401-tripdata] 
WHERE member_casual = 'casual'
UNION ALL
SELECT 'Feb 2024' AS year_month, COUNT(*) AS total_rides
FROM [202402-tripdata] 
WHERE member_casual = 'casual'
UNION ALL
SELECT 'Mar 2024' AS year_month, COUNT(*) AS total_rides
FROM [202403-tripdata] 
WHERE member_casual = 'casual';
----------------------------------------------
-- For members

year_month	total_rides
Apr 2023	213647
May 2023	281939
Jun 2023	314940
Jul 2023	328620
Aug 2023	350995
Sept 2023	309668
Oct 2023	273430
Nov 2023	202658
Dec 2023	130433
Jan 2024	96066
Feb 2024	146547
Mar 2024	167435

SELECT 'Apr 2023' AS year_month, COUNT(*) AS total_rides
FROM [202304-tripdata] 
WHERE member_casual = 'member'
UNION ALL
SELECT 'May 2023' AS year_month, COUNT(*) AS total_rides
FROM [202305-tripdata] 
WHERE member_casual = 'member'
UNION ALL
SELECT 'Jun 2023' AS year_month, COUNT(*) AS total_rides
FROM [202306-tripdata] 
WHERE member_casual = 'member'
UNION ALL
SELECT 'Jul 2023' AS year_month, COUNT(*) AS total_rides
FROM [202307-tripdata] 
WHERE member_casual = 'member'
UNION ALL
SELECT 'Aug 2023' AS year_month, COUNT(*) AS total_rides
FROM [202308-tripdata] 
WHERE member_casual = 'member'
UNION ALL
SELECT 'Sept 2023' AS year_month, COUNT(*) AS total_rides
FROM [202309-tripdata] 
WHERE member_casual = 'member'
UNION ALL
SELECT 'Oct 2023' AS year_month, COUNT(*) AS total_rides
FROM [202310-tripdata] 
WHERE member_casual = 'member'
UNION ALL
SELECT 'Nov 2023' AS year_month, COUNT(*) AS total_rides
FROM [202311-tripdata] 
WHERE member_casual = 'member'
UNION ALL
SELECT 'Dec 2023' AS year_month, COUNT(*) AS total_rides
FROM [202312-tripdata] 
WHERE member_casual = 'member'
UNION ALL
SELECT 'Jan 2024' AS year_month, COUNT(*) AS total_rides
FROM [202401-tripdata] 
WHERE member_casual = 'member'
UNION ALL
SELECT 'Feb 2024' AS year_month, COUNT(*) AS total_rides
FROM [202402-tripdata] 
WHERE member_casual = 'member'
UNION ALL
SELECT 'Mar 2024' AS year_month, COUNT(*) AS total_rides
FROM [202403-tripdata] 
WHERE member_casual = 'member';