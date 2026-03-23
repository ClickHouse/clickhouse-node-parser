CREATE TABLE data_03812 (key UInt64, value UInt64) ENGINE = MergeTree ORDER BY key;
INSERT INTO data_03812 VALUES (1, 1), (2, 2);
SET max_rows_to_read = 0;
