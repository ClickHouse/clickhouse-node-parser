CREATE TABLE t_filter(s String, a Array(FixedString(3)), u UInt64, f UInt8)
ENGINE = MergeTree ORDER BY u;
SET optimize_read_in_order = 0; -- this trigger error
SELECT * FROM t_filter WHERE f ORDER BY u LIMIT 5;
SELECT * FROM t_filter WHERE f != 0 ORDER BY u LIMIT 5;
