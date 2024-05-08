--This has queries for sum of rows
--Customer usage peaked in August and was worse in January.
--TotalRows for year 4,355,499.
--Same values as noted from CSV files after cleaning data.
-----------------------------------------------------
--By month
SELECT COUNT(*) AS TotalRows FROM [202304-tripdata];
-- TotalRows 324,163

SELECT COUNT(*) AS TotalRows FROM [202305-tripdata];
-- TotalRows 457,013

SELECT COUNT(*) AS TotalRows FROM [202306-tripdata];
-- TotalRows 534,710

SELECT COUNT(*) AS TotalRows FROM [202307-tripdata];
-- TotalRows 573,923

SELECT COUNT(*) AS TotalRows FROM [202308-tripdata];
-- TotalRows 584,839

SELECT COUNT(*) AS TotalRows FROM [202309-tripdata];
-- TotalRows 506,616

SELECT COUNT(*) AS TotalRows FROM [202310-tripdata];
-- TotalRows 403,693

SELECT COUNT(*) AS TotalRows FROM [202311-tripdata];
-- TotalRows 274,713

SELECT COUNT(*) AS TotalRows FROM [202312-tripdata];
-- TotalRows 167,115

SELECT COUNT(*) AS TotalRows FROM [202401-tripdata];
-- TotalRows 113,775

SELECT COUNT(*) AS TotalRows FROM [202402-tripdata];
-- TotalRows 184,709

SELECT COUNT(*) AS TotalRows FROM [202403-tripdata];
-- TotalRows 230,230
-------------------------------------------------------
-- For year  
SELECT SUM(TotalRows) AS TotalRows FROM (
    SELECT COUNT(*) AS TotalRows FROM [202304-tripdata]
		UNION ALL
    SELECT COUNT(*) AS TotalRows FROM [202305-tripdata]
		UNION ALL
	SELECT COUNT(*) AS TotalRows FROM [202306-tripdata]
		UNION ALL
	SELECT COUNT(*) AS TotalRows FROM [202307-tripdata]
		UNION ALL
	SELECT COUNT(*) AS TotalRows FROM [202308-tripdata]
		UNION ALL
	SELECT COUNT(*) AS TotalRows FROM [202309-tripdata]
		UNION ALL
	SELECT COUNT(*) AS TotalRows FROM [202310-tripdata]
		UNION ALL
	SELECT COUNT(*) AS TotalRows FROM [202311-tripdata]
		UNION ALL
	SELECT COUNT(*) AS TotalRows FROM [202312-tripdata]
		UNION ALL
	SELECT COUNT(*) AS TotalRows FROM [202401-tripdata]
		UNION ALL
	SELECT COUNT(*) AS TotalRows FROM [202402-tripdata]
		UNION ALL
    SELECT COUNT(*) AS TotalRows FROM [202403-tripdata]
) AS AnnualData;
--TotalRows 4,355,499
---------------------------------------------------------------------------------------------------------------------------------
