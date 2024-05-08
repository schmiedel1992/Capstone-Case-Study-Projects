-- Create a table from all 12 sheets of columns (member_casual, start & end stations) for deeper investigation.

CREATE TABLE AnnualTripData (
start_station_name VARCHAR(MAX), 
end_station_name VARCHAR(MAX), 
member_casual VARCHAR(50)
);

INSERT INTO AnnualTripData (start_station_name, end_station_name, member_casual)
SELECT start_station_name, end_station_name, member_casual
FROM [202304-tripdata]

UNION ALL

SELECT start_station_name, end_station_name, member_casual
FROM [202305-tripdata]

UNION ALL

SELECT start_station_name, end_station_name, member_casual
FROM [202306-tripdata]

UNION ALL

SELECT start_station_name, end_station_name, member_casual
FROM [202307-tripdata]

UNION ALL

SELECT start_station_name, end_station_name, member_casual
FROM [202308-tripdata]

UNION ALL

SELECT start_station_name, end_station_name, member_casual
FROM [202309-tripdata]

UNION ALL

SELECT start_station_name, end_station_name, member_casual
FROM [202310-tripdata]

UNION ALL

SELECT start_station_name, end_station_name, member_casual
FROM [202311-tripdata]

UNION ALL

SELECT start_station_name, end_station_name, member_casual
FROM [202312-tripdata]

UNION ALL

SELECT start_station_name, end_station_name, member_casual
FROM [202401-tripdata]

UNION ALL

SELECT start_station_name, end_station_name, member_casual
FROM [202402-tripdata]

UNION ALL

SELECT start_station_name, end_station_name, member_casual
FROM [202403-tripdata]