--Queries for max ride_length
--Suggestion would be to remove a layer of outliers in the data.
--All max ride_lengths are around the same, 23-24 hours.
--------------------------------------------------
-- By Month
SELECT MAX(ride_length) AS MaxRL FROM [202304-tripdata];
--MaxRL 23:53:18

SELECT MAX(ride_length) AS MaxRL FROM [202305-tripdata];
--MaxRL 23:56:00

SELECT MAX(ride_length) AS MaxRL FROM [202306-tripdata];
--MaxRL 23:54:11

SELECT MAX(ride_length) AS MaxRL FROM [202307-tripdata];
--MaxRL 23:54:03

SELECT MAX(ride_length) AS MaxRL FROM [202308-tripdata];
--MaxRL 23:57:41

SELECT MAX(ride_length) AS MaxRL FROM [202309-tripdata];
--MaxRL 23:49:26

SELECT MAX(ride_length) AS MaxRL FROM [202310-tripdata];
--MaxRL 23:59:15

SELECT MAX(ride_length) AS MaxRL FROM [202311-tripdata];
--MaxRL 23:59:52

SELECT MAX(ride_length) AS MaxRL FROM [202312-tripdata];
--MaxRL 23:34:45

SELECT MAX(ride_length) AS MaxRL FROM [202401-tripdata];
--MaxRL 23:46:27

SELECT MAX(ride_length) AS MaxRL FROM [202402-tripdata];
--MaxRL 23:57:46

SELECT MAX(ride_length) AS MaxRL FROM [202403-tripdata];
--MaxRL 23:57:11
--------------------------------------------------------------------------
--For year 
SELECT MAX(ride_length) AS MaxRL FROM (
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
--MaxRL 23:59:52
------------------------------------------------------------------------------------