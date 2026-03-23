-- https://stackoverflow.com/questions/53416531/clickhouse-moving-average

DROP TABLE IF EXISTS bm;
CREATE TABLE bm (amount float, business_dttm DateTime) engine Log;
INSERT INTO bm VALUES (0.3,'2018-11-19 13:00:00'), (0.3,'2018-11-19 13:05:00'), (0.4,'2018-11-19 13:10:00'), (0.5,'2018-11-19 13:15:00'), (0.6,'2018-11-19 13:20:00'), (0.7,'2018-11-19 13:25:00'), (0.8,'2018-11-19 13:30:00'), (0.9,'2018-11-19 13:45:00'), (0.5,'2018-11-19 13:50:00');
DROP TABLE bm;
