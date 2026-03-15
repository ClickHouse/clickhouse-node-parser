CREATE TABLE prewhere (light UInt8, heavy String) ENGINE = MergeTree ORDER BY tuple();
SELECT arrayJoin([light]) != 0 AS cond, length(heavy) FROM prewhere WHERE light != 0 AND cond != 0;
CREATE TABLE testtable (DT Datetime, Label1 String, Value UInt64) ENGINE = MergeTree() PARTITION BY DT ORDER BY Label1;
SELECT arrayJoin([0, 1]) AS arrayIdx FROM testtable WHERE arrayIdx = 0;
