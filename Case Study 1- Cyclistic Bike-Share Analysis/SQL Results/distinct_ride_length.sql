-- This has all queries for distinct ride_length.
-- July contains the largest set of unique ride length durations, 11,042. 
-- Total Distinct ride lengths for the year was 20,011. 
----------------------------------------------------------------------
-- by month
SELECT COUNT(DISTINCT ride_length) AS DistinctRL FROM [202304-tripdata];
--DistinctRL 8,005

SELECT COUNT(DISTINCT ride_length) AS DistinctRL FROM [202305-tripdata];
--DistinctRL 735

SELECT COUNT(DISTINCT ride_length) AS DistinctRL FROM [202306-tripdata];
--DistinctRL 10,333

SELECT COUNT(DISTINCT ride_length) AS DistinctRL FROM [202307-tripdata];
--DistinctRL 11,042
-- Highest DistinctRL

SELECT COUNT(DISTINCT ride_length) AS DistinctRL FROM [202308-tripdata];
--DistinctRL 10,737

SELECT COUNT(DISTINCT ride_length) AS DistinctRL FROM [202309-tripdata];
--DistinctRL 9,892

SELECT COUNT(DISTINCT ride_length) AS DistinctRL FROM [202310-tripdata];
--DistinctRL 8,489

SELECT COUNT(DISTINCT ride_length) AS DistinctRL FROM [202311-tripdata];
--DistinctRL 6,218

SELECT COUNT(DISTINCT ride_length) AS DistinctRL FROM [202312-tripdata];
--DistinctRL 4,781

SELECT COUNT(DISTINCT ride_length) AS DistinctRL FROM [202401-tripdata];
--DistinctRL 4,016

SELECT COUNT(DISTINCT ride_length) AS DistinctRL FROM [202402-tripdata];
--DistinctRL 5,507

SELECT COUNT(DISTINCT ride_length) AS DistinctRL FROM [202403-tripdata];
--DistinctRL 6,511

-------------------------------------------------------------------------------------
-- for year
SELECT COUNT(DISTINCT ride_length) AS DistinctRL FROM (
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
) AS AnnualData;
-- DistinctRL 20,011

