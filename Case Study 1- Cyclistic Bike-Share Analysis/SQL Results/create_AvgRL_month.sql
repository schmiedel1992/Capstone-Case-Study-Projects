-- Create table for average ride length per month DESC order
-- The average ride length in seconds per month. July 23' had the longer user duration.
  
SELECT
    LEFT(table_name, 6) AS Month,
    AVG(DATEDIFF(SECOND, CAST('00:00:00' AS TIME), ride_length)) AS AvgRL
FROM
    (
    SELECT ride_length, '202304' AS table_name FROM [202304-tripdata]
    UNION ALL
    SELECT ride_length, '202305' AS table_name FROM [202305-tripdata]
    UNION ALL
    SELECT ride_length, '202306' AS table_name FROM [202306-tripdata]
    UNION ALL
    SELECT ride_length, '202307' AS table_name FROM [202307-tripdata]
    UNION ALL
    SELECT ride_length, '202308' AS table_name FROM [202308-tripdata]
    UNION ALL
    SELECT ride_length, '202309' AS table_name FROM [202309-tripdata]
    UNION ALL
    SELECT ride_length, '202310' AS table_name FROM [202310-tripdata]
    UNION ALL
    SELECT ride_length, '202311' AS table_name FROM [202311-tripdata]
    UNION ALL
    SELECT ride_length, '202312' AS table_name FROM [202312-tripdata]
    UNION ALL
    SELECT ride_length, '202401' AS table_name FROM [202401-tripdata]
    UNION ALL
    SELECT ride_length, '202402' AS table_name FROM [202402-tripdata]
    UNION ALL
    SELECT ride_length, '202403' AS table_name FROM [202403-tripdata]
    ) AS AnnualData
GROUP BY LEFT(table_name, 6)
ORDER BY AvgRL DESC;;

CREATE TABLE AvgRideLength (
    Month VARCHAR(6),
    AvgRideLengthInSeconds FLOAT,
    PRIMARY KEY (Month)
);

INSERT INTO AvgRideLength(Month, AvgRideLengthInSeconds)
SELECT
    LEFT(table_name, 6) AS Month,
    AVG(DATEDIFF(SECOND, CAST('00:00:00' AS TIME), ride_length)) AS AvgRideLengthInSeconds
FROM
    (
    SELECT ride_length, '202304' AS table_name FROM [202304-tripdata]
    UNION ALL
    SELECT ride_length, '202305' AS table_name FROM [202305-tripdata]
    UNION ALL
    SELECT ride_length, '202306' AS table_name FROM [202306-tripdata]
    UNION ALL
    SELECT ride_length, '202307' AS table_name FROM [202307-tripdata]
    UNION ALL
    SELECT ride_length, '202308' AS table_name FROM [202308-tripdata]
    UNION ALL
    SELECT ride_length, '202309' AS table_name FROM [202309-tripdata]
    UNION ALL
    SELECT ride_length, '202310' AS table_name FROM [202310-tripdata]
    UNION ALL
    SELECT ride_length, '202311' AS table_name FROM [202311-tripdata]
    UNION ALL
    SELECT ride_length, '202312' AS table_name FROM [202312-tripdata]
    UNION ALL
    SELECT ride_length, '202401' AS table_name FROM [202401-tripdata]
    UNION ALL
    SELECT ride_length, '202402' AS table_name FROM [202402-tripdata]
    UNION ALL
    SELECT ride_length, '202403' AS table_name FROM [202403-tripdata]
    ) AS AnnualData
GROUP BY LEFT(table_name, 6);

Month	AvgRL
202307	1102
202308	1059
202306	1046
202305	1042
202309	1010
202304	916
202310	885
202403	855
202402	799
202311	768
202312	722
202401	720