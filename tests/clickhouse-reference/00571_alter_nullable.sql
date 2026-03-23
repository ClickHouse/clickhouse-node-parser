CREATE TABLE nullable_00571 (x String) ENGINE = MergeTree ORDER BY x;
INSERT INTO nullable_00571 VALUES ('hello'), ('world');
SELECT * FROM nullable_00571;
