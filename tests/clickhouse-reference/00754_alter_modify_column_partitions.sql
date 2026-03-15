-- check ALTER MODIFY COLUMN with partitions

SET send_logs_level = 'fatal';
CREATE TABLE alter_column(x UInt32, y Int32) ENGINE MergeTree PARTITION BY x ORDER BY x;
SELECT * FROM alter_column ORDER BY _part;
