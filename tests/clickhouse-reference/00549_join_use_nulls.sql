SET join_use_nulls = 1;
CREATE TABLE null_00549 (k UInt64, a String, b Nullable(String)) ENGINE = Log;
SELECT * FROM null_00549 ORDER BY k, a, b;
