--This has all queries for annual average ride length.
-- Annual average ride length for all users = 16 minutes and 07 seconds.
-- Annual average ride length for casual riders = 23  minutes and 05 seconds.
-- Annual average ride length for members = 12 minutes and 18 seconds.
--------------------------------------------------------------------------------
-- For all users
SELECT 
    AVG(CAST(DATEDIFF(SECOND, '00:00:00', CONVERT(time, ride_length)) AS bigint)) AS avg_rd_seconds
FROM (
    SELECT 
        ride_length
    FROM [202304-tripdata]		
    UNION ALL
	    SELECT 
        ride_length
    FROM [202305-tripdata]		
	UNION ALL
	    SELECT 
        ride_length
    FROM [202306-tripdata]		
	UNION ALL
	    SELECT 
        ride_length
    FROM [202307-tripdata]		
	UNION ALL
	    SELECT 
        ride_length
    FROM [202308-tripdata]		
	UNION ALL
	    SELECT 
        ride_length
    FROM [202309-tripdata]		
	UNION ALL
	    SELECT 
        ride_length
    FROM [202310-tripdata]		
	UNION ALL
	    SELECT 
        ride_length
    FROM [202311-tripdata]		
	UNION ALL
	    SELECT 
        ride_length
    FROM [202312-tripdata]		
	UNION ALL
	    SELECT 
        ride_length
    FROM [202401-tripdata]		
	UNION ALL
	    SELECT 
        ride_length
    FROM [202402-tripdata]		
	UNION ALL
	    SELECT 
        ride_length
    FROM [202403-tripdata]		
) AS subquery;

-- avg_rd_seconds = 967 aka 16:07
------------------------------------------------------------------------
--For casual riders	
SELECT 
    AVG(CAST(DATEDIFF(SECOND, '00:00:00', CONVERT(time, ride_length)) AS bigint)) AS avg_rd_seconds
FROM (
    SELECT 
        ride_length
    FROM [202304-tripdata]		
    WHERE member_casual = 'casual'
    UNION ALL
	    SELECT 
        ride_length
    FROM [202305-tripdata]		
    WHERE member_casual = 'casual'
	UNION ALL
	    SELECT 
        ride_length
    FROM [202306-tripdata]		
    WHERE member_casual = 'casual'
	UNION ALL
	    SELECT 
        ride_length
    FROM [202307-tripdata]		
    WHERE member_casual = 'casual'
	UNION ALL
	    SELECT 
        ride_length
    FROM [202308-tripdata]		
    WHERE member_casual = 'casual'
	UNION ALL
	    SELECT 
        ride_length
    FROM [202309-tripdata]		
    WHERE member_casual = 'casual'
	UNION ALL
	    SELECT 
        ride_length
    FROM [202310-tripdata]		
    WHERE member_casual = 'casual'
	UNION ALL
	    SELECT 
        ride_length
    FROM [202311-tripdata]		
    WHERE member_casual = 'casual'
	UNION ALL
	    SELECT 
        ride_length
    FROM [202312-tripdata]		
    WHERE member_casual = 'casual'
	UNION ALL
	    SELECT 
        ride_length
    FROM [202401-tripdata]		
    WHERE member_casual = 'casual'
	UNION ALL
	    SELECT 
        ride_length
    FROM [202402-tripdata]		
    WHERE member_casual = 'casual'
	UNION ALL
	    SELECT 
        ride_length
    FROM [202403-tripdata]		
    WHERE member_casual = 'casual'
) AS subquery;
-- avg_rd_seconds = 1385 aka 23:05
------------------------------------------------------------------------
--For members
SELECT 
    AVG(CAST(DATEDIFF(SECOND, '00:00:00', CONVERT(time, ride_length)) AS bigint)) AS avg_rd_seconds
FROM (
    SELECT 
        ride_length
    FROM [202304-tripdata]		
    WHERE member_casual = 'member'
    UNION ALL
	    SELECT 
        ride_length
    FROM [202305-tripdata]		
    WHERE member_casual = 'member'
	UNION ALL
	    SELECT 
        ride_length
    FROM [202306-tripdata]		
    WHERE member_casual = 'member'
	UNION ALL
	    SELECT 
        ride_length
    FROM [202307-tripdata]		
    WHERE member_casual = 'member'
	UNION ALL
	    SELECT 
        ride_length
    FROM [202308-tripdata]		
    WHERE member_casual = 'member'
	UNION ALL
	    SELECT 
        ride_length
    FROM [202309-tripdata]		
    WHERE member_casual = 'member'
	UNION ALL
	    SELECT 
        ride_length
    FROM [202310-tripdata]		
    WHERE member_casual = 'member'
	UNION ALL
	    SELECT 
        ride_length
    FROM [202311-tripdata]		
    WHERE member_casual = 'member'
	UNION ALL
	    SELECT 
        ride_length
    FROM [202312-tripdata]		
    WHERE member_casual = 'member'
	UNION ALL
	    SELECT 
        ride_length
    FROM [202401-tripdata]		
    WHERE member_casual = 'member'
	UNION ALL
	    SELECT 
        ride_length
    FROM [202402-tripdata]		
    WHERE member_casual = 'member'
	UNION ALL
	    SELECT 
        ride_length
    FROM [202403-tripdata]		
    WHERE member_casual = 'member'
) AS subquery;
-- avg_rd_seconds = 738 aka 12:18