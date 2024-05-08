--Most popular bikes amoung casual and member types.
--Classic bike is most popular = 66.21% for member and 58.51% for casual
-- I manually checked the sheets myself there are 0 instances of a member using a docked bike.

SELECT  
  rideable_type,
  member_casual,
  COUNT(*) AS totalRides,
  COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY member_casual) AS percentage
FROM (
  SELECT rideable_type, member_casual FROM [202304-tripdata]
  UNION ALL
  SELECT rideable_type, member_casual FROM [202305-tripdata]
    UNION ALL
    SELECT rideable_type, member_casual FROM [202306-tripdata]
    UNION ALL
    SELECT rideable_type, member_casual FROM [202307-tripdata]
    UNION ALL
    SELECT rideable_type, member_casual FROM [202308-tripdata]
    UNION ALL
    SELECT rideable_type, member_casual FROM [202309-tripdata]
    UNION ALL
    SELECT rideable_type, member_casual FROM [202310-tripdata]
    UNION ALL
    SELECT rideable_type, member_casual FROM [202311-tripdata]
    UNION ALL
    SELECT rideable_type, member_casual FROM [202312-tripdata]
    UNION ALL
    SELECT rideable_type, member_casual FROM [202401-tripdata]
    UNION ALL
    SELECT rideable_type, member_casual FROM [202402-tripdata]
    UNION ALL
    SELECT rideable_type, member_casual FROM [202403-tripdata]
) AS AnnualTable
GROUP BY rideable_type, member_casual;

rideable_type	member_casual	totalRides	percentage
classic_bike	casual	900639	58.51
docked_bike	casual	69360	4.50
electric_bike	casual	569122	36.97
classic_bike	member	1864777	66.21
electric_bike	member	951601	33.78
docked_bike	member	0	0	