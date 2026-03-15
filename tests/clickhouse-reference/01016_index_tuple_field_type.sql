CREATE TABLE tuple_01016(a Tuple(DateTime, Int32)) ENGINE = MergeTree() ORDER BY a;
SELECT * FROM tuple_01016 WHERE a < tuple(toDateTime('2019-01-01 00:00:00'), 0) format Null;
