CREATE TABLE bug_13492 (`d` DateTime) ENGINE = MergeTree
PARTITION BY toYYYYMMDD(d) ORDER BY tuple();
SET max_threads = 5;
SELECT DISTINCT 1 FROM bug_13492, numbers(1) n;
SET max_threads = 2;
