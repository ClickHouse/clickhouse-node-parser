CREATE TABLE set_crash (key1 Int32, id1 Int64, c1 Int64) ENGINE = MergeTree PARTITION BY id1 ORDER BY key1;
SELECT 1 in (-1, 1) FROM set_crash WHERE (key1, id1) in (-1, 1);
