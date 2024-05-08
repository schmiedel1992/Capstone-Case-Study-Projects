--Queries for Peak data
--Peak casual users vs peak member users
--Peak for Casual = Saturday
--Peak for Members = Thursday
--Peak usage of each user type per day of the week
-------------------------------------------------
-- Peak days for casual and member types
-- Members top days are during the week
-- Casuals top days are during the weekend
-------------------------------------------
--Peak hours for casual and member types
-- The most common time to use bikes for both user types = 3-6pm
-------------------------------------------------
--Peak rides in DESC order by day, by hour, by user type
-- There are 336 rows here. One row for each hour in a day of the week for a year per user type. The data is below this syntax.
--------------------------------------------------
-- Peak by day
day_of_week    peak_casual_users    peak_member_users
Sunday        	   255156			 306838
Monday         	   176790	         391777
Tuesday       	   180145            444157
Wednesday      	   181465	         454949
Thursday       	   200549	         462618
Friday        	   228897	         399908
Saturday       	   316119	         356131

peak_casual_users	peak_member_users
    Saturday            Thursday
    316119	              462618

SELECT
    day_of_week,
    SUM(casual_users) AS peak_casual_users,
    SUM(member_users) AS peak_member_users
FROM (
    SELECT 
        COUNT(*) AS casual_users,
        0 AS member_users,
        day_of_week
    FROM [202304-tripdata]
    WHERE member_casual = 'casual'
    GROUP BY day_of_week
    UNION ALL
    SELECT 
        COUNT(*) AS casual_users,
        0 AS member_users,
        day_of_week
    FROM [202305-tripdata]
    WHERE member_casual = 'casual'
    GROUP BY day_of_week
    UNION ALL
    SELECT 
        COUNT(*) AS casual_users,
        0 AS member_users,
        day_of_week
    FROM [202306-tripdata]
    WHERE member_casual = 'casual'
    GROUP BY day_of_week
    UNION ALL
    SELECT 
        COUNT(*) AS casual_users,
        0 AS member_users,
        day_of_week
    FROM [202307-tripdata]
    WHERE member_casual = 'casual'
    GROUP BY day_of_week
    UNION ALL
    SELECT 
        COUNT(*) AS casual_users,
        0 AS member_users,
        day_of_week
    FROM [202308-tripdata]
    WHERE member_casual = 'casual'
    GROUP BY day_of_week
    UNION ALL
    SELECT 
        COUNT(*) AS casual_users,
        0 AS member_users,
        day_of_week
    FROM [202309-tripdata]
    WHERE member_casual = 'casual'
    GROUP BY day_of_week
    UNION ALL
    SELECT 
        COUNT(*) AS casual_users,
        0 AS member_users,
        day_of_week
    FROM [202310-tripdata]
    WHERE member_casual = 'casual'
    GROUP BY day_of_week
    UNION ALL
    SELECT 
        COUNT(*) AS casual_users,
        0 AS member_users,
        day_of_week
    FROM [202311-tripdata]
    WHERE member_casual = 'casual'
    GROUP BY day_of_week
    UNION ALL
    SELECT 
        COUNT(*) AS casual_users,
        0 AS member_users,
        day_of_week
    FROM [202312-tripdata]
    WHERE member_casual = 'casual'
    GROUP BY day_of_week
    UNION ALL
    SELECT 
        COUNT(*) AS casual_users,
        0 AS member_users,
        day_of_week
    FROM [202401-tripdata]
    WHERE member_casual = 'casual'
    GROUP BY day_of_week
    UNION ALL
    SELECT 
        COUNT(*) AS casual_users,
        0 AS member_users,
        day_of_week
    FROM [202402-tripdata]
    WHERE member_casual = 'casual'
    GROUP BY day_of_week
    UNION ALL
    SELECT 
        COUNT(*) AS casual_users,
        0 AS member_users,
        day_of_week
    FROM [202403-tripdata]
    WHERE member_casual = 'casual'
    GROUP BY day_of_week
    UNION ALL
    SELECT 
        0 AS casual_users,
        COUNT(*) AS member_users,
        day_of_week
    FROM [202304-tripdata]
    WHERE member_casual = 'member'
    GROUP BY day_of_week
    UNION ALL
    SELECT 
        0 AS casual_users,
        COUNT(*) AS member_users,
        day_of_week
    FROM [202305-tripdata]
    WHERE member_casual = 'member'
    GROUP BY day_of_week
    UNION ALL
    SELECT 
        0 AS casual_users,
        COUNT(*) AS member_users,
        day_of_week
    FROM [202306-tripdata]
    WHERE member_casual = 'member'
    GROUP BY day_of_week
    UNION ALL
    SELECT 
        0 AS casual_users,
        COUNT(*) AS member_users,
        day_of_week
    FROM [202307-tripdata]
    WHERE member_casual = 'member'
    GROUP BY day_of_week
    UNION ALL
    SELECT 
        0 AS casual_users,
        COUNT(*) AS member_users,
        day_of_week
    FROM [202308-tripdata]
    WHERE member_casual = 'member'
    GROUP BY day_of_week
    UNION ALL
    SELECT 
        0 AS casual_users,
        COUNT(*) AS member_users,
        day_of_week
    FROM [202309-tripdata]
    WHERE member_casual = 'member'
    GROUP BY day_of_week
    UNION ALL
    SELECT 
        0 AS casual_users,
        COUNT(*) AS member_users,
        day_of_week
    FROM [202310-tripdata]
    WHERE member_casual = 'member'
    GROUP BY day_of_week
    UNION ALL
    SELECT 
        0 AS casual_users,
        COUNT(*) AS member_users,
        day_of_week
    FROM [202311-tripdata]
    WHERE member_casual = 'member'
    GROUP BY day_of_week
    UNION ALL
    SELECT 
        0 AS casual_users,
        COUNT(*) AS member_users,
        day_of_week
    FROM [202312-tripdata]
    WHERE member_casual = 'member'
    GROUP BY day_of_week
    UNION ALL
    SELECT 
        0 AS casual_users,
        COUNT(*) AS member_users,
        day_of_week
    FROM [202401-tripdata]
    WHERE member_casual = 'member'
    GROUP BY day_of_week
    UNION ALL
    SELECT 
        0 AS casual_users,
        COUNT(*) AS member_users,
        day_of_week
    FROM [202402-tripdata]
    WHERE member_casual = 'member'
    GROUP BY day_of_week
    UNION ALL
    SELECT 
        0 AS casual_users,
        COUNT(*) AS member_users,
        day_of_week
    FROM [202403-tripdata]
    WHERE member_casual = 'member'
    GROUP BY day_of_week
) AS subquery
GROUP BY day_of_week;
------------------------------------------------
-- Peak days for casual and member types
  
SELECT day_of_week, member_casual, COUNT(*) AS totalRides
FROM (
    SELECT day_of_week, member_casual FROM [202304-tripdata]
    UNION ALL
    SELECT day_of_week, member_casual FROM [202305-tripdata]
    UNION ALL
    SELECT day_of_week, member_casual FROM [202306-tripdata]
    UNION ALL
    SELECT day_of_week, member_casual FROM [202307-tripdata]
    UNION ALL
    SELECT day_of_week, member_casual FROM [202308-tripdata]
    UNION ALL
    SELECT day_of_week, member_casual FROM [202309-tripdata]
    UNION ALL
    SELECT day_of_week, member_casual FROM [202310-tripdata]
    UNION ALL
    SELECT day_of_week, member_casual FROM [202311-tripdata]
    UNION ALL
    SELECT day_of_week, member_casual FROM [202312-tripdata]
    UNION ALL
    SELECT day_of_week, member_casual FROM [202401-tripdata]
    UNION ALL
    SELECT day_of_week, member_casual FROM [202402-tripdata]
    UNION ALL
    SELECT day_of_week, member_casual FROM [202403-tripdata]
) AS AnnualTable
WHERE member_casual IN ('member', 'casual')
GROUP BY day_of_week, member_casual
ORDER BY totalRides DESC;


day_of_week	member_casual	totalRides
Thursday	member	462618
Wednesday	member	454949
Tuesday	member	444157
Friday	member	399908
Monday	member	391777
Saturday	member	356131
Saturday	casual	316119
Sunday	member	306838
Sunday	casual	255156
Friday	casual	228897
Thursday	casual	200549
Wednesday	casual	181465
Tuesday	casual	180145
Monday	casual	176790
-------------------------------------
--Peak hours for casual and member types
 
SELECT
  DATEPART(HOUR, started_at) AS hour,
  member_casual,
  COUNT(*) AS totalRides
FROM (
    SELECT started_at, member_casual FROM [202304-tripdata]
    UNION ALL
    SELECT started_at, member_casual FROM [202305-tripdata]
    UNION ALL
    SELECT started_at, member_casual FROM [202306-tripdata]
    UNION ALL
    SELECT started_at, member_casual FROM [202307-tripdata]
    UNION ALL
    SELECT started_at, member_casual FROM [202308-tripdata]
    UNION ALL
    SELECT started_at, member_casual FROM [202309-tripdata]
    UNION ALL
    SELECT started_at, member_casual FROM [202310-tripdata]
    UNION ALL
    SELECT started_at, member_casual FROM [202311-tripdata]
    UNION ALL
    SELECT started_at, member_casual FROM [202312-tripdata]
    UNION ALL
    SELECT started_at, member_casual FROM [202401-tripdata]
    UNION ALL
    SELECT started_at, member_casual FROM [202402-tripdata]
    UNION ALL
    SELECT started_at, member_casual FROM [202403-tripdata]
) AS AnnualTable
WHERE member_casual IN ('member', 'casual')
GROUP BY DATEPART(HOUR, started_at), member_casual
ORDER BY totalRides DESC;

hour	member_casual	totalRides
17	member	306481
16	member	261791
18	member	235160
8	member	195678
15	member	191351
19	member	163255
7	member	158632
14	member	155084
12	member	153988
13	member	152617
17	casual	151744
16	casual	139802
11	member	135180
9	member	128169
18	casual	126975
15	casual	120913
10	member	114438
20	member	112700
14	casual	109551
13	casual	105653
12	casual	101844
19	casual	92700
11	casual	85953
21	member	85386
6	member	84598
10	casual	67862
20	casual	66210
22	member	61706
21	casual	54489
9	casual	53158
8	casual	52772
22	casual	48216
7	casual	38481
23	member	38338
23	casual	34835
5	member	26791
0	casual	24915
0	member	23500
6	casual	21477
1	casual	16000
1	member	13473
2	casual	9161
5	casual	8160
2	member	7255
4	member	6033
3	member	4774
3	casual	4727
4	casual	3523
---------------------------------------
--Peak rides in DESC order by day, by hour, by user type

SELECT
    day_of_week,
	peak_hour,
    member_casual,
    MAX(totalRides) AS peak_rides
FROM (
    SELECT
        day_of_week,
        member_casual,
        DATEPART(HOUR, started_at) AS peak_hour,
        COUNT(*) AS totalRides
    FROM (
        SELECT day_of_week, member_casual, started_at FROM [202304-tripdata]
        UNION ALL
        SELECT day_of_week, member_casual, started_at FROM [202305-tripdata]
        UNION ALL
        SELECT day_of_week, member_casual, started_at FROM [202306-tripdata]
        UNION ALL
        SELECT day_of_week, member_casual, started_at FROM [202307-tripdata]
        UNION ALL
        SELECT day_of_week, member_casual, started_at FROM [202308-tripdata]
        UNION ALL
        SELECT day_of_week, member_casual, started_at FROM [202309-tripdata]
        UNION ALL
        SELECT day_of_week, member_casual, started_at FROM [202310-tripdata]
        UNION ALL
        SELECT day_of_week, member_casual, started_at FROM [202311-tripdata]
        UNION ALL
        SELECT day_of_week, member_casual, started_at FROM [202312-tripdata]
        UNION ALL
        SELECT day_of_week, member_casual, started_at FROM [202401-tripdata]
        UNION ALL
        SELECT day_of_week, member_casual, started_at FROM [202402-tripdata]
        UNION ALL
        SELECT day_of_week, member_casual, started_at FROM [202403-tripdata]
    ) AS AnnualTable
    WHERE member_casual IN ('member', 'casual')
    GROUP BY day_of_week, member_casual, DATEPART(HOUR, started_at)
) AS PeakTable
GROUP BY day_of_week, peak_hour, member_casual
ORDER BY peak_rides DESC;

day_of_week	peak_hour	member_casual	peak_rides
4	17	member	56811
3	17	member	56468
5	17	member	56010
2	17	member	48004
4	16	member	46097
3	16	member	45198
5	16	member	44318
5	18	member	41476
6	17	member	40495
3	18	member	40341
4	8	member	39739
4	18	member	39450
3	8	member	38959
5	8	member	38102
2	16	member	37937
6	16	member	37517
2	18	member	35878
4	7	member	33330
3	7	member	33174
6	18	member	33058
5	7	member	31521
2	8	member	30379
6	15	member	29614
5	15	member	29200
4	15	member	28232
5	19	member	27621
7	12	member	27619
3	15	member	27551
7	13	member	27002
7	15	casual	26767
7	14	member	26761
3	19	member	26666
7	14	casual	26575
7	15	member	26442
7	13	casual	26402
4	19	member	26340
7	16	casual	26241
7	16	member	26222
7	11	member	26037
6	8	member	25757
7	17	member	25625
2	7	member	25474
1	15	member	25213
7	12	casual	25207
2	15	member	25099
1	13	member	24825
1	14	member	24768
1	12	member	24572
1	16	member	24502
2	19	member	24456
7	17	casual	24002
7	18	member	23934
6	14	member	23868
7	10	member	23778
5	17	casual	23520
1	15	casual	23474
1	11	member	23324
1	17	member	23068
1	14	casual	23013
6	19	member	22829
6	13	member	22799
6	17	casual	22799
1	13	casual	22457
4	17	casual	22308
6	12	member	22251
6	7	member	22055
1	16	casual	22004
7	11	casual	21939
1	12	casual	21645
3	17	casual	21528
5	13	member	21328
5	14	member	21262
5	12	member	21262
6	16	casual	21173
1	18	member	21023
7	18	casual	20848
5	9	member	20791
4	14	member	20670
4	12	member	20340
5	18	casual	20070
1	10	member	19904
6	18	casual	19889
4	9	member	19853
4	13	member	19762
7	9	member	19514
3	9	member	19330
7	19	member	19144
2	17	casual	19113
1	11	casual	19033
2	12	member	19000
3	12	member	18944
2	14	member	18924
3	14	member	18831
5	20	member	18720
6	11	member	18674
5	16	casual	18651
2	13	member	18650
1	17	casual	18474
4	20	member	18323
6	15	casual	18280
3	13	member	18251
3	20	member	18029
5	11	member	17756
3	16	casual	17749
7	10	casual	17713
3	18	casual	17657
4	16	casual	17428
4	18	casual	17291
4	11	member	17106
3	6	member	16979
2	9	member	16952
4	6	member	16940
6	9	member	16902
2	16	casual	16556
2	20	member	16476
7	19	casual	16414
2	11	member	16360
1	19	member	16199
6	14	casual	16017
5	6	member	15987
3	11	member	15923
1	18	casual	15719
6	20	member	15715
2	18	casual	15501
1	10	casual	15231
6	13	casual	15068
5	10	member	14918
1	9	member	14827
5	21	member	14658
6	12	casual	14501
6	10	member	14458
6	19	casual	14446
4	21	member	14172
2	6	member	14168
4	10	member	14113
5	19	casual	14027
3	10	member	13867
5	15	casual	13839
2	15	casual	13707
3	21	member	13525
7	8	member	13492
7	20	member	13457
2	10	member	13400
6	6	member	13316
3	15	casual	12530
4	15	casual	12316
3	19	casual	12209
4	19	casual	12177
7	20	casual	12124
2	14	casual	12029
1	20	member	11980
7	9	casual	11916
6	21	member	11845
1	19	casual	11795
2	19	casual	11632
2	13	casual	11626
6	11	casual	11485
5	22	member	11349
2	21	member	11301
2	12	casual	11245
5	14	casual	11234
7	21	member	11162
5	13	casual	10962
7	22	casual	10726
7	21	casual	10477
5	12	casual	10468
3	14	casual	10443
7	22	member	10265
4	14	casual	10240
6	20	casual	10160
5	20	casual	9987
6	22	member	9817
1	9	casual	9780
3	13	casual	9665
3	12	casual	9560
7	23	casual	9514
4	13	casual	9473
2	11	casual	9320
1	8	member	9250
4	12	casual	9218
4	8	casual	9050
4	22	member	9045
5	8	casual	8994
4	20	casual	8883
3	20	casual	8752
1	21	member	8723
3	22	member	8623
3	8	casual	8558
5	11	casual	8548
6	21	casual	8518
6	10	casual	8483
7	23	member	8469
5	21	casual	8431
6	22	casual	8394
2	20	casual	8227
1	0	casual	8113
1	20	casual	8077
5	22	casual	8055
3	11	casual	7951
6	23	casual	7824
4	21	casual	7766
6	23	member	7721
4	11	casual	7677
7	7	member	7505
2	10	casual	7347
3	21	casual	7181
4	7	casual	7110
6	8	casual	7110
2	8	casual	6999
3	7	casual	6979
7	8	casual	6932
5	7	casual	6863
5	10	casual	6835
6	9	casual	6780
7	0	casual	6634
2	22	member	6538
5	9	casual	6480
1	0	member	6390
5	23	member	6382
1	21	casual	6316
3	10	casual	6300
2	9	casual	6209
4	22	casual	6095
1	22	member	6069
4	9	casual	6023
3	9	casual	5970
4	10	casual	5953
7	0	member	5932
6	7	casual	5922
2	21	casual	5800
3	22	casual	5588
1	7	member	5573
2	7	casual	5413
4	5	member	5355
3	5	member	5276
1	22	casual	5203
1	8	casual	5129
7	1	casual	5069
1	1	casual	4977
5	5	member	4933
5	23	casual	4791
4	23	member	4762
2	5	member	4404
6	6	casual	4336
7	1	member	4254
2	22	casual	4155
6	5	member	4128
3	23	member	4092
7	6	member	4028
1	1	member	3960
4	23	casual	3649
3	6	casual	3632
4	6	casual	3593
1	23	member	3560
5	6	casual	3558
1	23	casual	3462
2	23	member	3352
7	7	casual	3273
6	0	member	3253
1	2	casual	3237
1	6	member	3180
3	23	casual	3057
2	6	casual	2988
1	7	casual	2921
6	0	casual	2897
7	2	casual	2737
2	23	casual	2538
1	2	member	2348
5	0	member	2250
2	0	casual	2203
7	2	member	2139
2	0	member	2006
4	0	member	1977
5	0	casual	1797
6	1	casual	1794
4	0	casual	1745
7	6	casual	1736
3	0	member	1692
1	6	casual	1634
6	1	member	1548
1	3	casual	1544
3	0	casual	1526
7	5	member	1394
2	1	casual	1372
1	3	member	1342
4	5	casual	1336
7	3	casual	1314
1	5	member	1301
6	5	casual	1274
3	5	casual	1255
2	5	casual	1227
5	5	casual	1220
7	3	member	1210
2	1	member	1050
1	4	casual	989
5	1	member	980
5	1	casual	956
1	4	member	937
6	4	member	934
1	5	casual	929
4	1	casual	924
7	5	casual	919
3	1	casual	908
4	1	member	890
3	4	member	879
5	4	member	872
6	2	casual	839
4	4	member	833
2	4	member	832
3	1	member	791
7	4	member	746
6	2	member	742
2	2	casual	720
2	2	member	661
7	4	casual	640
5	2	casual	613
6	3	member	612
4	2	casual	511
5	2	member	507
3	2	casual	504
6	3	casual	486
2	3	member	476
2	3	casual	452
4	2	member	445
6	4	casual	422
5	3	member	415
3	2	member	413
2	4	casual	411
4	4	casual	388
4	3	member	364
3	3	member	355
3	4	casual	351
5	3	casual	328
5	4	casual	322
4	3	casual	311
3	3	casual	292