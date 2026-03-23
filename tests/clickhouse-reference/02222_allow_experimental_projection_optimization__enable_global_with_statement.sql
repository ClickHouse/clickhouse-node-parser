DROP TABLE IF EXISTS data_02222;
CREATE TABLE data_02222 engine=MergeTree() ORDER BY dummy AS SELECT * FROM system.one;
-- { echoOff }
DROP TABLE data_02222;
