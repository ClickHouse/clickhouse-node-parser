CREATE TABLE data2013 (name String, value UInt32) ENGINE = Memory;
CREATE TABLE data2015 (data_name String, data_value UInt32) ENGINE = Memory;
SELECT X FROM (SELECT name AS X FROM data2013 UNION ALL SELECT data_name FROM data2015) ORDER BY X ASC;
