-- Top 5 ride lengths between casual and member types.
-- Members use the bikes more often but in a shorter duration.
-- Casuals use the bikes less.
-------------------------------------------------------------------------------------

ride_length	member_casual	totalRides
00:07:00	casual	9773
00:08:00	casual	9411
00:06:00	casual	9342
00:09:00	casual	9249
00:05:00	casual	8773

* Average casual ride duration for top 5 is: 7:00
* Total number members for top 5: 46,548
* 29.12% of all users in the top 5 are casual

ride_length	member_casual	totalRides
00:05:00	member	24364
00:04:00	member	23675
00:06:00	member	23385
00:07:00	member	21827
00:08:00	member	20115

* Average member ride duration for top 5 is: 6:00
* Total number members for top 5:  113,366
* 70.88% of all users in the top 5 are member
-----------------------------------------------------------------------------------
-- for casuals
SELECT TOP 5
  ride_length,
  member_casual,
  COUNT(*) AS totalRides
FROM (
	SELECT ride_length, 'casual' AS member_casual FROM [202304-tripdata] WHERE member_casual = 'casual'
    UNION ALL
    SELECT ride_length, 'casual' AS member_casual FROM [202305-tripdata] WHERE member_casual = 'casual'
    UNION ALL
    SELECT ride_length, 'casual' AS member_casual FROM [202306-tripdata] WHERE member_casual = 'casual'
    UNION ALL
    SELECT ride_length, 'casual' AS member_casual FROM [202307-tripdata] WHERE member_casual = 'casual'
    UNION ALL
    SELECT ride_length, 'casual' AS member_casual FROM [202308-tripdata] WHERE member_casual = 'casual'
    UNION ALL
    SELECT ride_length, 'casual' AS member_casual FROM [202309-tripdata] WHERE member_casual = 'casual'
    UNION ALL
    SELECT ride_length, 'casual' AS member_casual FROM [202310-tripdata] WHERE member_casual = 'casual'
    UNION ALL
    SELECT ride_length, 'casual' AS member_casual FROM [202311-tripdata] WHERE member_casual = 'casual'
    UNION ALL
    SELECT ride_length, 'casual' AS member_casual FROM [202312-tripdata] WHERE member_casual = 'casual'
    UNION ALL
    SELECT ride_length, 'casual' AS member_casual FROM [202401-tripdata] WHERE member_casual = 'casual'
    UNION ALL
    SELECT ride_length, 'casual' AS member_casual FROM [202402-tripdata] WHERE member_casual = 'casual'
    UNION ALL
    SELECT ride_length, 'casual' AS member_casual FROM [202403-tripdata] WHERE member_casual = 'casual'
) AS AnnualTable
GROUP BY ride_length, member_casual
ORDER BY totalRides DESC;
------------------------------------------------------------------------------------------------------
-- for members
SELECT TOP 5
  ride_length,
  member_casual,
  COUNT(*) AS totalRides
FROM (
	SELECT ride_length, 'member' AS member_casual FROM [202304-tripdata] WHERE member_casual = 'member'
    UNION ALL
    SELECT ride_length, 'member' AS member_casual FROM [202305-tripdata] WHERE member_casual = 'member'
    UNION ALL
    SELECT ride_length, 'member' AS member_casual FROM [202306-tripdata] WHERE member_casual = 'member'
    UNION ALL
    SELECT ride_length, 'member' AS member_casual FROM [202307-tripdata] WHERE member_casual = 'member'
    UNION ALL
    SELECT ride_length, 'member' AS member_casual FROM [202308-tripdata] WHERE member_casual = 'member'
    UNION ALL
    SELECT ride_length, 'member' AS member_casual FROM [202309-tripdata] WHERE member_casual = 'member'
    UNION ALL
    SELECT ride_length, 'member' AS member_casual FROM [202310-tripdata] WHERE member_casual = 'member'
    UNION ALL
    SELECT ride_length, 'member' AS member_casual FROM [202311-tripdata] WHERE member_casual = 'member'
    UNION ALL
    SELECT ride_length, 'member' AS member_casual FROM [202312-tripdata] WHERE member_casual = 'member'
    UNION ALL
    SELECT ride_length, 'member' AS member_casual FROM [202401-tripdata] WHERE member_casual = 'member'
    UNION ALL
    SELECT ride_length, 'member' AS member_casual FROM [202402-tripdata] WHERE member_casual = 'member'
    UNION ALL
    SELECT ride_length, 'member' AS member_casual FROM [202403-tripdata] WHERE member_casual = 'member'
) AS AnnualTable
GROUP BY ride_length, member_casual
ORDER BY totalRides DESC;