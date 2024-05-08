--Distribution of casual vs member user types
--Ride date range 04-2023 to 03-2024
--Casual riders = 35.34%
--Member riders = 64.66%
-----------------------------------------------

SELECT 
  member_casual,
  COUNT(*) AS totalRides,
  COUNT(*) * 100.0 / SUM(COUNT(*)) OVER () AS percentage
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

member_casual	totalRides	percentage
casual	1539121	35.337420580282
member	2816378	64.662579419717