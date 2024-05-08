-- Another situation where the variable data type needed to be coerced for SQL to operate, July had the longest ride length at 18:22. 
-- The annual average is 16:07

SELECT AVG(DATEDIFF(second, '00:00:00', ride_length)) AS MeanRL FROM [202304-tripdata];
--MeanRL 916 aka 15:16

SELECT AVG(DATEDIFF(second, '00:00:00', ride_length)) AS MeanRL FROM [202305-tripdata];
--MeanRL 1042 aka 17:22

SELECT AVG(DATEDIFF(second, '00:00:00', ride_length)) AS MeanRL FROM [202306-tripdata];
--MeanRL 1046 aka 17:26

SELECT AVG(DATEDIFF(second, '00:00:00', ride_length)) AS MeanRL FROM [202307-tripdata];
--MeanRL 1102 aka 18:22

SELECT AVG(DATEDIFF(second, '00:00:00', ride_length)) AS MeanRL FROM [202308-tripdata];
--MeanRL 1059 aka 17:39

SELECT AVG(DATEDIFF(second, '00:00:00', ride_length)) AS MeanRL FROM [202309-tripdata];
--MeanRL 1010 aka 16:50

SELECT AVG(DATEDIFF(second, '00:00:00', ride_length)) AS MeanRL FROM [202310-tripdata];
--MeanRL 885 aka 14:45

SELECT AVG(DATEDIFF(second, '00:00:00', ride_length)) AS MeanRL FROM [202311-tripdata];
-- MeanRL 768 aka 12:48

SELECT AVG(DATEDIFF(second, '00:00:00', ride_length)) AS MeanRL FROM [202312-tripdata];
--MeanRL 722 aka 12:02

SELECT AVG(DATEDIFF(second, '00:00:00', ride_length)) AS MeanRL FROM [202401-tripdata];
--MeanRL 720 aka 12:00

SELECT AVG(DATEDIFF(second, '00:00:00', ride_length)) AS MeanRL FROM [202402-tripdata];
--MeanRL 799 aka 13:19

SELECT AVG(DATEDIFF(second, '00:00:00', ride_length)) AS MeanRL FROM [202403-tripdata];
--MeanRL 855 aka 14:15
--------------------------------------------------------------------------