-- This has queries for distinct day_of_week.
-- Distinct values of 'day_of_week', the bikes were rented on all '7' days of the week every month. 
------------------------------------------------------------------------
 
SELECT COUNT(DISTINCT day_of_week) AS DistinctDoW FROM [202304-tripdata]; 
--DistinctDoW 7

SELECT COUNT(DISTINCT day_of_week) AS DistinctDoW FROM [202305-tripdata];
--DistinctDoW 7

SELECT COUNT(DISTINCT day_of_week) AS DistinctDoW FROM [202306-tripdata];
--DistinctDoW 7

SELECT COUNT(DISTINCT day_of_week) AS DistinctDoW FROM [202307-tripdata];
--DistinctDoW 7

SELECT COUNT(DISTINCT day_of_week) AS DistinctDoW FROM [202308-tripdata];
--DistinctDoW 7

SELECT COUNT(DISTINCT day_of_week) AS DistinctDoW FROM [202309-tripdata];
--DistinctDoW 7

SELECT COUNT(DISTINCT day_of_week) AS DistinctDoW FROM [202310-tripdata];
--DistinctDoW 7

SELECT COUNT(DISTINCT day_of_week) AS DistinctDoW FROM [202311-tripdata];
--DistinctDoW 7

SELECT COUNT(DISTINCT day_of_week) AS DistinctDoW FROM [202312-tripdata];
--DistinctDoW 7

SELECT COUNT(DISTINCT day_of_week) AS DistinctDoW FROM [202401-tripdata];
--DistinctDoW 7

SELECT COUNT(DISTINCT day_of_week) AS DistinctDoW FROM [202402-tripdata];
--DistinctDoW 7

SELECT COUNT(DISTINCT day_of_week) AS DistinctDoW FROM [202403-tripdata];
--DistinctDoW 7
-----------------------------------------------------------------------
SELECT COUNT(DISTINCT day_of_week) AS DistinctDoW FROM (  
    SELECT day_of_week FROM [202304-tripdata]
    UNION
    SELECT day_of_week FROM [202305-tripdata]
    UNION
    SELECT day_of_week FROM [202306-tripdata]
    UNION
    SELECT day_of_week FROM [202307-tripdata]
    UNION
    SELECT day_of_week FROM [202308-tripdata]
    UNION
    SELECT day_of_week FROM [202309-tripdata]
    UNION
    SELECT day_of_week FROM [202310-tripdata]
    UNION
    SELECT day_of_week FROM [202311-tripdata]
    UNION
    SELECT day_of_week FROM [202312-tripdata]
    UNION
    SELECT day_of_week FROM [202401-tripdata]
    UNION
    SELECT day_of_week FROM [202402-tripdata]
    UNION
    SELECT day_of_week FROM [202403-tripdata]
) AS AnnualData;
-- DistinctDoW 7
-------------------------------------------------------------------------