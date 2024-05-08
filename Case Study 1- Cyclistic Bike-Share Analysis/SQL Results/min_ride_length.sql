--Queries for min ride_length 
-- More investigation is required to answer how a customer may only use the bike for 1 second. 
-- However, when querying further, I found MIN(ride_length) at :02, :03, :04, and on.
------------------------------------------------------------
-- By Month
SELECT 
	MIN(ride_length) AS MinRL 
	FROM (SELECT ride_length FROM [202304-tripdata]
	WHERE ride_length > '00:00:00'
) subquery;
-- MinRL 00:00:01

SELECT 
	MIN(ride_length) AS MinRL 
	FROM (SELECT ride_length FROM [202305-tripdata]
	WHERE ride_length > '00:00:00'
) subquery;
-- MinRL 00:00:01

SELECT 
	MIN(ride_length) AS MinRL 
	FROM (SELECT ride_length FROM [202306-tripdata]
	WHERE ride_length > '00:00:00' 
) subquery;
-- MinRL 00:00:01

SELECT 
	MIN(ride_length) AS MinRL 
	FROM (SELECT ride_length FROM [202307-tripdata]
	WHERE ride_length > '00:00:00' 
) subquery;
-- MinRL 00:00:01

SELECT 
	MIN(ride_length) AS MinRL 
	FROM (SELECT ride_length FROM [202308-tripdata]
	WHERE ride_length > '00:00:00'
) subquery;
-- MinRL 00:00:01

SELECT 
	MIN(ride_length) AS MinRL 
	FROM (SELECT ride_length FROM [202309-tripdata] 
	WHERE ride_length > '00:00:00' 
) subquery;
-- MinRL 00:00:01

SELECT 
	MIN(ride_length) AS MinRL 
	FROM (SELECT ride_length FROM [202310-tripdata]
	WHERE ride_length > '00:00:00' 
) subquery;
-- MinRL 00:00:01

SELECT 
	MIN(ride_length) AS MinRL 
	FROM (SELECT ride_length FROM [202311-tripdata]
	WHERE ride_length > '00:00:00'
) subquery;
-- MinRL 00:00:01

SELECT 
	MIN(ride_length) AS MinRL 
	FROM (SELECT ride_length FROM [202312-tripdata]	 
	WHERE ride_length > '00:00:00' 
) subquery;
-- MinRL 00:00:01
SELECT 
	MIN(ride_length) AS MinRL 
	FROM (SELECT ride_length FROM [202401-tripdata] 
	WHERE ride_length > '00:00:00'
) subquery;
-- MinRL 00:00:01

SELECT 
	MIN(ride_length) AS MinRL 
	FROM (SELECT ride_length FROM [202402-tripdata]
	WHERE ride_length > '00:00:00'
) subquery;
-- MinRL 00:00:01

SELECT 
	MIN(ride_length) AS MinRL 
	FROM (SELECT ride_length FROM [202403-tripdata]
	WHERE ride_length > '00:00:00' 
) subquery;
-- MinRL 00:00:01
-----------------------------------------------------
-- for year
SELECT MIN(ride_length) AS MinRL FROM (
    SELECT ride_length FROM [202304-tripdata]
		UNION
    SELECT ride_length FROM [202305-tripdata]
		UNION
    SELECT ride_length FROM [202306-tripdata]
		UNION
    SELECT ride_length FROM [202307-tripdata]
		UNION
    SELECT ride_length FROM [202308-tripdata]
		UNION
    SELECT ride_length FROM [202309-tripdata]
		UNION
    SELECT ride_length FROM [202310-tripdata]
		UNION
    SELECT ride_length FROM [202311-tripdata]
		UNION
    SELECT ride_length FROM [202312-tripdata]	
		UNION
    SELECT ride_length FROM [202401-tripdata]	
		UNION
    SELECT ride_length FROM [202402-tripdata]
		UNION
    SELECT ride_length FROM [202403-tripdata]
) AS AnnualData
WHERE ride_length > '00:00:00';
-- MinRL 00:00:01
--------------------------------------------------------------------------------