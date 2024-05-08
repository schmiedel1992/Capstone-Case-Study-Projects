-- Top 5 start stations for members annually 4/23-3/24
SELECT TOP 5 start_station_name, COUNT(*) AS member_start_count
FROM AnnualTripData
WHERE member_casual = 'member'
GROUP BY start_station_name
ORDER BY member_start_count DESC;

start_station_name	member_start_count
Clinton St & Washington Blvd	25073
Kingsbury St & Kinzie St	24674
Clark St & Elm St	22924
Clinton St & Madison St	20059
Wells St & Concord Ln	19034


-- Top 5 end stations for members annually 4/23-3/24
SELECT TOP 5 end_station_name, COUNT(*) AS member_end_count
FROM AnnualTripData
WHERE member_casual = 'member'
GROUP BY end_station_name
ORDER BY member_end_count DESC;

end_station_name	member_end_count
Clinton St & Washington Blvd	25998
Kingsbury St & Kinzie St	24616
Clark St & Elm St	22878
Clinton St & Madison St	21365
Wells St & Concord Ln	19811



-- Top 5 start stations for casual users annually 4/23-3/24
SELECT TOP 5 start_station_name, COUNT(*) AS casual_start_count
FROM AnnualTripData
WHERE member_casual = 'casual'
GROUP BY start_station_name
ORDER BY casual_start_count DESC;

start_station_name	casual_start_count
Streeter Dr & Grand Ave	44388
DuSable Lake Shore Dr & Monroe St	29434
Michigan Ave & Oak St	21479
DuSable Lake Shore Dr & North Blvd	19134
Millennium Park	19083


-- Top 5 end stations for casual users annually 4/23-3/24
SELECT TOP 5 end_station_name, COUNT(*) AS casual_end_count
FROM AnnualTripData
WHERE member_casual = 'casual'
GROUP BY end_station_name
ORDER BY casual_end_count DESC;

end_station_name	casual_end_count
Streeter Dr & Grand Ave	48726
DuSable Lake Shore Dr & Monroe St	27234
Michigan Ave & Oak St	22869
DuSable Lake Shore Dr & North Blvd	22732
Millennium Park	21523